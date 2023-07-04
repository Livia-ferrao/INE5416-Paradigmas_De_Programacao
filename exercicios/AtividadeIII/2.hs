--2. Crie uma fun ̧c ̃ao que receba um n ́umero x, negativo ou positivo, e retorne seu valor absoluto. Leia x do teclado.

absoluto :: Float -> Float
absoluto x = abs(x)
    
main = do
    xString <- getLine
    let x = (read xString :: Float)
    print(absoluto x)