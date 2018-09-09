
install.packages("")

# Cada que empiezas, debes tener:

#Paso 1
library(foreign)
library(ggplot2)
library(questionr)
#Elimina los warnings
options(warn=1)

#Paso 2
setwd("C:/Users/jmartinez/Desktop/2017trim1_dbf")
sandra<-read.dbf("sdemt117.dbf")
COE<-read.


#Paso 3. explorar los datos
#Tabulados
wtd.table(sandra$SEX, weights=sandra$FAC)
wtd.table(sandra$POS_OCU, weights=sandra$FAC)
wtd.table(sandra$INGOCUP, weights=sandra$FAC)









