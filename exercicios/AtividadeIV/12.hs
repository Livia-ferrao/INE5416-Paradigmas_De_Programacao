{-Crie uma fun ̧c ̃ao com assinatura apagar :: Int -> [t] -> [t], a qual recebe um n ́umero de elementos,
uma lista, e retorna uma lista. Esta fun ̧c ̃ao deve remover da lista os n primeiros elementos fornecidos
como parˆametro. Por exemplo, a chamada (apagar 3 [1,2,3,4,5]) deve retornar [4,5]. N ̃ao utilize
nenhuma fun ̧c ̃ao pronta to Haskell para esta tarefa.-}


apagar :: Int -> [t] -> [t]
apagar n [] = []
apagar n (a:b) | n-1 /= 0 = apagar (n-1) b
               | otherwise = b
