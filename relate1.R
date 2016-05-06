

age <- c( 1, 2, 3, 4, 5, 6)
weight <- c( 1, 2, 3, 4, 5, 6 )

person <- data.frame(age, weight)

ptable <- xtabs(~age + weight, data=person)
