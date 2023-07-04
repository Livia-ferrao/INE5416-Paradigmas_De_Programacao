def bubble_sort(a, b, c, d, n):
    i = 0
    for i in range(n):
        k = 0
        while k < n-i-1:
            if a[k+1] > a[k]:
                a[k], a[k+1] = a[k+1], a[k]
                b[k], b[k+1] = b[k+1], b[k]
                c[k], c[k+1] = c[k+1], c[k]
                d[k], d[k+1] = d[k+1], d[k]
            if a[k+1] == a[k]:
                if b[k+1] > b[k]:
                    a[k], a[k+1] = a[k+1], a[k]
                    b[k], b[k+1] = b[k+1], b[k]
                    c[k], c[k+1] = c[k+1], c[k]
                    d[k], d[k+1] = d[k+1], d[k]
                if b[k+1] == b[k]:
                    if c[k+1] > c[k]:
                        a[k], a[k+1] = a[k+1], a[k]
                        b[k], b[k+1] = b[k+1], b[k]
                        c[k], c[k+1] = c[k+1], c[k]
                        d[k], d[k+1] = d[k+1], d[k]
                    if c[k] == c[k+1]:
                        if d[k+1] < d[k]:
                            a[k], a[k+1] = a[k+1], a[k]
                            b[k], b[k+1] = b[k+1], b[k]
                            c[k], c[k+1] = c[k+1], c[k]
                            d[k], d[k+1] = d[k+1], d[k]
            k += 1
        


n = int(input())
a, b, c, d = [], [], [], []
for i in range(n):
    s = input().split()
    d.append(s[0])
    a.append(int(s[1]))
    b.append(int(s[2]))
    c.append(int(s[3]))

bubble_sort(a, b, c, d, n)

for i in range(n):
    print(d[i], a[i], b[i], c[i])