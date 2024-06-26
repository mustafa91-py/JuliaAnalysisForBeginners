
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

data = Table(X=t, Y=observations) # tabloya çevir verileri

ols = lm(@formula(Y ~ X), data) # glm lineer model için hesaplma

plot!(t,predict(ols),color=:yellow,alpha=0.5,width=1)

R² = r2(ols) #https://www.veribilimiokulu.com/r-kare-ve-duzeltilmis-r-kare/

savefig(p_scatter , "regression_gr.svg")

using StatsBase

K = Int(round(1 + 3.322 * log(length(observations))))

h = fit(Histogram,observations,nbins=K)

p_histogram = bar(h.edges,h.weights,
    xlabel = "gözlemler",
    ylabel = "miktar",
    title = "histogram grafiği",
    color = :green,
    alpha =0.5)

# yoğunluk grafiği

using KernelDensity

d = kde(observations)

p_density = plot(d.x,d.density,
    xlabel = "observation",
    ylabel = "density",
    title = "density graph",
    fill = (0, :blue),
    alpha = 0.5
)