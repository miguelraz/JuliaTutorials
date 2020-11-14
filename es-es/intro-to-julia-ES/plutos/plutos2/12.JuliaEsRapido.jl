### A Pluto.jl notebook ###
# v0.10.0

using Markdown

# ╔═╡ ec524cbb-6bf3-4905-9bcf-b12b132f5a73
md"""
# Julia es rápido

Frecuentemente, se usan benchmarks para comparar lenguajes. Éstos benchmarks pueden llevar a largas discusiones; primero, para saber lo que se está midiendo y segundo para explicar sus diferencias. Estas preguntas sencillas a veces son mucho más complicadas de lo que uno se imagina.

El propósito de este notebook es para que tú puedas hacer un benchmark simple. Uno puede leer el notebook y ver que sucedió en la Macbook Pro 4-core Intel Core i7 del autor, o correrlo uno mismo.

(Este material empezó como parte de una clase que dió Steven Johnson en MIT: https://github.com/stevengj/18S096/blob/master/lectures/lecture1/Boxes-and-registers.ipynb.)
"""

# ╔═╡ 7c937466-d3e3-40a2-a783-7aee0593194c
md"""
# Esquema de este notebook
- Definir la función suma
- Implementación y benchmark de la función suma en ...
    - C
    - python (interno)
    - python (numpy)
    - python (hecho a mano)
    - Julia (interno)
    - Julia (hecho a mano)
- Resúmenes de resultados
"""

# ╔═╡ 7b4560ee-5b96-4839-b177-e241d2b0a590
md"""
# `sum`: una función fácil de entender
"""

# ╔═╡ 1a6dc528-c4f0-4728-9584-7aa2603750e7
md"""
Considera la función  **sum** `sum(a)`, la cual calcula
$$
\mathrm{sum}(a) = \sum_{i=1}^n a_i,
$$
con $n$ longitud de `a`.
"""

# ╔═╡ 88ae83e6-fde5-4d8c-aa1a-ee8c20c4b4b6
a = rand(10^7) # Vector 1D uniforme en [0,1)

# ╔═╡ f7904227-b760-4756-8bce-00e4bfa4b8ac
sum(a)   

# ╔═╡ c10e3205-7dcc-4d5a-9c3a-9d5ad0ea64ff
md"""
El resultado esperado es 0.5 * 10^7, pues el promedio de cada entrada es .5
"""

# ╔═╡ 91a933be-f773-4953-a445-dc2705337cd6
md"""
# Benchmarks de algunas manera en algunos lenguajes
"""

# ╔═╡ 15a815af-8cad-44ba-a7a9-8d1dfe46c473
md"""
Julia cuenta con el paquete `BenchmarkTools.jl` para hacer benchmarks fácil y rápidos
"""

# ╔═╡ 6d50f534-c4ec-4a52-89c4-2c9e99bccc7d
#Pkg.add("BenchmarkTools")

# ╔═╡ 0b34c831-76a6-4f64-8dbf-99141c69a334
using BenchmarkTools  

