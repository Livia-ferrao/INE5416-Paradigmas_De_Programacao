-- 1. Crie uma função que receba dois números x e y e retorne xy . Leia x e y do teclado.

potencia :: Float -> Float -> Float
potencia x y = x**y

main = do
    xString <- getLine
    yString <- getLine
    let x = (read xString :: Float)
    let y = (read yString :: Float)
    print(potencia x y)