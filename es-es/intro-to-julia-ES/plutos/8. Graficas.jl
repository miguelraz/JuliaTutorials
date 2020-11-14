#Pkg.add("Plots")
using Plots

x = -3:0.1:3
f(x) = x^2

y = f.(x)

gr()

plot(x, y, label="linea")  
scatter!(x, y, label="puntos") 

plotlyjs()

plot(x, y, label="line")  
scatter!(x, y, label="points") 

globaltemperatures = [14.4, 14.5, 14.8, 15.2, 15.5, 15.8]
numpirates = [45000, 20000, 15000, 5000, 400, 17]

# Primero plotteamos los datos
plot(numpirates, globaltemperatures, legend=false)
scatter!(numpirates, globaltemperatures, legend=false)

# Agregamos Títulos y etiquetas/labels.
xlabel!("Número de piratas [Apróx.]")
ylabel!("Temperatura Global (C)")
title!("Influencia de población de piratas en calentamiento global")

# Primero graficamos datos
plot(numpirates, globaltemperatures, legend=false)
scatter!(numpirates, globaltemperatures, legend=false)

# Este comando invierte el eje x para que podamos ver los cambios hacia adelante en el tiempo, de 1860 a 2000
xflip!()

# Add titles and labels
xlabel!("Number of Pirates [Approximate]")
ylabel!("Global Temperature (C)")
title!("Influence of pirate population on global warming")

p1 = plot(x, x)
p2 = plot(x, x.^2)
p3 = plot(x, x.^3)
p4 = plot(x, x.^4)
plot(p1,p2,p3,p4,layout=(2,2),legend=false)


