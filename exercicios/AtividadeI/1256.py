def hash_func(num, qntd):
    x = num % qntd
    return x

vezes = int(input())
for number in range(vezes):
    qntd, n = input().split()
    qntd, n = int(qntd), int(n)
    dic = {}
    for x in range(qntd):
        dic[x] = []

    entrada = [int(x) for x in input().split()]
    for i in entrada:
        x = hash_func(i, qntd)
        dic[x].append(i)


    for i in dic:
        print('%d -> ' % int(i), end = '')
        for j in dic[i]:
            print('%d -> ' % j, end = '')
        print('\\')
    
    if number != vezes-1:
        print()