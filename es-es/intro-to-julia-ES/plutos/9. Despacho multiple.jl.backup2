methods(+)

@which 3 + 3

@which 3.0 + 3.0 

@which 3 + 3.0

import Base: +

"hello " + "world!"

@which "hello " + "world!"

+(x::String, y::String) = string(x, y)

"hello " + "world!"

@which "hello " + "world!"

foo(x, y) = println("duck-typed foo!")
foo(x::Int, y::Float64) = println("foo con entero y flotante!")
foo(x::Float64, y::Float64) = println("foo con dos flotantes!")
foo(x::Int, y::Int) = println("foo con dos enteros!")

foo(1, 1)

foo(1., 1.)

foo(1, 1.0)

foo(true, false)




