### A Pluto.jl notebook ###
# v0.10.0

using Markdown

# ╔═╡ b7a4d6c3-dc52-45c0-bcd6-dc1d32dbd302
md"""
# Factorizaciones y otras diversiones
Autor: Andreas Noack Jensen (MIT) (http://www.econ.ku.dk/phdstudent/noack/)
(con edición de Jane Herriman=

## Sinopsis
 - Factorizaciones
 - Estructuras de matrices especiales
 - Álgebra lineal genérica
"""

# ╔═╡ 43882091-fc1b-409a-92d9-455ca7ad6f64
md"""
Empezamos con un sistema lineal de la forma

`Ax = b`
"""

# ╔═╡ 85ad00b8-4b91-46c9-a130-4430f2986569
A = randn(3,3)

# ╔═╡ 5a8dd4eb-40a6-4750-b2e7-d44b30404363
x = fill(1.0, (3))
b = A*x

# ╔═╡ a98929e4-ce11-49b1-aeca-44ed3680df53
md"""
### Factorización
La función `\` esconde cómo regularmente se resuelve el problema.

Dependiendo de las dimensiones de `A`, distintos métodos son elegidos para resolver el problema.

```
Ax = b
```

Un paso intermedio en la solución es el cálculo de la factorización de la matriz `A`. 

Básicamente, una factorización de `A` es una manera de expresar `A` como el producto de matrices triangulares, unitarias, y de permutación.

Julia guarda estas factorizaciones usando un tipo abstracto llamado `Factorization` y varios subtipos.

Un objeto `Factorization` entonces debería ser pensado como una represenatación de la matriz `A`.

#### LU
"""

# ╔═╡ e00b9a3c-3ffc-4aac-b5f7-a88a0daafba4
md"""
Cuando `A` es cuadrada, el sistema linear es resuelto factorizando `A` vía

```
PA=LU
``` 

donde `P` es una matriz de permutación, `L` es un triangular inferior unitaria y `U` es triangular superior. 

Julia permita calcular la facorización LU y define un tipo de factorización compuesta para guardarlo.
"""

# ╔═╡ a6bc3137-f8f6-44ec-bc7e-baa5a2f9c499
md"""
Podemos hacer una factorización LU sobre `A` vía `lu(A)` ó `lufact(A)`.

La función `lu` regresa matrices `l` y `u` y un vector de permutación `p`.
"""

# ╔═╡ 0b6b51ee-ff9f-463e-95e1-2fd1f559bdf1
l,u,p = lu(A)

# ╔═╡ 2aefd8c5-abc3-4d1a-83fb-78f22190e0f3
md"""
El pivoteo está prendido por default, o sea que no podemos assumir que A == LU.
Vamos a comprobar esto viendo la norma de `LU - A`:
"""

# ╔═╡ 94c7fee6-2ada-4223-8fc0-57c7896181aa
norm(l*u - A)

# ╔═╡ edc134d0-de77-429a-8bac-36ef19e80471
md"""
Esto nos muestra que queremos tomar en cuenta el pivoteo!

Podemos pensar en `A[p,:]` como la sintaxis para `PA`, o como el producto de una matriz de permutación con `A`
"""

# ╔═╡ a123c969-8e5c-432b-9bbd-3f1dfa4b8f31
norm(l*u - A[p,:])

# ╔═╡ da792d5e-9ebf-4b93-9d57-61745021ec00
md"""
Por otro lado, podemos apagar el pivoteo usando `Val{false}` en Julia 0.6 ó `Val(false)` en versiones más modernas.
"""

# ╔═╡ 46ab0bb7-ded7-4d98-a452-70242a5bf648
l,u,p = lu(A, Val{false})

# ╔═╡ 8156b8f8-9919-42c7-83cd-49589bfd53e7
md"""
Cuando apagamos el pivoteo, `LU = A`
"""

# ╔═╡ 608bfb30-6530-474b-9374-c5caa3a716f8
norm(l*u - A)

# ╔═╡ cfd8ea62-ff51-4966-ad3e-2d12a937e71e
md"""
Una segunda manera de hacer la factorización es con `lufact`.
"""

# ╔═╡ 289f4361-2962-48f4-8c47-915290a26035
Alu = lufact(A)

