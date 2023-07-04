-- Pesquise o que  ́e o newtype. Qual  ́e a diferença dele para o type e para o data? Faca um pequeno
-- exemplo de aplicaçao e explique seu funcionamento


-- Uma declaração newtype cria um novo tipo da mesma maneira que os data. 
-- A sintaxe e o uso de newtypes são virtualmente idênticos aqueles das declarações de data - 
-- na verdade, você pode substituir a palavra-chave newtype por data e ela ainda compilará, 
-- na verdade, é provável que o programa ainda funcione. O contrário não é verdadeiro, no entanto 
-- -os data só podem ser substituídos por newtype se o tipo tiver exatamente um construtor com
-- exatamente um campo dentro dele.


-- O newtype é uma palavra-chave em Haskell, que permite a criação de novos tipos de dados,
-- com uma sintaxe semelhante à do data e do type. No entanto, há algumas diferenças importantes 
-- na forma como essas construções funcionam.
-- Enquanto o type é usado para criar sinônimos de tipos existentes,
-- permitindo que você use um nome diferente para um tipo já definido,
-- o data é usado para definir novos tipos de dados, com seus próprios construtores. 
-- O newtype, por outro lado, é usado para criar um tipo de dados que é semanticamente 
-- idêntico a um tipo existente, mas que é tratado como um tipo diferente pelo compilador.

newtype A = A B
