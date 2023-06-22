defmodule Matrix do
  @moduledoc """
    Módulo com métodos auxiliares para problemas com matrizes.
    Inclui a criação de tipos de dados que encapsulam listas e valores inteiros.
  """

  @typedoc """
    Tipo valor de cada posição (encapsula inteiros)
  """
  @type value_t :: integer

  @typedoc """
    Linhas das matrizes são listas de valores
  """
  @type row_t :: [value_t]

  @typedoc """
    Define o tipo Matrix, com linhas de um determinado tipo
  """
  @type matrix_t :: [row_t]

  @typedoc """
    Define um Table, que é matriz de int
  """
  @type table_t :: matrix_t

  @typedoc """
    Lista de valores possiveis para uma determinada célula
  """
  @type choices_t :: [value_t]

  ##################################################
  # definição dos métodos do modulo

  @doc """
    Retorna tamanho da matriz
  """
  @spec size(matrix_t) :: integer
  def size(matrix), do: length(Enum.at(matrix, 1))

  @doc """
    Retorna linhas da matriz em lista
  """
  @spec rows(matrix_t) :: [row_t]
  def rows(matrix), do: matrix

  @doc """
    Retorna colunas da matriz em lista
  """
  @spec cols(matrix_t) :: [row_t]
  def cols(matrix) do
    matrix
    |> List.zip()
    # & é o operador usado para transformar função em função anonima
    |> Enum.map(&Tuple.to_list/1)
  end

  @doc """
    cria tupla com valor e grupo de determinada posição
    divide a matriz de valores de acordo com os grupos
    retorna matriz com blocos
  """
  @spec matrixByGroup(matrix_t, table_t) :: matrix_t
  def matrixByGroup(values, groups) do
    for group <- mapGroups(valuesTuple(values, groups)),
        do: filterByGroup(group, valuesTuple(values, groups))
  end

  @doc """
    cria tupla (valor, grupo) para cada posição do tabuleiro
  """
  @spec valuesTuple(matrix_t, table_t) :: matrix_t
  def valuesTuple(matrix1, matrix2) do
    Enum.zip(matrix1, matrix2)
    |> Enum.flat_map(fn {row1, row2} -> Enum.zip(row1, row2) end)
  end

  # recebe lista de tuplas
  defp mapGroups(valuesG) do
    Enum.map(valuesG, fn {_, x} -> x end) |> Enum.uniq()
  end

  defp filterByGroup(group, valueTuple) do
    Enum.filter(valueTuple, fn {_, g} -> g == group end)
    |> Enum.map(fn {f, _} -> f end)
  end

  @doc """
    A partir da lista de linhas, remonta a matriz original (recebe separada por grupos)
  """
  @spec originalCols([row_t], integer) :: [row_t]
  def originalCols(bs, n) do
    bs
    |> Enum.concat()
    |> divide_list(n)
  end

  defp divide_list([], _n), do: []

  defp divide_list(list, n) do
    [Enum.take(list, n) | divide_list(Enum.drop(list, n), n)]
  end

  @doc """
    A partir dos valores e grupos, gera a matriz separada em grupos
  """
  @spec groupsByColumn(matrix_t, table_t) :: [row_t]
  def groupsByColumn(values, groups) do
    Enum.zip(Matrix.cols(values), Matrix.cols(groups))
    |> Enum.reduce([], fn {column1, column2}, acc ->
      grouped =
        Enum.with_index(Enum.zip(column1, column2))
        |> Enum.group_by(fn {{_, y}, _} -> y end)
        |> Enum.map(fn {_, list} -> {hd(list), list} end)
        |> Enum.sort_by(fn {{_, n}, _} -> n end)
        |> Enum.map(fn {_, value} -> value end)
        |> Enum.map(fn sublist -> Enum.map(sublist, fn {{number, _}, _} -> number end) end)

      acc ++ grouped
    end)
  end
end

