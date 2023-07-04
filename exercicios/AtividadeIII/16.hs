{- Crie uma função que receba dois números x e y e retorne se x ́e divisível por y. Leia x e y do teclado.-}



divisivel :: Int -> Int -> (String, Int)
divisivel x y
    |  resul == 0 = ("Divisivel", (resul))
    | otherwise = ("Nao divisivel", (resul))
    where resul = x `mod` y 

main = do
    aString <- getLine
    let x = (read aString :: Int)
    bString <- getLine
    let y = (read bString :: Int)
    print(divisivel x y)
