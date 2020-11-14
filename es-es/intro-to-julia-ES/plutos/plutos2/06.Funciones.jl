### A Pluto.jl notebook ###
# v0.10.0

using Markdown

# ╔═╡ b7d4165b-d051-441d-b4d1-251eba60a0d2
md"""
# Funciones

Temas:
1. Cómo declara una función
2. Duck-typing en Julia
3. Funciones mutantes vs. no-mutantes
4. Broadcasting
"""

# ╔═╡ 39434826-4c89-4074-9c9e-770bde3463dd
md"""
## Cómo declarar una función
Julia nos permite definir una función de varias maneras. La primera requiere de las palabras reservadas `function` y `end`
"""

# ╔═╡ 0adc05a6-8428-4722-94cc-355e65437395
function sayhi(name)
    println("Hi $name, it's great to see you!")
end

# ╔═╡ 158e67af-59ce-4d4f-8256-f635ffedf5a0
function f(x)
    x^2
end

# ╔═╡ b1bc4d5d-33b5-4698-8fb8-f4126af5463d
md"""
Y las podemos llamar así
"""

# ╔═╡ eaf96975-d1e6-4369-9fa1-8ab49b69b6d9
sayhi("C-3PO")

# ╔═╡ 7a5019b7-6ae4-4fcd-9859-118a6e000033
f(42)

# ╔═╡ e3585fc6-78ed-4ccf-a9f0-3387e41b1193
md"""
Alternativamente, las podemos declarar en una sóla línea
"""

# ╔═╡ 311a5abb-86ad-411f-9118-8827b65fb833
sayhi2(name) = println("Hi $name, it's great to see you!")

# ╔═╡ 25594aa9-0d0d-49e6-84cb-33d195e7bd62
f2(x) = x^2

# ╔═╡ 99fae709-86fd-4962-a47f-0dadfcebf9fc
sayhi2("R2D2")

# ╔═╡ c66327e0-3ac1-4078-96df-4c0132eeb5e9
f2(42)

# ╔═╡ 707831b6-e85a-4a11-9648-0af16acf71f7
md"""
Finalmente, pudimos declararlas como funciones "anónimas"
"""

# ╔═╡ c71820ac-4ae6-42a1-a1cb-d05ab25afc75
sayhi3 = name -> println("Hi $name, it's great to see you!")

# ╔═╡ 7a5b1e40-def3-4cca-9c81-73addb86aa18
f3 = x -> x^2

# ╔═╡ ca7f38ca-1b81-4425-ba04-32c40ba329cd
sayhi3("Chewbacca")

# ╔═╡ 59382902-5270-44f5-a19e-d8c296e630f3
f3(42)

# ╔═╡ 10880ded-73a9-4165-b993-623d93e08630
md"""
## Duck-typing en Julia
*"If it quacks like a duck, it's a duck."* 
*"Si suena como pato, es un pato"*
<br><br>
En Julia, las funciones operaran con el cualquier valor que haga sentido. <br><br>
Por ejemplo, `sayhi` funciona con el nombre de este personaje de tele, escrito como entero...
"""

# ╔═╡ 10205f9e-6758-44a7-a1ed-f1daae906893
sayhi(55595472)

# ╔═╡ 5d4f722a-3e68-422c-8dab-4c92be5b9804
md"""
Y `f` va a funcionar en una matriz.
"""

# ╔═╡ b9bfd357-22e7-4d75-a251-53e8379f8017
A = rand(3, 3)
A

# ╔═╡ 779781b3-5092-4559-9d61-b2e83d2b259a
f(A)

# ╔═╡ f16551eb-e665-4922-8e98-548a55872ebd
md"""
`f` funcionará con "hi" porque `*` para inputs de cadenas como concatenación.
"""

# ╔═╡ b626e299-7afd-4b62-b070-738fff6cb6cb
f("hi")

# ╔═╡ 2c44a8ae-c8e7-49ad-9de2-0537c56a6f23
md"""
Por el otro lado, `f` no funcionará sobre un vector. A diferencia de `A^2`, la cual es una operación bien definida, el signifiado de `v^2` para un vector, `v`, es ambigua. 
"""

# ╔═╡ 747e9a83-7886-4b33-a8d6-fd60293b2a0a
v = rand(3)