# ╔═╡ 039fdbaf-9870-4efc-a54a-f457088c5e88
md"""
Distintas partes de la factorización las puedes accesar con índices especiales
"""

# ╔═╡ d8217c6a-2f5f-4824-99e9-e56bfca07e92
Alu[:P]

# ╔═╡ 7d46f4fb-e092-409f-a0b0-5caad91f4022
Alu[:L]

# ╔═╡ 44aec045-5803-41d2-9574-31a9f14d9cf7
Alu[:U]

# ╔═╡ 466124e7-9978-4c7c-9cf1-6e34c7f55c33
md"""
Podemos calcular la solución de $Ax=b$ del objecto de factorización
"""

# ╔═╡ 9a023eb2-ce3d-413e-a872-231325c556b6
# PA = LU
# A = P'LU
# P'LUx = b
# LUx = Pb
# Ux = L\Pb
# x = U\L\Pb
Alu[:U]\(Alu[:L]\(Alu[:P]b))

# ╔═╡ cf9efbb5-87ad-4795-b132-8877b334f85d
md"""
*Más importantemente,* podemos despachar sobre el tipo de `LU` y simplemente resolver el problema por medio de
"""

# ╔═╡ 45f9ca18-2ba7-4e8c-9087-ebadf2aa7101
Alu\b

# ╔═╡ 424a4d00-0264-45cf-bbba-43fb51ffa394
md"""
Esto puede ser útil si el mismo lado izquierdo es usado para lados derechos.

La factorización también se puede usar para calcular el determinante pues

$\det(A)=\det(PLU)=\det(P)\det(U)=\pm \prod u_{ii}$

porque $U$ es triangular y el signo está definido por $\det(P)$.
"""

# ╔═╡ ba2407dd-ef47-4532-a783-aafb17506e5f
det(A)

# ╔═╡ 299bec2c-626f-40ca-a2f9-4e0450b23f3e
det(Alu)

# ╔═╡ 0fa226f7-8a15-466b-9757-3c019fd4c58e
md"""
#### QR
Cuando `A` es alta, 
"""

# ╔═╡ 92962e9b-13c2-465e-ae4d-b1c8a0172063
Atall = randn(3, 2)

# ╔═╡ e802da18-5118-4031-9be8-0fb90a7a0c9d
md"""
Julia calcula la solución de mínimos cuadrados $\hat{x}$ que minimiza $\|Ax-b\|_2$. 

Esto se puede hacer factorizando

```
A=QR
``` 

donde $Q$ es unitaria/ortogonal y 

$R=\left(\begin{smallmatrix}R_0\\0\end{smallmatrix}\right)$ y  $R_0$ es triangular superior.

con la factorización QR la norma mínima se puede expresar como 

\begin{equation*}
\|Ax-b\|=\|QRx-b\|=\|Q(Rx-Q'b)\|=\|Rx-Q'b\|=\left\|\begin{pmatrix}R_0x-Q_0'b\\Q_1'b\end{pmatrix}\right\|=\|R_0x-Q_0'b\|+\|Q_1'b\|
\end{equation*}

Y entonces el problema se puede reducir a resolver el problema cuadrado $R_0x=Q_0'b$ para $x$.

Podemos factorizar QR sobre `Atall` vía
"""

# ╔═╡ 215ea9e5-1a3a-4750-b249-2ed54f3ea9ac
Aqr = qrfact(Atall)

# ╔═╡ 021e9680-4a33-469e-8014-ae3b831db370
md"""
Otra característica de la factorización QR es que los tipos `Q` para guardar las matrices unitarias $Q$. Se pueden extraer de tipos `QR` con los índices
"""

# ╔═╡ e55a8449-a507-4e90-9f1c-013edb26704d
Aqr[:Q]

# ╔═╡ 60ce24a1-2d71-4efc-95a8-3e210da5c53f
md"""
Similarmente, la matriz superior triangular $R$ se puede extraer con el índice
"""

# ╔═╡ fa8dca75-5aca-454d-b733-8da5b10c6857
Aqr[:R]

