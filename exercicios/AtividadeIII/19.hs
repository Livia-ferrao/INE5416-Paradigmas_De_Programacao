{- conjetura de Goldbach diz que todo n ́umero inteiro par maior que 2 pode ser expressado como a soma de
dois n ́umeros primos. Embora ela nunca foi provada ser verdadeira, ela funciona para n ́umeros grandes.
Por exemplo, podemos escrever o n ́umero 14 como a soma de 7 e 7, ou 18 como a soma de 5 e 13.
Implemente uma fun ̧c ̃ao que receba um n ́umero n como parˆametro e retorne um dos n ́umeros primos que
fazem parte da soma. Ex: retorne 5 ou 13 para o caso do n ́umero 18. Leia n do teclado.-}

isPrime :: Int -> Bool
isPrime n = n > 1 && all (\x -> n `mod` x /= 0) [2..intSqrt n]
  where intSqrt = floor . sqrt . fromIntegral

goldbach :: Int -> Maybe Int
goldbach n
  | n <= 2 || n `mod` 2 /= 0 = Nothing -- não é um número par maior que 2
  | otherwise = find isPrime candidates
  where candidates = [(x, n - x) | x <- [2..n-2], isPrime x, isPrime (n - x)]

main :: IO ()
main = do
  putStrLn "Digite um número par maior que 2:"
  input <- getLine
  let n = read input :: Int
  let result = goldbach n
  case result of
    Just x -> putStrLn $ "Um dos números primos que fazem parte da soma é " ++ show x
    Nothing -> putStrLn "Não foi possível encontrar uma solução para a conjetura de Goldbach."
