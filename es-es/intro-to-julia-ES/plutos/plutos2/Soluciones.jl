### A Pluto.jl notebook ###
# v0.10.0

using Markdown

# ╔═╡ 8b27c417-eb11-4bb2-b11d-3835de736c35
md"""
### Notebook 1
#### 1.1 
Buscar `convert` y `parse` en la documentación.
"""

# ╔═╡ 88aa3f49-0f95-43aa-bd7a-8c1d79f2d341
?convert;
# ?parse

# ╔═╡ 2ea62f54-efd4-420c-909e-0003784d8dc1
md"""
#### 1.2 
Asignar `365` a una variable llamada `days`. Convierte `days` a flotante.
"""

# ╔═╡ 82b41bf8-5766-4fd2-807f-7e0dba424633
days = 365
convert(Float64, days)

# ╔═╡ de189aeb-361d-4f47-96ae-2a670056a590
md"""
#### 1.3 
Ver que sucede ejectuando 

```julia
convert(Int64, '1')
```
and

```julia
parse(Int64, '1')
```
"""

# ╔═╡ 73f6a473-6aa8-4f08-9aea-e74ce01e1b7b
# Esto regresa el código ascii (un entero) asociado con el caracter '1'
convert(Int64, '1')

# ╔═╡ 2a6dceb7-f609-499a-b736-117b72380ae2
# Esto regresa un entero encapsulado entre comillas
parse(Int64, '1')

# ╔═╡ 70b7b5fe-f290-4087-927e-21c80320548b
md"""
### Notebook 2
#### 2.1 
Crea una cadena que dice "hola" 1000 veces
"""

# ╔═╡ 6e768f73-8239-4d14-ae4c-adfe7c9c77f7
"hola"^1000

# ╔═╡ a176f8f7-afc4-43d3-a960-3e3a6ea7ff79
md"""
#### 2.2
Agrega dos números dentro de una cadena
"""

# ╔═╡ 09643980-8c7b-40ce-bb73-9565408555bf
m, n = 1, 1
"$m + $n = $(m + n)"

# ╔═╡ b533f6f7-63c1-415d-acb9-0ec8790976ac
md"""
### Notebook 3

#### 3.1 
Crea un arreglo, `arreglo`, que es un arreglo en 1D de 2 elementos, cada uno conteniendo el número 0.
Agrega a `arreglo` para agregar un segundo número, `1`, a cada arreglo.
"""

# ╔═╡ da8e8e66-ed67-4064-9d66-ba829c350380
a_ray = [[0], [0]]
push!(a_ray[1], 1)
push!(a_ray[2], 1)
a_ray

# ╔═╡ 3b35ffd4-15a4-46f5-8cdf-191411ec46db
md"""
### 3.2 
Trata de agregar "Emergencia" a `miagenda` con el valor `911`. Trata de agregar `911` como un entero y no como cadena. ¿Porqué no funciona?
"""

# ╔═╡ 67cc87a9-abe7-42eb-bf27-b0f1aa7fc4ed
miagenda = Dict("Jenny" => "867-5309", "Ghostbusters" => "555-2368")

# ╔═╡ 0438c676-2e85-45bb-8a90-0e692ddb4f71
miagenda["Emergency"] = 911
#= 

Julia infiere que "miagenda" toma ambos llaves
y valores del tipo "String". Podemos ver que miagenda
es un Dict{String,String} con 2 entradas. Esto significa que
Julia no va a aceptar enteros como valores en miagenda.

=#

# ╔═╡ 26508993-2fea-4de0-8b3f-366d1ef77eb7
md"""
#### 3.3 
Crea un nuevo diccionario que se llame `agenda_flexible` que tenga el número de Jenny guardado como cadena y el de los Cazafantasmas como entero.
"""

# ╔═╡ d8351db6-dc61-45c2-a771-0a353cb6ceb7
agenda_flexible = Dict("Jenny" => "867-5309", "Ghostbusters" => 5552368)

