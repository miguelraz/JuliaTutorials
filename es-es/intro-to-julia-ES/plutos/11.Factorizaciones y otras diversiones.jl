A = randn(3,3)

x = fill(1.0, (3))
b = A*x

l,u,p = lu(A)

norm(l*u - A)

norm(l*u - A[p,:])

l,u,p = lu(A, Val{false})

norm(l*u - A)

Alu = lufact(A)

Alu[:P]

Alu[:L]

Alu[:U]

# PA = LU
# A = P'LU
# P'LUx = b
# LUx = Pb
# Ux = L\Pb
# x = U\L\Pb
Alu[:U]\(Alu[:L]\(Alu[:P]b))

Alu\b

det(A)

det(Alu)

Atall = randn(3, 2)

Aqr = qrfact(Atall)

Aqr[:Q]

Aqr[:R]

Aqr[:Q]*ones(2)

Aqr[:Q]*ones(3)

Aqr[:Q]*ones(4)

Aqr[:Q][1]

Aqr\b

Atall\b

v = randn(3)
# Tomar el producto exterio de un vector consigo mismo nos da una matriz singular
singmatriz = v * v'

Aqrp = qrfact(singmatriz,Val{true})

Aqrp\b

Asym = A + A'
AsymEig = eigfact(Asym)

AsymEig[:values]

AsymEig[:vectors]

inv(AsymEig)*Asym

eig(Asym)

Asvd = svdfact(A[:,1:2])

Asvd\b

A

Diagonal(diag(A))

Diagonal(A)

LowerTriangular(tril(A))

LowerTriangular(A)

Symmetric(Asym)

SymTridiagonal(diag(Asym),diag(Asym,1))

n = 1000;
A = randn(n,n);

Asym = A + A';

Asym_noisy = copy(Asym); Asym_noisy[1,2] += 5eps();

println("Is Asym symmetric? ", issymmetric(Asym))
println("Is Asym_noisy symmetric? ", issymmetric(Asym_noisy))

@time eigvals(Asym);

@time eigvals(Asym_noisy);

@time eigvals(Symmetric(Asym_noisy));

n = 1_000_000;
A = SymTridiagonal(randn(n), randn(n-1));
@time eigmax(A)

rand(1:10,3,3)*rand(1:10,3,3)

1//2

Ar = convert(Matrix{Rational{BigInt}}, rand(1:10,3,3))/10

x = fill(1, (3))
b = Ar*x

Ar\b

lufact(Ar)

λ1,λ2,λ3 = 1//1,1//2,1//4
v1,v2,v3 = [1,0,0],[1,1,0],[1,1,1]
V,Λ = [v1 v2 v3], Diagonal([λ1,λ2,λ3])
A = V*Λ/V






