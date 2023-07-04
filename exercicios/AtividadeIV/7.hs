{-7. Motifique o arquivo alunos.hs (disponıvel 
no Moodle) de forma a adicionar novas fun ̧c ̃oes:-}

alunos :: [(Int, String, Float)]
alunos = [(1, "Ana", 3.4), (2, "Bob", 6.7), (3, "Tom", 7.6)]

getNome :: (Int, String, Float) -> String
getNome (a,b,c) = b

getPrimeiroAluno :: [(Int, String, Float)] -> (Int, String, Float)
getPrimeiroAluno (a:_) = a

gerarPares :: [t] -> [u] -> [(t,u)] 
gerarPares l1 l2 = [(a,b) | a <- l1, b <- l2]

{-Crie uma fun ̧c ̃ao com a seguinte assinatura: aprovados :: [(Int, String, Float)] -> [String],
a qual recebe uma lista de alunos e retorna uma lista com o nome dos alunos aprovados. Um aluno
est ́a aprovado se a sua m ́edia  ́e maior ou igual a 6. Utilize map e filter para resolver esta quest ̃ao.-}

aprovados :: [(Int, String, Float)] -> [String]
aprovados alunos = map getNome (filter (\(_, _, media) -> media >= 6) alunos)

{-Crie uma fun ̧c ̃ao com a seguinte assinatura: aprovados2 :: [(Int, String, Float)] -> [String],
a qual recebe uma lista de alunos e retorna uma lista com o nome dos alunos aprovados. Um aluno
est ́a aprovado se a sua m ́edia  ́e maior ou igual a 6. N ̃ao utilize map e filter para resolver esta
quest ̃ao. Utilize o conceito de list comprehension.-}

aprovados2 :: [(Int, String, Float)] -> [String]
aprovados2 alunos = [getNome aluno | aluno <- alunos, getMedia aluno >= 6.0]
    where getMedia (_, _, media) = media
          getNome (_, nome, _) = nome

{-Utilize (e modifique, se necess ́ario) a fun ̧c ̃ao gerarPares vista em aula e dispon ́ıvel no arquivo
alunos.hs para formar duplas de alunos. Note que um aluno n ̃ao pode fazer dupla consigo mesmo.-}

formarDuplas :: [(Int, String, Float)] -> [((Int, String, Float), (Int, String, Float))]
formarDuplas alunos = filter (\((id1, _, _), (id2, _, _)) -> id1 /= id2) duplas
  where duplas = gerarPares alunos alunos

main = do
    print (getPrimeiroAluno alunos)