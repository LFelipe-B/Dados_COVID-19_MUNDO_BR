#!/usr/bin/env Rscript

# I saved in R format because  its better to edit, but editing a .txt file is good, then and execute in R copying and pasting instead of running the script#
require(ggplot2)

library(ggplot2)

BR_19_covid_Confirmed <- read.csv("States_BR_24.3.csv")

BR_19_covid_Confirmed$DATE <- factor(BR_19_covid_Confirmed$DATE, levels = BR_19_covid_Confirmed$DATE)


ggplot(BR_19_covid_Confirmed, aes(x= DATE,group = 1)) +
geom_line(aes(y = CE,color="CE"),lwd=1)  +
geom_line(aes(y = RJ,color="RJ"),lwd=1)  +
geom_line(aes(y = RS,color="RS"),lwd=1)  +
geom_line(aes(y = SC,color="SC"),lwd=1)  +
geom_line(aes(y = SP,color="SP"),lwd=1)  + # to insert another state in the CSV file past another line of code as "geom_line and etc... then choose colors and etc.

scale_color_manual(name = "Estados",
values = c( "CE" = "#3569c3", "RJ" = "#008080", "RS" = "#612476", "SC" = "#c99800", "SP" = "#ff0000"),
labels = c("CE: 182 casos", "RJ: 305 casos", "RS: 98 casos","SC: 107 casos","SP: 810 casos"))+
labs(x = "Dias após primeiro caso reportado no Brasil",
y = "Soma dos casos (total)",
title = "Casos confirmados de COVID-19 em estados selecionados do Brasil",
subtitle = "Brasil, 25/3/2020 - Por: L. Felipe Benites @lfelipeb",caption="Fontes: https://pt.wikipedia.org/wiki/Pandemia_de_COVID-19_no_Brasil - https://g1.globo.com/bemestar/coronavirus/noticia/ e Ministério da Saúde")+
theme(
panel.background = element_rect(fill = "#daedf4", colour = "black",
size = 0.5, linetype = "solid"),
panel.grid.major = element_line(size = 0.5, linetype = 'solid',
colour = "white"),
panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
colour = "white")
)+theme(axis.text.x = element_text(angle = 90, hjust = 1))+
annotate(
geom = "curve", x = 14, y = 200, xend = 14, yend = 0,
curvature = .0, arrow = arrow(length = unit(2, "mm"))
) +
annotate(geom = "text", x = 9.6, y = 220, label = "Primeiro caso no RS", hjust = "left")+
annotate(
geom = "curve", x = 15, y = 300, xend = 15, yend = 0,
curvature = .0, arrow = arrow(length = unit(2, "mm"))
) +
annotate(geom = "text", x = 14.9, y = 325, label = "OMS declara pandemia", hjust = "left")+
annotate(
geom = "curve", x = 23, y = 400, xend = 23, yend = 0,
curvature = .0, arrow = arrow(length = unit(2, "mm"))
) +
annotate(geom = "text", x = 16.3, y = 420, label = "RS declara calamidade pública", hjust = "left")+
annotate(
geom = "curve", x = 1, y = 100, xend = 1, yend = 0,
curvature = .0, arrow = arrow(length = unit(2, "mm"))
) +
annotate(geom = "text", x = 0.9, y = 125, label = "Primeiro caso no BR", hjust = "left")

# to print choose name, size and uncomment ggsave("COVID19_STATES_final66.pdf",  width = 10.9, height = 5.58, limitsize = FALSE)
