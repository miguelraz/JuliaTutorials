### A Pluto.jl notebook ###
# v0.10.0

using Markdown

# ╔═╡ be8f2b17-1ffd-44a6-9932-dcf9850b200b
md"""
# Bucles

Temas:
1. bucles `while` 
2. bucles `for`
<br>

## bucles while

La sintaxis para un `while` es

```julia
while *condición*
    *cuerpo de bucle*
end
```

Por ejemplo, usaremos un `while` para contar o iterar sobre un arreglo.
"""

# ╔═╡ 88e8cf59-9f29-473a-ad15-f9cb06bc8041
n = 0
while n < 10
    n += 1
    println(n)
end

# ╔═╡ 4592214b-7e99-44d2-a42b-bd089458e9e9
myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

i = 1
while i <= length(myfriends)
    friend = myfriends[i]
    println("Hola $friend, ¡gusto en verte!")
    i += 1
end

# ╔═╡ 057fa1b3-74bf-4fc6-8481-9e533fb6ab52
md"""
## bucles for

La sintaxis para un bucle `for` es

```julia
for *var* in *iterable de bucle*
    *cuerpo de bucle*
end
```

Podemos usar un bucle for para generar los datos anteriores
"""

# ╔═╡ fe7047d8-1adc-4530-b7bf-603f369bdff6
for n in 1:10
    println(n)
end

# ╔═╡ c6bed13a-3d1a-4aac-b194-ecaac14f81d8
myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

for friend in myfriends
    println("Hi $friend, it's great to see you!")
end

# ╔═╡ bf6fa9ad-2c42-4b36-a46f-8535b6d9b399
md"""
Nota: se puede reemplazar `in` con `=` ó `∈`.
"""

# ╔═╡ 8969e3d6-0bd5-4c8d-82ab-76601fdcc26f
for n = 1:10
    println(n)
end

# ╔═╡ c3bca3ca-810d-4f77-8d5b-47f81e0faab6
for n ∈ 1:10
    println(n)
end

# ╔═╡ 7e3053c0-c48a-48ca-aa49-d76d4b0ec5ef
md"""
Ahora usemos bucles `for` para crear tablas de sumas donde el valor de cada entrada es la suma de los índices del renglón y la columna. <br>

Primero, inicializamos el arreglo con puros 0s.
"""

# ╔═╡ 392de431-f9ba-4b8f-96ef-a2b07ba40eba
m, n = 5, 5
A = fill(0, (m, n))

# ╔═╡ 7e9cc9af-875d-44c7-a579-0719b935524f
for i in 1:m
    for j in 1:n
        A[i, j] = i + j
    end
end
A

# ╔═╡ 5e68befc-4bba-449f-a584-00ae0686d98d
md"""
Aquí va un poquito de azúcar sintáctica para el bucle `for`
"""

# ╔═╡ 761a72b1-d015-49be-b096-49151298adc0
B = fill(0, (m, n))

# ╔═╡ 48b16d10-1566-4437-8cca-fced7a30b42f
for i in 1:m, j in 1:n
    B[i, j] = i + j
end
B

# ╔═╡ 1d481a45-af10-4ed7-a21c-9eb8a1bf17d6
md"""
La manera mas "Juliana" de crear esta tabla es por medio de un *array comprehension / comprehensión de arreglo*.
"""

# ╔═╡ c92fd9a3-5525-4046-a6bd-08323ad27999
C = [i + j for i in 1:m, j in 1:n]

# ╔═╡ 5a1aa04a-a98c-4292-80f2-b30d0018adfa
md"""
En el próximo ejemplo, embebimos un arreglo de comprehensión en un bucle `for`, generando tablas de adición de tamaño creciente.
"""

# ╔═╡ 66830444-9540-42ed-8fe2-5e6fb87cde62
for n in 1:10
   A = [i + j for i in 1:n, j in 1:n]
   display(A)
end

# ╔═╡ 78391d6a-3f6c-430b-9daf-480f7e12131d
md"""
### Ejercicios

4.1 Crea un diccionario `squares`, que tiene llaves de valores de 1 a 100. El valor asociado a cada llave es el cuadrado de la llave. Guarda los valores asociados a las llaves pares como enteros y las impares como cadenas. Por ejemplo,

```julia
squares[10] == 100
squares[11] == "121"
```

(¡No necesitas condicionales para esto!)
"""

# ╔═╡ bb3eb294-d78d-4e64-868e-84ae0f28c985


# ╔═╡ 44c740ff-80e0-4390-b599-00db419c269c
md"""
4.2 Usa `fill` para crea una matriz de `10x10` de solo `0`'s. Pobla las primeras 10 entradas con el índice de esa entrada. ¿Julia usa el orden de primero columna o primero renglón? (O sea, ¿el "segundo" elemento es el de la primera columna en el primer renglón, ó es el de el primer renglón en la segunda columna?)
"""

# ╔═╡ 074c5f35-f3cc-441f-87c4-b9c407b13efb


# ╔═╡ Cell order:
# ╟─be8f2b17-1ffd-44a6-9932-dcf9850b200b
# ╠═88e8cf59-9f29-473a-ad15-f9cb06bc8041
# ╠═4592214b-7e99-44d2-a42b-bd089458e9e9
# ╟─057fa1b3-74bf-4fc6-8481-9e533fb6ab52
# ╠═fe7047d8-1adc-4530-b7bf-603f369bdff6
# ╠═c6bed13a-3d1a-4aac-b194-ecaac14f81d8
# ╟─bf6fa9ad-2c42-4b36-a46f-8535b6d9b399
# ╠═8969e3d6-0bd5-4c8d-82ab-76601fdcc26f
# ╠═c3bca3ca-810d-4f77-8d5b-47f81e0faab6
# ╟─7e3053c0-c48a-48ca-aa49-d76d4b0ec5ef
# ╠═392de431-f9ba-4b8f-96ef-a2b07ba40eba
# ╠═7e9cc9af-875d-44c7-a579-0719b935524f
# ╟─5e68befc-4bba-449f-a584-00ae0686d98d
# ╠═761a72b1-d015-49be-b096-49151298adc0
# ╠═48b16d10-1566-4437-8cca-fced7a30b42f
# ╟─1d481a45-af10-4ed7-a21c-9eb8a1bf17d6
# ╠═c92fd9a3-5525-4046-a6bd-08323ad27999
# ╟─5a1aa04a-a98c-4292-80f2-b30d0018adfa
# ╠═66830444-9540-42ed-8fe2-5e6fb87cde62
# ╟─78391d6a-3f6c-430b-9daf-480f7e12131d
# ╠═bb3eb294-d78d-4e64-868e-84ae0f28c985
# ╟─44c740ff-80e0-4390-b599-00db419c269c
# ╠═074c5f35-f3cc-441f-87c4-b9c407b13efb
