{-Crie uma fun ̧c ̃ao com assinatura ocorrencias :: [Int] -> Int -> Int, a qual recebe uma lista de
Int e um Int e retorna o n ́umero de vezes em que o elemento est ́a presente na lista. N ̃ao utilize nenhuma
fun ̧c ̃ao pronta do Haskell para realizar esta tarefa.-}

ocorrencias :: [Int] -> Int -> Int
ocorrencias [] x = 0
ocorrencias (a:b) x | x == a = 1 + ocorrencias b x
                    | otherwise = ocorrencias b x