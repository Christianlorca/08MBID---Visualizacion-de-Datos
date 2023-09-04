library(readxl)

AF_2015 <- read_excel("~/Desktop/DATASET_TESIS/2. Ingresos por Materia Familia 2015.xlsx", na = "No registra")
AF_2016 <- read_excel("~/Desktop/DATASET_TESIS/Download-2016/2. Ingresos por Materia Familia 2016.xlsx", na = "No registra")
AF_2017 <- read_excel("~/Desktop/DATASET_TESIS/Download-2017/2. Ingresos por Materia Familia 2017.xlsx", na = "No registra")
AF_2018 <- read_excel("~/Desktop/DATASET_TESIS/Download-2018/2. Ingresos por Materia Familia 2018.xlsx", na = "No registra")
AF_2019 <- read_excel("~/Desktop/DATASET_TESIS/Download-2019/2. Ingresos por Materia Familia 2019.xlsx", na = "No registra")
AF_2020 <- read_excel("~/Desktop/DATASET_TESIS/Download-2020/2.- BBDD Ingresos por Materia Familia 2020.xlsx", na = "No registra")
AF_2021 <- read_excel("~/Desktop/DATASET_TESIS/Download-2021/2.-BBDD Ingresos por Materia Familia 2021.xlsx", na = "No registra")
AF_2022 <- read_excel("~/Desktop/DATASET_TESIS/Download-2022-2/Ingresos por Materia Familia 2022.xlsx", na = "No registra")

names(AF_2015)
names(AF_2016)
names(AF_2017)
names(AF_2018)
names(AF_2019)
names(AF_2020)
names(AF_2021)
names(AF_2022)


#install.packages("dplyr")
library(dplyr)

# Eliminar columnas adicionales

AF_2015 <- select(AF_2015, -c("N°"))
AF_2016 <- select(AF_2016, -c("N°"))
AF_2017 <- select(AF_2017, -c("N°"))
AF_2018 <- select(AF_2018, -c("N°"))
AF_2019 <- select(AF_2019, -c("N°"))
AF_2020 <- select(AF_2020, -c("N°"))
AF_2022 <- select(AF_2022, -c("ID_CAUSA"))

AF_2015 <- select(AF_2015, -c("MES INGRESO"))
AF_2016 <- select(AF_2016, -c("MES INGRESO"))
AF_2017 <- select(AF_2017, -c("MES INGRESO"))
AF_2018 <- select(AF_2018, -c("MES INGRESO"))
AF_2019 <- select(AF_2019, -c("MES INGRESO"))
AF_2020 <- select(AF_2020, -c("MES INGRESO"))
AF_2021 <- select(AF_2021, -c("MES INGRESO"))
AF_2022 <- select(AF_2022, -c("MES INGRESO"))


AF_2021 <- select(AF_2021, -c("RUC","TIPO CAUSA","FORMA INICIO","TIPO INGRESO","SISTEMA"))
AF_2020 <- rename(AF_2020, "TIPO CAUSA" = "PROCEDIMIENTO")
AF_2021 <- rename(AF_2021, "TIPO CAUSA" = "PROCEDIMIENTO")
AF_2022 <- select(AF_2022, -c("RUC","TIPO CAUSA","FORMA INICIO","TIPO INGRESO","SISTEMA"))
AF_2022 <- rename(AF_2022, "TIPO CAUSA" = "GLOSA TIPO CAUSA")
AF_2022 <- rename(AF_2022, "COD. CORTE" = "CÓDIGO CORTE")
AF_2022 <- rename(AF_2022, "COD. TRIBUNAL" = "CÓDIGO TRIBUNAL")

class(AF_2018$`FECHA INGRESO`)

AF_2018$`FECHA INGRESO` <- as.Date(AF_2018$`FECHA INGRESO`, format="%d-%m-%Y")
AF_2019$`FECHA INGRESO` <- as.Date(AF_2019$`FECHA INGRESO`, format="%d-%m-%Y")


#AF_2018$`FECHA INGRESO` <- as.POSIXct(AF_2018$`FECHA INGRESO`, format = "%d-%m-%Y")

#AF_2019$`FECHA INGRESO` <- as.POSIXct(AF_2019$`FECHA INGRESO`, format = "%d/%m/%Y")



# 2018 la vriable viene en char

AF_2015$`FECHA INGRESO` <- as.POSIXct(AF_2015$`FECHA INGRESO`, format = "%d/%m/%Y")
AF_2016$`FECHA INGRESO` <- as.POSIXct(AF_2016$`FECHA INGRESO`, format = "%d/%m/%Y")
AF_2017$`FECHA INGRESO` <- as.POSIXct(AF_2017$`FECHA INGRESO`, format = "%d/%m/%Y")
AF_2018$`FECHA INGRESO` <- as.POSIXct(AF_2018$`FECHA INGRESO`, format = "%d/%m/%Y")
AF_2019$`FECHA INGRESO` <- as.POSIXct(AF_2019$`FECHA INGRESO`, format = "%d/%m/%Y")
AF_2020$`FECHA INGRESO` <- as.POSIXct(AF_2020$`FECHA INGRESO`, format = "%d/%m/%Y")
AF_2021$`FECHA INGRESO` <- as.POSIXct(AF_2021$`FECHA INGRESO`, format = "%d/%m/%Y")
AF_2022$`FECHA INGRESO` <- as.POSIXct(AF_2022$`FECHA INGRESO`, format = "%d/%m/%Y")

AF_2015$`MES INGRESO` <- as.POSIXct(AF_2015$`MES INGRESO`, format = "%d/%m/%Y")
AF_2016$`MES INGRESO` <- as.POSIXct(AF_2016$`MES INGRESO`, format = "%d/%m/%Y")
AF_2017$`MES INGRESO` <- as.POSIXct(AF_2017$`MES INGRESO`, format = "%d/%m/%Y")
AF_2018$`MES INGRESO` <- as.POSIXct(AF_2018$`MES INGRESO`, format = "%d/%m/%Y")
AF_2019$`MES INGRESO` <- as.POSIXct(AF_2019$`MES INGRESO`, format = "%d/%m/%Y")
AF_2020$`MES INGRESO` <- as.POSIXct(AF_2020$`MES INGRESO`, format = "%d/%m/%Y")
AF_2021$`MES INGRESO` <- as.POSIXct(AF_2021$`MES INGRESO`, format = "%d/%m/%Y")
AF_2022$`MES INGRESO` <- as.POSIXct(AF_2022$`MES INGRESO`, format = "%d/%m/%Y")

Ingresos_Familia<-rbind(AF_2015,AF_2016,AF_2017,AF_2018,AF_2019,AF_2020,AF_2021,AF_2022)

