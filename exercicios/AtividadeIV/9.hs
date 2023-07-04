{-Crie uma fun ̧c ̃ao com assinatura inverte :: [t] -> [t], a qual recebe uma lista como parˆametro e
deve retornar a mesma invertida. N ̃ao utilize nenhuma fun ̧c ̃ao pronta do Haskell para realizar esta tarefa.-}

 mapear :: (t -> y) -> [t] -> [y]
 mapear f [] = []
 mapear f (a:b) = f a: mapear f b