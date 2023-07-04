{-Crie uma função que compute o n- ́esimo numero de Fibonacci. Leia n do teclado.-}

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)

main = do
    print("Digite um numero:")
    nString <- getLine
    let n = (read nString :: Int)
    let resul = fib n
    print(resul)
