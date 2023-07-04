-- Crie um novo tipo Ponto, usando data, que pode ser um ponto 2D ou um ponto 3D. Depois, crie uma
-- função que receba dois pontos (necessariamente ambos sendo 2D ou ambos sendo 3D), e retorne a distˆancia
-- entre eles

data Ponto = P2D Float Float| P3D Float Float Float

distancia :: Ponto -> Ponto -> Float
distancia (P2D a1 b1) (P2D a2 b2) = (((a2 - a1) ** 2) + ((b2 - b1) ** 2)) ** 1/2
distancia (P3D a1 b1 c1) (P3D a2 b2 c2) = (((a2 - a1) ** 2) + ((b2 - b1) ** 2) + ((c2 - c1) ** 2)) ** 1/2

ponto1 :: Ponto
ponto1 = (P2D 1 2)
ponto2 :: Ponto
ponto2 = (P2D 3 4)
ponto3 :: Ponto
ponto3 = (P3D 1 2 3)
ponto4 :: Ponto
ponto4 = (P3D 4 5 6)

main = do 
    putStrLn (show (distancia ponto1 ponto2))
    putStrLn (show (distancia ponto3 ponto4))
