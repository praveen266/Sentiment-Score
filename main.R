library(plumber)
r= plumb("D:/plum/plumber.R")
r$run(port= 8787, host= "0.0.0.0")

