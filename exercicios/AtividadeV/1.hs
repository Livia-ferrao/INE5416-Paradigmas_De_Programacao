-- Crie um tipo de dados Aluno, usando type, assim como criamos um tipo de dados Pessoa. O tipo Aluno
-- deve possuir um campo para o nome, outro para a disciplina e outros três campos para notas. Agora,
-- execute os passos abaixo:

type Nome = String
type Disciplina = String 
type N1 = Float
type N2 = Float
type N3 = Float
type Aluno = (Nome, Disciplina, N1, N2, N3)

-- A: Crie uma função no mesmo estilo que a função pessoa, vista em sala e disponıvel nos slides no Moodle,
-- ou seja, que receba um inteiro e retorne um Aluno correspondente ao valor inteiro.
-- B: Crie alguns alunos de exemplo, assim como tamb ́em feito no exemplo da pessoa.

aluno :: Int -> Aluno
aluno 1 = ("Livia", "Paradigmas", 9.0, 9.0, 9.0)
aluno 2 = ("Jonas", "Redes", 3.0, 3.0, 3.0)

-- C: No main, imprima o primeiro nome de um aluno, portanto crie uma fun ̧c ̃ao para obter o primeiro
-- nome.

getNome :: Aluno -> Nome
getNome (n,_,_,_,_) = n

-- D: Crie uma função que receba um Int e retorne a media do aluno correspondente.
mediaAluno :: Int -> Float
mediaAluno x = getMedia (aluno x)

getMedia :: Aluno -> Float
getMedia(_,_,0,0,0) = 0
getMedia (_,_,n1,n2,n3) = ((n1 + n2 + n3) /3)

-- E: Crie uma função que calcule a m ́edia da turma, ou seja, considerando todos os alunos. DICA: crie
-- uma função recursiva que receba o primeiro identificador de aluno e incremente o identificador a cada
-- chamada recursiva, at ́e chegar no  ́ultimo aluno. Não use listas!

somaMediaTurma :: Int -> Float
somaMediaTurma 0 = 0
somaMediaTurma x = mediaAluno x + somaMediaTurma (x-1)

mediaTurma :: Int -> Float
mediaTurma i = (somaMediaTurma i) / (fromIntegral i)

main = do
    putStrLn(show(getNome(aluno 1)))
    putStrLn(show(mediaAluno 1))
    putStrLn(show(mediaTurma 2))
