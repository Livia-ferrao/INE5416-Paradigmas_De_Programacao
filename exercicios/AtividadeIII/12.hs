{-Crie uma função que receba três n ́umeros x, y e z e retorne o m ́aximo divisor comum (DICA: apenas
modifique o algoritmo anterior). Leia x, y e z do teclado.-}

mdc :: Int -> Int -> Int
mdc a b 
    | a < b = mdc b a
    | b == 0 = a
    | otherwise = mdc b (mod a b)

mdc3n :: Int -> Int -> Int -> Int
mdc3n a b c = mdc a (mdc b c)

main = do
    (a, b, c) <- readLn
    print(mdc3n a b c)