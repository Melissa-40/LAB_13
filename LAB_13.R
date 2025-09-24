install.packages("ggplot2")
# cargar libreria ggplot2
library(ggplot2)

# leer df
green_data <- read.csv("E:/DOCTORADO/4to semestre/LABS/SESION 3/LAB_13/INPUT/REGESIONES FINALES.csv")

}# echando un ojo a los datos
names(green_data)

# colocando objetos
p1<-ggplot(data=green_data,
           mapping = aes(x=ICE_index,y=GCI_index,))+
  geom_point()+
  geom_text(label=green_data$STATE,
            color="black",
            size=4)+
  geom_point()+
  geom_smooth(method = lm,
              se=FALSE,
              fullrange=T)
#visualizar 
p1

#comparación de ranking
p2<-ggplot(data=green_data,
           mapping = aes(x=ICE_rank,y=GCI_rank,))+
  geom_point()+
  geom_text(label=green_data$STATE,
            color="black",
            size=4)+
  geom_point()+
  geom_smooth(method = lm,
              se=FALSE,  fullrange=T)
P3# PIB estatal 
p3<-ggplot(data=green_data,
           mapping = aes(x=LPIBE,y=GCI_index,))+
  geom_point()+
  geom_text(label=green_data$STATE,
            color="black",
            size=4)+
  geom_point()+
  geom_smooth(method = lm,
              se=FALSE,  fullrange=T)
p3

### correl1
install.packages("psych")
library(psych)

library(readr)
correl <- read_csv<- read.csv("E:/DOCTORADO/4to semestre/LABS/SESION 3/LAB_13/INPUT/correl.csv")
(correl)

#correlacionar cada variable de forma pareada
attach(correl)
names(correl)
pairs(correl)
pairs.panels(correl)

### correl2

# Calculamos la correlación 
complex_corr<-cor(correl,method="pearson")
complex_corr

# Redondeamos
complex_corr=round(complex_corr,digits=2)
complex_corr

#mapa de calor de las correlaciones
#matriz de correlación
install.packages("ggcorrplot")
library(ggcorrplot)
library(ggplot2)

#hacer otro objeto
p4
p4<-ggcorrplot(complex_corr,method="circle",type="lower",lab=TRUE)+ggtitle("matrizdecorrelacion")+theme_minimal()
visualizar 
p4

#generar un conjunto de gráficos en la misma cuadrícula
install.packages("ggpubr")
require(ggpubr)

#conjuntar todo en uno
ggpubr :: ggarrange (p1, p2, p3, p4, etiquetas = c ("A", "B", "C" , "D"))

#objeto grafico
install.packages("gridExtra")
require (gridExtra)
F1 <- grid.arrange (p1, p2, p3, p4, nrow = 2)
