{-Crie uma função que receba dois números x e y e determine se eles são coprimos. Dois numeros são ditos
coprimos se o maximo divisor comum entre eles  ́e 1. Leia x e y do teclado.-}

mdc :: Int -> Int -> Int
mdc a b 
    | a < b = mdc b a
    | b == 0 = a
    | otherwise = mdc b (mod a b)

coprimos :: Int -> Int -> String
coprimos a b
    | mdc a b == 1 = "Sao coprimos"
    | otherwise = "Nao sao coprimos"

main = do
    aString <- getLine
    let a = (read aString :: Int)
    bString <- getLine
    let b = (read bString :: Int)
    print(coprimos a b)

