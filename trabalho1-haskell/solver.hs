import Data.List

-- definições dos tipos
type Value = Int
type Row a = [a]
type Matrix a = [Row a]
type Table = Matrix Value
type Choices = [Value]

------------------------------------------------------------------
-- métodos para operar as matrizes

-- retorna ordem da matriz (quadrada)
size :: Matrix m -> Int
size matrix = length (head matrix)

-- linhas de uma matriz
rows :: Matrix m -> [Row m]
rows matrix = matrix

-- colunas de uma matriz
cols :: Matrix m -> [Row m]
cols matrix = transpose matrix

-- cria tupla com valor e grupo de determinada posição
-- divide a matriz de valores de acordo com os grupos
-- retorna matriz com blocos
matrixByGroup :: Eq m => Matrix m -> Table -> Matrix m
matrixByGroup values groups = [filterByGroup group valuesTuple | group <- mapGroups]
    where
        valuesTuple = foldl1 (++) (zipWith zip values groups)
        mapGroups = nub (map snd valuesTuple)
        filterByGroup group list = map fst $ filter ((== group) . snd) list

-- remonta as colunas originais a partir de uma dividida por blocos
originalCols :: [Row l] -> Int -> [Row l]
originalCols bs n = divideList n (concat bs)
    where
        divideList n = takeWhile (not . null) . map (take n) . iterate (drop n)

------------------------------------------------------------------
-- métodos da solução do Kojun

-- conta quantos elementos estão em um grupo para saber seu tamanho
groupSize :: Eq m => m -> Matrix m -> Int
groupSize _ [] = 0
groupSize id groups = sum [count id p | p <- groups]
  where count x xs = length (filter (==x) xs)

-- id identifica um bloco (grupo)
-- cria lista dos valores que já estão em um bloco
getValuesInGroup :: Eq m => Matrix m -> Table -> Int -> [m]
getValuesInGroup values groups id = map fst $ filter ((==id) . snd) valuesTuple
    where
        valuesTuple = foldl1 (++) (zipWith zip values groups)

minus :: Choices -> Choices -> Choices
xs `minus` ys = if singleElementInList xs then xs else xs \\ ys

-- ve se a linha tem apenas um elemento
singleElementInList :: [a] -> Bool
singleElementInList [_] = True
singleElementInList _ = False

-- cria escolhas possíveis em cada célula
-- células sem valor possuem valores possíveis de 1 até tamanho do grupo
-- remove os valores que já estão naquele grupo (para não haver repetição)
choices :: Table -> Table -> Matrix Choices
choices values groups = map (map choice) (zipWith zip values groups)
    where choice (v, p) = if v == 0 then [1..(groupSize p groups)] `minus` (getValuesInGroup values groups p) else [v]

-- cria as colunas da matriz delimitando pelos grupos
groupsByColumn :: Eq m => Matrix m -> Table -> [Row m]
groupsByColumn values groups = zipWith zip (cols values) (cols groups) >>= map (map fst) . groupBy (\x y -> snd x == snd y)

-- em cada coluna (já dividida por grupos), faz uma redução em lista
-- faz a redução das escolhas dentro de cada lista e retorna a matriz reduzida
reduceChoices :: Matrix Choices -> Table -> Matrix Choices
reduceChoices values groups = cols $ originalCols (map reduceChoicesByList (groupsByColumn values groups)) (size values)

-- em posições que só possui um valor possível, seta o valor na célula
reduceChoicesByList :: Row Choices -> Row Choices
reduceChoicesByList xss = [xs `minus` singles | xs <- xss]
    where singles = concat (filter singleElementInList xss)

-- filtra soluções baseada nas escolhas, percorrendo as células
-- cria uma lista com tabuleiros com possíveis soluções para o tabuleiro
searchForSolution :: Matrix Choices -> Table -> [Table]
searchForSolution values groups
    | notPossible values groups = []  -- caso não tenha solução, retorna lista vazia
    | all (all singleElementInList) values = [map concat values]  -- não precisa de mais reduções
    | otherwise = [g | values' <- expandChoices values, g <- searchForSolution (reduceChoices values' groups) groups]  -- ainda precisa de redução, expandindo a matriz e em seguida reduzindo, continuando a busca