defmodule Solver do
  @moduledoc """
    Módulo com funções responsáveis pela solução de tabuleiros do jogo Kojun
  """

  @doc """
    retorna o tamanho de um determinado grupo (dado pelo id)
  """
  @spec groupSize(integer, Matrix.matrix_t()) :: integer
  def groupSize(id, groups) do
    Enum.sum(for group <- groups, do: Enum.count(group, &(&1 == id)))
  end

  @doc """
    Retorna os valores que estão em um grupo especificado pelo seu id de grupo
  """
  @spec getValuesInGroup(Matrix.matrix_t(), Matrix.table_t(), integer) :: [integer]
  def getValuesInGroup(values, groups, id) do
    Enum.map(Enum.filter(Matrix.valuesTuple(values, groups), fn {_, v} -> v == id end), fn {v, _} ->
      v
    end)
  end

  @doc """
    Retorna a matriz de escolhas a partir dos valores e grupos
  """
  @spec choices(Matrix.table_t(), Matrix.table_t()) :: Matrix.matrix_t()
  def choices(values, groups) do
    Enum.map(Enum.zip(values, groups), fn {value, group} ->
      Enum.map(Enum.zip(value, group), fn {v, g} ->
        if v == 0 do
          Enum.to_list(1..groupSize(g, groups)) -- getValuesInGroup(values, groups, g)
        else
          [v]
        end
      end)
    end)
  end

  @doc """
    Posições que só possui um valor possível, seta o valor na célula
  """
  @spec reduceChoicesByList(Matrix.row_t()) :: Matrix.row_t()
  def reduceChoicesByList(xss) do
    singles = xss |> Enum.filter(&Solver.singleElementInList/1) |> List.flatten()
    Enum.map(xss, &Solver.minus(&1, singles))
  end

  @doc """
    Faz a redução das escolhas dentro de cada lista e retorna a matriz reduzida
  """
  @spec reduceChoices(Matrix.matrix_t(), Matrix.table_t()) :: Matrix.matrix_t()
  def reduceChoices(values, groups) do
    groupsByCol = Matrix.groupsByColumn(values, groups)
    reduction = Enum.map(groupsByCol, &reduceChoicesByList/1)
    Matrix.originalCols(reduction, Matrix.size(values)) |> Matrix.cols()
  end

  @doc """
    Ordenamento descrescente de cima para baixo nas colunas dentro de um grupo
  """
  @spec descendingRow(list) :: bool
  def descendingRow([]), do: true
  def descendingRow([_]), do: true

  def descendingRow([a, b | bs]) when length(a) <= 1 and length(b) <= 1 do
    if a < b, do: false, else: descendingRow([b | bs])
  end

  def descendingRow([_, b | bs]), do: descendingRow([b | bs])

  @doc """
    Compara valores iguais dentro de cada grupo
  """
  @spec validRow(list) :: bool
  def validRow([]), do: true

  def validRow([x | xs]) when length(x) <= 1 do
    not Enum.member?(xs, x) and validRow(xs)
  end

  def validRow([_ | xs]), do: validRow(xs)

  @doc """
    Nenhuma célula tem vizinhos com valor igual (em linha e coluna)
  """
  @spec validNeighbour(Matrix.row_t()) :: bool
  def validNeighbour([]), do: true
  def validNeighbour([_]), do: true

  def validNeighbour([a, b | bs]) when length(a) <= 1 and length(b) <= 1 do
    if a == b, do: false, else: validNeighbour([b | bs])
  end

  def validNeighbour([_, b | bs]), do: validNeighbour([b | bs])

  @doc """
    Verifica se há apenas um elemento na lista
  """
  @spec singleElementInList([Matrix.value_t()]) :: bool
  def singleElementInList([_]), do: true
  def singleElementInList(_), do: false

  @doc """
    Verifica se há elementos vazios e se as regras do jogo são cumpridas
  """
  @spec notPossible(Matrix.matrix_t(), Matrix.table_t()) :: bool
  def notPossible(values, groups) do
    empty =
      Enum.any?(values, fn row ->
        Enum.any?(row, fn r ->
          r == []
        end)
      end)

    empty || !valid(values, groups)
  end

  @doc """
    Testa todas regras do jogo
  """
  @spec valid(Matrix.matrix_t(), Matrix.table_t()) :: bool
  def valid(values, groups) do
    Enum.reduce(Matrix.cols(values), true, fn col, acc -> acc && validNeighbour(col) end) &&
      Enum.reduce(Matrix.rows(values), true, fn row, acc -> acc && validNeighbour(row) end) &&
      Enum.reduce(Matrix.matrixByGroup(values, groups), true, fn matrixGroup, acc ->
        acc && validRow(matrixGroup)
      end) &&
      Enum.reduce(Matrix.groupsByColumn(values, groups), true, fn groupColumn, acc ->
        acc && descendingRow(groupColumn)
      end)
  end

  @doc """
    Expansão da matriz de escolhas
  """
  @spec expandChoices(Matrix.matrix_t()) :: [Matrix.matrix_t()]
  def expandChoices(m) do
    {rows1, [row | rows2]} = Enum.split_while(m, fn r -> Enum.all?(r, &singleElementInList/1) end)
    {row1, [cs | row2]} = Enum.split_while(row, &singleElementInList/1)

    Enum.map(cs, fn c ->
      Enum.concat([rows1, [Enum.concat([row1, [[c]], row2])], rows2])
    end)
  end

  @doc """
    Remove os elementos que estão na lista xs de ys
  """
  @spec minus(Matrix.choices_t(), Matrix.choices_t()) :: Matrix.choices_t()
  def minus(xs, ys) do
    if singleElementInList(xs) do
      xs
    else
      xs -- ys
    end
  end

  @doc """
    Cria uma lista com tabuleiros com possíveis soluções para o tabuleiro e por meio do backtracking filtra as escolhas
  """
  @spec searchForSolution(Matrix.matrix_t(), Matrix.table_t()) :: [Matrix.table_t()]
  def searchForSolution(values, groups) do
    cond do
      Solver.notPossible(values, groups) ->
        []

      Enum.all?(values, fn sublist -> Enum.all?(sublist, &singleElementInList/1) end) ->
        [values]

      true ->
        for values1 <- expandChoices(values),
            g <- searchForSolution(reduceChoices(values1, groups), groups),
            do: g
    end
  end

  @doc """
    Encontra a solução para o tabuleiro (devolve a primeira encontrada)
  """
  @spec getSolution(Matrix.table_t(), Matrix.table_t()) :: Matrix.table_t()
  def getSolution(values, groups) do
    Enum.at(searchForSolution(reduceChoices(choices(values, groups), groups), groups), 0)
  end

  @doc """
    Função para imprimir a matriz final obtida na tela com formato correto
  """
  @spec convertOutput([Matrix.matrix_t()]) :: Matrix.matrix_t()
  def convertOutput(matrix) do
    for row <- matrix, do: for(el <- row, do: Enum.at(el, 0))
  end
