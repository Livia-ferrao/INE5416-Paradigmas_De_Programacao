{-Crie uma fun ̧c ̃ao com assinatura busca :: [Int] -> Int -> Bool, a qual recebe uma lista de Int e um
Int e retorna se o elemento passado como parˆametro encontra-se na lista ou n ̃ao. N ̃ao utilize nenhuma
fun ̧c ̃ao pronta do Haskell para realizar esta tarefa.-}

busca :: [Int] -> Int -> Bool
busca [] x = False
busca (a:b) x | a == x = True
              | otherwise = busca b x


main = do
    let lista = [2,5,9]
    let n = 2
    print(busca lista n)