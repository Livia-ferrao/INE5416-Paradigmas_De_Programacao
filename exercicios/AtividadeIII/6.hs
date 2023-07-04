{-Crie uma função que receba três inteiros x, y e z e retorne se havendo varetas com esses valores em
comprimento pode-se construir um triângulo. Exemplo, com varetas de comprimento 4, 8 e 9 posso
construir um triângulo, porém com varetas de comprimento 10, 5 e 4 não posso construir um triângulo.
Leia x, y e z do teclado.-}

triangulo :: Int -> Int -> Int -> String
triangulo x y z | x + y >= z && x + z >= y && y + z >= x = "Forma triangulo"
                | otherwise = "Não forma triangulo"

main = do
    xString <- getLine
    let x = (read xString :: Int)
    yString <- getLine
    let y = (read yString :: Int)
    putStrLn ("Digite a terceira nota do aluno:")
    zString <- getLine
    let z = (read zString :: Int)
    print(triangulo x y z)