# ╔═╡ 60918647-3d3d-4dec-a4e8-e0cf4348d072
md"""
En este caso se guarda R como una matriz 2x2 en vez de 3x2 porque el último renglón de R está lleno de 0's.<br><br>


Aunque la matriz `Aqr[:Q]` se imprime como $3\times 3$ en el objeto de factorización, en la práctica puede representar la versión delgada también. Así
"""

# ╔═╡ 83e8b0eb-f8c9-4e4d-b319-27134985ffd1
Aqr[:Q]*ones(2)

# ╔═╡ 9aa2af05-bbb0-4570-8958-0ac08c5da7b5
md"""
funciona y representa a $3 x 2$ matrix por un vector de 2-elementos.

Similarmente,
"""

# ╔═╡ 4ce42698-361a-4929-b03e-23b43ad04d33
Aqr[:Q]*ones(3)

# ╔═╡ 32879b97-8789-408f-a992-5f21dcd6e8fe
md"""
funciona representando la matriz $3x3$ y un vector de 3 elementos.

Sin embargo, esto no significa que podemos multiplicar a `Q` por vectores de longitued arbitraria.
"""

# ╔═╡ 4c3f2f14-3bd3-45c1-b36d-1000811fc622
Aqr[:Q]*ones(4)

# ╔═╡ 6a2732c8-241f-426c-8b51-ba130c3a4047
md"""
La matriz tiene representación interna compacta, entonces indexar sólo hace sentido si uno sabe cómo la factorización guarda datos.
"""

# ╔═╡ 45af09e4-8d42-404e-8e69-e0d185f4ea27
Aqr[:Q][1]

# ╔═╡ 8227c126-4417-4d6a-9c40-232ae467b17d
md"""
El objeto QRCompactWY `\` tiene un método para QR y entonces el problema de los mínimos cuadrados es resuelto con
"""

# ╔═╡ cad5d92d-d7cb-444d-9664-e9eccbbb5b06
Aqr\b

# ╔═╡ 6d694031-b7e4-423e-a341-e1e78e26d484
md"""
Y si en vez escribimos
"""

# ╔═╡ ac57e6e1-986c-4efe-ad64-e2bb3a4aeb4c
Atall\b

# ╔═╡ aa4e579d-5b59-494c-be51-dc65e6b57aa6
md"""
En vez de factorizar con QR a `Atall` primero, Julia va a defaultear factorizar *con* pivoteo.
"""

# ╔═╡ 61434524-e698-4a8d-a430-0126ac99157e
md"""
Este default a pivotear la factorización QR le permite a Julia resolver problemas deficientes de rango.

Podemos explícitamente escoger pivotear durante la factorización QR (de una matriz singular, por ejemplo) con `Val{true}`.
"""

# ╔═╡ 04f4492e-5156-4526-b761-ab3c5a209646
v = randn(3)
# Tomar el producto exterio de un vector consigo mismo nos da una matriz singular
singmatriz = v * v'

# ╔═╡ f8bb7598-095d-449a-86e2-f8bd6b9d8b94
Aqrp = qrfact(singmatriz,Val{true})

# ╔═╡ a8e4b120-54b2-4e16-b993-5a884c29309d
md"""
Notamos que el tipo que resulta del objecto de Factorization es distinto que antes.

`\` también tiene un método de `QRPivoted` y el problema con rango deficiente es entonces calculado como 
"""

# ╔═╡ c85c1276-a8d9-4f02-9fd7-0a448da34436
Aqrp\b

# ╔═╡ 9ea6c93a-e36f-4624-9598-7e4741efa50a
md"""
#### Eigendescompisición y los SVDs (Valores de descomposición Singular)
"""

# ╔═╡ 6a578f8f-29fa-4583-a328-e8f33ba80738
md"""
Los resultados de eigendescomposición y de la descomposición singular de valores se guardan en los tipos`Factorization`. Esto también incluye la factorización de Hessenberg y de Schur

La eigendescomposición puede ser calculada como
"""

# ╔═╡ 3e8c3380-7db5-4e35-b6f8-9b94dc417f80
Asym = A + A'
AsymEig = eigfact(Asym)

# ╔═╡ 0c0caea9-3ee9-4e30-8570-4d30ed7cc14a
md"""
Los valores y vectores se pueden recoger del tipo Eigen con un índice especial
"""

