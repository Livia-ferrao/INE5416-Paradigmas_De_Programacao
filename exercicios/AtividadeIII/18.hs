{-Crie uma função que receba três parâmetros Operador, x e y, e retorne o resultado da opera ̧c ̃ao matem ́atica
x Operador y. Os operadores poss ́ıveis de informar s ̃ao +, -, *, /. Leia o Operador, x e y do teclado-}

operacao :: Char -> Float -> Float -> Float
operacao op x y
    | op == '+' = x + y
    | op == '-' = x - y
    | op == '*' = x * y
    | op == '/' = x/y


main = do
    (op, x, y) <- readLn
    print(operacao op x y)
