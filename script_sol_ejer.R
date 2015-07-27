# lectura data sociodemigrafica (sdata)
library(readxl)
setwd("C:/Users/Toshiba/Desktop/Source Stat Lab EC/R-Nivel-Intermedio ssl/clean_data_01/data_examples")
sdata <- read_excel("data_sociodemografica.xlsx", sheet = 1,col_names = TRUE,na = "")
names(sdata)

# Abreviación de cadenas {.build}
prov <- sdata[,"provincia"]
abr1 <- substr(x = prov, start = 1, stop = 4)
head(abr1, n = 20)

abr2 <- abbreviate(prov)
head(abr2, n = 20)

# Longitud de cadenas
prov_chars <- nchar(prov)
table(prov_chars)
barplot(table(prov_chars), main="Número de caracteres")


# Patrones de búsqueda
tipov <- sdata[,"tipo.vivienda"]
grep(pattern = "[pP]", tipov, value = TRUE)

grep(pattern = "p", tolower(tipov), value = TRUE)

grep(pattern = "P", toupper(tipov), value = TRUE)

# Distribución de las vocales
#install.packages('stringr', dependencies=TRUE)
library(stringr)
# funcion que contabiliza el numero de vocales
vocales <- c("a", "e", "i", "o", "u")
num_vocales <- vector(mode = "integer", length = 5)

for (i in seq_along(vocales)) {
    num_aux <- str_count(tolower(tipov), vocales[i])
    num_vocales[i] <- sum(num_aux) 
}
names(num_vocales) <- vocales
num_vocales

# La función paste {.build}
prov <- sdata[,"provincia"]
reg <- sdata[,"region"]

prov_reg <- paste(prov, reg, sep="-")
head(prov_reg, n=20)
# "FAMILIAR" por "Familiar" y "-" por "X".
tipov <- sdata[,"tipo.vivienda"]
table(tipov)

tipov1 <- chartr("FAMILIAR", "Familiar",x = tipov)
table(tipov1)

tipov2 <- chartr("-", "X",x = tipov1)
table(tipov2)

# Extraer los 3 primeros caracteres de la variable estado.civil
estciv <- sdata[,"estado.civil"]
estciv3 <- substr(estciv, start =1 , stop = 3)
head(estciv3,n=20)

word(change, 1)
# extraemos la ultima palabra
word(change, -1)
#extraemos todo menos las dos primeras
word(change, 2, -1)
```

# archivo en excel data_crediticia.xlsx
cdata <- read_excel("data_crediticia.xlsx", sheet = 1, col_names = TRUE, na = "")
sdata <- read_excel("data_sociodemografica.xlsx", sheet = 1, col_names = TRUE, na = "")
head(cdata)
head(sdata)

consdata <- merge(sdata, cdata, by="identificacion")
dim(consdata)
col <- match(sdata$identificacion, cdata$identificacion)

consdata1 <- cbind(sdata, cdata[col,])
dim(consdata1)

# Extraer el mes en la variable `fecha.plazo.vencido`.
fechapv <- cdata[,"fecha.plazo.vencido"]
mes <- word(fechapv)
table(mes)

# merge & match
consdata <- merge(sdata, cdata, by="identificacion")
names(consdata)
head(consdata, n=10)

# val predidos y duplicados 
# cantidad y proporción de `NAs` en la variable `ingresos`.
ingr <- sdata[,"ingresos"]
sum(is.na(ingr))
mean(is.na(ingr))

# cantidad de valores únicos para de la variable `edad`
ed <- sdata[,"edad"]
unique(ed)
length(unique(ed))

# cantidad y porcentaje de valores duplicados para la variable `edad`
sum(duplicated(ed))
mean(duplicated(ed))

# recodificacion y discretizacion
# `"-"` por `"Sin Info"` en estado.civil.
restadciv <- ifelse(sdata$estado.civil=="-", "Sin Info", sdata$estado.civil)
table(restadciv)

# tipo.vivienda en "Propia" y "Otras"
rtipviv <- ifelse(sdata$tipo.vivienda=="Propia" | sdata$tipo.vivienda=="PROPIO",
                  "Propia", "Otras")
table(rtipviv)

# Discretice `edad` en `"menor a 18", "De 18 a 40", "De 40 a 65", "mayor a 65"`.
dedad <- cut(sdata$edad, breaks = c(0,18,40,65,max(sdata$edad)), 
             labels = c("menor a 18", "De 18 a 40", "De 40 a 65", "mayor a 65"))
table(dedad)


# muestras aleatorias
# con reemplazamiento
muestra <- sample(sdata$edad,size = 500,replace = TRUE)
any(duplicated(muestra))

