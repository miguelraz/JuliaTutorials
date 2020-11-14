function sayhi(name)
    println("Hi $name, it's great to see you!")
end

function f(x)
    x^2
end

sayhi("C-3PO")

f(42)

sayhi2(name) = println("Hi $name, it's great to see you!")

f2(x) = x^2

sayhi2("R2D2")

f2(42)

sayhi3 = name -> println("Hi $name, it's great to see you!")

f3 = x -> x^2

sayhi3("Chewbacca")

f3(42)

sayhi(55595472)

A = rand(3, 3)
A

f(A)

f("hi")

v = rand(3)

f(v)

v = [3, 5, 2]

sort(v)

v

sort!(v)

v

A = [i + 3*j for j in 0:2, i in 1:3]

f(A)

B = f.(A)

A[2, 2]

A[2, 2]^2

B[2, 2]

v = [1, 2, 3]

f.(v)






