
using Statistics
using StatsBase

calories = [144, 151, 157, 170, 152, 145, 175, 149, 99, 113, 140, 102, 135, 149, 149, 68, 136, 144, 72, 97]

vscodedisplay(calories)

describe(calories)

length(calories)

mean(calories)

minimum(calories)

median(calories)

maximum(calories)

quantile(calories)

mode(calories)

# measures of dispersion

# range


r = maximum(calories) - minimum(calories)

# sample variance

sample_var = var(calories)

# population variance

population_variance = var(calories,corrected=false)

# sample standart deviation

std(calories)

#

beverage_mean = 5.67
beverage_std = 2.09
beverage_n = 200

#standart error of the mean

beverage_sem = beverage_std / sqrt(beverage_n)

# unicode for ± \pm

println("95% CI = ", beverage_mean," ± ",1.96 * beverage_sem)

function ci(data::Vector)
    #= 
    güven aralığı fonskiyonu 
    =#
    interval = 1.96 * sem(data)
    _mean = mean(data)
    lower = _mean - interval
    upper = _mean + interval
    println("95% CI = ", _mean, " ± ", interval)
    return (lower, upper)
    
end

ci(calories)