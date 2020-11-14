a = rand(10^7) # Vector 1D uniforme en [0,1)

sum(a)   

#Pkg.add("BenchmarkTools")

using BenchmarkTools  

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

c_sum(a)

c_sum(a) ≈ sum(a) # teclea \approx y luego <TAB> para obtener el símbolo ≈

≈  # alias para la función `isapprox`

?isapprox

c_bench = @benchmark c_sum($a) 

println("C: Tiempo más rápido fue $(minimum(c_bench.times) / 1e6) msec")

d = Dict()  # un diccionario a.k.a un arreglo asociativo
d["C"] = minimum(c_bench.times) / 1e6  # en milisegundos
d

using Plots
gr()

t = c_bench.times / 1e6 # tiempos en milisegundos
m, σ = minimum(t), std(t)

histogram(t, bins=500,
    xlim=(m - 0.01, m + σ),
    xlabel="milliseconds", ylabel="count", label="")

#Pkg.add("PyCall")

using PyCall

# Llama una función de bajo nivel de PyCall para obtener una lista de Python
# porque por default PyCall convertirá a un arreglo de NumPy en vez (benchmarkeamos NumPy más abajo)

apy_list = PyCall.array2py(a, 1, 1)

# obtener el "sum" interno de Python
pysum = pybuiltin("sum")

pysum(a)

pysum(a) ≈ sum(a)

py_list_bench = @benchmark $pysum($apy_list)

d["Python interno"] = minimum(py_list_bench.times) / 1e6
d

using Conda 
#Conda.add("numpy")

numpy_sum = pyimport("numpy")["sum"]
apy_numpy = PyObject(a) # convierte a un arreglo de NumPy por default

py_numpy_bench = @benchmark $numpy_sum($apy_numpy)

numpy_sum(apy_list) # python thing

numpy_sum(apy_list) ≈ sum(a)

d["Python numpy"] = minimum(py_numpy_bench.times) / 1e6
d

py"""
def py_sum(a):
    s = 0.0
    for x in a:
        s = s + x
    return s
"""

sum_py = py"py_sum"

py_hand = @benchmark $sum_py($apy_list)

sum_py(apy_list)

sum_py(apy_list) ≈ sum(a)

d["Python hecho a mano"] = minimum(py_hand.times) / 1e6
d

@which sum(a)

j_bench = @benchmark sum($a)

d["Julia interno"] = minimum(j_bench.times) / 1e6
d

function mysum(A)   
    s = 0.0  # s = zero(eltype(A))
    for a in A
        s += a
    end
    s
end

j_bench_hand = @benchmark mysum($a)

d["Julia hecho a mano"] = minimum(j_bench_hand.times) / 1e6
d

for (key, value) in sort(collect(d))
    println(rpad(key, 20, "."), lpad(round(value, 1), 8, "."))
end

for (key, value) in sort(collect(d), by=x->x[2])
    println(rpad(key, 20, "."), lpad(round(value, 2), 10, "."))
end
