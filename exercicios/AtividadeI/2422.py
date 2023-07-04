
n = int(input())

v = []
for i in range(n):
    casa = int(input())
    v.append(casa)

k = int(input())
i, j = 0, n-1

while True:
    if v[i] + v[j] == k:
        print(v[i], v[j])
        break
    elif v[i] + v[j] < k:
        i += 1
    else:
        j -= 1