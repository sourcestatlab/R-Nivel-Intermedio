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

# Cargamos la informacion necesaria

hflights <- tbl_df(read.csv("hflights.csv", stringsAsFactors = FALSE))

hflights_db <- src_sqlite("hflights.sqlite3", create = TRUE)

copy_to(hflights_db, as.data.frame(flights), name = "flights", 
        indexes = list(c("date", "hour"), "plane", "dest", "arr"), temporary = FALSE)
copy_to(hflights_db, as.data.frame(weather), name = "weather", 
        indexes = list(c("date", "hour")), temporary = FALSE)
copy_to(hflights_db, as.data.frame(airports), name = "airports", 
        indexes = list("iata"), temporary = FALSE)
copy_to(hflights_db, as.data.frame(planes), name = "planes", 
        indexes = list("plane"), temporary = FALSE)

flights_db <- hflights_db %>% tbl("flights")
weather_db <- hflights_db %>% tbl("weather")
planes_db <- hflights_db %>% tbl("planes")
airports_db <- hflights_db %>% tbl("airports")

## Operador magrittr

iris %>% head

iris %>% tail(5)

c(1, 2, 3, NA) %>% mean()
c(1, 2, 3, NA) %>% mean(na.rm = TRUE)
iris %>% mutate(dim=Sepal.Length*Sepal.Width) %>% filter(!is.na(dim)) %>% group_by(Species) %>%summarise(avg=mean(dim), sd=sd(dim)) 