# ╔═╡ 3cde0ff8-2325-47b7-a1ff-d15155c2f634
AsymEig[:values]

# ╔═╡ c4d93f45-2191-4624-ade9-277b546ced95
AsymEig[:vectors]

# ╔═╡ b51b8521-6f77-410e-ae49-de138a1aec67
md"""
Una vez más, como la descomposición se guarda en un tipo, podemos despatchar sobre esos tipos y explotar un método especializado para cada factorización, e.g. que $A^{-1}=(V\Lambda V^{-1})^{-1}=V\Lambda^{-1}V^{-1}$.
"""

# ╔═╡ 50f4c300-e49b-4331-b364-582cc7692dd7
inv(AsymEig)*Asym

# ╔═╡ 65386dae-fb08-47d7-a81c-c3133a8403cf
md"""
Julia también tiene una función `eig` que regresa una tupla con los valores y vectores
"""

# ╔═╡ 707539e7-c4b9-46c1-89f1-8d61a19413fa
eig(Asym)

# ╔═╡ 827e2055-5f83-44b1-a1dc-636b807c8b81
md"""
No recomendamos esta versión.

La función `svdfact` calcula la descomposición singular de valores
"""

# ╔═╡ 1afd9e85-1f7d-48aa-baca-8cdf754e4d4b
Asvd = svdfact(A[:,1:2])

# ╔═╡ 78a13f6a-ce68-4060-a1bf-1993ad5e93ad
md"""
y de nuevo `\` tiene un método para el tipo que permite los mínimos cuadrados por SVD
"""

# ╔═╡ a5b49236-f31e-4449-941e-70e1677ae1b2
Asvd\b

# ╔═╡ 9ad38b16-f9b9-4cde-bbfa-204d96ee3a43
md"""
Existen funciones especiales para proporcionar los valores sólamente: `eigvals` and `svdvals`.
"""

# ╔═╡ 0139d8bd-7a60-4cdc-8844-91c0e0eaa9c6
md"""
### Estructuras especiales de matrices

La estructura de matrices es muy importante en el álgebra linear. Ésta estructura se le puede hacer explícita a Julia por medio de los tipos compuestos. Ejemplos: `Diagonal`, `Triangular`, `Symmetric`, `Hermitian`, `Tridiagonal` y `SymTridiagonal`. Se han escrito métodos especializados para cada tipo de matriz especial para aprovechar su estructura. Siguen algunos ejemplos:
"""

# ╔═╡ 7ee1aa1c-7219-46d3-8abd-5a226c0f4abb
A

# ╔═╡ f572bd5d-f1f4-4dce-a5be-293b4404bf71
md"""
Creando una matriz Diagonal
"""

# ╔═╡ 6846c3c4-6f80-43dc-9ece-07efe11133f8
Diagonal(diag(A))

# ╔═╡ 2b5bb260-8997-4b54-ba40-c19c0bd592a5
Diagonal(A)

# ╔═╡ 7f270025-80df-4b91-babc-db876885e479
md"""
Creando una matriz triangular inferior
"""

# ╔═╡ 876fb13e-d540-4931-ad32-f9491fd504c7
LowerTriangular(tril(A))

# ╔═╡ e46ff282-c6a5-4917-8322-9ff2d1df8318
LowerTriangular(A)

# ╔═╡ b1093e1f-65fa-40d1-8b56-a374f15b3f51
md"""
Creando una matriz simétrica
"""

# ╔═╡ 9d354a03-6229-46f1-80eb-cbed5d304d5b
Symmetric(Asym)

# ╔═╡ 6e20dd10-3e4a-411e-bfdf-1534b509e8ce
SymTridiagonal(diag(Asym),diag(Asym,1))

# ╔═╡ fb94650f-06f4-4b65-a598-45c820c27c95
md"""
Cuando se sabe que una matriz es e.g. triangular o simétrica Julia puede que resuelva el problema más rápido convirtiendo a una matriz especial.

Para algunos procedimientos, Julia checa si el input de matriz es triangular o simétrica y lo convierte a tal estructura si lo detecta.

Debería notarse que `Symmetric`, `Hermitian` y `Triangular` no copian la matriz original.

#### Eigenproblema simétrico
La capacidad de Julia para poder detectar si una matriz es simétrica/Hermitian puede influenciar muchísimo sobre qué tan rápido se puede resolver un problema de eigenvalor.
"""

