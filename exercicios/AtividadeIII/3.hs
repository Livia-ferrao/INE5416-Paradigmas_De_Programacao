{-Crie uma fun ̧c ̃ao que receba a base e a altura de um triˆangulo e calcule a  ́area do mesmo. Leia a base e a
altura do teclado.-}

areaTriangulo :: Float -> Float -> Float
areaTriangulo base altura = ((base * altura)/2)
    
main = do
    baseString <- getLine
    alturaString <- getLine
    let base = (read baseString :: Float)
    let altura = (read alturaString :: Float)
    print(areaTriangulo base altura)