# ╔═╡ fb3682c1-674c-4ea3-a222-103bf960cbe8
f(v)

# ╔═╡ 81a0e65a-e4fb-427b-b59c-3248eff10b61
md"""
## Funciones mutantes vs no-mutantes

Por convención, funciones seguidas por un `!` alteran, o bien mutan, sus contenidos y las que carecen de un `!` no lo hacen.

Por ejemplo, `sort` y `sort!`.

"""

# ╔═╡ 3ce811b3-19aa-4f4f-8cf5-28f0032cc878
v = [3, 5, 2]

# ╔═╡ 284c7800-9dc2-4f0c-b3c0-da82e020cdfa
sort(v)

# ╔═╡ eec63ee5-9d20-4892-92df-9d0aeecfb323
v

# ╔═╡ 99dfcd21-d511-40d5-8119-fdf943bb2708
md"""
`sort(v)` regresa el arreglo ordenado de `v`, pero `v` no cambia. <br><br>

Por otro lado, si corremos `sort!(v)`, el contenido del arreglo es ordenado dentro de `v`.
"""

# ╔═╡ 11a3c01b-0ac1-4538-8103-8e7e35eadd3c
sort!(v)

# ╔═╡ 017e9146-e1ab-46c0-b6e8-e36f14965639
v

# ╔═╡ ca47c936-e9e4-4039-9ff2-3e6f6f395f89
md"""
## Broadcasting

Si ponemos `.` entre el nombre de la funcion y su lista de argumento,<br>
le estamos diciendo a la función que se "difunda"/haga broadcasting sobre los elementos del input. <br>

Primero veamos la diferencia entre `f()` y `f.()`.<br>

Primero definimos una nueva matriz `A` que hará la diferencia fácil de observar
"""

# ╔═╡ 0e5e8129-b03f-4010-8e33-d57d4aa49529
A = [i + 3*j for j in 0:2, i in 1:3]

# ╔═╡ 96b1c681-280a-43b0-bc00-2abb315549f6
f(A)

# ╔═╡ ac7f99d1-0eef-43b6-a01a-0da4bf0d5ef5
md"""
Cómo se vio antes, para una matriz, `A`,
```
f(A) = A^2 = A * A
``` 

`f.(A)` por el otro lado va a regresar un objeto que contiene el cuadrado de `A[i, j]` en su entrada correspondiente.
"""

# ╔═╡ 5d1d011e-2399-4d33-858c-b7b7e89e81b6
B = f.(A)

# ╔═╡ b5c3116e-f7dd-4ead-a554-c539eb152a32
A[2, 2]

# ╔═╡ 9144bda4-a4d0-4c30-b551-0324c35761eb
A[2, 2]^2

# ╔═╡ 918a6647-80e5-4a5a-820c-cdaf6f835fc7
B[2, 2]

# ╔═╡ 6469d0a9-860b-4bc0-b791-40edc1cea224
md"""
Esto significa que para `v`, `f.(v)` está definido, pero no para `f(v)` :
"""

# ╔═╡ 72658881-9638-4264-8d65-5766423ace70
v = [1, 2, 3]

# ╔═╡ 5c26b16d-4d73-4b79-b5e4-3b1e20c5cd9d
f.(v)

# ╔═╡ fb497c48-76e2-4eb1-8e21-785c93f39dc4
md"""
### Ejercicios

6.1 En vez de broadcastear `f` sobre `v`,  pudimos haber hecho `v .^ 2`.

Sin declarar una nueva funcion, agrega 1 a cada elemento de una matriz de `3x3` llena de `0`'s.
"""

# ╔═╡ f681fc78-679f-45b8-ae95-14b2d9eb6366


# ╔═╡ 62c8731f-63a7-4fae-8980-0d0665cb556a
md"""

"""

# ╔═╡ 7dbb40ed-0b51-4825-bbc8-9e6f4d0c4738


# ╔═╡ be113c25-4aec-4ead-a812-50a54aa7428d
md"""
6.3 Una cifra de César recorre cada letra un número determinado de plazas más adelante en el abecedario. Un corrimiento, o shift, de 1 manda "A" a "B". Escribe una función llamada `cesar` que toma una cadena como input y un corrimiento y regresa una cadena desencriptada tal que obtengas

```julia
cesar("abc", 1)
"bcd"

cesar("hello", 4)
"lipps"
```
"""