# ╔═╡ 7773e25a-57e8-4917-9629-7329d7ddc60c
n = 1000;
A = randn(n,n);

# ╔═╡ 2f6332ef-caef-423b-bc2d-4299436390f8
md"""
Usamos `A` para genera una matriz simétrica `Asym`
"""

# ╔═╡ b844544e-c513-42af-9b27-b006d50973c0
Asym = A + A';

# ╔═╡ f34e931a-c11b-4776-8d50-90812ef67d5b
md"""
Ahora creemos una matriz Asym para simular una matriz simétrica con errores de punto flotante
"""

# ╔═╡ 09b262f1-6a2d-4696-a194-54b65f129eb3
Asym_noisy = copy(Asym); Asym_noisy[1,2] += 5eps();

# ╔═╡ 44b64772-3daa-4037-9b6f-07d5feba3223
md"""
¿Puede Julia determinar que ambas `Asym` y `Asym_noisy` son matrices simétricas?
"""

# ╔═╡ dcef7621-ef7f-467e-9dec-75fae2bc44f3
println("Is Asym symmetric? ", issymmetric(Asym))
println("Is Asym_noisy symmetric? ", issymmetric(Asym_noisy))

# ╔═╡ e451672e-e44d-45c7-a3c2-3badfcc83d40
md"""
Ahora veamos como el ruido de `Asym_noisy` impacta el tiempo en llevar a cabo una eigendescomposición
"""

# ╔═╡ a994a69a-3879-49ad-a03a-c05d901b4072
@time eigvals(Asym);

# ╔═╡ 63d5a411-bd56-4ff6-bf35-a23995d4c2bb
@time eigvals(Asym_noisy);

# ╔═╡ 9902503c-0448-4bfc-bf6f-7c11321cca78
md"""
Por suerte, le podeemos proveer información explícita sobre la estructura de la matriz a Julia
En este ejemplo, usamos la palabra clave `Symmetric` 
"""

# ╔═╡ 9d099581-b364-4ad0-990a-d3151dcdcf96
@time eigvals(Symmetric(Asym_noisy));

# ╔═╡ 8ea1527f-a664-4520-9801-840e77bd6e62
md"""
Y así nuestros cálculos son mucho más eficientes :)
"""

# ╔═╡ 231d2771-137d-4930-80a6-4ca352e88aa5
md"""
### Un gran problema
Usar matrices tridiagonales permite trabajar con problemas potencialmente muy grandes. El siguiente problema no seria posible resolverlo en una laptop si la matriz se tuviera que guardar como tipo `Matrix`.
"""

# ╔═╡ a0afdba1-25a0-409c-b84d-c63e53dbf343
n = 1_000_000;
A = SymTridiagonal(randn(n), randn(n-1));
@time eigmax(A)

# ╔═╡ 49cfb27c-8c00-4458-a77a-38dd5a4c643a
md"""
### Álgebra lineal numérica
La manera usual de agregar soporte para álgebra lineal numérica es haciendo un wrapper para subrutinas de BLAS y LAPACK. Para matrices con elementos `Float32`, `Float64`, `Complex{Float32}` ó `Complex{Float64}` esto es lo que hace Julia. Desde hace rato, Julia ha tnido soport para la multiplicación genérica de tipos. Así, cuando uno multiplica matrices de enteros, obtiene una matriz de enteros.
"""

# ╔═╡ 0f4aec6b-6701-46f9-8a60-1c91f19cbb37
rand(1:10,3,3)*rand(1:10,3,3)

# ╔═╡ 1b26ea8e-d825-48ab-a0a0-a401dd83d42c
md"""
Recientemente, más métodos de álgebra lineal se han añadido a Julia y ahora soporta factorizaciones generales de tipo `LU` y `QR`. Métodos generales para eigenvalores y SVD han sido escritos más recientemente en paquetería externa.

En general, la factorización `LU` puede ser calculada cuando los elementos de la matriz se cierraon sobre los operadores `+`, `-`, `*` y `\`. Por supuesto, la matriz también deben tener rango completo. El método general de factorización `LU` en Julia aplica pivoteo y por lo tanto debe poder soportar `<` y `abs`. Por lo tanto es posible resolver sistemas de ecuaciones de e.g. números racionales como en los ejemplos que siguen.
"""

