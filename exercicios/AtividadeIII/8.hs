{-Crie uma função que resolva uma equação de segundo grau da forma ax2 + bx + c utilizando a fórmula
de Bhaskara. Leia os coeficientes a, b e c do teclado.-}

delta :: Double -> Double -> Double -> Double
delta a b c = b*b - 4*a*c

bhaskara :: Double -> Double -> Double -> (Double, Double)
bhaskara a b c = (x1, x2)
    where 
        x1 = (-b + sqrt (d)) / (2*a)
        x2 = (-b - sqrt (d)) / (2*a)
        d = delta a b c

main = do
    putStrLn "Primeiro coeficiente:"
    aString <- getLine
    let a = (read aString :: Double)
    putStrLn "Segundo coeficiente:"
    bString <- getLine
    let b = (read bString :: Double)
    putStrLn "Terceiro coeficiente:"
    cString <- getLine
    let c = (read cString :: Double)
    print(bhaskara a b c)
