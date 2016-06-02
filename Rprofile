#########################################################
############ load packages I rely on a lot #############
library("devtools")
library("ggplot2")
library("data.table")
#########################################################

#########################################################
############## load self-defined shorthand ##############
"%ni%" = Negate("%in%")
#########################################################

#########################################################
######### find and load my utilities package ############
library("base"); library("utils")
pkg_list <- as.data.frame(installed.packages())
if ( "nima" %ni% names(pkg_list$Package)) {
  devtools::install_github("nhejazi/nima", ref = "devel")
}
rm(pkg_list)
library("nima")
#########################################################
