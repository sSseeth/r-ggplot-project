library(tidyverse)

grey_theme <- theme(axis.text.x = element_text(colour = "grey20", size = 12, angle = 45, hjust = 0.5, vjust = 0.5),
                   axis.text.y = element_text(colour = "grey20", size = 12),
                   text = element_text(size = 16),
                   plot.title = element_text(hjust = 0.5))

int_p <- read_csv("data_output/interviews_plotting.csv")



my_plot<-ggplot(data=int_p, 
       aes(x=no_membrs, y=number_items)) +
       geom_jitter(alpha=.5, width=.11, height=.11) 
       
ggsave("fig_output/mems_item.png", my_plot, width=15, height=10,dpi = "retina")