# ╔═╡ 14e4057a-96f3-4cec-b1f0-e0c01e73dd86


# ╔═╡ Cell order:
# ╟─b7d4165b-d051-441d-b4d1-251eba60a0d2
# ╟─39434826-4c89-4074-9c9e-770bde3463dd
# ╠═0adc05a6-8428-4722-94cc-355e65437395
# ╠═158e67af-59ce-4d4f-8256-f635ffedf5a0
# ╟─b1bc4d5d-33b5-4698-8fb8-f4126af5463d
# ╠═eaf96975-d1e6-4369-9fa1-8ab49b69b6d9
# ╠═7a5019b7-6ae4-4fcd-9859-118a6e000033
# ╟─e3585fc6-78ed-4ccf-a9f0-3387e41b1193
# ╠═311a5abb-86ad-411f-9118-8827b65fb833
# ╠═25594aa9-0d0d-49e6-84cb-33d195e7bd62
# ╠═99fae709-86fd-4962-a47f-0dadfcebf9fc
# ╠═c66327e0-3ac1-4078-96df-4c0132eeb5e9
# ╟─707831b6-e85a-4a11-9648-0af16acf71f7
# ╠═c71820ac-4ae6-42a1-a1cb-d05ab25afc75
# ╠═7a5b1e40-def3-4cca-9c81-73addb86aa18
# ╠═ca7f38ca-1b81-4425-ba04-32c40ba329cd
# ╠═59382902-5270-44f5-a19e-d8c296e630f3
# ╟─10880ded-73a9-4165-b993-623d93e08630
# ╠═10205f9e-6758-44a7-a1ed-f1daae906893
# ╟─5d4f722a-3e68-422c-8dab-4c92be5b9804
# ╠═b9bfd357-22e7-4d75-a251-53e8379f8017
# ╠═779781b3-5092-4559-9d61-b2e83d2b259a
# ╟─f16551eb-e665-4922-8e98-548a55872ebd
# ╠═b626e299-7afd-4b62-b070-738fff6cb6cb
# ╟─2c44a8ae-c8e7-49ad-9de2-0537c56a6f23
# ╠═747e9a83-7886-4b33-a8d6-fd60293b2a0a
# ╠═fb3682c1-674c-4ea3-a222-103bf960cbe8
# ╟─81a0e65a-e4fb-427b-b59c-3248eff10b61
# ╠═3ce811b3-19aa-4f4f-8cf5-28f0032cc878
# ╠═284c7800-9dc2-4f0c-b3c0-da82e020cdfa
# ╠═eec63ee5-9d20-4892-92df-9d0aeecfb323
# ╟─99dfcd21-d511-40d5-8119-fdf943bb2708
# ╠═11a3c01b-0ac1-4538-8103-8e7e35eadd3c
# ╠═017e9146-e1ab-46c0-b6e8-e36f14965639
# ╟─ca47c936-e9e4-4039-9ff2-3e6f6f395f89
# ╠═0e5e8129-b03f-4010-8e33-d57d4aa49529
# ╠═96b1c681-280a-43b0-bc00-2abb315549f6
# ╟─ac7f99d1-0eef-43b6-a01a-0da4bf0d5ef5
# ╠═5d1d011e-2399-4d33-858c-b7b7e89e81b6
# ╠═b5c3116e-f7dd-4ead-a554-c539eb152a32
# ╠═9144bda4-a4d0-4c30-b551-0324c35761eb
# ╠═918a6647-80e5-4a5a-820c-cdaf6f835fc7
# ╟─6469d0a9-860b-4bc0-b791-40edc1cea224
# ╠═72658881-9638-4264-8d65-5766423ace70
# ╠═5c26b16d-4d73-4b79-b5e4-3b1e20c5cd9d
# ╟─fb497c48-76e2-4eb1-8e21-785c93f39dc4
# ╠═f681fc78-679f-45b8-ae95-14b2d9eb6366
# ╟─62c8731f-63a7-4fae-8980-0d0665cb556a
# ╠═7dbb40ed-0b51-4825-bbc8-9e6f4d0c4738
# ╟─be113c25-4aec-4ead-a812-50a54aa7428d
# ╠═14e4057a-96f3-4cec-b1f0-e0c01e73dd86