end

values6x6 = [
  [2, 0, 0, 0, 1, 0],
  [0, 0, 0, 3, 0, 0],
  [0, 3, 0, 0, 5, 3],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 3, 0, 4, 2],
  [0, 0, 0, 0, 0, 0]
]

groups6x6 = [
  [1, 1, 2, 2, 2, 3],
  [4, 4, 4, 4, 4, 3],
  [5, 6, 6, 6, 4, 7],
  [5, 5, 5, 6, 7, 7],
  [8, 8, 10, 0, 0, 0],
  [9, 9, 10, 10, 0, 0]
]

values8x8 = [
  [2, 5, 0, 0, 3, 0, 0, 0],
  [0, 0, 6, 0, 0, 0, 0, 0],
  [0, 0, 5, 0, 5, 2, 0, 0],
  [0, 0, 0, 2, 0, 0, 0, 0],
  [0, 0, 1, 0, 4, 0, 0, 0],
  [3, 0, 2, 0, 0, 4, 0, 0],
  [0, 0, 0, 6, 0, 0, 0, 0],
  [0, 0, 0, 0, 4, 0, 3, 2]
]

groups8x8 = [
  [0, 1, 1, 1, 1, 2, 3, 3],
  [0, 0, 5, 1, 2, 2, 4, 4],
  [6, 7, 5, 8, 2, 2, 9, 9],
  [6, 10, 5, 5, 5, 2, 9, 9],
  [6, 10, 5, 11, 11, 11, 9, 12],
  [13, 10, 14, 11, 14, 14, 12, 12],
  [13, 13, 14, 14, 14, 15, 15, 12],
  [13, 13, 16, 16, 15, 15, 15, 12]
]

solution = Solver.getSolution(values6x6, groups6x6)
Solver.convertOutput(solution) |> IO.inspect()
# IO.inspect(Solver.getSolution(values8x8, groups8x8))
