{-Crie uma fun ̧c ̃ao com assinatura inverte :: [t] -> [t], a qual recebe uma lista como parˆametro e
deve retornar a mesma invertida. N ̃ao utilize nenhuma fun ̧c ̃ao pronta do Haskell para realizar esta tarefa.-}

inv_lista :: [t] -> [t]
inv_lista [] = []
inv_lista (x:xs) = inv_lista xs ++ [x]
