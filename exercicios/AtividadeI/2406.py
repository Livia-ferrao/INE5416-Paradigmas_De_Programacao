 
def paranteses(expr):
    pilha = []
 
    for char in expr:
        if char in ["(", "{", "["]:
            pilha.append(char)
        else:
            if not pilha:
                return False
            current_char = pilha.pop()
            if current_char == '(' and char != ")":
                return False
            if current_char == '{' and char != "}":
                return False
            if current_char == '[' and char != "]":
                return False
    if pilha:
        return False
    return True
 
 
n = int(input())
for i in range(n):
    expr = input()
    retorno = paranteses(expr)
    if retorno == True:
        print("S")
    else:
        print("N")