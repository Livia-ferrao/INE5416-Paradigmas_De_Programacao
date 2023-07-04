while True:
    buffer = []
    cartas = int(input())
    if cartas == 0:
        break
    for i in range(cartas):
        buffer.append(i+1)
    print("Discarded cards: ", end='')
    while len(buffer) > 1:
        descartada = buffer.pop(0)

        if len(buffer) == 1:
            print(descartada)
        else:
            print("%s, " % descartada,end="")

        buffer.append(buffer.pop(0))           
    print("Remaining card:", buffer[0])
    


    # print("Discarded card: ", end="")
    # for i in range(len(lista)-1):
    #     if i == len(lista)-1:
    #         print(lista[i])
    #     else:
    #         print(lista[i], end="")
    #         print(", ", end="")