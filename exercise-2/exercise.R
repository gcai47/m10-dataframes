# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100)
employees <- c(paste0("Employee ", c(1:100)))

# Create a vector of 2014 salaries using the runif function
salaries.2014 <- c(runif(100, 100, 200))

# Create a vector of 2015 salaries that are typically higher than the 2014 salaires (use runif again)
salaries.2015 <- c(runif(100, 150, 250))

# Create a data.frame 'salaries' by combining the vectors you just made
salaries <- data.frame(employees, salaries.2014, salaries.2015)

# Create a column 'raise' that stores the size of the raise between 2014 and 2015
salaries$raise <- salaries$salaries.2015 - salaries$salaries.2014

# Create a column 'got.raise' that is TRUE if the person got a raise
salaries$got.raise <- salaries$raise > 0

# Retrieve values from your data frame to answer the following questions:

# What was the 2015 salary of employee 57
salary2015.employee57 <- salaries[57, "salaries.2015"]

# How many employees got a raise?
count.raise <- length(which(salaries$got.raise))

# What was the value of the highest raise?
max.raise <- max(salaries$raise)

# What was the name of the employee who recieved the highest raise?
name.max.raise <- as.character(salaries[which(salaries$raise == max.raise), "employees"]) 

# What was the largest decrease in salaries between the two years?
max.decrease <- min(salaries$raise)

# What was the name of the employee who recieved largest decrease in salary?
name.min.raise <- as.character(salaries[which(salaries$raise == max.decrease), "employees"])

# What was the average salary increase?
average <- mean(salaries$raise)

### Bonus ###

# Write a .csv file of your salaries to your working directory
write.csv(salaries, "salaries.csv")

# For people who did not get a raise, how much money did they lose?
mean.loss <- mean(salaries[which(salaries$got.raise == FALSE), "raise"])

# Is that what you expected them to lose?

### Double Bonus (no answer given) ###

# Repeat the above experiment 100 times, tracking the loss each time.
# Does the average loss equal what you expect?
# What about 10,000 times?
