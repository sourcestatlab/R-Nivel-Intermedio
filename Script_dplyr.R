#############################
###    dplyr - package    ###
#############################

# Instalación
install.packages('dplyr', dependencies = TRUE)

if (packageVersion("devtools") < 1.6) {
      install.packages("devtools")
}
devtools::install_github("hadley/lazyeval")
devtools::install_github("hadley/dplyr")

# Instalamos librerias de datos
library(hflights)

# Librerias
library(dplyr)
library(hflights)

# Visualizamos la informacion
data(package="hflights")
hflights
dim(hflights)
class(hflights)

# Convertimos en table dataframe
hflights <- tbl_df(hflights)
dim(hflights)
class(hflights)





