###############################################################################
# Importación de datos
###############################################################################
setwd("C:/Users/brand/Desktop/Modelo de divorcios/datos")
divorcios <- read.csv("conjunto_de_datos_divorcios_2019.csv")
###############################################################################
# Creación de nueva tabla para la Ciudad de Puebla
###############################################################################
library(plyr)
dvp <- matrix(NA, nrow = 93, ncol = 2)
#Divorcio administrativo
dvp[1,1] <- nrow(divorcios[(divorcios$ent_regis == 21 &
                            divorcios$mun_regis == 114 &
                            divorcios$ï..tipo_div == 2 &
                           (divorcios$dura_leg == 93 |
                            divorcios$dura_leg == 94 |
                            divorcios$dura_leg == 95 |
                            divorcios$dura_leg == 96 |
                            divorcios$dura_leg == 97 |
                            divorcios$dura_leg == 98)),])
for (i in 1:92){
dvp[i + 1,1] <- nrow(divorcios[(divorcios$ent_regis == 21 &
                                divorcios$mun_regis == 114 &
                                divorcios$ï..tipo_div == 2 &
                                divorcios$dura_leg == i),])
}
#Divorcio judicial
dvp[1,2] <- nrow(divorcios[(divorcios$ent_regis == 21 &
                            divorcios$mun_regis == 114 &
                            divorcios$ï..tipo_div == 1 &
                           (divorcios$dura_leg == 93 |
                            divorcios$dura_leg == 94 |
                            divorcios$dura_leg == 95 |
                            divorcios$dura_leg == 96 |
                            divorcios$dura_leg == 97 |
                            divorcios$dura_leg == 98)),])
for (i in 1:92){
dvp[i + 1,2] <- nrow(divorcios[(divorcios$ent_regis == 21 &
                                divorcios$mun_regis == 114 &
                                divorcios$ï..tipo_div == 1 &
                                divorcios$dura_leg == i),])
}
colnames(dvp) <- c("Administrativo","Judicial")
rownames(dvp) <- c(0:92)
#Exportación de datos
write.csv(dvp,"dvp.csv")


###############################################################################
# Creación de nueva tabla para el país
###############################################################################
dvm <- matrix(NA, nrow = 93, ncol = 2)
#Divorcio administrativo
dvm[1,1] <- nrow(divorcios[(divorcios$ï..tipo_div == 2 &
                           (divorcios$dura_leg == 93 |
                            divorcios$dura_leg == 94 |
                            divorcios$dura_leg == 95 |
                            divorcios$dura_leg == 96 |
                            divorcios$dura_leg == 97 |
                            divorcios$dura_leg == 98)),])
for (i in 1:92){
  dvm[i + 1,1] <- nrow(divorcios[(divorcios$ï..tipo_div == 2 &
                                  divorcios$dura_leg == i),])
}
#Divorcio judicial
dvm[1,2] <- nrow(divorcios[(divorcios$ï..tipo_div == 1 &
                           (divorcios$dura_leg == 93 |
                            divorcios$dura_leg == 94 |
                            divorcios$dura_leg == 95 |
                            divorcios$dura_leg == 96 |
                            divorcios$dura_leg == 97 |
                            divorcios$dura_leg == 98)),])
for (i in 1:92){
  dvm[i + 1,2] <- nrow(divorcios[(divorcios$ï..tipo_div == 1 &
                                  divorcios$dura_leg == i),])
}
colnames(dvm) <- c("Administrativo","Judicial")
rownames(dvm) <- c(0:92)
#Exportación de datos
write.csv(dvm,"dvm.csv")






