# ╔═╡ 8b718fad-0ded-42d2-915c-7868a8fc15df
md"""
Para usar números racionales, usamos un doble //:
"""

# ╔═╡ 9858cb5f-ec34-4ce3-aa44-a676bf2d9d35
1//2

# ╔═╡ 4811bad4-fa07-4a22-92e6-c9947bce13d1
md"""
#### Ejemplo 1: Sistemas racionales lineales de ecuaciones
Julia cuenta con números racionales ya instalados. El siguiente ejemplo consta de un sistema lineal de ecuaciones resulto sin promover a tipos de punto flotanto. Puede haber un error de overflow fácilmente al trabajar con racionales, así que usamos `BigInt`s.
"""

# ╔═╡ a756d1d8-57ce-4e17-984f-7fbe1a8117e5
Ar = convert(Matrix{Rational{BigInt}}, rand(1:10,3,3))/10

# ╔═╡ e97ccbb7-fb81-4514-a8b6-0b177ef9620e
x = fill(1, (3))
b = Ar*x

# ╔═╡ a808d3f1-21a0-4d72-8323-9ffdb55084b6
Ar\b

# ╔═╡ d9e7e3c7-cf57-4b86-b2f6-7b24b3ea8bdb
lufact(Ar)

# ╔═╡ 6d5e0b76-5360-4e77-bd5a-93f5aac6011a
md"""
#### Ejemplo 2: Matriz racional de eigenestructura

El siguiente ejemplo muestra como la artimética de matriz racional puede ser usada para calcular una matriz dados los eigenvalores y eigenvectores racionales. Yo he encontrado ésto útil para mostrar ejemplos de sistemas dinámicos lineales.
"""

# ╔═╡ 57d7e0de-a3c9-4fda-b4b1-4e847bd5f8d2
λ1,λ2,λ3 = 1//1,1//2,1//4
v1,v2,v3 = [1,0,0],[1,1,0],[1,1,1]
V,Λ = [v1 v2 v3], Diagonal([λ1,λ2,λ3])
A = V*Λ/V

