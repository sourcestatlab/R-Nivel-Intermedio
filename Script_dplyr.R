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



devtools::install_github("trestletech/shinyAce")
devtools::install_github("swarm-lab/editR")

install.packages(c("shiny", "shinyFiles", "shinyBS", "rmarkdown", "knitr"), dependencies=TRUE)
library(devtools)
install_github("trestletech/shinyAce")
install_github("ebailey78/shinyBS")

editR::editR("dplyr_04.Rmd")

