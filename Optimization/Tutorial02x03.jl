# Tutorial 02x03



#=
@article{DunningHuchetteLubin2017,
    author = {Iain Dunning and Joey Huchette and Miles Lubin},
    title = {JuMP: A Modeling Language for Mathematical Optimization},
    journal = {SIAM Review},
    volume = {59},
    number = {2},
    pages = {295-320},
    year = {2017},
    doi = {10.1137/15M1020575},
}
=#


################################################################################

# Linear Examples

# Example 1: From JuMPTutorials.jl

using JuMP
using GLPK

model = Model(GLPK.Optimizer)

@variable(model, x >= 0)

@variable(model, y >= 0)

@constraint(model, 6x + 8y >= 100)

@constraint(model, 7x + 12y >= 120)

@objective(model, Min, 12x + 20y)

optimize!(model)

@show value(x)

@show value(y)

@show objective_value(model)

# example 2

model = Model(GLPK.Optimizer)

@variable(model, green, Bin)
@variable(model, blue, Bin)
@variable(model, orange, Bin)
@variable(model, yellow, Bin)
@variable(model, gray, Bin)

@constraint(model, weight, green * 12 + blue * 2 + orange * 1 + yellow * 4 + gray * 1 <= 15)

@objective(model, Max,
    green * 4 + blue * 2 + orange * 1 + yellow * 10 + gray *2 
)

optimize!(model)

boxes = [green, blue, orange, yellow, gray]

for box in boxes
    println(box,"\t= " ,value(box))
end

value(weight) # toplam ağırlık

objective_value(model) # toplam tutar

# example 3

model = Model(GLPK.Optimizer)

@variable(model, green >= 0, Int)
@variable(model, blue >= 0, Int)
@variable(model, orange >= 0, Int)
@variable(model, yellow >= 0, Int)
@variable(model, gray >= 0, Int)

@constraint(model, weight, green * 12 + blue * 2 + orange * 1 + yellow * 4 + gray * 1 <= 15)

@objective(model, Max,
    green * 4 + blue * 2 + orange * 1 + yellow * 10 + gray *2 
)

optimize!(model)

boxes = [green, blue, orange, yellow, gray]

for box in boxes
    println(box,"\t= " ,value(box))
end

value(weight) # toplam ağırlık

objective_value(model) # toplam tutar

# Nonlinear Examples

# example 4 maximize area of yard

using Ipopt

model = Model(Ipopt.Optimizer)

@variable(model, x >= 0,start = 0)
@variable(model, y >= 0, start = 0)

@NLconstraint(model, x + 2y == 100)

@NLobjective(model, Max, x * y)

optimize!(model)

value(x)

value(y)

objective_value(model)

# visualize conclusion Nonlinear

using Plots

plotlyjs(size=(1366, 768))

x = 0:100

area(x) = x * (100 - x) / 2

p = plot(x, area,
    title = "maximize area",
    xlabel = "length of x (feet)",
    ylabel = "Area (square feed)"
)

savefig(p, "max_area.svg")

# example 5

model = Model(Ipopt.Optimizer)

@variable(model, 0 <= x <= 6, start = 0)

@NLobjective(model, Min, x / 8 + sqrt((6-x)^2 + 2^2 ) / 3)

optimize!(model)

value(x)

objective_value(model)

x = 0:0.01:6

time(x) = x / 8 + sqrt((6-x)^2 + 2^2 ) / 3

p = plot(x, time,
    title = "minimize travel time",
    xlabel = "distance (miles)",
    ylabel = "time (hours)"
)
savefig(p, "min_time.svg")

# example 6

model = Model(Ipopt.Optimizer)

@variable(model, 50 <= P <= 200,start = 50)

@NLobjective(model, Max, P * (1000 - 5P)) # revenue

optimize!(model)

value(P)

objective_value(model)

P = 50:200

revenue(P) = P * (1000- 5P)

p = plot(P, revenue,
    title = "maximiz revenue",
    xlabel = "price (\$)",
    ylabel = "revenue (\$)"
)

savefig(p, "max_revenue.svg")

# plot demand curve

Q(P) = 1000 - 5P

p = plot(P, Q,
    title = "demand curve",
    xlabel = "price (\$)",
    ylabel = "quantity (cars)"
)

savefig(p, "demand_curve.svg")