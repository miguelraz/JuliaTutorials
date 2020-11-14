### A Pluto.jl notebook ###
# v0.10.0

using Markdown

# ╔═╡ f906f80a-9eec-40cb-80ba-bdb06a798b1b
md"""
# Estructuras de datos

Una vez que empecemos a trabajar con muchos datos a la vez, será conveniente guardar nuestros datos en estructuras como arreglos o diccionarios (más allá que sólo variables).<br>

Tipos de estructuras de datos que cubrimos
1. Tuplas
2. Diccionarios
3. Arreglos

<br>
Como repaso, las tuplas y los arreglos ambos son secuencias ordenadas de elementos (entonces podemos accesarlos por medio de un índice).
Los diccionarios y los arreglos son mutables.

¡Explicaremos más brevemente!
"""

# ╔═╡ 67852a29-1c6c-4ab6-be1e-35a16be10a40
md"""
## Tuplas / Tuples

Podemos crear una tupla encerrando una secuencia ordenada de elementos con `( )`.

Sintaxis: <br>
```julia
(item1, item2, ...)```
"""

# ╔═╡ 5f86014d-54f2-497e-b6d3-529ff3e6f43e
mis_animales_favoritos = ("pingüino", "gato", "petauro_del_azúcar")

# ╔═╡ b21a8b34-0b8d-4c06-b38c-f468e6994dd7
md"""
Podemos accesar con el índice a esta tupla,
"""

# ╔═╡ 19f89894-779a-4498-bbc5-a586f26904fe
myfavoriteanimals[1]

# ╔═╡ b5b36260-b451-4537-801b-a0c90963fce0
md"""
Pero como las tuplas con inmutables, no la podemos modificar
"""

# ╔═╡ 41d46a14-3604-41d9-b8f7-3f4961dd66c8
mis_animales_favoritos[1] = "nutria"

# ╔═╡ 4ac9e892-3ac0-4f76-bc89-fee80ace061a
md"""
## Diccionarios

Si tenemos conjuntos de datos relacionados entre sí, podemos guardar los datos en un diccionario. Un buen ejemplo es una lista de contactos, donde asociamos nombres a números de teléfono.

Sintaxis:
```julia
Dict(llave1 => valor1, llave2 => valor2, ....)```
"""

# ╔═╡ 4ac82f64-1d92-4a63-ad3b-9d65df410245
miagenda = Dict("Jenny" => "867-5309", "Cazafantasmas" => "555-2368")

# ╔═╡ a4e6740c-947d-4413-9eac-d5252e6c23e3
md"""
En este ejemplo, cada nombre y número es un par de "llave" y "valor". Podemos tomar el númer de Jenny (un valor) usando la llave asociada.
"""

# ╔═╡ 0d2e6550-8ba0-4c97-a12a-911125e71237
miagenda["Jenny"]

# ╔═╡ 680c0f29-beac-49d6-9072-862c2c40c882
md"""
Podemos agregar otra entrada al diccionario de la manera siguiente
"""

# ╔═╡ 1bb288b2-522d-4846-879e-801ba9237967
miagenda["Kramer"] = "555-FILK"

# ╔═╡ 79ad3556-1c4b-40a1-bec9-26f407c39824
md"""
Veamos como se ve nuestro diccionario ahora...
"""

# ╔═╡ 4b30cdfc-8870-432e-8a00-2bcd9e6f719f
miagenda

# ╔═╡ 3276de5f-804a-46c3-b56c-dc59b4e0e5c6
md"""
Para borrar a Kramer de nuestro diccionario - y simultáneamente tomar su número - usamos  pop!
"""

# ╔═╡ f957b7d5-aaf4-456d-b820-66e1cc1b1fb2
pop!(miagenda, "Kramer")

# ╔═╡ c016c9d6-bea4-431d-b4fe-428798797e9b
miagenda

# ╔═╡ f391e572-57d7-4bbf-8cb4-8ffcf3477eb1
md"""
A diferencia de las tuplas y los arreglos, los diccionarios no están ordenados y no podemos accesarlos con un índice
"""

# ╔═╡ 6e2a49b3-076d-49cf-918a-1a3f47adc968
miagenda[1]

