using Pkg
Pkg.activate(".")
# Pkg.add("Graphs")
# Pkg.add("GraphRecipes")

using Graphs
using Plots
using GraphRecipes

n = 5
g = SimpleDiGraph(n)
add_edge!(g, 1, 2)
add_edge!(g, 1, 3)
add_edge!(g, 2, 4)
add_edge!(g, 3, 4)
add_edge!(g, 2, 5)
add_edge!(g, 4, 5)

graphplot(g, names=1:nv(g), markershape=:circle, nodesize=0.25, arrowlengthfrac=0.25)

mutable struct Attr
	id_prec::Int
	min_dst::Int
end

properties = Dict()
properties[1] = Attr(-1, 0)

n_v = nv(g)
to_visit = [1]
visited  = []
while to_visit != []
	id = to_visit[1]
	d  = properties[id].min_dst
	deleteat!(to_visit, 1)
	append!(visited, id)
	for neigh in neighbors(g, id)
		if !(neigh in visited)
			if !(neigh in keys(properties))
				properties[neigh] = Attr(id, d+1)
				append!(to_visit, neigh)
			else
				if ((d+1) < properties[neigh].id_prec)
					properties[neigh].id_prec = d+1
				end
			end
		end
	end
end

@show to_visit
@show visited
@show properties






