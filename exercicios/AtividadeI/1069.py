class Stack:
    def __init__(self):
        self.items = [] # [<,.,.,>,<,.,<,.,.,>,>]

    def push(self, item):
        self.items.append(item)
    
    def pop(self):
        return self.items.pop(0)
    
pilha = Stack()
x = int(input())

## para cada caso
for i in range(x):
    mina = input()
    for i in mina:
        pilha.push(i)
    
    menor = 0
    tot = 0

    ##percorrer pilha
    while True:
        if len(pilha.items) == 0:
            break
        elem = pilha.pop()
        if elem == "<":
            menor += 1

        if menor > 0 and elem == ">":
            tot += 1
            menor -= 1
    print(tot)


    
