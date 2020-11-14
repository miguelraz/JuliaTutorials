n = 0
while n < 10
    n += 1
    println(n)
end

myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

i = 1
while i <= length(myfriends)
    friend = myfriends[i]
    println("Hola $friend, ¡gusto en verte!")
    i += 1
end

for n in 1:10
    println(n)
end

myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

for friend in myfriends
    println("Hi $friend, it's great to see you!")
end

for n = 1:10
    println(n)
end

for n ∈ 1:10
    println(n)
end

m, n = 5, 5
A = fill(0, (m, n))

for i in 1:m
    for j in 1:n
        A[i, j] = i + j
    end
end
A

B = fill(0, (m, n))

for i in 1:m, j in 1:n
    B[i, j] = i + j
end
B

C = [i + j for i in 1:m, j in 1:n]

for n in 1:10
   A = [i + j for i in 1:n, j in 1:n]
   display(A)
end