-- ve se tabuleiro não gera solução
notPossible :: Matrix Choices -> Table -> Bool
notPossible values groups = empty values || not (valid values groups)
    where
        empty m = any (any null) m

-- verifica se uma matriz de escolhas é valida
valid :: Matrix Choices -> Table -> Bool
valid values groups = all validNeighbour (cols values) &&
                      all validNeighbour (rows values) &&  -- nenhuma célula tem vizinhos com valor igual (em linha e coluna)
                      all validRow (matrixByGroup values groups) &&  --compara dentro do grupo para ver se não há valor igual
                      all descendingRow (groupsByColumn values groups)  -- deve haver ordenamento descrescente de cima para baixo nas colunas dentro de um grupo

-- vizinhos não podem ter o mesmo valor
validNeighbour :: Eq a => Row [a] -> Bool
validNeighbour [] = True
validNeighbour [a] = True
validNeighbour (a:b:bs)  -- compara primeiro com segundo, se necessáiro, chama a função usando o segundo valor e o resto da lista 
    | (length a <= 1) && (length b <= 1) = if a == b then False else validNeighbour (b:bs)
    | otherwise = validNeighbour (b:bs)  -- b = segundo valor; bs = restante da Row

-- não pode haver valores iguais em uma linha
validRow :: Eq a => Row [a] -> Bool
validRow [] = True
validRow (x:xs) = if (length x <= 1) then not (elem x xs) && validRow xs else validRow xs

-- ordenamento decrescente nas colunas (não pode ter valor menor sobre maior)
descendingRow :: Ord a => Row [a] -> Bool
descendingRow [] = True
descendingRow [a] = True
descendingRow (a:b:bs)
    | (length a <= 1) && (length b <= 1) = if a < b then False else descendingRow (b:bs)
    | otherwise = descendingRow (b:bs)

-- faz expanção das escolhas
expandChoices :: Matrix Choices -> [Matrix Choices]
expandChoices m = [rows1 ++ [row1 ++ [c] : row2] ++ rows2 | c <- cs]
    where
        (rows1,row:rows2) = break (not . all singleElementInList) m
        (row1,cs:row2) = break (not . singleElementInList) row

-- encontra a solução para o tabuleiro (devolve a primeira encontrada)
getSolution :: Table -> Table -> Table
getSolution values groups = head (searchForSolution (reduceChoices (choices values groups) groups) groups)

values6x6 :: Table
values6x6 = [[2,0,0,0,1,0],
             [0,0,0,3,0,0],
             [0,3,0,0,5,3],
             [0,0,0,0,0,0],
             [0,0,3,0,4,2],
             [0,0,0,0,0,0]
            ]

groups6x6 :: Table
groups6x6 = [[1,1,2,2,2,3],
             [4,4,4,4,4,3],
             [5,6,6,6,4,7],
             [5,5,5,6,7,7],
             [8,8,10,0,0,0],
             [9,9,10,10,0,0]
            ]

-- https://www.janko.at/Raetsel/Kojun/065.a.htm
-- values12x12 :: Table
-- values12x12 = [
--              [0,0,0,4,0,3,2,0,0,1,0,3],
--              [0,0,2,0,5,0,0,0,0,0,0,0],
--              [0,4,0,0,0,1,0,0,0,0,0,0],
--              [2,0,5,0,2,0,0,0,4,0,0,0],
--              [1,6,0,0,0,4,0,2,0,0,0,0],
--              [0,5,2,0,0,0,0,0,2,0,0,1],
--              [0,0,0,0,5,0,4,0,0,4,0,0],
--              [3,0,0,7,0,0,0,0,0,0,3,0],
--              [0,0,6,0,0,0,0,3,0,0,2,0],
--              [0,5,0,3,0,0,0,4,0,5,0,0],
--              [4,0,0,0,0,2,0,0,6,0,0,0],
--              [5,0,3,0,0,0,3,1,4,0,1,0]
--             ]
-- groups12x12 :: Table
-- groups12x12 = [
--     [0,0,1,1,2,2,2,2,3,4,4,5],
--     [6,6,1,7,7,7,8,9,3,3,5,5],
--     [10,10,1,11,7,7,8,12,3,5,5],
--     [10,11,11,11,11,]
-- ]

main = do
    let values = values6x6
    let groups = groups6x6
    print "Resolvendo tabuleiro 6x6"
    mapM_ print (getSolution values groups)