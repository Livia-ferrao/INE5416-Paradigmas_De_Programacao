
def solve(vet, n: int) -> bool:
    p = []
    curr = 0
    for i in range(1, n+1):
        p.append(i)
        while p and vet[curr] == p[-1]:
            curr += 1
            p.pop()
    return not p

while True:
    n = int(input())
    if not n:
        break
    while True:
        vet = list(map(int, input().split()))
        if not vet:
            break
        if len(vet) != n:
            break
        if solve(vet, n):
            print("Yes")
        else:
            print("No")
    print()