# ╔═╡ c5d36d38-bb99-48de-9131-0e5cb99bc9c5
md"""
#  1. El lenguaje C

C es considerado el estándar dorado: difícil para el usuario, fácil para la máquina. Estar dentro de un factor de 2 de C puede ser muy satisfactorio. Sin emargo, aún dentro de C, existen muchos tipos de optimizaciones posibles que un usuario de C promedio puedo o no aprovechar.

Su autor no habla C, entonces no va a leer la celda siguiente, pero será feliz en saber que puedes poner código de C en una sesión de Julia, compilarlo, y correrlo. Nota que `"""` denota una cadena de varias líneas.
"""

# ╔═╡ 8fc6e2d0-9547-4c76-baa3-e57fa0d1fd8f
C_code = """
#include <stddef.h>
double c_sum(size_t n, double *X) {
    double s = 0.0;
    for (size_t i = 0; i < n; ++i) {
        s += X[i];
    }
    return s;
}
"""

const Clib = tempname()   # Haz un directorio temporario

# compila a una biblioteca compartida pipeando C_code a gcc
# (funciona sólo con gcc instalado):

open(`gcc -fPIC -O3 -msse3 -xc -shared -o $(Clib * "." * Libdl.dlext) -`, "w") do f
    print(f, C_code) 
end

# define una funcion de Julia que llama a la función de C:
c_sum(X::Array{Float64}) = ccall(("c_sum", Clib), Float64, (Csize_t, Ptr{Float64}), length(X), X)

# ╔═╡ 33d262a0-1ff7-4acd-87b1-3040f5a185fd
c_sum(a)

# ╔═╡ 94f2bead-9d31-4d39-9f84-582c496b6baa
c_sum(a) ≈ sum(a) # teclea \approx y luego <TAB> para obtener el símbolo ≈

# ╔═╡ fea09a3c-ea4d-47a0-a21b-64f9ebebc7e3
≈  # alias para la función `isapprox`

# ╔═╡ 3adf64d4-51d4-4b09-b6cf-99ec92f1fbf2
?isapprox

# ╔═╡ 0e21a579-0f38-4e4c-bcaf-dcd2f0ef5ffe
md"""
¡Ahora podemos correr el benchmark directo desde Julia!
"""

# ╔═╡ e122b029-882e-4ba0-9fd8-f52bf8b9f355
c_bench = @benchmark c_sum($a) 

# ╔═╡ 5fb9fd14-211d-4c0b-915c-33f56dc55a46
println("C: Tiempo más rápido fue $(minimum(c_bench.times) / 1e6) msec")

# ╔═╡ 831a1618-5a4a-420d-a10f-c1a79519b8db
d = Dict()  # un diccionario a.k.a un arreglo asociativo
d["C"] = minimum(c_bench.times) / 1e6  # en milisegundos
d

# ╔═╡ d176bf1d-f920-43ec-a0f5-258f66939c6b
using Plots
gr()

# ╔═╡ 5ef530cd-ee1a-43da-a62b-a4d413c6d1f3
t = c_bench.times / 1e6 # tiempos en milisegundos
m, σ = minimum(t), std(t)

histogram(t, bins=500,
    xlim=(m - 0.01, m + σ),
    xlabel="milliseconds", ylabel="count", label="")

# ╔═╡ 7eedc060-e5f4-47a5-9430-8f12784f8afa
md"""
# 2. Python y `sum` interno 
"""

# ╔═╡ d3456c29-d8f3-45d2-9147-dfd228dc5779
md"""
El paquete `PyCall` provee un interfaz de Julia a Python
"""

# ╔═╡ 32033011-8f48-45a7-bb3d-5977bff9f9b7
#Pkg.add("PyCall")

# ╔═╡ 4c6dbf22-bdb6-46c1-816c-de7e5d43d60d
using PyCall

# ╔═╡ 60e548a1-0224-4570-bdae-3361fb5cd828
# Llama una función de bajo nivel de PyCall para obtener una lista de Python
# porque por default PyCall convertirá a un arreglo de NumPy en vez (benchmarkeamos NumPy más abajo)

apy_list = PyCall.array2py(a, 1, 1)

# obtener el "sum" interno de Python
pysum = pybuiltin("sum")

# ╔═╡ c8a7a4d1-5c23-41ce-866b-ee519c411068
pysum(a)

# ╔═╡ 690c3eb5-b885-4c8b-970e-d53335be6e0f
pysum(a) ≈ sum(a)

# ╔═╡ c09c9a8e-556b-42da-8fcb-ffd4d682fda7
py_list_bench = @benchmark $pysum($apy_list)

# ╔═╡ 0f2c481d-32e5-4b5c-a885-b6ab9748fb7a
d["Python interno"] = minimum(py_list_bench.times) / 1e6
d

# ╔═╡ 4a64a3ce-f2fd-4d1f-b66e-b888ed2ce2f9
md"""
# 3. Python: `numpy` 

## Aprovechar arquitectura "SIMD" pero sólo cuando funciona

`numpy` es una biblioteca de C optimizada, llamable desde Python, que se puede instalar en Julia haciendo:
"""

# ╔═╡ 874ebdb9-a746-4547-bdba-34d8d94ae9d8
using Conda 
#Conda.add("numpy")

# ╔═╡ 92d796e9-1a66-40e3-b9fb-6dba5b322428
numpy_sum = pyimport("numpy")["sum"]
apy_numpy = PyObject(a) # convierte a un arreglo de NumPy por default

py_numpy_bench = @benchmark $numpy_sum($apy_numpy)

# ╔═╡ b68015f2-04ba-4233-8442-4a67b3231b98
numpy_sum(apy_list) # python thing

# ╔═╡ ac78ba96-cb1b-4acb-b866-e965acd3a240
numpy_sum(apy_list) ≈ sum(a)

# ╔═╡ c694f08f-f21d-49c6-9584-3c56a559256c
d["Python numpy"] = minimum(py_numpy_bench.times) / 1e6
d

# ╔═╡ da9cea03-a889-44cb-9f9d-fe62e1f7f2eb
md"""
# 4. Python, hecho a mano
"""

# ╔═╡ 7c70c208-bf85-4b53-8e68-a3cbf7bdaad8
py"""
def py_sum(a):
    s = 0.0
    for x in a:
        s = s + x
    return s
"""

sum_py = py"py_sum"

# ╔═╡ ffea97e6-c458-4887-af2f-1614e772b12a
py_hand = @benchmark $sum_py($apy_list)

# ╔═╡ 6c821697-2bff-48ef-82ea-afbaf2d72fed
sum_py(apy_list)

# ╔═╡ fd6f2717-54f4-4642-8899-ecfc61b38408
sum_py(apy_list) ≈ sum(a)

# ╔═╡ 40bce87d-2c98-4b99-8c6f-e24ae1bf89f6
d["Python hecho a mano"] = minimum(py_hand.times) / 1e6
d

# ╔═╡ 5d21c3fb-06dc-4605-a161-5b2ae0661e58
md"""
# 5. Julia (interno) 

   ## Escrito directo en Julia, ¡no en C!
"""

# ╔═╡ 622cda9b-81e6-4a9f-999a-3340b5e38d58
@which sum(a)

# ╔═╡ c2316f62-e28b-42ea-8fbf-141842a8ad3c
j_bench = @benchmark sum($a)

# ╔═╡ 5fc5090a-8e35-4b16-81d6-61c72f2eed9f
d["Julia interno"] = minimum(j_bench.times) / 1e6
d

# ╔═╡ 09dfaec6-229c-43c7-b09d-ff3e523f5117
md"""
# 6. Julia (hecho a mano) 
"""

# ╔═╡ adfa1a38-1835-49fe-8e7d-d15fba49be87
function mysum(A)   
    s = 0.0  # s = zero(eltype(A))
    for a in A
        s += a
    end
    s
end

# ╔═╡ f88824c1-6f59-478c-accd-a6ec70d09861
j_bench_hand = @benchmark mysum($a)

# ╔═╡ d9aad37c-2a57-44aa-aafc-e0d9ffffa185
d["Julia hecho a mano"] = minimum(j_bench_hand.times) / 1e6
d

# ╔═╡ 3c676aa8-8e94-4745-abca-4402452f684b
md"""
# Summary
"""

# ╔═╡ 13a1f41f-24a4-4660-a112-3718b1ae1265
for (key, value) in sort(collect(d))
    println(rpad(key, 20, "."), lpad(round(value, 1), 8, "."))
end

# ╔═╡ bc697e8a-63a2-4e2f-bf4d-f4e7a34910eb
for (key, value) in sort(collect(d), by=x->x[2])
    println(rpad(key, 20, "."), lpad(round(value, 2), 10, "."))
end

# ╔═╡ Cell order:
# ╟─ec524cbb-6bf3-4905-9bcf-b12b132f5a73
# ╟─7c937466-d3e3-40a2-a783-7aee0593194c
# ╟─7b4560ee-5b96-4839-b177-e241d2b0a590
# ╟─1a6dc528-c4f0-4728-9584-7aa2603750e7
# ╠═88ae83e6-fde5-4d8c-aa1a-ee8c20c4b4b6
# ╠═f7904227-b760-4756-8bce-00e4bfa4b8ac
# ╟─c10e3205-7dcc-4d5a-9c3a-9d5ad0ea64ff
# ╟─91a933be-f773-4953-a445-dc2705337cd6
# ╟─15a815af-8cad-44ba-a7a9-8d1dfe46c473
# ╠═6d50f534-c4ec-4a52-89c4-2c9e99bccc7d
# ╠═0b34c831-76a6-4f64-8dbf-99141c69a334
# ╟─c5d36d38-bb99-48de-9131-0e5cb99bc9c5
# ╠═8fc6e2d0-9547-4c76-baa3-e57fa0d1fd8f
# ╠═33d262a0-1ff7-4acd-87b1-3040f5a185fd
# ╠═94f2bead-9d31-4d39-9f84-582c496b6baa
# ╠═fea09a3c-ea4d-47a0-a21b-64f9ebebc7e3
# ╠═3adf64d4-51d4-4b09-b6cf-99ec92f1fbf2
# ╟─0e21a579-0f38-4e4c-bcaf-dcd2f0ef5ffe
# ╠═e122b029-882e-4ba0-9fd8-f52bf8b9f355
# ╠═5fb9fd14-211d-4c0b-915c-33f56dc55a46
# ╠═831a1618-5a4a-420d-a10f-c1a79519b8db
# ╠═d176bf1d-f920-43ec-a0f5-258f66939c6b
# ╠═5ef530cd-ee1a-43da-a62b-a4d413c6d1f3
# ╟─7eedc060-e5f4-47a5-9430-8f12784f8afa
# ╟─d3456c29-d8f3-45d2-9147-dfd228dc5779
# ╠═32033011-8f48-45a7-bb3d-5977bff9f9b7
# ╠═4c6dbf22-bdb6-46c1-816c-de7e5d43d60d
# ╠═60e548a1-0224-4570-bdae-3361fb5cd828
# ╠═c8a7a4d1-5c23-41ce-866b-ee519c411068
# ╠═690c3eb5-b885-4c8b-970e-d53335be6e0f
# ╠═c09c9a8e-556b-42da-8fcb-ffd4d682fda7
# ╠═0f2c481d-32e5-4b5c-a885-b6ab9748fb7a
# ╟─4a64a3ce-f2fd-4d1f-b66e-b888ed2ce2f9
# ╠═874ebdb9-a746-4547-bdba-34d8d94ae9d8
# ╠═92d796e9-1a66-40e3-b9fb-6dba5b322428
# ╠═b68015f2-04ba-4233-8442-4a67b3231b98
# ╠═ac78ba96-cb1b-4acb-b866-e965acd3a240
# ╠═c694f08f-f21d-49c6-9584-3c56a559256c
# ╟─da9cea03-a889-44cb-9f9d-fe62e1f7f2eb
# ╠═7c70c208-bf85-4b53-8e68-a3cbf7bdaad8
# ╠═ffea97e6-c458-4887-af2f-1614e772b12a
# ╠═6c821697-2bff-48ef-82ea-afbaf2d72fed
# ╠═fd6f2717-54f4-4642-8899-ecfc61b38408
# ╠═40bce87d-2c98-4b99-8c6f-e24ae1bf89f6
# ╟─5d21c3fb-06dc-4605-a161-5b2ae0661e58
# ╠═622cda9b-81e6-4a9f-999a-3340b5e38d58
# ╠═c2316f62-e28b-42ea-8fbf-141842a8ad3c
# ╠═5fc5090a-8e35-4b16-81d6-61c72f2eed9f
# ╟─09dfaec6-229c-43c7-b09d-ff3e523f5117
# ╠═adfa1a38-1835-49fe-8e7d-d15fba49be87
# ╠═f88824c1-6f59-478c-accd-a6ec70d09861
# ╠═d9aad37c-2a57-44aa-aafc-e0d9ffffa185
# ╟─3c676aa8-8e94-4745-abca-4402452f684b
# ╠═13a1f41f-24a4-4660-a112-3718b1ae1265
# ╠═bc697e8a-63a2-4e2f-bf4d-f4e7a34910eb
