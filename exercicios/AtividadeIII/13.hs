{-Crie uma função que receba dois números x e y e retorne o m ́ınimo múltiplo comum (DICA: use a função
do maximo divisor comum j ́a criada). Leia x e y do teclado-}

mdc :: Int -> Int -> Int
mdc a b 
    | a < b = mdc b a
    | b == 0 = a
    | otherwise = mdc b (mod a b)

mmc :: Int -> Int -> Int
mmc a b = (a * b) `div` (mdc a b)

main = do
    (a, b) <- readLn
    print(mmc a b)