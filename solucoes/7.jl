


struct Planeta

  nome :: String
  massa :: Float64
  raio :: Float64
  dsol :: Float64
  vtrans :: Float64

end

terra = Planeta("Terra", 5.972e24 , 6350. , 147e6 , 29.79 )
marte = Planeta("Marte", 6.417e23, 3396. , 206e6 , 24.13 )

planetas = [ terra, marte ]

function nomes( planetas )
  for planeta in planetas
    println(planeta.nome)
  end
end

nomes(planetas)



