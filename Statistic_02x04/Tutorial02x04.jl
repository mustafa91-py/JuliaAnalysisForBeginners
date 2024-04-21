
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

# CI binomial distributions

# standart error for binomial distribution

function se_binomial(p, n)
    seb = sqrt(p * (1 - p) / n)
    return seb
end

p = 0.72
n = 200

se_binomial(p, n)

function ci_binomial(p, n)
    interval = 1.96 * se_binomial(p, n)

    lower = p - interval
    upper = p + interval
    
    println("95% CI = ", p, " ± ", interval)
    return (lower, upper)
end

ci_binomial(p, n)

# tests of significance

using HypothesisTests

# example A/B testing

difference = [-4, -7, -3, -4, -6, -1, 1, 8, -8, 1]

OneSampleTTest(difference)

# example training plan effectiveness testing

using LinearAlgebra

# observations (gözlemler)

O = [175, 25, 100, 100]

# expactations (beklentiler)

E = [137.5, 62.5, 137.5, 62.5]

# Pearson's chi-square test

ChisqTest(O, normalize(E, 1))