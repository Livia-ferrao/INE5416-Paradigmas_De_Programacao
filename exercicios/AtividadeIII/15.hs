{-Crie uma função que receba um numero n e retorne a função totiente de Euler (φ(n)). A função totiente
de Euler  ́e dada pelo número de inteiros positivos r a partir de 1 e menores que n, ou seja 1 <= r < n,
que s ̃ao coprimos de n. Por exemplo, se n = 10, ent ̃ao os coprimos de 10 de 1 at ́e 10-1 são {1, 3, 7, 9} e
a função deve retornar φ(n) = 4. Leia n do teclado.-}

totient :: Int -> Int
totient n = length [x | x <- [1..n-1], gcd x n == 1]

-- gcd x n retorna o maior divisor comum entre x e n. 

main = do
    putStrLn "Digite um número:"
    input <- getLine
    let n = read input :: Int
    let result = totient n
    putStrLn ("O totiente de Euler de " ++ show n ++ " é " ++ show result)