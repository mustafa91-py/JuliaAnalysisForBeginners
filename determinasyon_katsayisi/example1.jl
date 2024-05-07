
deney_no = collect(1:7) # i

vitamin_c_kons = [4,6,8,10,15,20,25] # Xi

olculen_absorbans_farki = [0.0585,0.0870,0.1215,0.1520,0.2310,0.2935,0.3825] # Yi

using Plots

gr(size=(800,600))

p_line = plot(vitamin_c_kons,olculen_absorbans_farki,
    xlabel = "konsantrasyon",
    ylabel = "absorbans farki",
    title = "askorbik asit",

)

using GLM
using TypedTables

data = Table(X=vitamin_c_kons, Y=olculen_absorbans_farki)

ols = lm(@formula(Y ~ X),data)