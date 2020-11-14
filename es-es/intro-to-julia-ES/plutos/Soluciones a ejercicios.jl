?convert;
# ?parse

days = 365
convert(Float64, days)

# Esto regresa el código ascii (un entero) asociado con el caracter '1'
convert(Int64, '1')

# Esto regresa un entero encapsulado entre comillas
parse(Int64, '1')

"hola"^1000

m, n = 1, 1
"$m + $n = $(m + n)"

a_ray = [[0], [0]]
push!(a_ray[1], 1)
push!(a_ray[2], 1)
a_ray

miagenda = Dict("Jenny" => "867-5309", "Ghostbusters" => "555-2368")

miagenda["Emergency"] = 911
#= 

Julia infiere que "miagenda" toma ambos llaves
y valores del tipo "String". Podemos ver que miagenda
es un Dict{String,String} con 2 entradas. Esto significa que
Julia no va a aceptar enteros como valores en miagenda.

=#

agenda_flexible = Dict("Jenny" => "867-5309", "Ghostbusters" => 5552368)

flexible_phonebook["Emergency"] = 911

#= 

Julia infiere que miagenda_flexible toma valores del tipo
Any. A diferencia de miagenda, miagenda_flexible es un
Dict{String,Any} con 2 entradas.

Para evitar esto, podemos inicializar miagenda a un
diccionario vacío y agregamos entradas después. O podemos
decirle a Julia explícitamente que queremos un diccionario
que acepte objectos del tipo Any como valores.

¡Ve los ejemplos!

=#

miagenda = Dict()

miagenda = Dict{String, Any}("Jenny" => "867-5309", "Ghostbusters" => "555-2368")

squares = Dict()
iterable = range(1, 2, 50)
#  Otra opción 
# iterable = 1:2:99
for key in iterable
    squares[key] = "$(key^2)"
    squares[key + 1] = (key + 1)^2
end

@show squares[10]
@show squares[11]

A = fill(0, (10, 10))
for i in 1:10
    A[i] = i
end
A
# ¡Julia usa order columnar! Los primeros 10 elementos van a poblar la primera columna.

N = 16
if (N % 3 == 0) & (N % 5 == 0)
    println("FizzBuzz")
else
    if (N % 3 == 0)
        println("Fizz")
    else
        if (N % 5 == 0)
            println("Buzz")
        else
            println(N)
        end
    end
end

((N % 3 == 0) & (N % 5 == 0)) ? println("FizzBuzz") : ((N % 3 == 0) ? println("Fizz") : ((N % 5 == 0) ? println("Buzz") : println(N)))

fill(0, (3, 3)) .+ 1

f(x) = x^2
v = [1, 2, 3]
map(f, v)

caesar(input_string, shift) = map(x -> x + shift, input_string)

#Pkg.add("Primes")
using Primes
maximum(primes(1000000))

using Plots
pyplot()
x = 1:10
y = x .^ 2
plot(x, y)

import Base: +
+(x::String, y::Int) = map(x -> x + y, x)

"Gr#qrw#phggoh#lq#wkh#diidluv#ri#gudjrqv#iru#|rx#duh#fuxqfk|#dqg#wdvwh#jrrg#zlwk#nhwfkxs1" + -3

circshift(A, (0, 4))

v = [1, 2, 3]
v * v'

v' * v

A =
[
 140   97   74  168  131
  97  106   89  131   36
  74   89  152  144   71
 168  131  144   54  142
 131   36   71  142   36
]

eigdec = eigfact(A)
eigdec[:values]

Diagonal(eigdec[:values])

F = hessfact(A)

isapprox(A, F[:Q] * F[:H] * F[:Q]')


