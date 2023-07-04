{-Crie uma função que receba três notas de um aluno (a, b, c), calcule a m ́edia e retorne se o aluno foi
aprovado ou reprovado. Para um aluno ser aprovado, ele deve possuir nota igual ou superior a 6. Leia as
notas dos alunos do teclado.-}

aprovado :: Float -> Float -> Float -> String
aprovado n1 n2 n3 | ((n1+n2+n3)/3) >= 6 = "Aprovado"
                  | otherwise = "Reprovado"

main = do
    putStrLn ("Digite a primeira nota do aluno:")
    n1String <- getLine
    let n1 = (read n1String :: Float)
    putStrLn ("Digite a segunda nota do aluno:")
    n2String <- getLine
    let n2 = (read n2String :: Float)
    putStrLn ("Digite a terceira nota do aluno:")
    n3String <- getLine
    let n3 = (read n3String :: Float)
    print(aprovado n1 n2 n3)