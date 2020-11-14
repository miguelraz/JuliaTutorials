### A Pluto.jl notebook ###
# v0.12.4

using Markdown
using InteractiveUtils

# ╔═╡ 94321f8e-18c7-11eb-2ad3-95d8d43b619e
md"""# 02. Cadenas

Las cadenas (o strings) son una manera de representar 'escritura', de cierta manera. Vamos a ver unas pocas operaciones esenciales."""

# ╔═╡ 43a552ca-18c7-11eb-27cf-a542625f9c2a
s1 = "Yo soy una cadena."

# ╔═╡ 83c285e4-18c7-11eb-24ae-e7fa2261f59d
s2 = """Yo también soy una cadena. """

# ╔═╡ 83c32152-18c7-11eb-0160-75319f13f0ac
md"""Aquí me sale un "error" porque es ambiguo dónde se acaba la cadena. """

# ╔═╡ 83c3af96-18c7-11eb-0193-bff7c9ad728c
md"""Mira Mamá, sin "errors"!!! """

# ╔═╡ 83ca5b70-18c7-11eb-3a89-17c9cf24ef07
typeof('a')

# ╔═╡ 83cb2c44-18c7-11eb-0619-23dd78a98c3c
md"Esto va a dar un error"

# ╔═╡ 83d2c078-18c7-11eb-259f-1fde4a616418
nombre = "Jane"

# ╔═╡ 83d8028e-18c7-11eb-0426-bb22341c210e
num_dedos = 10

# ╔═╡ 83ddb2b0-18c7-11eb-091e-69c0a0bd7fda
num_dedos_de_los_pies = 10

# ╔═╡ 83deb072-18c7-11eb-1f6a-f573333e7b77
println("Hola, me llamo $nombre.")

# ╔═╡ 83e61bee-18c7-11eb-1fec-73e66ae5fd41
println("Yo tengo $num_dedos dedos y $num_dedos_de_los_pies. ¡Esos son $(num_dedos + num_dedos_de_los_pies) dígitos en total!!")

# ╔═╡ 83ebec36-18c7-11eb-17c4-b3469784352f
string("¿Cuántos gatos ", "son demasiados?")

# ╔═╡ 83f34044-18c7-11eb-338b-6f52fa3aaa28
string("No lo sé, pero ", 10, " son muy pocos.")

# ╔═╡ 83f7bd72-18c7-11eb-299b-532cd21b5c74
s3 = "¿Cuántos gatos ";

# ╔═╡ 83fd7c44-18c7-11eb-11e2-cd16995cb97e
s4 = "son demasiados?";

# ╔═╡ 83fe4eda-18c7-11eb-175c-fd5187fad01b
s3*s4

# ╔═╡ 840692b6-18c7-11eb-2444-1db13647dd0e
"$s3$s4"

# ╔═╡ Cell order:
# ╟─94321f8e-18c7-11eb-2ad3-95d8d43b619e
# ╠═43a552ca-18c7-11eb-27cf-a542625f9c2a
# ╠═83c285e4-18c7-11eb-24ae-e7fa2261f59d
# ╟─83c32152-18c7-11eb-0160-75319f13f0ac
# ╟─83c3af96-18c7-11eb-0193-bff7c9ad728c
# ╠═83ca5b70-18c7-11eb-3a89-17c9cf24ef07
# ╟─83cb2c44-18c7-11eb-0619-23dd78a98c3c
# ╠═83d2c078-18c7-11eb-259f-1fde4a616418
# ╠═83d8028e-18c7-11eb-0426-bb22341c210e
# ╠═83ddb2b0-18c7-11eb-091e-69c0a0bd7fda
# ╠═83deb072-18c7-11eb-1f6a-f573333e7b77
# ╠═83e61bee-18c7-11eb-1fec-73e66ae5fd41
# ╠═83ebec36-18c7-11eb-17c4-b3469784352f
# ╠═83f34044-18c7-11eb-338b-6f52fa3aaa28
# ╠═83f7bd72-18c7-11eb-299b-532cd21b5c74
# ╠═83fd7c44-18c7-11eb-11e2-cd16995cb97e
# ╠═83fe4eda-18c7-11eb-175c-fd5187fad01b
# ╠═840692b6-18c7-11eb-2444-1db13647dd0e