# ╔═╡ 5560c6a3-a7e1-4963-bc16-4999b1eb1157
md"""
#### 3.4
Add the key "Emergency" with the value `911` (an integer) to `flexible_phonebook`.
"""

# ╔═╡ fc29f9aa-b3b0-4fd2-b0bc-96301f950600
flexible_phonebook["Emergency"] = 911

# ╔═╡ d77e981c-9440-4882-abd5-ca391a054621
md"""
##### 3.5
3.5 ¿Porqué podemos agregar un entero como valor a `agenda_flexible` pero no a  `miagenda`? ¿Cómo pudimos haber inicializado `miagenda` para que aceptara enteros como valores?
"""

# ╔═╡ b1830c1b-3f00-42f9-81bf-adecfa05c161
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

# ╔═╡ 03aac330-27fc-459e-8261-0fdac3721197
miagenda = Dict{String, Any}("Jenny" => "867-5309", "Ghostbusters" => "555-2368")

# ╔═╡ af8072fd-3175-49c6-9248-41f48588d5a2
md"""
### Notebook 4

#### 4.1

4.1 Crea un diccionario `squares`, que tiene llaves de valores de 1 a 100. El valor asociado a cada llave es el cuadrado de la llave. Guarda los valores asociados a las llaves pares como enteros y las impares como cadenas. Por ejemplo,

```julia
squares[10] == 100
squares[11] == "121"
```

(¡No necesitas condicionales para esto!)
"""

# ╔═╡ 72506456-8104-45b8-8243-722bd3bbce1f
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

# ╔═╡ ace49f1a-2149-4d68-81ea-965d4d0e9197
md"""
#### 4.2

4.2 Usa `fill` para crea una matriz de `10x10` de solo `0`'s. Pobla las primeras 10 entradas con el índice de esa entrada. ¿Julia usa el orden de primero columna o primero renglón? (O sea, ¿el "segundo" elemento es el de la primera columna en el primer renglón, ó es el de el primer renglón en la segunda columna?)
"""

# ╔═╡ 6c9e8943-0997-4f01-bc16-68bf62f72d21
A = fill(0, (10, 10))
for i in 1:10
    A[i] = i
end
A
# ¡Julia usa order columnar! Los primeros 10 elementos van a poblar la primera columna.

# ╔═╡ a544197a-a657-453c-80d5-b08e0d2dcdf6
md"""
### Notebook 5

#### 5.1

5.1 Reescribe FizzBuzz sin usar `elseif`.
"""

# ╔═╡ 2e786f7a-e0a4-4e7c-90b6-7081864b6fa2
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

# ╔═╡ 6b91710e-5b70-434e-917c-d8c1e5f9809f
md"""
#### 5.2

Reescribe FizzBuzz usando el operador ternario.
"""

# ╔═╡ 3add75d7-88e6-4eb3-ad52-ace52755cf58
((N % 3 == 0) & (N % 5 == 0)) ? println("FizzBuzz") : ((N % 3 == 0) ? println("Fizz") : ((N % 5 == 0) ? println("Buzz") : println(N)))

# ╔═╡ 71cd7876-82ca-4b09-b5b9-d79160b8061b
md"""
### Notebook 6

#### 6.1

6.1 En vez de broadcastear `f` sobre `v`,  pudimos haber hecho `v .^ 2`.

Sin declarar una nueva funcion, agrega 1 a cada elemento de una matriz de `3x3` llena de `0`'s.
"""

# ╔═╡ 4594cabf-46b0-42dc-b027-92c42de34d15
fill(0, (3, 3)) .+ 1

# ╔═╡ d36ccfa0-6a44-4644-aa69-a46c09668c4d
md"""
#### 6.2

6.2 En vez de broadcastear `f` sobre el vector `v` con la sintaxis de punto, aplica `f` a todos los elementos de`v` usando `map` como función.
"""

