
# using Plots instead of PyPlot 

using Plots
pyplot()

# Read data

push!(LOAD_PATH,"./")
using Data
ndata, x, y = read_data("teste.dat", cols=[1,2], comment="#")

plot(x,y,lw=1,color="red")

#annotate!([(5,20,text("look here",14,:red,:left))])

plot!(size=(200,200),xlim=(0,10),ylim=(0,50))
plot!(grid=false)

plot!(xlabel="x",ylabel="y")
plot!(title="Title")

#plot!(legend=false)

savefig("plot2.pdf")

