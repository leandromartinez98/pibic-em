
struct Planeta

  nome :: String
  massa :: Float64
  raio :: Float64
  dsol :: Float64
  vtrans :: Float64

end

terra = Planeta("Terra", 5.972e24 , 6350. , 147e6 , 29.79 )

println(terra.nome)
println(terra.massa)
println(terra.raio)
println(terra.dsol)
println(terra.vtrans)

marte = Planeta("Marte", 6.417e23, 3396. , 206e6 , 24.13 )

#etc.

println(marte.nome)
println(marte.massa)
println(marte.raio)
println(marte.dsol)
println(marte.vtrans)
