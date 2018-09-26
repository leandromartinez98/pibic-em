using PyPlot

#
# Reading a file using our custom read_data function (see data.jl)
#

push!(LOAD_PATH,"./")
using Data

ndata, x, y = read_data("teste.dat", cols=[1,2], comment="#")

plot(x,y)
xlabel("x")
ylabel("y")
savefig("xy1.png")

#
# Reading a file using the already available readlm function from DelimitedFiles
#

using DelimitedFiles

# this command reads all data ignoring commented lines
data = readdlm("teste.dat",comments=true,comment_char='#')

# get the number of lines (size of dimension 1 of the matrix)
ndata = size(data,1)

# set r and gmd as vectors containing the data in the first and second
# columns of the data matrix
x = [ data[i,1] for i in 1:ndata ]
y = [ data[i,2] for i in 1:ndata ]

plot(x,y)
xlabel("x")
ylabel("y")
savefig("xy2.png")
