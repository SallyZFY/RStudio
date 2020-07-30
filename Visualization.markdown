## Dumbbell Charts

### S/U Proportion Comparision in Each College

```R
install.packages('ggalt')
install.packages('tidyr')
install.packages("devtools")

library("ggalt")
library("tidyverse")
library("devtools")

#draw the dumbbell plot
"
    ExcelFile: College_Info
    y:         College_Description
    x:         SU_2019_Proportions
    xend:      SU_2020_Proportions
"

dumbbell_chart <- ggplot(data = College_Info) +
  geom_dumbbell(aes(y=reorder(College_Description,SU_2020_Proportions), 
                    x=SU_2019_Proportions, xend=SU_2020_Proportions),
                show.legend = TRUE,
                size=1, 
                color='#dddddd',
                #size_y =1,
                size_x=2, 
                size_xend = 2, 
                colour_x = '#FAAB18', 
                colour_xend = '#1380A1')+
  #Step 2: Labels
  #label each point at its respective political affiliation, and specify color -> point color.
  geom_text(data=filter(College_Info, College_Description=="Law"),
            aes(x=SU_2020_Proportions, y=College_Description, label="2020"),
            color='#1380A1', size=2.75, vjust=-1, fontface="bold") +
  geom_text(data=filter(College_Info, College_Description=="Law"),
            aes(x=SU_2019_Proportions, y=College_Description, label="2019"),
            color='#FAAB18', size=2.75, vjust=-1, fontface="bold") +
  #add direct labels for values
  geom_text(aes(x=SU_2019_Proportions, y=College_Description,
                label=paste0(round(SU_2019_Proportions*100,2)," ")), 
            color='#FAAB18', size=2.75, hjust=1.3) +
  geom_text(aes(x=SU_2020_Proportions, y=College_Description, 
                label=paste0("  ",round(SU_2020_Proportions*100,2))),
            color='#1380A1', size=2.75, hjust=-0.3) + 
  #Step 3: Add a differences column
  #create a grey rectangle
  geom_rect(aes(xmin=3, xmax=3.8, ymin=-Inf, ymax=Inf), fill="grey") +
  #spans the entire chart vertically, so ymin and ymax range from negative to positive infinity
  geom_text(aes(label=round(SU_Proportion_Increase*100,2), 
                #paste0(SU_Proportion_Increase*100, "%"),
                y=College_Description, x=3.4), 
            fontface="bold", size=3) +
  #create labels according to the differences column
  geom_text(data=filter(College_Info, College_Description=="Law"), 
            aes(x=3.4, y=College_Description, label="Difference"),
            color="black", size=3.1, vjust=-2, fontface="bold") +
  scale_x_continuous(expand=c(0,0.5))+ #, limits=c(0, .625)) +  0.4
  scale_y_discrete(expand=c(0.1,1)) +
  labs(x="Requests/100Persons", y=NULL, title="SU Proportion Comparision",
       subtitle="2019 vs 2020",
       caption="Source: UF Data Lake, July 23, 2020.\n\nDesign: Team2") +
  #bbc_style() +
  theme_bw()+
  theme(
    plot.margin = margin(0,0,0,0, "mm"),
    panel.grid.major.x =element_blank(),
    panel.grid.minor=element_blank(),
    panel.border=element_blank(),
    #axis.ticks=element_blank(),
    #axis.text.x=element_blank(),
    plot.title=element_text(size = 16, face="bold"),
    plot.title.position = "plot",
    plot.subtitle=element_text(face="italic", size=12, margin=margin(b=12)),
    plot.caption=element_text(size=8, margin=margin(t=12))
  )

dumbbell_chart
```
