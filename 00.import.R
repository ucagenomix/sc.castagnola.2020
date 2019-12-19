library(Seurat)
library(dplyr)
library(pheatmap)
library(monocle)
library(velocyto.R)
library(tidyverse)
library(ggplot2)
library(RColorBrewer)
library(RColorBrewer)
library(gplots)
library(fgsea)
library(biomaRt)
library(knitr)
library(xtable)
library(cowplot)

setwd(".")

ggplotColours <- function(n = 6, h = c(0, 360) + 15){
  if ((diff(h) %% 360) < 1) h[2] <- h[2] - 360/n
  hcl(h = (seq(h[1], h[2], length = n)), c = 100, l = 65)
}
col=ggplotColours(n = 9)

fmr1.genes <- readLines(con = "ressources/fmr1_targets.txt")
fmr1.neuron.genes <- readLines(con = "ressources/fmr1_neuron_targets.txt")
ieg.genes <- readLines(con = "ressources/ieg_targets.txt")

markers <- c("Mki67","Top2a","Ube2c","Olig1","Gad1","Gad2","Slc17a6","Slc17a7","Snap25","Gfap","Id2","Neurod1","Neurod2","Neurod6","Cd63","Rora","Calb2","Nr2f2","Htr3a","Dcx","Pax6","Eomes","Vim","S100b","Rbfox1","Ccnd2","Synpr","Mef2c","Pde1c")
precursors <- c("Mef2c","Erbb4","Plcxd3","Tspan7","Satb1","Synpr","Reln","Mpped1","Id2","Top2a","Cenpf","Ube2c","Olig1","Calb2","Pecam1","Cldn5","Igfbp7","Gad1","Gad2","Nrgn","Rora","Unc5c","Mdk","Neurod2","Slc17a6","Dlx1","Pbx3","Htr3a","Ckb","Cd63","Cd9","Slc6a5")
sub.markers <- c("Npy","Calb2","Nr2f2","Th","Cck","Reln","Pvalb","Nos1","Htr3a","Ccnd2","Id2","Synpr","Mef2c","Reln","Neurod6")

cell_type_color <- c("Cycling NKT" = "#aea9ce",
                     "Akap7" = "#eb511a",
                     "Inh-Sox4" = "#1ebbd7",
                     "Inh-Synpr" = "#107dac",
                     "Inh-Top2a" = "#71c7ec",
                     "Ex-Neurod2" = "#607c3c",
                     "Ex-Selm" = "#809c13",
                     "Ex-Top2a" = "#ececa3",
                     "Ex-Sept4" = "#b5e550",
                     "Sema3c" = "#ebd513",
                     "baseline" = "#345392",
                     "ampa" = "#ca001b")
