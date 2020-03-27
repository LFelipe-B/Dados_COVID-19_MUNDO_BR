#!/usr/bin/env Rscript

# I saved in R format because  its better to edit, but editing a .txt file is good, then and execute in R copying and pasting instead of running the script#
require(ggplot2)

library(ggplot2)


BR_19_covid_Confirmed <- read.csv("WORLD_26.3.csv")

BR_19_covid_Confirmed <- read.csv("world_log_26.csv")


BR_19_covid_Confirmed$DATE <- factor(BR_19_covid_Confirmed$DATE, levels = BR_19_covid_Confirmed$DATE)

ggplot(BR_19_covid_Confirmed, aes(x= DATE,group = 1)) +
geom_line(aes(y = CH,color="CH"),lwd=1)  +
geom_line(aes(y = ES,color="ES"),lwd=1)  +
geom_line(aes(y = FR,color="FR"),lwd=1)  +
geom_line(aes(y = IT,color="IT"),lwd=1)  +
geom_line(aes(y = JP,color="JP"),lwd=1)  +
geom_line(aes(y = US,color="US"),lwd=1)  +
geom_line(aes(y = ZA,color="ZA"),lwd=1)  +
geom_line(aes(y = BR,color="BR"),lwd=1)  +

scale_color_manual(name = "Países",
values = c("BR" = "#008080", "CH" = "#ff0000", "ES" = "#c84671", "FR" = "#c99800", "IT" = "#3569c3","JP" = "yellow","US" = "#3d005b", "ZA" = "#fba257"),
labels = c("BR (Brasil): 2915 casos","CH (China): 84591 casos", "ES (Espanha): 37986 casos","FR (França): 25304 casos","IT (Itália): 72176 casos","JP (Japão): 1593 casos", "US (Estados Unidos): 83836 casos", "ZA (África do Sul): 927 casos"))+
labs(x = "Dias após primeiro caso confirmado no US",
y = "Soma dos casos (total)",
title = "Casos confirmados de COVID-19 em países selecionados no Mundo",
subtitle = "Brasil, 27/3/2020 - Por: L. Felipe Benites @lfelipeb",caption="Fonte: Johns Hopkins University (JHU CSSE) - https://github.com/CSSEGISandData/COVID-19")+
theme(
panel.background = element_rect(fill = "#daedf4", colour = "black",
size = 0.5, linetype = "solid"),
panel.grid.major = element_line(size = 0.5, linetype = 'solid',
colour = "white"),
panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
colour = "white")
)+theme(axis.text.x = element_text(angle = 90, hjust = 1))+

annotate(
geom = "curve", x = 35, y = 20000, xend = 35, yend = 0,
curvature = .0, arrow = arrow(length = unit(2, "mm"))
) +
annotate(geom = "text", x = 29, y = 22000, label = "Primeiro caso no BR", hjust = "left")+

annotate(
geom = "curve", x = 45, y = 40000, xend = 45, yend = 0,
curvature = .0, arrow = arrow(length = unit(2, "mm"))
) +
annotate(geom = "text", x = 39, y = 42000, label = "OMS declara pandemia", hjust = "left")+

annotate(
geom = "curve", x = 1, y = 60000, xend = 1, yend = 0,
curvature = .0, arrow = arrow(length = unit(2, "mm"))
) +
annotate(geom = "text", x = 0.9, y = 62000, label = "Primeiro caso no US em 21/1", hjust = "left")+

annotate(
geom = "curve", x = 3, y = 50000, xend = 3, yend = 0,
curvature = .0, arrow = arrow(length = unit(2, "mm"))
) +
annotate(geom = "text", x = 2.9, y = 52000, label = "Primeiros casos na FR", hjust = "left")+

annotate(
geom = "curve", x = 6, y = 40000, xend = 6, yend = 0,
curvature = .0, arrow = arrow(length = unit(2, "mm"))
) +
annotate(geom = "text", x = 5.9, y = 42000, label = "Primeiro caso na ES", hjust = "left")+

annotate(
geom = "curve", x = 10, y = 5000, xend = 10, yend = 0,
curvature = .0, arrow = arrow(length = unit(2, "mm"))
) +
annotate(geom = "text", x = 9.9, y = 7200, label = "Primeiro caso na IT", hjust = "left")+

annotate(
geom = "curve", x = 44, y = 30000, xend = 44, yend = 0,
curvature = .0, arrow = arrow(length = unit(2, "mm"))
) +
annotate(geom = "text", x = 34.2, y = 32000, label = "Primeiro caso na ZA", hjust = "left")

# to sabe uncomment and change the aspects to your favorite size #ggsave("COVID19_WORLD_26.3.pdf", width = 12.6, height = 5.07, limitsize = FALSE)