# ╔═╡ c0ab3d4b-93f1-4588-b7fa-c007039889a4
f(x) = x^2
v = [1, 2, 3]
map(f, v)

# ╔═╡ 06339cb3-9e6b-4214-9276-86574cc5d6bb
md"""
#### 6.3

Una cifra de César recorre cada letra un número determinado de plazas más adelante en el abecedario. Un corrimiento, o shift, de 1 manda "A" a "B". Escribe una función llamada `cesar` que toma una cadena como input y un corrimiento y regresa una cadena desencriptada tal que obtengas

```julia
cesar("abc", 1)
"bcd"

cesar("hello", 4)
"lipps"
```
"""

# ╔═╡ bb0149cd-6e2d-4bf1-af68-71b3ddae9a61
caesar(input_string, shift) = map(x -> x + shift, input_string)

# ╔═╡ 83177d5d-28a4-4d52-8df4-4b316e5e3080
md"""
### Notebook 7

#### 7.1 

7.1 Usa el paquete de  (código fuente en https://github.com/JuliaMath/Primes.jl) para encontrar el número primer más grande menor a 1,000,000
"""

# ╔═╡ d09fbb3f-9cd8-4c8a-b2f8-2258579a71b5
#Pkg.add("Primes")
using Primes
maximum(primes(1000000))

# ╔═╡ e5de2132-0a97-4802-a10a-cd0e770c8985
md"""
### Notebook 8

#### 8.1

8.1 Grafica y vs x para `y = x^2` usando el backend de PyPlot.
"""

# ╔═╡ 77929858-3d6a-4832-ac1a-726ef652aea9
using Plots
pyplot()
x = 1:10
y = x .^ 2
plot(x, y)

# ╔═╡ bb14c31f-4d17-4fe6-86a0-7c2799c078f4
md"""
### Notebook 9

#### 9.1

Agrega un método para `+` que aplique un cifrado de César a una cadena (cómo en el notebook 6) tal que

```julia
"hello" + 4 == "lipps"
```
"""

# ╔═╡ 085df56e-9938-45bb-944b-21173b3f6c76
import Base: +
+(x::String, y::Int) = map(x -> x + y, x)

# ╔═╡ a515c3be-a27b-4cbf-9417-7b8446399ad2
md"""
#### 9.2

Checa que has extendido propiamente `+` recorriendo la próxima cadena para atrás por 3 letras:

"Gr#qrw#phggoh#lq#wkh#diidluv#ri#gudjrqv#iru#|rx#duh#fuxqfk|#dqg#wdvwh#jrrg#zlwk#nhwfkxs1"
"""

# ╔═╡ 05f18b69-67ae-40fc-aefd-622af5f46a96
"Gr#qrw#phggoh#lq#wkh#diidluv#ri#gudjrqv#iru#|rx#duh#fuxqfk|#dqg#wdvwh#jrrg#zlwk#nhwfkxs1" + -3

# ╔═╡ c59e1737-d5fa-4cfe-9bd8-f0c8eb677231
md"""
### Notebook 10

#### 10.1

10.1 Usa `circshift` para obtener una matriz con las columnas de A cíclicamente recorridas a la derecha por 3 columnas.

Empezando con

```
A = [
 1  2  3  4  5  6  7  8  9  10
 1  2  3  4  5  6  7  8  9  10
 1  2  3  4  5  6  7  8  9  10
 1  2  3  4  5  6  7  8  9  10
 1  2  3  4  5  6  7  8  9  10
 1  2  3  4  5  6  7  8  9  10
 1  2  3  4  5  6  7  8  9  10
 1  2  3  4  5  6  7  8  9  10
 1  2  3  4  5  6  7  8  9  10
 1  2  3  4  5  6  7  8  9  10
 ]
```

Quieres obtener

```
A = [
 7  8  9  10  1  2  3  4  5  6
 7  8  9  10  1  2  3  4  5  6
 7  8  9  10  1  2  3  4  5  6
 7  8  9  10  1  2  3  4  5  6
 7  8  9  10  1  2  3  4  5  6
 7  8  9  10  1  2  3  4  5  6
 7  8  9  10  1  2  3  4  5  6
 7  8  9  10  1  2  3  4  5  6
 7  8  9  10  1  2  3  4  5  6
 7  8  9  10  1  2  3  4  5  6
 ]
```
"""

