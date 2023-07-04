-- Dizemos que uma matriz quadrada inteira Anxn ́e um quadrado m ́agico se é formada pelos números
-- (não repetidos) de 1 a n2 e a soma dos elementos de cada linha, a soma dos elementos de cada coluna
-- e a soma dos elementos das diagonais principal e secundária s ̃ao todas iguais. O exemplo abaixo
-- mostra um quadrado mágico válido. Faça um função que retorne se uma matriz  ́e um quadrado
-- mágico ou nao.

quadradoMagico :: [[Int]] -> Bool
quadradoMagico m =
  let n = length m
      ns = n^2
      s = n*(ns+1) `div` 2
      flatten = concat m
      valid = all (\x -> x >= 1 && x <= ns) (nub flatten)
      rows = map sum m
      cols = map sum (transpose m)
      diag1 = sum [m !! i !! i | i <- [0..n-1]]
      diag2 = sum [m !! i !! (n-1-i) | i <- [0..n-1]]
  in n == length m !! 0 && valid && all (==s) (rows ++ cols ++ [diag1, diag2])
