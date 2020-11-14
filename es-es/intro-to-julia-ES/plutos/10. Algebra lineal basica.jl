A = rand(1:4,3,3)

x = fill(1.0, (3))

b = A*x

Asym = A + A'

Apd = A'A

A\b

Atall = rand(3, 2)
display(Atall)
Atall\b

v = randn(3)
rankdef = [v v]

rankdef\b

Ashort = rand(2, 3)
display(Ashort)
Ashort\b[1:2]






