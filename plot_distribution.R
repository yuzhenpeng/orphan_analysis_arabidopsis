library("ggplot2")
library("tidyr")
library("reshape2")
library("dplyr")
#setwd("~/Box Sync/analysis_orphan_gene_aim_3")
setwd("/work/LAS/mash-lab/bhandary/analysis_orphan_gene_aim_3/")
#exp_data <- read.table(file="final_metadata_for_5210_runs", sep = "\t", header=TRUE)
final_metadata_for_5210_runs <- read.delim("~/Box Sync/analysis_orphan_gene_aim_3/final_metadata_for_5210_runs")
#exp_data <- exp_data[,1:10]
final_metadata_for_5210_runs <- final_metadata_for_5210_runs %>% select(run_accession, total_size)
#as.numeric(unlist(data))
#hist(data[,-1])

#plot(density(as.numeric(unlist(data[,-1]))))
pdf(file="distribution_plot.pdf", width=4, height = 4)
ggplot(final_metadata_for_5210_runs, aes(x = total_size)) + geom_density()
quantile(final_metadata_for_5210_runs$total_size)
sub <- final_metadata_for_5210_runs %>% filter_at(vars(total_size), any_vars(. > 1000000000))
#data_melted <- data_melted %>% unite('variable_to_use', rowname:variable, remove = TRUE)
#ggplot(sub_data_melted, aes(x = value)) + geom_density()
dev.off()

