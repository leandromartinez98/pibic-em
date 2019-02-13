using Plots

struct Planeta

  nome :: String
  massa :: Float64
  raio :: Float64
  dsol :: Float64
  vtrans :: Float64

end

terra =   Planeta("Terra"  , 5.972e24 ,  6350. , 147e6 , 29.79 )
marte =   Planeta("Marte"  , 6.417e23 ,  3396. , 206e6 , 24.13 )
jupiter = Planeta("Jupiter", 1.898e27 , 71450. , 740e6 , 13.06 )

planetas = [ terra, marte, jupiter ]

vtrans = [ planetas[i].vtrans for i in 1:3 ]

dsol = [ planetas[i].dsol for i in 1:3 ]

plot(dsol,vtrans,xlabel="Distância ao sol",ylabel="Velocidade de translação")

savefig("9.pdf")






