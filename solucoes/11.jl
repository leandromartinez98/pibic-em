using PyPlot

struct Planeta

  nome :: String

  raio :: Float64
  massa :: Float64

  xini :: Float64
  yini :: Float64

  vxini :: Float64
  vyini :: Float64

  x :: Vector{}
  y :: Vector{}
  vx :: Vector{}
  vy :: Vector{}

end

let TerraLua

  G = 19.968

  # Tempo total da simulação (número de passos)

  npassos = 30 * 24 * 60 # um mes, um passo por minuto

  lua = Planeta( "Lua",            # nome
                 0.273 ,           # raio 
                 0.0123,           # massa 
                 0.,               # x inicial
                 60.,              # y inicial
                 0.565 ,           # velocidade inicial x
                 0. ,              # velocidade inicial y
                 zeros(npassos),       # vetor para posicoes x 
                 zeros(npassos),       # vetor para posicoes y 
                 zeros(npassos),       # vetor para velocidades x 
                 zeros(npassos)        # vetor para velocidades y 
                 ) # Fim

  # Dados da Terra

  vx_terra = -lua.vxini * lua.massa / 1. # velocidade para v centro de massa = 0

  terra = Planeta( "Terra",          # nome
                   1.,               # raio 
                   1.,               # massa 
                   0.,               # x inicial
                   0.,               # y inicial
                   vx_terra ,        # velocidade inicial x
                   0. ,              # velocidade inicial y
                   zeros(npassos),       # vetor para posicoes x 
                   zeros(npassos),       # vetor para posicoes y 
                   zeros(npassos),       # vetor para velocidades x 
                   zeros(npassos)        # vetor para velocidades y 
                   ) # Fim
  
  # Vetor de tempos

  t = [ 0. for i in 1:npassos ] 

  # Primeiro passo

  t[1] = 0.

  lua.x[1] = lua.xini
  lua.y[1] = lua.yini
  lua.vx[1] = lua.vxini
  lua.vy[1] = lua.vyini

  terra.x[1] = terra.xini
  terra.y[1] = terra.yini
  terra.vx[1] = terra.vxini
  terra.vy[1] = terra.vyini

  dt = 1. / 60 # um minuto, em horas
  for i in 2:npassos

    t[i] = i*dt
  
    r = sqrt( ( lua.x[i-1] - terra.x[i-1])^2 + (lua.y[i-1]-terra.y[i-1])^2 )
    F = G * terra.massa * lua.massa / r^2

    # Força e aceleração da Lua

    Fx = F * ( (lua.x[i-1]-terra.x[i-1]) / r )
    Fy = F * ( (lua.y[i-1]-terra.y[i-1]) / r )
    ax = -Fx / lua.massa
    ay = -Fy / lua.massa

    # Atualização das velocidades da Lua

    lua.vx[i] = lua.vx[i-1] + ax*dt
    lua.vy[i] = lua.vy[i-1] + ay*dt

    # Atualização das posições da Lua
  
    lua.x[i] = lua.x[i-1] + lua.vx[i-1]*dt + (ax/2)*dt^2
    lua.y[i] = lua.y[i-1] + lua.vy[i-1]*dt + (ay/2)*dt^2

    # Força e aceleração pra a Terra

    ax = Fx / terra.massa
    ay = Fy / terra.massa

    # Atualização das velocidades da Terra

    terra.vx[i] = terra.vx[i-1] + ax*dt
    terra.vy[i] = terra.vy[i-1] + ay*dt

    # Atualização das posições da Terra
  
    terra.x[i] = terra.x[i-1] + terra.vx[i-1]*dt + (ax/2)*dt^2
    terra.y[i] = terra.y[i-1] + terra.vy[i-1]*dt + (ay/2)*dt^2

  end

  plot(lua.x,lua.y)
  plot(terra.x,terra.y)

  savefig("terra_e_lua_ex11.png")

end

  

