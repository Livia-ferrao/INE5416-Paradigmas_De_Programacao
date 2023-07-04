{-Crie uma função que receba 3 valores numéricos (a, b, c) e retorne o maior deles. Não utilize nenhuma
forma de ordenação. Leia os valores a, b, c do teclado.-}


-- maximo :: Double -> Double -> Double -> Double
-- maximo a b c
--     | a > b && a > c = a
--     | b > a && b > c = b
--     | c > a && c > b = c
    
-- main = do
--     print("Primeiro valor:")
--     aString <- getLine
--     let a = (read aString :: Double)
--     print("Segundo valor:")
--     bString <- getLine
--     let b = (read bString :: Double)
--     print("Terceiro valor:")
--     cString <- getLine
--     let c = (read cString :: Double)
--     print(maximo a b c)


maximo :: Double -> Double -> Double -> Double
maximo a b c
    | a > b && a > c = a
    | b > a && b > c = b
    | c > a && c > b = c

main = do
    (a, b, c) <- readLn
    print(maximo a b c)