# ╔═╡ 4f28e674-6bf5-487e-927d-1323740e5744
md"""
En el ejemplo anterior, `julia` piensa que estás tratando de accesar a un valor asociado a la llave `1`.
"""

# ╔═╡ 285cf3f2-6d51-4a62-89c1-fa4c1fcdce6e
md"""
## Arreglos

A diferencia de las tuplas, los arreglos son mutables. A diferencia de los diccionarios, los arreglos contienen secuencias ordenadas de elementos. <br>
Podemos crear un arreglo encapsulando esta secuencia de elementos con `[ ]`.

Sintaxis: <br>
```julia
[item1, item2, ...]```


Por ejemplo, podemos usar un arreglo para recordar a mis amigos
"""

# ╔═╡ 2a19ba38-cbfa-4c3d-9976-4a1cd21f4313
myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

# ╔═╡ 51e4ab4e-75e7-43b0-ba5c-33742dcd013c
md"""
O guardar una secuencia de números
"""

# ╔═╡ b80b646a-71fd-4ffd-942a-7ef55f729402
fibonacci = [1, 1, 2, 3, 5, 8, 13]

# ╔═╡ 764cbdbc-44f5-4296-91ae-2e32ce3e98e0
mezcla = [1, 1, 2, 3, "Ted", "Robyn"]

# ╔═╡ a2366d3b-d945-422d-b0f0-d31d110899ef
md"""
Una vez que tenenmos un arreglo, podemos tomar los datos individualmente dentro del arreglo accesándolos por su índice. Por ejemplo, si queremos al tercer amigo en myfriends, escribimos
"""

# ╔═╡ 1b4b94c0-18e6-4d6a-bf5b-fb8a144e0a13
myfriends[3]

# ╔═╡ 82ee1763-e192-488d-a11a-5c2138e9ca54
md"""
Podemos usar el índice para mutar la entrada del arreglo
"""

# ╔═╡ 66c708d0-c7b7-47d1-8256-5c7e00cc4f51
myfriends[3] = "Baby Bop"

# ╔═╡ 8ec49414-da74-41c8-a2b1-55722966ce8f
md"""
También se puede editar con las fuciones de `push!` y `pop!`. `push!` agrega un elemento al final del arreglo y `pop!` quita al último elemento del arreglo.

Podemos agregar otro número a la secuencia fibonacci
"""

# ╔═╡ efd0045d-1f74-4ba0-988c-88897a8fea05
push!(fibonacci, 21)

# ╔═╡ 097606fc-7e9c-4c18-a5e6-027b352d0303
md"""
y quitarlo
"""

# ╔═╡ 78d6f8b1-5f07-45a4-ae60-658a3dd3fc02
pop!(fibonacci)

# ╔═╡ aaf34386-b771-4b0b-9d59-9ae24f4e8db8
fibonacci

# ╔═╡ 1f56308b-608a-4bac-b2ed-427d652d9f98
md"""
Hasta ahora hemos dado ejemplos de arreglos de escalars unidimensionales, pero los arreglos pueden tener un número arbitrario de dimensiones y también pueden guardar otros arreglos.
<br><br>
Por ejemplo, estos son arreglos de arreglos
"""

# ╔═╡ e47cb827-15e0-4ec0-b35f-5dc823844ac3
favoritos = [["koobideh", "chocolate", "eggs"],["penguins", "cats", "sugargliders"]]

# ╔═╡ a21f2ecb-7dbb-44df-8e81-55b7ed249161
numbers = [[1, 2, 3], [4, 5], [6, 7, 8, 9]]

# ╔═╡ eb301c3e-035f-42b7-aec5-66f53f085553
md"""
Abajo hay arreglos de 2D y 3D poblados con valores aleatorios
"""

# ╔═╡ 3a6a5316-9f10-40f1-9424-7d932c04be29
rand(4, 3)

# ╔═╡ 6fc41d26-ebc4-46ff-ac4e-075a903178e0
rand(4, 3, 2)

# ╔═╡ ea1953f7-9b6c-4698-8b50-e1ac43e04068
md"""
¡Cuidado copiando los arreglos!
"""

# ╔═╡ c6015f8e-87dd-408a-9491-8164f8ff9a40
fibonacci

# ╔═╡ eaeb74ea-6e64-4d3e-afbe-e9d5f518a618
somenumbers = fibonacci

