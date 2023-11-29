library(MVA)
library(tidyverse)
read.table("ANIMALS-matrixPM.txt")-> PM
read.table("ANIMALS-matrixSP.txt")-> SP
read.table("ANIMALS-matrixVH.txt")-> VH


PM_cmd<-cmdscale(PM,k=2)
plot(PM_cmd, type="n")
text(PM_cmd, labels="")

