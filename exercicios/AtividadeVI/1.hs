-- (a) Crie uma função que receba uma matriz e retorne a soma de seus elementos

let matriz = [[1,2,3],[4,5,6],[7,8,9]]

somaMatriz :: [[Int]] -> Int
somaMatriz matriz = sum [elemento | linha <- matriz, elemento <- linha]

-- Outro jeito:

somaMatriz :: [[Int]] -> Int
somaMatriz matriz = somaMatrizAux matriz 0

somaMatrizAux :: [[Int]] -> Int -> Int
somaMatrizAux [] acc = acc -- caso base: chegamos ao final da matriz, retorna o acumulador
somaMatrizAux (linha:outrasLinhas) acc = somaMatrizAux outrasLinhas (acc + somaLinha linha)

somaLinha :: [Int] -> Int
somaLinha [] = 0 -- caso base: chegamos ao final da linha, retorna 0
somaLinha (x:xs) = x + somaLinha xs -- soma o elemento atual com a soma dos outros elementos da linha
