library(ggplot2)
library(gganimate)

df
df_aux_2 <- read.table("clipboard",header=TRUE,dec=',')
df_aux_1

df_aux_2$group <- ifelse(df_aux_2$group==1,2,1)
df_aux_2<-df_aux_2[df_aux_2$month!='jan',]

aux_3<-df_aux_2[df_aux_2$group!=1,]
aux_3$group<-ifelse(aux_3$group==3,2,3)

p <- ggplot(aux_3[aux_3$month!="jan",], aes(x = V1, y=V2, colour =year,label=month))+
  geom_point(show.legend = TRUE, alpha = 0.7,size=2) +
  #geom_text(hjust=1, vjust=1,size=3,alpha = 0.7)+
  labs(x = "PCoA 1", y = "PcoA 2",size=15, face="bold")+
  labs(title = "Comunity Trajectory Analysis", subtitle = "20-year phytoplaknton´s dynamics")+
  
  geom_segment(aes(x = V1, y = V2, xend = V1_2, yend = V2_2),arrow = arrow(length = unit(0.25, "cm")))+
  
  theme(axis.text.x = element_text(face="bold", color="#993333", 
                                   size=12),
        axis.text.y = element_text(face="bold", color="#993333", 
                                   size=12)) +
  scale_color_gradient2(
    midpoint = 2007,
    low = "orange",
    mid = "purple",
    high = "black")
#facet_wrap(vars(amgles.pam),ncol=2)
p

time_plot<-p + transition_time(aux_3$group[aux_3$month!="jan"]) 
  #labs(title = "Moving to: {frame_time}") +ease_aes('cubic-in-out') 

gganimate::animate(time_plot, fps = 30, width = 400, height = 400,nframes = 600)
anim_save("trajectory_sizes_unsorted.gif")  





#### Just the pictures ####


#df_aux_2[df_aux_2$group==1,]

pp <- ggplot(df_aux_2[df_aux_2$group==3,], aes(x = V1, y=V2, colour =year,label=month))+
  geom_point(show.legend = TRUE, alpha = 0.7,size=2) +
  geom_text(hjust=1, vjust=1,size=3,alpha = 0.7)+
  labs(x = "PCoA 1", y = "PcoA 2",size=15)+
  
  geom_segment(aes(x = V1, y = V2, xend = V1_2, yend = V2_2),arrow = arrow(length = unit(0.25, "cm")))+
  
  theme(axis.text.x = element_text(face="bold", color="#993333", 
                                   size=12),
        axis.text.y = element_text(face="bold", color="#993333", 
                                   size=12)) +
  scale_color_gradient2(
    midpoint = 2007,
    low = "orange",
    mid = "purple",
    high = "black")
#facet_wrap(vars(amgles.pam),ncol=2)
pp





pp <- ggplot(df_aux_2[df_aux_2$group==3,], aes(x = V1, y=V2, colour =year,label=month))+
  geom_point(show.legend = TRUE, alpha = 0.7,size=2) +
  #geom_text(hjust=1, vjust=1,size=3,alpha = 0.7)+
  labs(x = "PCoA 1", y = "PcoA 2",size=15, face="bold")+
  labs(title = "Principal Coodinate Analysis", subtitle = "20-year phytoplaknton´s dynamics")+
  
  geom_segment(aes(x = V1, y = V2, xend = V1_2, yend = V2_2),arrow = arrow(length = unit(0.25, "cm")))+
  
  theme(axis.text.x = element_text(face="bold", color="#993333", 
                                   size=12),
        axis.text.y = element_text(face="bold", color="#993333", 
                                   size=12)) +
  scale_color_gradient2(
    midpoint = 2007,
    low = "orange",
    mid = "purple",
    high = "black")
#facet_wrap(vars(amgles.pam),ncol=2)
pp

# savinbg the tiff

nome<-"PCoA_com_trajectorias.tiff"
tiff(nome, height = 15, width = 17, units = 'cm', 
     compression = "lzw", res = 300)
pp
dev.off()






