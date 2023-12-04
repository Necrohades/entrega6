library(MVA)
library(tidyverse)
library(ggplot2)
read.table("fileListANIMAL_phylum.txt") ->phylum
read.table("ANIMALS-matrixPM.txt")-> PM
sqrt(2* (1-PM)) -> PM
read.table("ANIMALS-matrixSP.txt")-> SP
sqrt(2* (1-SP)) -> SP
read.table("ANIMALS-matrixVH.txt")-> VH
sqrt(2* (1-VH)) -> VH

phylum <- read.table("fileListANIMAL_phylum.txt", header = FALSE)
colnames(phylum) <- c("Animal", "Phylum")

phylum <- phylum %>% mutate(Phylum = Phylum %>% factor(
  levels = 101:114,
  labels = c("Vertebrates", "Lancelet", "Ascidians", "Hechinoderms", "Hemichordates", "Arthropods", "Nematodes",
             "Annelids", "Mollusks", "Brachipodas", "Flatworms", "Cnidarians", "Placozoans", "Poriferans")
))

Phylum = phylum[,2] %>%  as.factor

PM_cmd <- cmdscale(PM,k=2) %>% as.data.frame
# PM_cmd <- merge(PM_cmd, phylum)

PM_cmd %>% ggplot(aes(x = V1, y = V2, color = Phylum)) +
  geom_point() +
  ggtitle("PM kernel")


SP_cmd <- cmdscale(SP,k=2) %>% as.data.frame
# SP_cmd <- merge(SP_cmd, phylum)

SP_cmd %>% ggplot(aes(x = V1, y = V2, color = Phylum)) +
  geom_point() +
  ggtitle("SP kernel")


VH_cmd <- cmdscale(VH,k=2) %>% as.data.frame
# VH_cmd <- merge(VH_cmd, phylum)

VH_cmd %>% ggplot(aes(x = V1, y = V2, color = Phylum)) +
  geom_point() +
  ggtitle("VH kernel")
