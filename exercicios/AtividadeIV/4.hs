{-Crie uma fun ̧c ̃ao com assinatura diferencaMaiorMenor :: [Int] -> Int, a qual recebe uma lista de
Int e retorna a diferen ̧ca entre o maior e o menor elemento da lista. Retorne 0 caso a lista for vazia. N ̃ao
utilize nenhuma fun ̧c ̃ao pronta do Haskell para realizar esta tarefa.-}

menor :: [Int] -> Int
menor [] = 0   
menor (a:b) = menorAux a b
    where menorAux a [] = a
          menorAux a (x:xs) | x < a = menorAux x xs
                            | otherwise = menorAux a xs
                

maior :: [Int] -> Int
maior [] = 0   
maior (a:b) = maiorAux a b
    where maiorAux a [] = a
          maiorAux a (x:xs) | x < a = maiorAux a xs
                            | otherwise = maiorAux x xs


diferencaMaiorMenor :: [Int] -> Int
diferencaMaiorMenor [] = 0
diferencaMaiorMenor x = maior x - menor x
