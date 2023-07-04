{-Crie uma fun ̧c ̃ao com assinatura media :: [Int] -> Float, a qual recebe uma lista de Int e retorna
a m ́edia de todos os elementos da lista. Retorne 0 caso a lista for vazia. N ̃ao utilize nenhuma fun ̧c ̃ao
pronta do Haskell para realizar esta tarefa. DICA: utilize a fun ̧c ̃ao fromIntegral para converter um tipo
inteiro para um tipo compat ́ıvel com o operador de divis ̃ao /-}

soma :: [Int] -> Int
soma [] = 0
soma (a:b) = a + soma b

comp :: [Int] -> Int
comp [] = 0
comp (a:b) = 1 + comp b

media :: [Int] -> Float
media [] = 0
media a = (fromIntegral (soma a)) / (fromIntegral (comp a))