dim(Ingresos_Familia)
unique(Ingresos_Familia$MATERIA)
table(Ingresos_Familia$TRIBUNAL,Ingresos_Familia$`AÑO INGRESO`)

Ingresos_Familia$`TIPO CAUSA` <- toupper(Ingresos_Familia$`TIPO CAUSA`)
unique(Ingresos_Familia$`TIPO CAUSA`)

table(Ingresos_Familia$`AÑO INGRESO`)

#Ingresos_Familia_Intra <-subset(Ingresos_Familia,`TIPO CAUSA`=="Violencia Intrafamiliar")
Ingresos_Familia_Intra <- subset(Ingresos_Familia, `TIPO CAUSA` %in% c("Violencia Intrafamiliar", "VIOLENCIA INTRAFAMILIAR"))

Ingresos_Familia_Intra$`TIPO CAUSA`<-toupper(Ingresos_Familia_Intra$`TIPO CAUSA`)

dim(Ingresos_Familia_Intra)
unique(Ingresos_Familia_Intra$TRIBUNAL)



Ingresos_Familia_Intra$TRIBUNAL<-gsub("JUZGADO DE FAMILIA ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("JUZGADO LETRAS Y GARANTÍA ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("DE ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("JUZGADO LETRAS ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("2º ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("1º ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("3º ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("4º ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("Jgdo. L. y G.","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub(" de ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("2 ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("1 ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("3 ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("4 ","",Ingresos_Familia_Intra$TRIBUNAL)

Ingresos_Familia_Intra$TRIBUNAL<-gsub("JuzgadoFamilia ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("JGDO. L. Y G. ","",Ingresos_Familia_Intra$TRIBUNAL)

Ingresos_Familia_Intra$TRIBUNAL<-gsub("JGDO. L. ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("Jgdo. L.","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("JuzgadoLetras y Garantía","",Ingresos_Familia_Intra$TRIBUNAL) 
Ingresos_Familia_Intra$TRIBUNAL<-gsub("Y GARANTÍA ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("JGDO. LETRAS ","",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("JuzgadoLetras","",Ingresos_Familia_Intra$TRIBUNAL)

unique(Ingresos_Familia_Intra$TRIBUNAL)
# Quitar los espacios en blanco al principio y al final
Ingresos_Familia_Intra$TRIBUNAL <- trimws(Ingresos_Familia_Intra$TRIBUNAL, which = "both")
Ingresos_Familia_Intra$TRIBUNAL <- toupper(Ingresos_Familia_Intra$TRIBUNAL)

#.---
Ingresos_Familia_Intra$TRIBUNAL<-gsub("CENTROMEDIDAS CAUTELARES","SANTIAGO",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("CENTRO MEDIDAS CAUTELARES","SANTIAGO",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("ISLAPASCUA","ISLA DE PASCUA",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("DIEGOALMAGRO","DIEGO DE ALMAGRO",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("DIEGO ALMAGRO","DIEGO DE ALMAGRO",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("CABOHORNOS","CABO DE HORNOS",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("CABO HORNOS","CABO DE HORNOS",Ingresos_Familia_Intra$TRIBUNAL)


unique(Ingresos_Familia_Intra$TRIBUNAL)

table(Ingresos_Familia_Intra$`AÑO INGRESO`)

Ingresos_Familia_Intra$Mes<-format(Ingresos_Familia_Intra$`FECHA INGRESO`, format="%m")
Ingresos_Familia_Intra$DiaDeLaSemana <- weekdays(Ingresos_Familia_Intra$`FECHA INGRESO`)


Ingresos_Familia_Intra$DiaDeLaSemana<-gsub("Monday","LUNES",Ingresos_Familia_Intra$DiaDeLaSemana)
Ingresos_Familia_Intra$DiaDeLaSemana<-gsub("Thursday","MARTES",Ingresos_Familia_Intra$DiaDeLaSemana)
Ingresos_Familia_Intra$DiaDeLaSemana<-gsub("Tuesday","MIERCOLES",Ingresos_Familia_Intra$DiaDeLaSemana)
Ingresos_Familia_Intra$DiaDeLaSemana<-gsub("Wednesday","JUEVES",Ingresos_Familia_Intra$DiaDeLaSemana)
Ingresos_Familia_Intra$DiaDeLaSemana<-gsub("Friday","VIERNES",Ingresos_Familia_Intra$DiaDeLaSemana)
Ingresos_Familia_Intra$DiaDeLaSemana<-gsub("Saturday","SABADO",Ingresos_Familia_Intra$DiaDeLaSemana)
Ingresos_Familia_Intra$DiaDeLaSemana<-gsub("Sunday","DOMINGO",Ingresos_Familia_Intra$DiaDeLaSemana)


unique(Ingresos_Familia_Intra$`TIPO CAUSA`)
Ingresos_Familia_Intra$`TIPO CAUSA`<-toupper(Ingresos_Familia_Intra$`TIPO CAUSA`)

# REGIONES
dim(Ingresos_Familia_Intra)
table(Ingresos_Familia_Intra$DiaDeLaSemana,Ingresos_Familia_Intra$`AÑO INGRESO`)

library(ggplot2)
library(dplyr)
df <- table(Ingresos_Familia_Intra$`AÑO INGRESO`)
df<-as.data.frame(df)
#df <- table(Ingresos_Familia_Intra$`AÑO INGRESO`)
names(df) <- c("Año", "Ingresos")
df$Año <- as.numeric(as.character(df$Año))
# Ordena el dataframe por el año
df <- df[order(df$Año), ]
p <- ggplot(data = df, aes(x = Año, y = Ingresos)) +
  geom_line(color = "#FF8C00", linewidth = 1) +
  theme_bw() +  
  theme(plot.title = element_text(hjust = 0.5)) + 
  labs(x = "Año", 
       y = "Ingresos", 
       title = "Ingresos de denuncias a lo largo del tiempo") +
  scale_x_continuous(breaks = seq(min(df$Año), max(df$Año), by = 1))  # Asegura que todos los años aparezcan en el eje x

print(p)  # Imprime el gráfico

dr<-table(Ingresos_Familia$`TIPO CAUSA`)
heatmap(table(Ingresos_Familia_Intra$DiaDeLaSemana,Ingresos_Familia_Intra$`AÑO INGRESO`))

#VIF_DF <- merge(Ingresos_Familia_Intra, REGIONES_COMUNAS, by.x = "TRIBUNAL", by.y = "Nombre Comuna")
Ingresos_Familia_Intra$TRIBUNAL
Ingresos_Familia_Intra$TRIBUNAL<-gsub("AYSEN","PUERTO AYSEN",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("MUERMOS","LOS MUERMOS",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("PUERTO CISNE","PUERTO CISNES",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("SAN VICENTE","SAN VICENTE TAGUA-TAGUA",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("TRASCAÑETE","CANETE",Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL<-gsub("ISLA PASCUA","ISLA DE PASCUA",Ingresos_Familia_Intra$TRIBUNAL)




unique(Ingresos_Familia_Intra$TRIBUNAL)

library(readxl)
REGIONES_COMUNAS <- read_excel("~/Desktop/NEW_REGIONES_PROVINCIAS_COMUNAS.xlsx", 
                               range = "A2:D349")
REGIONES_COMUNAS$`Nombre Comuna`<-toupper(REGIONES_COMUNAS$`Nombre Comuna`)
REGIONES_COMUNAS$`Código Comuna hasta 1999`<-toupper(REGIONES_COMUNAS$`Código Comuna hasta 1999`)
REGIONES_COMUNAS$`Provincia desde 2018`<-toupper(REGIONES_COMUNAS$`Provincia desde 2018`)
REGIONES_COMUNAS$`Nombre Región desde 2018`<-toupper(REGIONES_COMUNAS$`Nombre Región desde 2018`)

REGIONES_COMUNAS$`Nombre Comuna`<-gsub("CABO HORNOS","CABO DE HORNOS",REGIONES_COMUNAS$`Nombre Comuna`)
REGIONES_COMUNAS$`Nombre Comuna`<-gsub("DIEGO ALMAGRO","DIEGO DE ALMAGRO",REGIONES_COMUNAS$`Nombre Comuna`)
REGIONES_COMUNAS$`Nombre Comuna`<-gsub("ISLA PASCUA","ISLA DE PASCUA",REGIONES_COMUNAS$`Nombre Comuna`)
REGIONES_COMUNAS$`Nombre Comuna`<-gsub("CABO HORNOS","CABO DE HORNOS",REGIONES_COMUNAS$`Nombre Comuna`)
REGIONES_COMUNAS$`Nombre Comuna`<-gsub("CABO HORNOS","CABO DE HORNOS",REGIONES_COMUNAS$`Nombre Comuna`)
REGIONES_COMUNAS$`Nombre Comuna`<-gsub("CABO HORNOS","CABO DE HORNOS",REGIONES_COMUNAS$`Nombre Comuna`)
REGIONES_COMUNAS$`Nombre Comuna`<-gsub("CABO HORNOS","CABO DE HORNOS",REGIONES_COMUNAS$`Nombre Comuna`)

unique(REGIONES_COMUNAS$`Nombre Comuna`)




# quitar los acentos
library(stringi)
reg<-REGIONES_COMUNAS
intra<-Ingresos_Familia_Intra

REGIONES_COMUNAS$`Nombre Comuna` <- stri_trans_general(REGIONES_COMUNAS$`Nombre Comuna`, "Latin-ASCII")
Ingresos_Familia_Intra$TRIBUNAL <- stri_trans_general(Ingresos_Familia_Intra$TRIBUNAL, "Latin-ASCII")

unique(Ingresos_Familia_Intra$TRIBUNAL)
unique(REGIONES_COMUNAS$`Nombre Comuna`)

Ingresos_Familia_Intra$TRIBUNAL <- replace(Ingresos_Familia_Intra$TRIBUNAL, 
                                           Ingresos_Familia_Intra$TRIBUNAL == "ACHAO", 
                                           "QUINCHAO")

REGIONES_COMUNAS$`Nombre Comuna` <- replace(REGIONES_COMUNAS$`Nombre Comuna`, 
                                            REGIONES_COMUNAS$`Nombre Comuna` == "ACHAO", 
                                           "QUINCHAO")

duplicated_values <- REGIONES_COMUNAS[duplicated(REGIONES_COMUNAS$`Nombre Comuna`), "Nombre Comuna"]
library(dplyr)
REGIONES_COMUNAS <- distinct(REGIONES_COMUNAS, `Nombre Comuna`, .keep_all = TRUE)



VIF_DF <- merge(Ingresos_Familia_Intra, REGIONES_COMUNAS, by.x = "TRIBUNAL", by.y = "Nombre Comuna", all = TRUE)

dim(VIF_DF)
View(VIF_DF)

#install.packages("writexl")
library(writexl)
# Después, usa la función write_xlsx para escribir el DataFrame a un archivo Excel
write_xlsx(VIF_DF, "/Users/christianlorcacruz/Desktop/TP20.xlsx")


table(VIF_DF$`Nombre Región desde 2018`,VIF_DF$`AÑO INGRESO`)
unique(VIF_DF$`Nombre Región desde 2018`)
unique(Ingresos_Familia_Intra$TRIBUNAL)
Ingresos_Familia_Intra$TRIBUNAL <- toupper()
any(is.na(VIF_DF))
library(dplyr)
VIF_DF <- rename(VIF_DF,"PROCEDIMIENTO"="TIPO CAUSA")
names(VIF_DF)

VIF_DF <- rename(VIF_DF, "COMUNA" = "TRIBUNAL")
VIF_DF <- rename(VIF_DF, "PROVINCIA" = "Provincia desde 2018")
VIF_DF <- rename(VIF_DF, "REGION" = "Nombre Región desde 2018")
names(VIF_DF)
VIF_DF$REGION<-gsub("DEL ","",VIF_DF$REGION)
VIF_DF$REGION<-gsub("DE ","",VIF_DF$REGION)
unique(VIF_DF$REGION)

VIF_DF <- select(VIF_DF, -c("Código Comuna hasta 1999"))
VIF_DF <- rename(VIF_DF, "TIPO CAUSA" = "PROCEDIMIENTO")

VIF_DF$PROVINCIA <- toupper(VIF_DF$PROVINCIA)
VIF_DF$REGION <- toupper(VIF_DF$REGION)

dim(VIF_DF)



######### Tablas de contingencias

unique(VIF_DF$COMUNA)

table(VIF_DF$COMUNA,VIF_DF$`AÑO INGRESO`)
table(VIF_DF$REGION)
table(VIF_DF$COMUNA,VIF_DF$DiaDeLaSemana)

table(VIF_DF$PROVINCIA,VIF_DF$`AÑO INGRESO`)
table(VIF_DF$PROVINCIA,VIF_DF$Mes)
table(VIF_DF$PROVINCIA,VIF_DF$DiaDeLaSemana)

table(VIF_DF$REGION,VIF_DF$`AÑO INGRESO`)
table(VIF_DF$REGION,VIF_DF$Mes)
table(VIF_DF$REGION,VIF_DF$DiaDeLaSemana)

# Heatmap dias de la semana, por region, provincia y comuna

heatmap(table(VIF_DF$REGION,VIF_DF$DiaDeLaSemana),scale="column")
heatmap(table(VIF_DF$PROVINCIA,VIF_DF$DiaDeLaSemana),scale="column")
heatmap(table(VIF_DF$DiaDeLaSemana,VIF_DF$COMUNA),scale="column")

# Heatmap meses, por region, provincia y comuna

heatmap(table(VIF_DF$REGION,VIF_DF$Mes),scale="row")
heatmap(table(VIF_DF$PROVINCIA,VIF_DF$Mes),scale="row")
heatmap(table(VIF_DF$COMUNA,VIF_DF$Mes),scale="row")

# Heatmap años, por region, provincia y comuna

heatmap(table(VIF_DF$REGION,VIF_DF$`AÑO INGRESO`),scale="row")
heatmap(table(VIF_DF$PROVINCIA,VIF_DF$`AÑO INGRESO`),scale="row")
heatmap(table(VIF_DF$COMUNA,VIF_DF$`AÑO INGRESO`),scale="row",cexRow = .3)


##### Propuesta de Heatmap con libreria ggplto2 

# Normalizar los datos para el heatmap
library(ggplot2)
heatmap_df <- as.data.frame(table(VIF_DF$Mes, VIF_DF$COMUNA)/ max(tab))
names(heatmap_df) <- c("Mes", "COMUNA", "Count")

# Crear el heatmap
ggplot(data = heatmap_df, aes(x = Mes, y = COMUNA, fill = Count)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "red") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
        axis.text.y = element_text(size = 5))  

##### Propuesta de Heatmap con libreria ggplto2 REUNION 9 de Junio

# Normalizar los datos para el heatmap
library(ggplot2)
heatmap_df <- as.data.frame(table(VIF_DF$Mes, VIF_DF$PROVINCIA)/ max(table(VIF_DF$Mes, VIF_DF$PROVINCIA)))
names(heatmap_df) <- c("Mes", "PROVINCIA", "Count")

# Crear el heatmap
ggplot(data = heatmap_df, aes(x = Mes, y = PROVINCIA, fill = Count)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "red") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
        axis.text.y = element_text(size = 5)) 

#####
##### Propuesta de Heatmap con libreria ggplto2

# Normalizar los datos para el heatmap
library(ggplot2)
heatmap_df <- as.data.frame(table(VIF_DF$Mes, VIF_DF$REGION)/ sum(table(VIF_DF$Mes, VIF_DF$REGION)))
names(heatmap_df) <- c("Mes", "REGION", "Count")

# Crear el heatmap
ggplot(data = heatmap_df, aes(x = Mes, y = REGION, fill = Count)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "red") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
        axis.text.y = element_text(size = 5))  

#####
##### Propuesta de Heatmap con libreria ggplto2

# Normalizar los datos para el heatmap
library(ggplot2)
heatmap_df <- as.data.frame(table(VIF_DF$DiaDeLaSemana, VIF_DF$REGION)/ max(table(VIF_DF$DiaDeLaSemana, VIF_DF$REGION)))
names(heatmap_df) <- c("DiaDeLaSemana", "REGION", "Count")

# Crear el heatmap
ggplot(data = heatmap_df, aes(x = DiaDeLaSemana, y = REGION, fill = Count)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "red") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
        axis.text.y = element_text(size = 5)) 

#####

#### Series temporales

library(dplyr)
library(ggplot2)

# Crear un data frame que resume la cantidad de casos por año y por región
VIF_summary <- VIF_DF %>%
  group_by(REGION, `AÑO INGRESO`) %>%
  summarise(Casos = n(), .groups = 'drop')

table(VIF_DF$`AÑO INGRESO`)

dim(VIF_DF)
################################
install.packages("writexl")
library(writexl)
# Después, usa la función write_xlsx para escribir el DataFrame a un archivo Excel
write_xlsx(VIF_DF, "/Users/christianlorcacruz/Desktop/TP.xlsx")
################################

# Crear el gráfico
ggplot(data = VIF_summary, aes(x = `AÑO INGRESO`, y = Casos, color = REGION)) +
  geom_line() +
  labs(x = "Año de Ingreso", y = "Casos de Violencia Intrafamiliar",
       color = "Región",
       title = "Casos de Violencia Intrafamiliar a lo largo de los años por Región") +
  theme_minimal()

library(dplyr)
library(ggplot2)

# Filtrar los datos para incluir sólo la región de Coquimbo
VIF_coquimbo <- VIF_DF %>%
  filter(REGION == "COQUIMBO")

table(VIF_coquimbo$COMUNA,VIF_coquimbo$`AÑO INGRESO`)
table(VIF_coquimbo$COMUNA)

# Crear un data frame que resume la cantidad de casos por año en la región de Coquimbo
VIF_summary <- VIF_tendencia %>%
  group_by(`AÑO INGRESO`) %>%
  summarise(Casos = n(), .groups = 'drop')

# Crear el gráfico
ggplot(data = VIF_summary, aes(x = `AÑO INGRESO`, y = Casos)) +
  geom_line() +
  labs(x = "Año de Ingreso", y = "Casos de Violencia Intrafamiliar",
       title = "Casos de Violencia Intrafamiliar a lo largo de los años en la Región de Coquimbo") +
  theme_minimal()

#### GRAFICO DE LINEAS

# Libraries
library(ggplot2)
library(dplyr)
library(hrbrthemes)

# Load dataset from github
data <-VIF_DF

# Plot
data %>%
  tail(10) %>%
  ggplot( aes(x=YEAR, y=FREC,group=REGION, color=REGION)) +
  geom_line( color="grey") +
  geom_point(shape=21, color="black", fill="#69b3a2", size=6) +
  theme_ipsum() +
  ggtitle("Evolution of bitcoin price")




# Libraries
library(ggplot2)
library(dplyr)

# Keep only 3 names
Ingresos_Familia_Intra
unique(Ingresos_Familia_Intra$TRIBUNAL)
data_comuna<-subset(VIF_DF,REGION=="COQUIMBO")
names(data_comuna)
don <- VIF_DF
df<-as.data.frame(table(data_comuna$COMUNA,data_comuna$`AÑO INGRESO`))
don<-df
# Plot
don %>%
  ggplot( aes(x=Var2, y=Freq, group=Var1)) +
  geom_line()+facet_wrap(vars(Var1), ncol = 3,scales = "free")+theme(legend.position = "none")



# tecnicas de clasterizacion por region

data_VIF<-table(VIF_DF$REGION,VIF_DF$`AÑO INGRESO`)

# Ward Hierarchical Clustering
d <- dist(data_VIF, method = "euclidean") # distance matrix
fit <- hclust(d, method="ward.D") 
plot(fit,cex=.5) # display dendogram
groups <- cutree(fit, k=4) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters 
rect.hclust(fit, k=4, border="red")
data_VIF<-as.matrix(data_VIF)
data_VIF<-as.data.frame(data_VIF)
data_VIF$CLASES_YEAR<-rep(groups,8)
colnames(data_VIF)=c("REGION","YEAR","FREQ","CLASE")

table(data_VIF$REGION,data_VIF$CLASE)/8
length(groups)

## GRFICO
#install.packages("ggpubr")
library("ggpubr")
dataVIF<-table(data_VIF$REGION,data_VIF$CLASE)/8
dataVIF<-as.matrix(dataVIF)
dataVIF<-data.frame(c1=dataVIF[,1],c2=dataVIF[,2],c3=dataVIF[,3],c4=dataVIF[,4])

table(data_VIF$CLASE)/8
ggballoonplot(dataVIF,font.label = list(size = 4, color = "black"))

# Clasterizacion por provincia 

# tecnicas de clasterizacion por provincia

data_VIF_provincia<-table(VIF_DF$PROVINCIA,VIF_DF$`AÑO INGRESO`)

# Ward Hierarchical Clustering
d <- dist(data_VIF_provincia, method = "euclidean") # distance matrix
fit <- hclust(d, method="ward.D") 
plot(fit,cex=.5) # display dendogram
groups <- cutree(fit, k=4) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters 
rect.hclust(fit, k=4, border="red")
data_VIF_provincia<-as.matrix(data_VIF_provincia)
data_VIF_provincia<-as.data.frame(data_VIF_provincia)
data_VIF_provincia$CLASES_YEAR<-rep(groups,8)
colnames(data_VIF_provincia)=c("PROVINCIA","YEAR","FREQ","CLASE")

table(data_VIF_provincia$PROVINCIA,data_VIF_provincia$CLASE)/8
length(groups)

## GRFICO
#install.packages("ggpubr")
library("ggpubr")
dataVIF_provincia<-table(data_VIF_provincia$PROVINCIA,data_VIF_provincia$CLASE)/8
dataVIF_provincia<-as.matrix(dataVIF_provincia)
dataVIF_provincia<-data.frame(c1=dataVIF_provincia[,1],c2=dataVIF_provincia[,2],c3=dataVIF_provincia[,3],c4=dataVIF_provincia[,4])

table(data_VIF_provincia$CLASE)/8
ggballoonplot(dataVIF,font.label = list(size = 4, color = "black"))

### por comuna

# tecnicas de clasterizacion por comuna

data_VIF_comuna<-table(VIF_DF$COMUNA,VIF_DF$`AÑO INGRESO`)

# Ward Hierarchical Clustering
d <- dist(data_VIF_comuna, method = "euclidean") # distance matrix
fit <- hclust(d, method="ward.D") 
plot(fit,cex=.5) # display dendogram
groups <- cutree(fit, k=4) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters 
rect.hclust(fit, k=4, border="red")

data_VIF_comuna<-as.matrix(data_VIF_comuna)
data_VIF_comuna<-as.data.frame(data_VIF_comuna)
data_VIF_comuna$CLASES_YEAR<-rep(groups,8)
colnames(data_VIF_comuna)=c("COMUNA","YEAR","FREQ","CLASE")

table(data_VIF_comuna$PROVINCIA,data_VIF_comuna$CLASE)/8
length(groups)

## GRFICO
#install.packages("ggpubr")
library("ggpubr")
dataVIF_provincia<-table(data_VIF_provincia$PROVINCIA,data_VIF_provincia$CLASE)/8
dataVIF_provincia<-as.matrix(dataVIF_provincia)
dataVIF_provincia<-data.frame(c1=dataVIF_provincia[,1],c2=dataVIF_provincia[,2],c3=dataVIF_provincia[,3],c4=dataVIF_provincia[,4])

table(data_VIF_comuna$CLASE)/8
ggballoonplot(data_VIF_comuna,font.label = list(size = 4, color = "black"))


###
ggplot(data_VIF, aes(x=REGION, y=CLASE, size=FREQ)) + 
  geom_point(alpha=0.7) +
  scale_size_area(max_size = 15) +
  theme_bw() +
  theme(legend.position="none", 
        text = element_text(size = 10, color = "black"), 
        plot.title = element_text(size = 14, hjust = 0.5)) 

##### grafico por region

#data_VIF_2015 <- filter(data_VIF, YEAR == 2015)
library(dplyr)
p <- ggplot(df, aes(disp, mpg)) + theme_bw() +
  geom_point(aes(fill=model, size=n), shape=21)

ggplot(filter(data_VIF, YEAR == 2016), aes(x = CLASE, y = REGION, size = FREQ)) + 
  geom_point(alpha = 0.7,aes(color=CLASE)) +  
  scale_size_area(max_size = 15, guide = "legend") + 
  labs(title = "Título",  
       x = "Región",  
       y = "Clase",
       size = "Frecuencia") +  
  theme_bw() +
  theme(
    legend.position = "right", 
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5, color = "darkblue"), 
    axis.title = element_text(size = 14, face = "bold", color = "darkblue"),  
    axis.text = element_text(size = 7, color = "black"),  
    legend.title = element_text(size = 12, face = "bold", color = "darkblue"),  
    legend.text = element_text(size = 10, color = "black")  
  )

####### grafico por provincia

ggplot(filter(data_VIF_provincia, YEAR == 2022), aes(x = CLASE, y = PROVINCIA, size = FREQ)) + 
  geom_point(alpha = 0.7, color = "#69b3a2") +  
  scale_size_area(max_size = 15, guide = "legend") + 
  labs(title = "Título",  
       x = "Clase",  
       y = "Provincia",
       size = "Frecuencia") +  
  theme_bw() +
  theme(
    legend.position = "right", 
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5, color = "darkblue"), 
    axis.title = element_text(size = 14, face = "bold", color = "darkblue"),  
    axis.text = element_text(size = 7, color = "black"),  
    legend.title = element_text(size = 12, face = "bold", color = "darkblue"),  
    legend.text = element_text(size = 10, color = "black")  
  )


####### grafico por Comuna

ggplot(filter(data_VIF_comuna, YEAR == 2022), aes(x = CLASE, y = COMUNA, size = FREQ,colors=CLASE)) + 
  geom_point(alpha = 0.7) +  
  scale_size_area(max_size = 15, guide = "legend") + 
  labs(title = "Título",  
       x = "Clase",  
       y = "Comuna",
       size = "Frecuencia") +  
  theme_bw() +
  theme(
    legend.position = "right", 
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5, color = "darkblue"), 
    axis.title = element_text(size = 14, face = "bold", color = "darkblue"),  
    axis.text = element_text(size = 4, color = "black"),  
    legend.title = element_text(size = 12, face = "bold", color = "darkblue"),  
    legend.text = element_text(size = 10, color = "black")  
  )

# aumento porcentual

dif_year<-table(Ingresos_Familia_Intra$`AÑO INGRESO`)
dif_year<-as.data.frame(dif_year)
dif_year <- dif_year[order(dif_year$Var1), ]
# Calcular el aumento porcentual
dif_year$Increase <- c(0, diff(dif_year$Freq) / head(dif_year$Freq, -1) * 100)

library(ggplot2)

ggplot(dif_year, aes(x = Var1, y = Increase)) +
  geom_bar(stat = "identity", fill = "orange") +
  labs(x = "Año de Ingreso", y = "Aumento porcentual (%)", 
       title = "Aumento porcentual de violencia intrafamiliar en Chile por año") +
  theme_minimal()

########################### MAPAS #############################################


#### MAPAS DE CHILE CON LIBRERIA CHILEMAPAS
#install.packages(c("ggplot2", "sf", "rnaturalearth", "rnaturalearthdata"))
#install.packages("dplyr")
library(ggplot2)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(chilemapas)
library(dplyr)
library(readxl)

COD_REG <- read_excel("Desktop/COD_REG.xlsx")
COD_REG$Cod_region <- sprintf("%02d", as.integer(COD_REG$Cod_region))

names(COD_REG)
names(chile_regiones)

chile_regiones<-generar_regiones()

COD_REG$Cod_region <- as.character(COD_REG$Cod_region)
chile_regiones <- left_join(chile_regiones, COD_REG, by = c("codigo_region" = "Cod_region"))

# subset para determinar a que corresponde el código region
class(chile_regiones)
class(tercera_cuarta)
cuarta <- subset(chile_regiones, codigo_region == "16")

ggplot() +
  geom_sf(data = cuarta) +
  theme_minimal()


library(sf)
library(ggplot2)

# Calcula los centroides de cada región
chile_regiones$centroid <- st_centroid(chile_regiones$geometry)

# Extrae las coordenadas x e y de los centroides
chile_regiones$lon <- st_coordinates(chile_regiones$centroid)[, 1]
chile_regiones$lat <- st_coordinates(chile_regiones$centroid)[, 2]
names(chile_regiones)


# mapa
ggplot() +
  geom_sf(data = chile_regiones) +
  geom_text(data = chile_regiones, aes(x = Longitud, y = Latitud, label =`Número Región (Odeplan)`), size = 3) +
  theme_minimal()

reg<-as.data.frame(table(VIF_DF$REGION))


library(stringi)

chile_regiones$`Nombre de la Región`<-stri_trans_general(chile_regiones$`Nombre de la Región`, "Latin-ASCII")

reg$Var1<-stri_trans_general(reg$Var1, "Latin-ASCII")



chile_regiones$`Nombre de la Región`<-toupper(chile_regiones$`Nombre de la Región`)

chile_regiones$`Nombre de la Región` <- tolower(gsub("REGION DEL ", "", chile_regiones$`Nombre de la Región`))
chile_regiones$`Nombre de la Región` <- tolower(gsub("REGION DE ", "", chile_regiones$`Nombre de la Región`))
chile_regiones$`Nombre de la Región` <- tolower(gsub("region ", "", chile_regiones$`Nombre de la Región`))

unique(reg$Var1)
unique(chile_regiones$`Nombre de la Región`)
chile_regiones$`Nombre de la Región`<-toupper(chile_regiones$`Nombre de la Región`)


chile_reg <- left_join(chile_regiones, reg, by = c("Nombre de la Región" = "Var1"))
############################### este es sin errores

# Crea un mapeo manual para corregir los nombres de las regiones
corrections <- c("LIBERTADOR GENERAL BERNARDO O'HIGGINS" = "LIBERTADOR B. O'HIGGINS",
                 "BIO-BIO" = "BIOBIO",
                 "AYSEN DEL GENERAL CARLOS IBANEZ DEL CAMPO" = "AISEN GRAL. C. IBANEZ CAMPO",
                 "MAGALLANES Y ANTARTICA CHILENA" = "MAGALLANES Y LA ANTARTICA CHILENA",
                 "METROPOLITANA DE SANTIAGO" = "METROPOLITANA SANTIAGO")

# Aplicar las correcciones a los nombres de las regiones en chile_regiones
chile_regiones$`Nombre de la Región` <- ifelse(chile_regiones$`Nombre de la Región` %in% names(corrections),
                                               corrections[chile_regiones$`Nombre de la Región`],
                                               chile_regiones$`Nombre de la Región`)

# unir los data frames
chile_reg <- left_join(chile_regiones, reg, by = c("Nombre de la Región" = "Var1"))

### este funciona propuesta 1 con escala azul

ggplot() +
  geom_sf(data = chile_reg, aes(fill = Freq)) +
  geom_text(data = chile_regiones, aes(x = Longitud, y = Latitud, label = ""), size = 3) +
  theme_minimal()


### propuesta 2 

#install.packages("viridis") 
library(viridis)

ggplot() +
  geom_sf(data = chile_reg, aes(fill = Freq)) +
  geom_text(data = chile_regiones, aes(x = Longitud, y = Latitud, label = ""), size = 3) +
  scale_fill_viridis_c(option = "magma", 
                       guide = guide_colorbar(title = "Frecuencia de violencia intrafamiliar")) +
  theme_minimal()

##### propuesta 3

ggplot() +
  geom_sf(data = chile_reg, aes(fill = Freq)) +
  geom_text(data = chile_regiones, aes(x = Longitud, y = Latitud, label = ""), size = 3) +
  scale_fill_gradient(low = "white", high = "red", 
                      guide = guide_colorbar(title = "Frecuencia de violencia intrafamiliar")) +
  theme_minimal()
## con escala logaritmica

ggplot() +
  geom_sf(data = chile_reg, aes(fill = log1p(Freq))) +
  geom_text(data = chile_regiones, aes(x = Longitud, y = Latitud, label = ""), size = 3) +
  scale_fill_gradient(low = "white", high = "red", 
                      guide = guide_colorbar(title = "Log de la frecuencia de violencia intrafamiliar")) +
  theme_minimal()


### MAPA NACIONAL A TRAVES DE LAS REGIONALES (este es el mejor segun mi opinion)
ggplot() +
  geom_sf(data = chile_reg, aes(fill = Freq)) +
  geom_text(data = chile_regiones, aes(x = Longitud, y = Latitud, label = ""), size = 3) +
  scale_fill_gradientn(colors = c("white", "yellow", "orange", "red"), 
                       limits = c(0, max(chile_reg$Freq, na.rm = TRUE)),
                       guide = guide_colorbar(title = "Frec VIF")) +
  theme_minimal()+ coord_sf(xlim = c(-78, -66), ylim=c(-57.5, -19))

############# MAPAS CON CHILEMAPAS

library(ggplot2)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(chilemapas)


chile_comunas<-mapa_comunas

chile_comunas <- st_as_sf(chile_comunas)

# lectura de codigos de comunas

library(readxl)
COD_COMUNA <- read_excel("Downloads/CUT_2018_v04.xls")

library(dplyr)

COD_COMUNA$`Nombre Comuna`<-toupper(COD_COMUNA$`Nombre Comuna`)

COD_COMUNA <- COD_COMUNA %>%
  mutate(`Nombre Comuna` = case_when(
    `Nombre Comuna` == "AYSEN" ~ "PUERTO AYSEN",
    `Nombre Comuna` == "CALERA" ~ "LA CALERA",
    `Nombre Comuna` == "CISNES" ~ "PUERTO CISNES",
    `Nombre Comuna` == "NATALES" ~ "PUERTO NATALES",
    `Nombre Comuna` == "SAN VICENTE" ~ "SAN VICENTE TAGUA-TAGUA",
    TRUE ~ `Nombre Comuna`
  ))


COD_COMUNA$`Nombre Comuna`<-stri_trans_general(COD_COMUNA$`Nombre Comuna`, "Latin-ASCII")


chile_c <- left_join(chile_comunas, COD_COMUNA, by = c("codigo_comuna" = "Código Comuna 2018"))


library(dplyr)
library(sf)

ggplot() +
  geom_sf(data = chile_c) +
  theme_minimal()



library(sf)
library(ggplot2)
library(dplyr)

# Calcular los centroides de cada comuna
chile_c_centroids <- st_centroid(st_geometry(chile_c))

# Convertir los centroides a un data frame
chile_c_centroids_df <- data.frame(st_coordinates(chile_c_centroids))

# Añadir los nombres de las comunas al data frame
chile_c_centroids_df$`Nombre Comuna` <- chile_c$`Nombre Comuna`


ggplot() +
  geom_sf(data = chile_c) +
  geom_text(data = chile_c_centroids_df, aes(X, Y, label = `Nombre Comuna`), check_overlap = TRUE, size = .4) +
  theme_minimal()


Freq_comunas<-as.data.frame(table(VIF_DF$COMUNA))

# Identificar las comunas con RIT vacío
comunas_con_RIT_vacio <- unique(VIF_DF$COMUNA[is.na(VIF_DF$RIT)])

# Reemplazar las frecuencias de las comunas con RIT vacío por cero
Freq_comunas$Freq[ Freq_comunas$Var1 %in% comunas_con_RIT_vacio ] <- 0

chile_reg

regi<-as.data.frame(table(VIF_DF$REGION,VIF_DF$`AÑO INGRESO`))

write_xlsx(regi, "/Users/christianlorcacruz/Desktop/TP26.xlsx")









#----


chile_c$`Nombre Comuna`<-toupper(chile_c$`Nombre Comuna`)
chile_c$`Nombre Comuna`<-stri_trans_general(chile_c$`Nombre Comuna`, "Latin-ASCII")


sum(Freq_comunas$Freq)
unique(chile_c$`Nombre Comuna`)
unique(Freq_comunas$Var1)

chile_comun <- left_join(chile_c, Freq_comunas, by = c("Nombre Comuna" = "Var1"))

class(chile_comun)

sum(chile_comun$Freq, na.rm = TRUE)

select_reg<- chile_comun[chile_comun$codigo_region == "05", ]

select_reg <- chile_comun[chile_comun$codigo_region == "05" & chile_comun$`Nombre Comuna` != "ISLA DE PASCUA" & chile_comun$`Nombre Comuna` != "JUAN FERNANDEZ" , ]

####################### filtro por region

ggplot() +
  geom_sf(data = select_reg, aes(fill = Freq)) +
  scale_fill_gradientn(colors = c("white", "yellow", "orange", "red"), 
                       limits = c(0, max(select_reg$Freq, na.rm = TRUE)),
                       guide = guide_colorbar(title = "Frecuencia de violencia intrafamiliar")) +
  theme_minimal()

ggplot() +
  geom_sf(data = select_reg, aes(fill = Freq)) +
  scale_fill_gradientn(colors = c("white", "yellow", "orange", "red"),
                       limits = c(0, max(select_reg$Freq, na.rm = TRUE)),
                       guide = guide_colorbar(title = "Frecuencia de violencia intrafamiliar")) +
  theme_minimal() #+
  #coord_sf(xlim = c(-72, -70), ylim=c(-34, -32))


### este es el mejor segun mi opinion
ggplot() +
  geom_sf(data = chile_comun, aes(fill = Freq)) +
  scale_fill_gradientn(colors = c("white", "yellow", "orange", "red"), 
                       limits = c(0, max(chile_comun$Freq, na.rm = TRUE)),
                       guide = guide_colorbar(title = "Frecuencia de violencia intrafamiliar")) +
  theme_minimal()

#PROVINCIAS ----
provincia<-generar_provincias(mapa = chilemapas::mapa_comunas)
class(chile_provincia)

chile_provincia <- st_as_sf(provincia)
ggplot() +
  geom_sf(data = chile_provincia) +
  theme_minimal()

library(dplyr)

chile_prov <- chile_comun %>%
  group_by(codigo_provincia) %>%
  summarise(`Nombre Provincia` = first(`Nombre Provincia`),
            Freq_sum = sum(Freq, na.rm = TRUE))

chile_provincia_df <- as.data.frame(chile_provincia)
chile_prov_df <- as.data.frame(chile_prov)
chile_prov_df$geometry <- NULL


chile_provincial <- left_join(chile_provincia_df, chile_prov_df, by = "codigo_provincia")


library(writexl)
#  DataFrame a un archivo Excel
write_xlsx(chile_comun, "/Users/christianlorcacruz/Desktop/TP29.xlsx")






# FILTRO COQUIMBO#########

# Filtrar los datos para obtener la comuna de interés
coquimbo_comuna <- chile_c[chile_c$codigo_region == "05", ]

# Calcular los centroides de cada comuna
chile_c_centroid_R4 <- st_centroid(st_geometry(coquimbo_comuna))

# Convertir los centroides a un data frame
chile_c_centroids_df1 <- data.frame(st_coordinates(chile_c_centroid_R4))

# Añadir los nombres de las comunas al data frame
chile_c_centroids_df1$`Nombre Comuna` <- coquimbo_comuna$`Nombre Comuna`

ggplot() +
  geom_sf(data = coquimbo_comuna) +
  geom_text(data = chile_c_centroids_df1, aes(X, Y, label = `Nombre Comuna`), check_overlap = TRUE, size = 1) +
  theme_minimal()



######## Indice : Frecuencia_VIF/Población

chile_reg_table <- data.frame(
  Region = chile_reg$`Nombre de la Región`,
  Freq = chile_reg$Freq,
  Poblacion_2017 = chile_reg$Poblacion_2017,
  Freq_Poblacion_Ratio = chile_reg$Freq / chile_reg$Poblacion_2017
)

chile_reg_table





library(ggplot2)
library(sf)

# Filtrar los datos para obtener la comuna de interés
coquimbo_comuna <- chile_comunas[chile_comunas$codigo_region == "05", ]

# Crear el gráfico
ggplot() +
  geom_sf(data = coquimbo_comuna) +
  theme_minimal()

library(ggplot2)
library(sf)
library(dplyr)
ggplot() +
  geom_sf(data = chile_comunas) +
  theme_minimal()

names(chile_comunas)


# Crea un nuevo data frame con las filas únicas en VIF_DF
tabla <- unique(VIF_DF[, c("REGION", "PROVINCIA", "COMUNA")])

# Muestra la tabla
print(tabla)


library(writexl)
# Después, usa la función write_xlsx para escribir el DataFrame a un archivo Excel
write_xlsx(tabla, "/Users/christianlorcacruz/Desktop/TP15.xlsx")

# COMUNAS ##########

comunna<-as.data.frame(table(VIF_DF$COMUNA))


# INDICE DE MORAN ##########

table(VIF_DF$REGION)

############ Indice de moran prueba 

# Crear el data frame
df_moran_coquimbo <- data.frame(
  COMUNA = c("Andacollo", "Canela", "Combarbalá", "Coquimbo", "Illapel", 
             "La Higuera", "La Serena", "Los Vilos", "Monte Patria", 
             "Ovalle", "Paihuano", "Punitaqui", "Río Hurtado", "Salamanca", "Vicuña"),
  Frecuencia = c(419, 0, 292, 11235, 2041, 0, 10336, 1070, 0, 5469, 0, 0, 0, 0, 966),
  Latitud = c(-30.2310, -31.5833, -31.1833, -29.9602, -31.6333, 
              -29.8915, -29.9094, -31.9167, -30.8333, -30.5992, 
              -30.0292, -30.8307, -30.4231, -31.7667, -30.0333),
  Longuitud = c(-71.0846, -70.8500, -71.0000, -71.3170, -71.1667, 
                -70.8862, -71.2500, -71.5167, -70.7000, -71.2003, 
                -70.5167, -71.2582, -70.9740, -70.9667, -70.7000)
)








# Imprime el data frame
print(df_moran_coquimbo)

# Instalar y cargar el paquete
#install.packages("spdep")
library(spdep)
library(sf)



# Crear un objeto de vecindad. Aquí, usamos la función dnearneigh() para definir vecinos como aquellos puntos que están a una cierta distancia máxima el uno del otro
maxdist <- 1.0 # distancia a lo que sea apropiado
nb <- dnearneigh(df_moran_coquimbo[, c("Longuitud", "Latitud")], 0, maxdist)

# Crear una lista de vecindad ponderada
lw <- nb2listw(nb, style="W")

# Calcular el índice de Moran
moran.test(df_moran_coquimbo$Frecuencia, lw)

####### INDICE DE MORAN TODAS LAS COMUNAS

library(spdep)
library(sf)

chile_comun <- st_as_sf(chile_comun)

coords <- st_coordinates(st_centroid(chile_comun$geometry))

# Asignamos las coordenadas a nuevas columnas en el dataframe
chile_comun$longitud <- coords[,1]
chile_comun$latitud <- coords[,2]

# dataframe Indice de Moran 
nuevo_df <- chile_comun[, c("Código Región","Nombre Región","Nombre Comuna", "Freq", "latitud", "longitud")]

# Subconjuntar el dataframe para incluir sólo la región 04
region_04 <- nuevo_df[nuevo_df$`Código Región` == "05", ]
# Convierte la lista de vecinos a una lista de pesos espaciales
  # Ajusta el radio de búsqueda según tus datos
nb <- poly2nb(region_04)
lw <- nb2listw(nb, style = "W")


region_04$Freq <- as.numeric(region_04$Freq)
region_04 <- na.omit(region_04)

# Calcular y devolver la prueba de Moran para la región
resultado_moran <- moran.test(region_04$Freq, listw = lw)

print(unique(region_04$`Nombre Región`))
print(resultado_moran$p.value)










library(tidyr)
library(ggplot2)

# Convert the table to a data frame
df <- as.data.frame(tabla)

# Convert data to long format
df_long <- df %>% 
  gather(key = "Año", value = "Frecuencia", -Var1)

# Plotting the data
ggplot(data = df_long, aes(x = Año, y = Frecuencia, group = Var1, color = Var1)) +
  geom_line() +
  theme_minimal() +
  labs(x = "Año", y = "Frecuencia", title = "Frecuencia por Provincia y Año", color = "Provincia")



#------

###ANEXOS 

########## Mapa de distribucion frecuencial por región
#install.packages("pacman")
library (pacman)
pacman::p_load (raster, rgdal, rgeos, tidyverse, broom) 
shp <- shapefile('/Users/christianlorcacruz/Downloads/Regiones/Regional.shp')
geo_df<-as.data.frame(table(shp$Region,shp$st_area_sh, shp$st_length_))
names(shp)

library(ggplot2)
library(sf)

ggplot(shp) +
  geom_sf(aes(fill = codregion, geometry = geometry)) +
  scale_fill_continuous(low = "antiquewhite2", high = "palevioletred4", guide = "colorbar") +
  theme_void()

library(ggplot2)
library(sf)

# convertir 'shp' en un objeto 'sf'
shp_sf <- st_as_sf(shp)
class(shp_sf)
ggplot(shp_sf) +
  geom_sf(aes(fill = Region, geometry = geometry)) +
  scale_fill_continuous(low = "antiquewhite2", high = "palevioletred4", guide = "colorbar") +
  theme_void()


ggplot(shp_sf) +
  geom_sf(aes(fill = Region, geometry = geometry)) +
  scale_fill_brewer(palette = "Set1") +
  theme_void()



ggplot(shp_sf) +
  geom_sf(aes(fill = Region, geometry = geometry)) +
  scale_fill_discrete() +
  theme_void()



library(dplyr)
library(ggplot2)
library(sf) # This package is needed for the functions geom_sf() and st_centroid()


chile_comunas %>%
  group_by(codigo_region)%>%
  count()



chile_comunas %>%
  group_by(codigo_region)%>%
  count()%>%
  ggplot(aes(fill = n)) +
  geom_sf(aes(geometry = geometry)) +
  scale_fill_continuous(low = "antiquewhite2", high = "palevioletred4", guide = "colorbar") +
  theme_void()

mapa_comunas
class(mapa_comunas)
mapa<-mapa_comunas
mapa<- st_as_sf(mapa_comunas)
class(Mex)

