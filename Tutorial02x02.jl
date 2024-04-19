
# supply and demand example

# supply curve from wikipedia

# Q uantity miktar, P rice fiyat
Q(P) = 3P - 6

# arz fonksiyonu

function supply(p::Number)
    Q(p)
end

supply(5)

supply(10)

# demand (talep) eğrisi(curve) wikipedia ya göre

Q(P) = 32 - 2P

function demand(p::Number)
    Q(p)
end

demand(5)

demand(10)


P_supply(Q) = (Q + 6) / 3

P_demand(Q) = (-Q + 32) / 2

using CairoMakie

scene, layout = layoutscene(resolution=(500, 500))
scene

ax = layout[1, 1] = Axis(scene,
xlabel = "Quantity", xlabelsize = 10, xticklabelsize = 9, xticksize = 3,
ylabel = "Price", ylabelsize = 10, yticklabelsize = 9, yticksize = 3,
ytickformat = "\${:d}",
title = "Supply and Demand", titlesize = 12
)

scene


Q_range = 1:25

lineobject1 = lines!(ax, Q_range, P_supply, linewidth = 1,color = :blue)

scene

lineobject2 = lines!(ax, Q_range, P_demand, linewidth = 1 ,color = :red)

scene

# add legend 

leg = Legend(scene, [lineobject1, lineobject2],
["Supply","Demand"],
halign = :right,valign = :top,labelsize = 7, labelwidth = 1 ,padding=(10,10,5,5),
tellheight = false, tellwidth = false , margin = (10, 10, 10 ,10),
patchsize = (20, 10)
)

scene

A = [1 -3; 1 2]
b = [-6, 32]

using LinearAlgebra

e_Q, e_P = A \ b


#  dash eksen uznluklarında manuel yazıldığı için kesişim hatası var
vlines!(ax,
    [e_Q],
    ymax = [0.611],
    linewidth = 1,
    linestyle = :dash,
    color = :green)

hlines!(ax, [e_P], xmax = [0.645],linewidth = 1, linestyle =:dash, color = :green)

scene

# mortgage calculator example

function pmt(r, N, P)
    c = r * P / (1 - (1 + r)^-N)
    
end

r = 3.92 / 100 / 12
N = 30 * 12
P = 100_000

c = pmt(r,N,P)

total = c * N

function recursive(n::Int64)
    println(n)
    if n > 0
        n -= 1
        return recursive(n)
    end
end
recursive(5)

    