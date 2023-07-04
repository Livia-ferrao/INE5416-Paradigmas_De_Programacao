{- Crie uma função que dados dois pontos no espaço 3D, (x1, y1, z1) e (x2, y2, z2), 
compute a distância entre eles. Leia as posições dos pontos do teclado.-}

distance :: (Double, Double, Double) -> (Double, Double, Double) -> Double
distance (x1, y1, z1) (x2, y2, z2) = dist
    where
        dx = x2 - x1
        dy = y2 - y1
        dz = z2 - z1
        dist = sqrt(dx**2 + dy**2+ dz**2)


main = do
    putStrLn "Primeira coordenada:"
    (x1, y1, z1) <- readLn

    putStrLn "Segunda coordenada:"
    (x2, y2, z2) <- readLn
    print(distance (x1, y1, z1) (x2, y2, z2))
