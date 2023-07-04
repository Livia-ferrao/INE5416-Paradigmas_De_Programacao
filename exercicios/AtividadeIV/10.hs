{-Crie uma fun ̧c ̃ao com assinatura filtrar :: (t -> Bool) -> [t] -> [t], a qual recebe uma fun ̧c ̃ao,
uma lista e retorna uma nova lista. Esta fun ̧c ̃ao aplica a fun ̧c ̃ao recebida como parˆametro sobre cada
elemento da lista e caso o retorno da fun ̧c ̃ao for verdadeiro, ent ̃ao o elemento far ́a parte da nova lista, caso
contr ́ario n ̃ao. Para esta tarefa, utilize o conceito de list comprehension.-}


filtrar :: (t -> Bool) -> [t] -> [t]
filtrar f [] = []
filtrar f (a:b) | f a = a: (filtrar f b)
| otherwise = filtrar f b

-- x, para cada x em xs, f x
filtrar :: (t -> Bool) -> [t] -> [t]
filtrar f xs = [x | x <- xs, f x]