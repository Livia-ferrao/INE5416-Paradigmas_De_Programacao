{-Crie uma fun ̧c ̃ao com assinatura soma :: [Int] -> Int, a qual recebe uma lista de Int e retorna a soma
de todos os elementos da lista. Retorne 0 caso a lista for vazia. N ̃ao utilize nenhuma fun ̧c ̃ao pronta do
Haskell para realizar esta tarefa.-}

soma :: [Int] -> Int
soma [] = 0
soma (a:b) = a + soma b