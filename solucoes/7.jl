
struct Planeta

  nome :: String
  massa :: Float64
  raio :: Float64
  dsol :: Float64
  vtrans :: Float64

end

terra = Planeta("Terra", 5.972e24 , 6350. , 147e6 , 29.79 )
marte = Planeta("Marte", 6.417e23, 3396. , 206e6 , 24.13 )

function maiormassa( planeta1, planeta2 )
  if planeta1.massa > planeta2.massa
    println(planeta1.nome," tem maior massa. ")
  elseif planeta2.massa > planeta1.massa
    println(planeta2.nome," tem maior massa. ")
  else
    println(" As massas são iguais. ")
  end
end

maiormassa(terra,marte)
maiormassa(terra,terra)





