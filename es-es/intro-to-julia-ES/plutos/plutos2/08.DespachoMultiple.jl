### A Pluto.jl notebook ###
# v0.12.4

using Markdown
using InteractiveUtils

# ╔═╡ d2ac9e5e-8bb6-4fa1-9cb3-957d238d7355
md"""
# Despacho múltiple / multiple dispatch
"""

# ╔═╡ 60cc9b65-62bd-4795-a9d9-30ff6a5fdc48
md"""
En este notebook vamos a explorar **multiple dispatch**, un concepto fundamental en Julia.

Multiple dispatch permite software:
- rápido
- extendible
- programable
- divertido para experimentar
"""

# ╔═╡ dda25ade-80d1-429a-a285-dbc477305966
md"""
Para entender el despacho múltiple en Julia, observemos el operador `+`. <br>

Si llamamos `methods()` sobre `+`, podemos ver todas las definiciones de `+`
"""

# ╔═╡ d232a85b-62c8-4de5-8798-637af323b492
md"""
Podemos usar el macro de `@which` para saber qué método en particular estamos usando de `+`.<br> 

Distintos métodos se usan en cada uno de estos ejemplos.
"""

# ╔═╡ 495ee98c-e2b8-475f-8c36-b870c816d33b
md"""
Aún más, pues podemos definir nuevos métodos de `+`. <br>

Primero tenemos que importar `+` de Base.
"""

# ╔═╡ 37b52b24-d323-47e4-87db-fcbe204ca96e
import Base: +

# ╔═╡ 19b8a372-4ea5-4ff4-8a6a-f48aa34430f4
methods(+);

# ╔═╡ 6426c7fa-c3ed-4d06-be67-355ac10ebfea
@which 3 + 3

# ╔═╡ b297c837-e937-4da0-acd8-933df7fee791
@which 3.0 + 3.0 

# ╔═╡ 9896765a-8906-4877-b8e5-b5c0fc4b09f8
@which 3 + 3.0

# ╔═╡ 76151c1b-139f-40c6-b111-0b0634473e17
md"""
Digamos que queremos concatenar elementos con  `+`. Sin extender el método, no funciona
"""

# ╔═╡ 4f27b734-90ce-4502-9df2-b7d69c230266
"hello " + "world!"

# ╔═╡ 317c59a1-fe9d-47bc-acd6-d25f8a2bcbc7
@which "hello " + "world!"

# ╔═╡ 74997f65-4f75-4aa8-88f1-49a96a724e82
md"""
Entonces agregamos a `+` un método que toma dos cadenas y las concatena
"""

# ╔═╡ 1df76000-3434-4be6-b49d-6839436f1c6e
Base.:+(x::String, y::String) = string(x, y)

# ╔═╡ 37d06d98-4d74-4d29-9ec9-39fb0d31d31a
"hello " + "world!"

# ╔═╡ 1dbf2eb6-87ff-425e-b9bb-4039538c54ce
md"""
¡Funciona! Y si queremos más, podemos comprobarnos que Julia ha despachado sobre los tipos de "hello" y "world!", sobre el método que acabamos de definir
"""

# ╔═╡ 66dccffc-d0f1-4974-a673-4941cdc61429
@which "hello " + "world!"

# ╔═╡ b87d4755-802e-45a5-9478-2aa69af92a62
md"""
Vamos por un ejemplo más
"""

# ╔═╡ c5397d75-f538-4346-95e5-0c30f4d203e0
begin
	foo(x, y) = println("duck-typed foo!")
	foo(x::Int, y::Float64) = println("foo con entero y flotante!")
	foo(x::Float64, y::Float64) = println("foo con dos flotantes!")
	foo(x::Int, y::Int) = println("foo con dos enteros!")
end

# ╔═╡ b16e8931-5887-4335-bafa-8a06969d679f
foo(1, 1)

# ╔═╡ 33e60ea0-8788-477e-a45d-dd5c92f36929
foo(1., 1.)

# ╔═╡ a007b5cf-3ebf-473d-b640-32c1d9182fe9
foo(1, 1.0)

# ╔═╡ c135586a-4c72-4489-b143-c18226000bcc
foo(true, false)

# ╔═╡ 4a1d67f1-ee84-49e5-94ec-84a8c1ec965e
md"""
Nota que el último ejemplo aplica por default el caso de 'duck-typed foo' porque no había un método definido exclusivamente para dos booleanos.
"""

# ╔═╡ 976d280a-1474-47aa-9856-eb5e4ee6ab49
md"""
### Ejercicios

#### 9.1

Agrega un método para `+` que aplique un cifrado de César a una cadena (cómo en el notebook 6) tal que

```julia
"hello" + 4 == "lipps"
```
"""

# ╔═╡ ddd66730-c1d2-4a28-9b9e-c4aa66057e4e


# ╔═╡ 9cfd983b-0b80-4712-a394-d95b33e79ca8
md"""
#### 9.2

Checa que has extendido propiamente `+` recorriendo la próxima cadena para atrás por 3 letras:

"Gr#qrw#phggoh#lq#wkh#diidluv#ri#gudjrqv#iru#|rx#duh#fuxqfk|#dqg#wdvwh#jrrg#zlwk#nhwfkxs1"
"""

# ╔═╡ 09d662a9-9ce6-4718-9740-a79cf6ac18dd


# ╔═╡ Cell order:
# ╟─d2ac9e5e-8bb6-4fa1-9cb3-957d238d7355
# ╟─60cc9b65-62bd-4795-a9d9-30ff6a5fdc48
# ╟─dda25ade-80d1-429a-a285-dbc477305966
# ╠═19b8a372-4ea5-4ff4-8a6a-f48aa34430f4
# ╟─d232a85b-62c8-4de5-8798-637af323b492
# ╠═6426c7fa-c3ed-4d06-be67-355ac10ebfea
# ╠═b297c837-e937-4da0-acd8-933df7fee791
# ╠═9896765a-8906-4877-b8e5-b5c0fc4b09f8
# ╟─495ee98c-e2b8-475f-8c36-b870c816d33b
# ╠═37b52b24-d323-47e4-87db-fcbe204ca96e
# ╟─76151c1b-139f-40c6-b111-0b0634473e17
# ╠═4f27b734-90ce-4502-9df2-b7d69c230266
# ╠═317c59a1-fe9d-47bc-acd6-d25f8a2bcbc7
# ╟─74997f65-4f75-4aa8-88f1-49a96a724e82
# ╠═1df76000-3434-4be6-b49d-6839436f1c6e
# ╠═37d06d98-4d74-4d29-9ec9-39fb0d31d31a
# ╟─1dbf2eb6-87ff-425e-b9bb-4039538c54ce
# ╠═66dccffc-d0f1-4974-a673-4941cdc61429
# ╟─b87d4755-802e-45a5-9478-2aa69af92a62
# ╠═c5397d75-f538-4346-95e5-0c30f4d203e0
# ╠═b16e8931-5887-4335-bafa-8a06969d679f
# ╠═33e60ea0-8788-477e-a45d-dd5c92f36929
# ╠═a007b5cf-3ebf-473d-b640-32c1d9182fe9
# ╠═c135586a-4c72-4489-b143-c18226000bcc
# ╟─4a1d67f1-ee84-49e5-94ec-84a8c1ec965e
# ╟─976d280a-1474-47aa-9856-eb5e4ee6ab49
# ╠═ddd66730-c1d2-4a28-9b9e-c4aa66057e4e
# ╟─9cfd983b-0b80-4712-a394-d95b33e79ca8
# ╠═09d662a9-9ce6-4718-9740-a79cf6ac18dd
