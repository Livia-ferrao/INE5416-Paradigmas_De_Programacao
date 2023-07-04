{-Crie uma fun ̧c ̃ao com assinatura menor :: [Int] -> Int, a qual recebe uma lista de Int e retorna o
menor elemento da lista. Retorne 0 caso a lista for vazia. N ̃ao utilize nenhuma fun ̧c ̃ao pronta do Haskell
para realizar esta tarefa.-}

    
menor :: [Int] -> Int
menor [] = 0   
menor (a:b) = menorAux a b
    where menorAux a [] = a
          menorAux a (x:xs) | x < a = menorAux x xs
                            | otherwise = menorAux a xs

main = do
    let lista = [1..10]
    print(menor lista)

