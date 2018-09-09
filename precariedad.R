

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
COE<-read.dbf("coe1t117.dbf")


#Paso 3. explorar los datos
#Tabulados
wtd.table(sandra$SEX, weights=sandra$FAC)
wtd.table(sandra$POS_OCU, weights=sandra$FAC)
wtd.table(sandra$INGOCUP, weights=sandra$FAC)

wtd.table(COE$P1, weights=COE$FAC)

# Paso 4. ajustar las variables al formato que necesitamos
sandra$EDA<-as.numeric(sandra$EDA)
sandra$SEX<-as.character(sandra$SEX)

sandy<-sandra[which(as.numeric(sandra$SEX)==2), ]
wtd.table(sandy$SEX)

# Paso 5. 

llave <- paste (sandra$CD_A, sandra$ENT, sandra$CON, sandra$V_SEL, sandra$N_HOG, 
                sandra$H_MUD, sandra$N_REN)
x<-data.frame (sandra, llave)

llave<- paste(COE$CD_A, COE$ENT, COE$CON, COE$V_SEL, COE$N_HOG, 
              COE$H_MUD, COE$N_REN)
x1<-data.frame(COE, llave)

total <- merge(x,x1,by="llave")
wtd.table(total$SEX, total$P3)


#paso 6. Indice

# selecciono mis variables
base_indice<-total[, c("POS_OCU","TIP_CON","ING7C")]

#Creo mi índice con 3 categorías
fit <- kmeans(base_indice, 3)

#se lo pego a la base total
total_mas_indice <- data.frame(total, fit$cluster)
#Ver el nombre 
head(total_mas_indice)

#Tabulo
wtd.table(total_mas_indice$fit.cluster,total_mas_indice$POS_OCU)










