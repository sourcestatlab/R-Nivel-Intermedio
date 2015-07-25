###############################
### Script Nivel Intermedio ###
########    CLase 01  #########

head(USArrests)

states <- rownames(USArrests)
head(states)

substr(x = states, start = 1, stop = 4)

states2 <- abbreviate(states)
states2

state_chars <- nchar(states)
state_chars
barplot(table(state_chars), main="Número de caracteres")

grep(pattern = "w", states, value = TRUE)

grep(pattern = "[wW]", states, value = TRUE)

grep(pattern = "w", tolower(states), value = TRUE)

grep(pattern = "W", toupper(states), value = TRUE)

install.packages('stringr', dependencies=TRUE)
library(stringr)

str_count(states, "a")

str_count(tolower(states), "a")

vocales <- c("a", "e", "i", "o", "u")
num_vocales <- vector(mode = "integer", length = 5)

for (i in seq_along(vocales)) {
      num_aux <- str_count(tolower(states), vocales[i])
      num_vocales[i] <- sum(num_aux) 
}


names(num_vocales) <- vocales
num_vocales

paste("El valor de pi es: ", pi)

paste("Curso", "R", "Intermedio", sep = "-")

paste(c("a", "b", "c"), c("1r", "2r", "3r"), sep="")










