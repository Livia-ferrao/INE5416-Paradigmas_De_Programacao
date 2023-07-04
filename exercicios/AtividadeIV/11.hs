{-Crie uma fun ̧c ̃ao com assinatura primeiros :: Int -> [t] -> [t], a qual recebe um n ́umero de ele-
mentos, uma lista, e retorna uma lista. Esta fun ̧c ̃ao deve retornar uma lista com os n primeiros elementos
informados no primeiro parˆametro. N ̃ao utilize nenhuma fun ̧c ̃ao pronta to Haskell para esta tarefa.-}


primeiros :: Int -> [t] -> [t]
primeiros n [] = []
primeiros n (a:b) | n-1 /= 0 = [a] ++ (primeiros (n-1) b)
                  | otherwise = [a]

main = do
  nString <- getLine
  let n = (read nString :: Int)
  let lista = [1 .. 10]
  print(primeiros n lista)