# ╔═╡ 242397e3-e3e7-4f76-817c-2bccfb69009a
circshift(A, (0, 4))

# ╔═╡ 79802f7a-50f2-4ae4-8991-046cd8fff9c6
md"""
#### 10.2

10.2 Toma el producto de un vector `v` con sí mismo.
"""

# ╔═╡ fd8a44d2-ca0b-469c-a33e-ecf02dec6955
v = [1, 2, 3]
v * v'

# ╔═╡ 0e6ddaa6-3d8c-4db7-904a-e8eb76acb083
md"""
#### 10.3
10.3 Toma el producto de un vector `v` con sí mismo.
"""

# ╔═╡ ec5e8a05-43f4-4f8a-a6e0-cdc7213a2d82
v' * v

# ╔═╡ 595844c9-cc40-4aaf-862a-e8becf9b4f0c
md"""
### Notebook 11

#### 11.1

 ¿Cuáles son los eigenvalores de la Matriz A

```
A =
[
 140   97   74  168  131
  97  106   89  131   36
  74   89  152  144   71
 168  131  144   54  142
 131   36   71  142   36
]
```
"""

# ╔═╡ f4e78715-446b-4434-b10e-a39ed3cac57c
A =
[
 140   97   74  168  131
  97  106   89  131   36
  74   89  152  144   71
 168  131  144   54  142
 131   36   71  142   36
]

# ╔═╡ bc2e20b3-7f7d-418e-a5ac-0bb90bfcecbc
eigdec = eigfact(A)
eigdec[:values]

# ╔═╡ f66596d8-a5c2-4025-995e-a0a1a3ebbade
md"""
#### 11.2

Crea una matriz diagonal de los eigenvalores de A
"""

# ╔═╡ 3881814e-0956-4588-831c-a6afc18c4290
Diagonal(eigdec[:values])

# ╔═╡ 985f658f-81ad-46d9-8158-673a10c77628
md"""
#### 11.3

Realiza un factorización de Hessenberg sobre la matriz A. Verifica que `A = QHQ'`.
"""

# ╔═╡ dd6cf48b-a756-4d1f-95a9-89649892bab7
F = hessfact(A)

