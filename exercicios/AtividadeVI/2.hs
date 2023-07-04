-- Crie uma fun ̧c ̃ao que receba duas matrizes e retorne a soma delas.


let matriz1 = [[1,2,3],[4,5,6],[7,8,9]]
let matriz2 = [[1,2,3],[4,5,6],[7,8,9]]

somaMatrizes :: [[Int]] -> [[Int]] -> [[Int]]
somaMatrizes m1 m2 = if dimensoesIguais m1 m2
                     then zipWith (zipWith (+)) m1 m2
                     else error "As matrizes nao possuem a mesma dimensao."

dimensoesIguais :: [[Int]] -> [[Int]] -> Bool
dimensoesIguais m1 m2 = length m1 == length m2 && all (== length (head m1)) (map length m1)