# ╔═╡ b29effd2-bb03-4f65-bd5c-ba5206378c54
md"""
### Exercises

11.1 ¿Cuáles son los eigenvalores de la Matriz A

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

# ╔═╡ 9e39d0ed-49b7-48c6-894e-6140c37aebbc


# ╔═╡ b7875dd0-68ff-475f-8c90-e3d33a72b12a
md"""
11.2 Crea una matriz diagonal de los eigenvalores de A
"""

# ╔═╡ 4a6152f4-78be-47e6-906a-25863ba85913


# ╔═╡ b6899c90-d9b9-4476-9971-96fef2aa14d0
md"""
11.3 Realiza un factorización de Hessenberg sobre la matriz A. Verifica que `A = QHQ'`.
"""

# ╔═╡ db8a09c4-2825-47c8-9697-1990d65b0b58


# ╔═╡ Cell order:
# ╟─b7a4d6c3-dc52-45c0-bcd6-dc1d32dbd302
# ╟─43882091-fc1b-409a-92d9-455ca7ad6f64
# ╠═85ad00b8-4b91-46c9-a130-4430f2986569
# ╠═5a8dd4eb-40a6-4750-b2e7-d44b30404363
# ╟─a98929e4-ce11-49b1-aeca-44ed3680df53
# ╟─e00b9a3c-3ffc-4aac-b5f7-a88a0daafba4
# ╟─a6bc3137-f8f6-44ec-bc7e-baa5a2f9c499
# ╠═0b6b51ee-ff9f-463e-95e1-2fd1f559bdf1
# ╟─2aefd8c5-abc3-4d1a-83fb-78f22190e0f3
# ╠═94c7fee6-2ada-4223-8fc0-57c7896181aa
# ╟─edc134d0-de77-429a-8bac-36ef19e80471
# ╠═a123c969-8e5c-432b-9bbd-3f1dfa4b8f31
# ╟─da792d5e-9ebf-4b93-9d57-61745021ec00
# ╠═46ab0bb7-ded7-4d98-a452-70242a5bf648
# ╟─8156b8f8-9919-42c7-83cd-49589bfd53e7
# ╠═608bfb30-6530-474b-9374-c5caa3a716f8
# ╟─cfd8ea62-ff51-4966-ad3e-2d12a937e71e
# ╠═289f4361-2962-48f4-8c47-915290a26035
# ╟─039fdbaf-9870-4efc-a54a-f457088c5e88
# ╠═d8217c6a-2f5f-4824-99e9-e56bfca07e92
# ╠═7d46f4fb-e092-409f-a0b0-5caad91f4022
# ╠═44aec045-5803-41d2-9574-31a9f14d9cf7
# ╟─466124e7-9978-4c7c-9cf1-6e34c7f55c33
# ╠═9a023eb2-ce3d-413e-a872-231325c556b6
# ╟─cf9efbb5-87ad-4795-b132-8877b334f85d
# ╠═45f9ca18-2ba7-4e8c-9087-ebadf2aa7101
# ╟─424a4d00-0264-45cf-bbba-43fb51ffa394
# ╠═ba2407dd-ef47-4532-a783-aafb17506e5f
# ╠═299bec2c-626f-40ca-a2f9-4e0450b23f3e
# ╟─0fa226f7-8a15-466b-9757-3c019fd4c58e
# ╠═92962e9b-13c2-465e-ae4d-b1c8a0172063
# ╟─e802da18-5118-4031-9be8-0fb90a7a0c9d
# ╠═215ea9e5-1a3a-4750-b249-2ed54f3ea9ac
# ╟─021e9680-4a33-469e-8014-ae3b831db370
# ╠═e55a8449-a507-4e90-9f1c-013edb26704d
# ╟─60ce24a1-2d71-4efc-95a8-3e210da5c53f
# ╠═fa8dca75-5aca-454d-b733-8da5b10c6857
# ╟─60918647-3d3d-4dec-a4e8-e0cf4348d072
# ╠═83e8b0eb-f8c9-4e4d-b319-27134985ffd1
# ╟─9aa2af05-bbb0-4570-8958-0ac08c5da7b5
# ╠═4ce42698-361a-4929-b03e-23b43ad04d33
# ╟─32879b97-8789-408f-a992-5f21dcd6e8fe
# ╠═4c3f2f14-3bd3-45c1-b36d-1000811fc622
# ╟─6a2732c8-241f-426c-8b51-ba130c3a4047
# ╠═45af09e4-8d42-404e-8e69-e0d185f4ea27
# ╟─8227c126-4417-4d6a-9c40-232ae467b17d
# ╠═cad5d92d-d7cb-444d-9664-e9eccbbb5b06
# ╟─6d694031-b7e4-423e-a341-e1e78e26d484
# ╠═ac57e6e1-986c-4efe-ad64-e2bb3a4aeb4c
# ╟─aa4e579d-5b59-494c-be51-dc65e6b57aa6
# ╟─61434524-e698-4a8d-a430-0126ac99157e
# ╠═04f4492e-5156-4526-b761-ab3c5a209646
# ╠═f8bb7598-095d-449a-86e2-f8bd6b9d8b94
# ╟─a8e4b120-54b2-4e16-b993-5a884c29309d
# ╠═c85c1276-a8d9-4f02-9fd7-0a448da34436
# ╟─9ea6c93a-e36f-4624-9598-7e4741efa50a
# ╟─6a578f8f-29fa-4583-a328-e8f33ba80738
# ╠═3e8c3380-7db5-4e35-b6f8-9b94dc417f80
# ╟─0c0caea9-3ee9-4e30-8570-4d30ed7cc14a
# ╠═3cde0ff8-2325-47b7-a1ff-d15155c2f634
# ╠═c4d93f45-2191-4624-ade9-277b546ced95
# ╟─b51b8521-6f77-410e-ae49-de138a1aec67
# ╠═50f4c300-e49b-4331-b364-582cc7692dd7
# ╟─65386dae-fb08-47d7-a81c-c3133a8403cf
# ╠═707539e7-c4b9-46c1-89f1-8d61a19413fa
# ╟─827e2055-5f83-44b1-a1dc-636b807c8b81
# ╠═1afd9e85-1f7d-48aa-baca-8cdf754e4d4b
# ╟─78a13f6a-ce68-4060-a1bf-1993ad5e93ad
# ╠═a5b49236-f31e-4449-941e-70e1677ae1b2
# ╟─9ad38b16-f9b9-4cde-bbfa-204d96ee3a43
# ╟─0139d8bd-7a60-4cdc-8844-91c0e0eaa9c6
# ╠═7ee1aa1c-7219-46d3-8abd-5a226c0f4abb
# ╟─f572bd5d-f1f4-4dce-a5be-293b4404bf71
# ╠═6846c3c4-6f80-43dc-9ece-07efe11133f8
# ╠═2b5bb260-8997-4b54-ba40-c19c0bd592a5
# ╟─7f270025-80df-4b91-babc-db876885e479
# ╠═876fb13e-d540-4931-ad32-f9491fd504c7
# ╠═e46ff282-c6a5-4917-8322-9ff2d1df8318
# ╟─b1093e1f-65fa-40d1-8b56-a374f15b3f51
# ╠═9d354a03-6229-46f1-80eb-cbed5d304d5b
# ╠═6e20dd10-3e4a-411e-bfdf-1534b509e8ce
# ╟─fb94650f-06f4-4b65-a598-45c820c27c95
# ╠═7773e25a-57e8-4917-9629-7329d7ddc60c
# ╟─2f6332ef-caef-423b-bc2d-4299436390f8
# ╠═b844544e-c513-42af-9b27-b006d50973c0
# ╟─f34e931a-c11b-4776-8d50-90812ef67d5b
# ╠═09b262f1-6a2d-4696-a194-54b65f129eb3
# ╟─44b64772-3daa-4037-9b6f-07d5feba3223
# ╠═dcef7621-ef7f-467e-9dec-75fae2bc44f3
# ╟─e451672e-e44d-45c7-a3c2-3badfcc83d40
# ╠═a994a69a-3879-49ad-a03a-c05d901b4072
# ╠═63d5a411-bd56-4ff6-bf35-a23995d4c2bb
# ╟─9902503c-0448-4bfc-bf6f-7c11321cca78
# ╠═9d099581-b364-4ad0-990a-d3151dcdcf96
# ╟─8ea1527f-a664-4520-9801-840e77bd6e62
# ╟─231d2771-137d-4930-80a6-4ca352e88aa5
# ╠═a0afdba1-25a0-409c-b84d-c63e53dbf343
# ╟─49cfb27c-8c00-4458-a77a-38dd5a4c643a
# ╠═0f4aec6b-6701-46f9-8a60-1c91f19cbb37
# ╟─1b26ea8e-d825-48ab-a0a0-a401dd83d42c
# ╟─8b718fad-0ded-42d2-915c-7868a8fc15df
# ╠═9858cb5f-ec34-4ce3-aa44-a676bf2d9d35
# ╟─4811bad4-fa07-4a22-92e6-c9947bce13d1
# ╠═a756d1d8-57ce-4e17-984f-7fbe1a8117e5
# ╠═e97ccbb7-fb81-4514-a8b6-0b177ef9620e
# ╠═a808d3f1-21a0-4d72-8323-9ffdb55084b6
# ╠═d9e7e3c7-cf57-4b86-b2f6-7b24b3ea8bdb
# ╟─6d5e0b76-5360-4e77-bd5a-93f5aac6011a
# ╠═57d7e0de-a3c9-4fda-b4b1-4e847bd5f8d2
# ╟─b29effd2-bb03-4f65-bd5c-ba5206378c54
# ╠═9e39d0ed-49b7-48c6-894e-6140c37aebbc
# ╟─b7875dd0-68ff-475f-8c90-e3d33a72b12a
# ╠═4a6152f4-78be-47e6-906a-25863ba85913
# ╟─b6899c90-d9b9-4476-9971-96fef2aa14d0
# ╠═db8a09c4-2825-47c8-9697-1990d65b0b58
