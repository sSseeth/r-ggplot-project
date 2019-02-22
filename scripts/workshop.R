library(tidyverse)
#CONTINUOUS
grey_theme <- theme(axis.text.x = element_text(colour = "grey20", size = 12, angle = 45, hjust = 0.5, vjust = 0.5),
                   axis.text.y = element_text(colour = "grey20", size = 12),
                   text = element_text(size = 16),
                   plot.title = element_text(hjust = 0.5))

int_p <- read_csv("data_output/interviews_plotting.csv")

ggplot(data=int_p, 
       aes(x=no_membrs, y=number_items)) +
  geom_jitter(alpha=.5, height=.1, width=.1, size=2) + aes()

(my_plot<-ggplot(data=int_p, 
       aes(x=village, y=rooms, color=respondent_wall_type)) +
       geom_boxplot())
my_plot
       
ggsave("fig_output/mems_item.png", my_plot, width=15, height=10,dpi = "retina")

ggplot(data=int_p, aes(x=no_membrs, fill=village)) +
       geom_histogram(binwidth=1, color="white") + facet_wrap(~village)

ggplot(data=int_p, aes(x=no_membrs, fill=village)) +
  geom_histogram(binwidth=1, color="white") + facet_wrap(~village)

ggplot(data=int_p, aes(x=no_membrs, y=stat(density), color=village)) +
  geom_freqpoly(binwidth=1) + facet_wrap(~village)

ggplot(data=int_p, aes(x=no_membrs, y=stat(density), fill=village))+
  geom_density(alpha=0.3)

       
ggplot(data=int_p, aes(x=no_membrs, fill=village)) +
  geom_histogram(binwidth=1, color="white") + facet_wrap(~village)

ggplot(data=int_p, aes(fill=respondent_wall_type, x=village)) +
  geom_bar(position = "fill") +
  stat_count(geom="text", aes(label=stat(count)),
             position=position_fill(vjust=0.5), color="white")
#CATS
ggplot(int_p,
       aes(x=village, fill=respondent_wall_type)) +
       geom_bar(position="fill") + 
       ylab("proportion") +
       stat_count(geom="text",
                  aes(label=stat(count)),
                  position = position_fill(vjust=.5), colour="white")

qt<-table(int_p$respondent_wall_type, int_p$village)        

q=data.frame(qt)
q
names = c("wall", "village", "freq")
colnames(q)<-names
ggplot(q, aes(x=village, y=freq, fill=wall)) +
  geom_bar(stat="identity", position="fill") +
  scale_fill_brewer(palette="B")

food = filter(int_p, !is.na(memb_assoc))
ggplot(data=int_p,
       aes(x=respondent_wall_type, y=liv_count, fill=memb_assoc, colour=memb_assoc)) +
       geom_boxplot(alpha=0.5) +
       geom_point(alpha=0.5, position = position_jitterdodge(jitter.width=0.1, jitter.height=0.1))+
       geom_text(aes(label=stat(count), y=5.5),
                 position = position_dodge(), colour="white") +
      
  ggplot(data=int_p, aes(fill=respondent_wall_type, x=village)) + 
  geom_bar(position="fill") +
  stat_count(geom="text", aes(label=stat(count)),
             position=position_fill(vjust=0.5), color="white") +
  labs(x="Village", y="proportion", title = "Wall type by village") +
  scale_fill_discrete(labels=c("burnt brick", "cement", "mud daub", "sub bricks")) +
  guides(fill=guide_legend(title="Wall type"))


ggplot(data=int_p, aes(fill=memb_assoc, x=respondent_wall_type)) + 
  geom_bar(position="fill") +
  stat_count(geom="text", aes(label=stat(count)),
             position=position_fill(vjust=0.5), color="white") +
  labs(x="Wall Type", y="proportion") + facet_wrap(~village, nrow=2) +
  scale_x_discrete(labels= c("burnt bricks", "cement", "mud daub", "sun bricks")) +
  theme_classic() +
  ggtitle("Plot title") +
  theme(axis.text.x= element_text(angle=45, hjust=1, size=13), axis.text.y=element_text(size=15), plot.title=element_text(hjust=0.5)) +
  guides(fill=guide_legend(title="Member\nAssociation")) +
  scale_fill_discrete(labels=c("burnt brick", "cement", "mud daub", "sub bricks"))



