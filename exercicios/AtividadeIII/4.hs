{-Crie uma funçãoo que receba dois valores booleanos (x, y) 
retorne o resultado do “ou exclusivo” (XOR) sobre eles. A função
apenas deve usar os operadores &&, || e not. Leia os valores x e y do teclado-}

xor :: Bool -> Bool -> Bool
xor x y = (x && not y) || (not x && y)

main = do
    xString <- getLine
    yString <- getLine
    let x = (read xString :: Bool)
    let y = (read yString :: Bool)
    print(xor x y)


xor :: Bool -> Bool -> Bool
xor x y = (x && not y) || (not x && y)

main :: IO ()
main = do
  putStrLn "Digite o primeiro valor booleano (True ou False):"
  x <- readLn
  putStrLn "Digite o segundo valor booleano (True ou False):"
  y <- readLn
  let resultado = xor x y
  putStrLn ("O resultado do XOR entre " ++ show x ++ " e " ++ show y ++ " é " ++ show resultado ++ ".")
