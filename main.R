library(MVA)
library(tidyverse)
library(ggplot2)

read.table("ANIMALS-matrixPM.txt")-> PM
read.table("ANIMALS-matrixSP.txt")-> SP
read.table("ANIMALS-matrixVH.txt")-> VH

phylum <- read.table("fileListANIMAL_phylum.txt", header = FALSE)
colnames(phylum) <- c("Animal", "Phylum")
phylum <- phylum %>% mutate(Phylum = as.factor(Phylum))


PM_cmd <- cmdscale(PM,k=2) %>% as.data.frame
PM_cmd <- merge(PM_cmd, phylum)

PM_cmd %>% ggplot(aes(x = V1, y = V2, color = Phylum)) +
  geom_point() +
  ggtitle("PM kernel")


SP_cmd <- cmdscale(SP,k=2) %>% as.data.frame
SP_cmd <- merge(SP_cmd, phylum)

SP_cmd %>% ggplot(aes(x = V1, y = V2, color = Phylum)) +
  geom_point() +
  ggtitle("SP kernel")


VH_cmd <- cmdscale(VH,k=2) %>% as.data.frame
VH_cmd <- merge(VH_cmd, phylum)

VH_cmd %>% ggplot(aes(x = V1, y = V2, color = Phylum)) +
  geom_point() +
  ggtitle("VH kernel")