# ╔═╡ 6cf155cd-07e5-466d-9e98-903450b969fc
isapprox(A, F[:Q] * F[:H] * F[:Q]')

# ╔═╡ 3426c47a-b63c-4d3c-89d3-24bbd751300c


# ╔═╡ Cell order:
# ╟─8b27c417-eb11-4bb2-b11d-3835de736c35
# ╠═88aa3f49-0f95-43aa-bd7a-8c1d79f2d341
# ╟─2ea62f54-efd4-420c-909e-0003784d8dc1
# ╠═82b41bf8-5766-4fd2-807f-7e0dba424633
# ╟─de189aeb-361d-4f47-96ae-2a670056a590
# ╠═73f6a473-6aa8-4f08-9aea-e74ce01e1b7b
# ╠═2a6dceb7-f609-499a-b736-117b72380ae2
# ╟─70b7b5fe-f290-4087-927e-21c80320548b
# ╠═6e768f73-8239-4d14-ae4c-adfe7c9c77f7
# ╟─a176f8f7-afc4-43d3-a960-3e3a6ea7ff79
# ╠═09643980-8c7b-40ce-bb73-9565408555bf
# ╟─b533f6f7-63c1-415d-acb9-0ec8790976ac
# ╠═da8e8e66-ed67-4064-9d66-ba829c350380
# ╟─3b35ffd4-15a4-46f5-8cdf-191411ec46db
# ╠═67cc87a9-abe7-42eb-bf27-b0f1aa7fc4ed
# ╠═0438c676-2e85-45bb-8a90-0e692ddb4f71
# ╟─26508993-2fea-4de0-8b3f-366d1ef77eb7
# ╠═d8351db6-dc61-45c2-a771-0a353cb6ceb7
# ╟─5560c6a3-a7e1-4963-bc16-4999b1eb1157
# ╠═fc29f9aa-b3b0-4fd2-b0bc-96301f950600
# ╟─d77e981c-9440-4882-abd5-ca391a054621
# ╠═b1830c1b-3f00-42f9-81bf-adecfa05c161
# ╠═03aac330-27fc-459e-8261-0fdac3721197
# ╟─af8072fd-3175-49c6-9248-41f48588d5a2
# ╠═72506456-8104-45b8-8243-722bd3bbce1f
# ╟─ace49f1a-2149-4d68-81ea-965d4d0e9197
# ╠═6c9e8943-0997-4f01-bc16-68bf62f72d21
# ╟─a544197a-a657-453c-80d5-b08e0d2dcdf6
# ╠═2e786f7a-e0a4-4e7c-90b6-7081864b6fa2
# ╟─6b91710e-5b70-434e-917c-d8c1e5f9809f
# ╠═3add75d7-88e6-4eb3-ad52-ace52755cf58
# ╟─71cd7876-82ca-4b09-b5b9-d79160b8061b
# ╠═4594cabf-46b0-42dc-b027-92c42de34d15
# ╟─d36ccfa0-6a44-4644-aa69-a46c09668c4d
# ╠═c0ab3d4b-93f1-4588-b7fa-c007039889a4
# ╟─06339cb3-9e6b-4214-9276-86574cc5d6bb
# ╠═bb0149cd-6e2d-4bf1-af68-71b3ddae9a61
# ╟─83177d5d-28a4-4d52-8df4-4b316e5e3080
# ╠═d09fbb3f-9cd8-4c8a-b2f8-2258579a71b5
# ╟─e5de2132-0a97-4802-a10a-cd0e770c8985
# ╠═77929858-3d6a-4832-ac1a-726ef652aea9
# ╟─bb14c31f-4d17-4fe6-86a0-7c2799c078f4
# ╠═085df56e-9938-45bb-944b-21173b3f6c76
# ╟─a515c3be-a27b-4cbf-9417-7b8446399ad2
# ╠═05f18b69-67ae-40fc-aefd-622af5f46a96
# ╟─c59e1737-d5fa-4cfe-9bd8-f0c8eb677231
# ╠═242397e3-e3e7-4f76-817c-2bccfb69009a
# ╟─79802f7a-50f2-4ae4-8991-046cd8fff9c6
# ╠═fd8a44d2-ca0b-469c-a33e-ecf02dec6955
# ╟─0e6ddaa6-3d8c-4db7-904a-e8eb76acb083
# ╠═ec5e8a05-43f4-4f8a-a6e0-cdc7213a2d82
# ╟─595844c9-cc40-4aaf-862a-e8becf9b4f0c
# ╠═f4e78715-446b-4434-b10e-a39ed3cac57c
# ╠═bc2e20b3-7f7d-418e-a5ac-0bb90bfcecbc
# ╟─f66596d8-a5c2-4025-995e-a0a1a3ebbade
# ╠═3881814e-0956-4588-831c-a6afc18c4290
# ╟─985f658f-81ad-46d9-8158-673a10c77628
# ╠═dd6cf48b-a756-4d1f-95a9-89649892bab7
# ╠═6cf155cd-07e5-466d-9e98-903450b969fc
# ╠═3426c47a-b63c-4d3c-89d3-24bbd751300c