# ╔═╡ 4cd1a54f-050c-4db6-b3de-957ee37f6c7f
somenumbers[1] = 404

# ╔═╡ 6f9e6b20-6dd7-47dc-b1c9-f599dcceaea0
fibonacci

# ╔═╡ fb09bb5b-9f80-47fe-9c75-2d9017a14271
md"""
Editar `somenumbers` causa que `fibonacci` se edite también!

En el ejemplo superior, en realidad no hicimos una copia de `fibonacci`. Sólo creamos una nueva manera de accesar las entradas del arreglo relacionado a `fibonacci`.

Si queremos hacer una copia de un arreglo amarrado a `fibonacci`, usamos la función de `copy`.
"""

# ╔═╡ a448ed00-e41b-4686-8c09-127ad496914b
# Primero restauramos a fibonnaci
fibonacci[1] = 1
fibonacci

# ╔═╡ 366a0922-c471-484d-9e3f-39b4117e705a
somemorenumbers = copy(fibonacci)

# ╔═╡ 57c6edf7-2d12-4d48-816c-3b32de841b3f
somemorenumbers[1] = 404

# ╔═╡ 636ee6ad-7010-4c50-9582-b8431dee69e0
fibonacci

# ╔═╡ 74e89a6d-f8bd-4744-aad3-7a5c109ae9f4
md"""
En el último ejemplo, no se editó a fibonacci. Entonces vemos que los arreglos amarrados a `somemorenumbers` y `fibonacci` son distintos.
"""

# ╔═╡ 9b65e734-61c3-4059-9539-79711d7cd48f
md"""
### Exercises

3.1 Crea un arreglo, `arreglo`, que sea un arreglo de 1D de 2-elementos de 1-elemento de 1D, cada uno guardando el número 0.
Accesa a `arreglo` para agregar un `1` a cada uno de los arreglos que contiene.
"""

# ╔═╡ cf0b40c8-cf5b-473d-a0c9-4248198d395e


# ╔═╡ d6cc5532-87c1-409a-9661-a4edc42a3177
md"""
3.2 Trata de agregar "Emergencia" a `miagenda` con el valor `911`. Trata de agregar `911` como un entero y no como cadena. ¿Porqué no funciona?
"""

# ╔═╡ 56fcc723-4baf-4225-88f0-de331af394e1


# ╔═╡ da4abb22-bd0a-4eaf-89df-d9c95f183f6a
md"""
3.3 Crea un nuevo diccionario que se llame `agenda_flexible` que tenga el número de Jenny guardado como cadena y el de los Cazafantasmas como entero.
"""

# ╔═╡ c2763aaa-e0af-4d36-9997-c62cb85c10d4


# ╔═╡ 66aa9ebe-09ea-4bab-8bed-90d79cdc2826
md"""
3.4 Agrega la llave de "Emergencia al valor (entero) `911` a `agenda_flexible`.
"""

# ╔═╡ 2fa4912f-569d-48ad-81ed-9609174b967b


# ╔═╡ 15636609-63bd-4ff1-88b3-497e54deb1c7
md"""
3.5 ¿Porqué podemos agregar un entero como valor a `agenda_flexible` pero no a  `miagenda`? ¿Cómo pudimos haber inicializado `miagenda` para que aceptara enteros como valores?
"""

# ╔═╡ b42e131e-6d50-40c0-9a22-762612efef0a


