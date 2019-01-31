
using Dates

struct Pessoa

  nome :: String
  peso :: Float64
  altura :: Float64
  nascimento :: String
  
end

function imc( pessoa )
  return pessoa.peso / pessoa.altura^2
end

function idade( pessoa )

  data = split(pessoa.nascimento,"/")
  dia_n = parse(Int64,data[1])
  mes_n = parse(Int64,data[2])
  ano_n = parse(Int64,data[3])
 
  dia_h = Dates.day(now())
  mes_h = Dates.month(now())
  ano_h = Dates.year(now())

  if ano_n > ano_h
    error(" Voce mentiu na data de nascimento. ")
  end

  if mes_n > mes_h
    idade = ano_h - ano_n - 1

  elseif mes_n < mes_h 
    idade = ano_h - ano_n

  elseif mes_n == mes_h

    if dia_n > dia_h
      idade = ano_h - ano_n - 1

    elseif dia_n < dia_h 
      idade = ano_h - ano_n

    elseif dia_n == dia_h 
      idade = ano_h - ano_n

    end

  end

  return idade

end

function maisvelho(pessoa1,pessoa2)

  if idade(pessoa1) > idade(pessoa2)
    return pessoa1.nome
  elseif idade(pessoa2) > idade(pessoa1)
    return pessoa2.nome
  else
    return "Ambos tem a mesma idade."
  end

end

function maisgordo(pessoa1,pessoa2)

  if imc(pessoa1) > imc(pessoa2)
    return pessoa1.nome
  elseif imc(pessoa2) > imc(pessoa1)
    return pessoa2.nome
  else
    return "Ambos têm o mesmo IMC."
  end

end

#leandro = Pessoa("Leandro Martinez", 79., 1.81, "16/1/1979" )
#
#println(imc(leandro))
#println(idade(leandro))








