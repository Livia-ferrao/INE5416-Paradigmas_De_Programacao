from queue import Queue

class No:
    def __init__(self, valor):
        self.valor = valor
        self.esquerda = None
        self.direita = None

def insere_no(raiz, valor):
    if raiz is None:
        return No(valor)
    elif valor < raiz.valor:
        raiz.esquerda = insere_no(raiz.esquerda, valor)
    else:
        raiz.direita = insere_no(raiz.direita, valor)
    return raiz

def percurso_nivel(raiz):
    fila = Queue()
    fila.put(raiz)
    
    while not fila.empty():
        no_atual = fila.get()
        print(no_atual.valor, end=' ')
        if no_atual.esquerda is not None:
            fila.put(no_atual.esquerda)
        if no_atual.direita is not None:
            fila.put(no_atual.direita)
    print()

# Lê o número de casos de teste
t = int(input())

for x in range(t):
    # Lê o número de nós da árvore
    n = int(input())
    
    # Lê os valores dos nós e insere na árvore
    valores = list(map(int, input().split()))
    raiz = None
    for valor in valores:
        raiz = insere_no(raiz, valor)
        
    # Realiza o percurso por nível e imprime os nós
    print("Case %d" % (x+1))
    percurso_nivel(raiz)
    if x != t-1:
        print()