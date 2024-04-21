
# 
observations = [144, 151, 157, 170, 152, 145, 175, 149, 99, 113, 140, 102, 135, 149, 149, 68, 136, 144, 72, 97]

t = collect(1:20)# saatler

using Plots

pwd()

gr(size = (1366, 768))

# çizgi grafiği

p_line = plot(t, observations,
    xlabel = "time",
    ylabel = "observations",
    title = "plots/GR default (line) plot",
    legend = false
)

# scatter plot

p_scatter = scatter(t,observations,
    title = "scatter plot",
    xlabel = "time",
    ylabel = "observations",
    legend = false,
    alpha = 0.5,
    color = :blue
)

using Statistics

avg = mean(observations)

stdev = std(observations)

# ortalama ve  standart sapma yı grafiğe ekleme

hline!([avg - stdev, avg, avg + stdev],
    linestyle = :dash,
    color = :red
)

# regresyon çizgisi oluşturmak için tablo oluşturma

using GLM
using TypedTables

data = Table(X=t, Y=observations)

ols = lm(@formula(Y ~ X), data) # glm

plot!(t,predict(ols),color=:yellow,alpha=0.5,width=1)

R² = r2(ols)

savefig(p_scatter , "regression_gr.svg")