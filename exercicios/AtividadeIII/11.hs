{-Crie uma função que receba dois números x e y e retorne o maximo divisor comum (DICA: pesquise sobre
o Algoritmo de Euclides). Leia x e y do teclado-}

mdc :: Int -> Int -> Int
mdc a b 
    | a < b = mdc b a
    | b == 0 = a
    | otherwise = mdc b (mod a b)

main = do
    (a, b) <- readLn
    print(mdc a b)