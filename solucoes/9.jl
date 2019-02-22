
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

function maiormassa( planetas )
  planeta_de_maiormassa = planetas[1]
  for planeta in planetas
    if planeta.massa > planeta_de_maiormassa.massa
      planeta_de_maiormassa = planeta
    end
  end
  return planeta_de_maiormassa.nome
end

maiormassa(planetas)



