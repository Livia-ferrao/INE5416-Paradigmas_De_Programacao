 
def paranteses(expr):
    pilha = []
 
    for char in expr:
        if char == "(":
            pilha.append(char)
        elif char == ")":
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
 
 
while True:
    try:
        expr = input()
        retorno = paranteses(expr)
        if retorno == True:
            print("correct")
        else:
            print("incorrect")

    except(EOFError):
        break