# ╔═╡ Cell order:
# ╟─f906f80a-9eec-40cb-80ba-bdb06a798b1b
# ╟─67852a29-1c6c-4ab6-be1e-35a16be10a40
# ╠═5f86014d-54f2-497e-b6d3-529ff3e6f43e
# ╟─b21a8b34-0b8d-4c06-b38c-f468e6994dd7
# ╠═19f89894-779a-4498-bbc5-a586f26904fe
# ╟─b5b36260-b451-4537-801b-a0c90963fce0
# ╠═41d46a14-3604-41d9-b8f7-3f4961dd66c8
# ╟─4ac9e892-3ac0-4f76-bc89-fee80ace061a
# ╠═4ac82f64-1d92-4a63-ad3b-9d65df410245
# ╟─a4e6740c-947d-4413-9eac-d5252e6c23e3
# ╠═0d2e6550-8ba0-4c97-a12a-911125e71237
# ╟─680c0f29-beac-49d6-9072-862c2c40c882
# ╠═1bb288b2-522d-4846-879e-801ba9237967
# ╟─79ad3556-1c4b-40a1-bec9-26f407c39824
# ╠═4b30cdfc-8870-432e-8a00-2bcd9e6f719f
# ╟─3276de5f-804a-46c3-b56c-dc59b4e0e5c6
# ╠═f957b7d5-aaf4-456d-b820-66e1cc1b1fb2
# ╠═c016c9d6-bea4-431d-b4fe-428798797e9b
# ╟─f391e572-57d7-4bbf-8cb4-8ffcf3477eb1
# ╠═6e2a49b3-076d-49cf-918a-1a3f47adc968
# ╟─4f28e674-6bf5-487e-927d-1323740e5744
# ╟─285cf3f2-6d51-4a62-89c1-fa4c1fcdce6e
# ╠═2a19ba38-cbfa-4c3d-9976-4a1cd21f4313
# ╟─51e4ab4e-75e7-43b0-ba5c-33742dcd013c
# ╠═b80b646a-71fd-4ffd-942a-7ef55f729402
# ╠═764cbdbc-44f5-4296-91ae-2e32ce3e98e0
# ╟─a2366d3b-d945-422d-b0f0-d31d110899ef
# ╠═1b4b94c0-18e6-4d6a-bf5b-fb8a144e0a13
# ╟─82ee1763-e192-488d-a11a-5c2138e9ca54
# ╠═66c708d0-c7b7-47d1-8256-5c7e00cc4f51
# ╟─8ec49414-da74-41c8-a2b1-55722966ce8f
# ╠═efd0045d-1f74-4ba0-988c-88897a8fea05
# ╟─097606fc-7e9c-4c18-a5e6-027b352d0303
# ╠═78d6f8b1-5f07-45a4-ae60-658a3dd3fc02
# ╠═aaf34386-b771-4b0b-9d59-9ae24f4e8db8
# ╟─1f56308b-608a-4bac-b2ed-427d652d9f98
# ╠═e47cb827-15e0-4ec0-b35f-5dc823844ac3
# ╠═a21f2ecb-7dbb-44df-8e81-55b7ed249161
# ╟─eb301c3e-035f-42b7-aec5-66f53f085553
# ╠═3a6a5316-9f10-40f1-9424-7d932c04be29
# ╠═6fc41d26-ebc4-46ff-ac4e-075a903178e0
# ╟─ea1953f7-9b6c-4698-8b50-e1ac43e04068
# ╠═c6015f8e-87dd-408a-9491-8164f8ff9a40
# ╠═eaeb74ea-6e64-4d3e-afbe-e9d5f518a618
# ╠═4cd1a54f-050c-4db6-b3de-957ee37f6c7f
# ╠═6f9e6b20-6dd7-47dc-b1c9-f599dcceaea0
# ╟─fb09bb5b-9f80-47fe-9c75-2d9017a14271
# ╠═a448ed00-e41b-4686-8c09-127ad496914b
# ╠═366a0922-c471-484d-9e3f-39b4117e705a
# ╠═57c6edf7-2d12-4d48-816c-3b32de841b3f
# ╠═636ee6ad-7010-4c50-9582-b8431dee69e0
# ╟─74e89a6d-f8bd-4744-aad3-7a5c109ae9f4
# ╟─9b65e734-61c3-4059-9539-79711d7cd48f
# ╠═cf0b40c8-cf5b-473d-a0c9-4248198d395e
# ╟─d6cc5532-87c1-409a-9661-a4edc42a3177
# ╠═56fcc723-4baf-4225-88f0-de331af394e1
# ╟─da4abb22-bd0a-4eaf-89df-d9c95f183f6a
# ╠═c2763aaa-e0af-4d36-9997-c62cb85c10d4
# ╟─66aa9ebe-09ea-4bab-8bed-90d79cdc2826
# ╠═2fa4912f-569d-48ad-81ed-9609174b967b
# ╟─15636609-63bd-4ff1-88b3-497e54deb1c7
# ╠═b42e131e-6d50-40c0-9a22-762612efef0a
