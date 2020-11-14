### A Pluto.jl notebook ###
# v0.12.4

using Markdown
using InteractiveUtils

# ╔═╡ 1de6669f-0ea3-4ba3-a8dc-823c3d80587b
using Example

# ╔═╡ 41705822-0e1d-4415-ab0a-e4bcd69a7ba0
using Colors

# ╔═╡ 6f95520c-7814-42ef-8d8d-448689f3b134
md"""
# Paquetes

Julia tiene màs de 1686 paquetes registrados, conformando una gran parte del ecosistema de Julia.

Para ver todos los paquetes, visita

https://pkg.julialang.org/

o bien

https://juliaobserver.com/

Ahora vamos a aprender a usarlos
"""

# ╔═╡ 106b3ed9-fd78-4d58-b5d1-f334227fb5bd
md"""
La primera vez que quieres usar un paquete en Julia, hay que agregarlo
"""

# ╔═╡ 7a0a379a-c671-4d5f-8f10-0353532e78a2
#Pkg.add("Example")

# ╔═╡ 5a32707a-150f-46ac-8e8c-55e7f09d73bd
md"""
Cada vez que usas Julia (empezar una nueva sesión en el REPL, abrir un notebook por primera vez, por ejemplo), tienes que cargar el paquete usando la palabra reservada `using`
"""

# ╔═╡ 0c48df5e-7758-400b-b2d3-1cf682dc7d65
md"""
En el código fuente de  `Example.jl` en

https://github.com/JuliaLang/Example.jl/blob/master/src/Example.jl

Vemos una función declarada como 

```
hello(who::String) = "Hello, $who"
```

Si cargamos `Example`, debemos poder llamar `hello`
"""

# ╔═╡ 066eaf1a-e63c-49ec-9daa-5963ebea8013
hello("it's me. I was wondering if after all these years you'd like to meet.")

# ╔═╡ b8960f7d-7a16-49a5-a715-205b400d54de
md"""
Ahora vamos a jugar con el paquete de Colors
"""

# ╔═╡ d589b892-e9b4-4ad4-9b31-4038574ee1ca
#Pkg.add("Colors")

# ╔═╡ 8eb3fa0c-d505-4da6-920f-267291f3f71f
md"""
Creemos una bandeja de 100 colores
"""

# ╔═╡ eed87d62-4aee-4ce8-81e4-98690b4ac26f
bandeja = distinguishable_colors(100)

# ╔═╡ 6b5d2e71-7be3-466a-af58-e7a7bc705af5
md"""
y podemos crear una matriz colorida aleatoriamente con rand
"""

# ╔═╡ d7690f46-9e9d-4298-a585-025df0544942
rand(bandeja, 3, 3)

# ╔═╡ be413aad-d1af-461c-b258-5ba644012cb0
md"""
En el próximo notebook, vamos a usar un nuevo paquete para graficar datos
"""

# ╔═╡ a7036073-ce03-4b90-848c-dd9a06563bf6
md"""
### Ejercicios

7.1 Usa el paquete de  (código fuente en https://github.com/JuliaMath/Primes.jl) para encontrar el número primer más grande menor a 1,000,000
"""

# ╔═╡ d95c6285-bb5f-4951-ae57-6ab846ee30fe


# ╔═╡ Cell order:
# ╟─6f95520c-7814-42ef-8d8d-448689f3b134
# ╟─106b3ed9-fd78-4d58-b5d1-f334227fb5bd
# ╠═7a0a379a-c671-4d5f-8f10-0353532e78a2
# ╟─5a32707a-150f-46ac-8e8c-55e7f09d73bd
# ╠═1de6669f-0ea3-4ba3-a8dc-823c3d80587b
# ╟─0c48df5e-7758-400b-b2d3-1cf682dc7d65
# ╠═066eaf1a-e63c-49ec-9daa-5963ebea8013
# ╟─b8960f7d-7a16-49a5-a715-205b400d54de
# ╠═d589b892-e9b4-4ad4-9b31-4038574ee1ca
# ╠═41705822-0e1d-4415-ab0a-e4bcd69a7ba0
# ╟─8eb3fa0c-d505-4da6-920f-267291f3f71f
# ╠═eed87d62-4aee-4ce8-81e4-98690b4ac26f
# ╟─6b5d2e71-7be3-466a-af58-e7a7bc705af5
# ╠═d7690f46-9e9d-4298-a585-025df0544942
# ╟─be413aad-d1af-461c-b258-5ba644012cb0
# ╟─a7036073-ce03-4b90-848c-dd9a06563bf6
# ╠═d95c6285-bb5f-4951-ae57-6ab846ee30fe
