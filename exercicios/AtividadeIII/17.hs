{-Crie uma função que receba um número n e retorne se o mesmo é primo. Leia n do teclado.-}

divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], mod n x == 0]

primo :: Int -> Bool
primo n = divisores n == [1,n]

main = do
    xString <- getLine
    let x = (read xString :: Int)
    print(primo x)
