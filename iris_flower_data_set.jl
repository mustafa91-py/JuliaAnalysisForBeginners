
# Iris Dataset

# Julia version 1.10.2

# select packages

using VegaDatasets
using DataVoyager
using VegaLite

# load dataset

data = dataset("iris")

vscodedisplay(data)