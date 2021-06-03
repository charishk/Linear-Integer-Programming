# Reference: https://medium.com/analytics-vidhya/operations-research-with-r-diet-problem-e11b4c1e05cc

# Import lpSolve package
library(lpSolve) 

# Set coefficients of the objective function: min z = sum of cixi (from i=1 to 6)
f.obj <- c(2, 3.5, 8, 1.5, 11, 1) # ci

# Set matrix corresponding to coefficients of constraints by rows
f.con <- matrix(c(90.0, 120.0, 106.0, 97.0, 130.0, 180.0, # diet must contain at least 300 calories
                  4.0, 8.0, 7.0, 1.3, 8.0, 9.2, # diet must contain no more than 10 grams of protein
                  15.0, 11.7, 0.4, 22.6, 0.0, 17.0, # diet must contain no less than 10 grams of carbohydrates
                  1.0, 5.0, 9.0, 0.1, 7.0, 1.0, # diet must contain no less than 8 grams of fat 
                  0.0, 0.0, 0.0, 0.0, 1.0, 0.0, # diet must contain at least 0.5 unit of fish
                  0.0, 1.0, 0.0, 0.0, 0.0, 0.0), # diet must contain at least 1 unit of milk
                nrow=6,
                byrow = TRUE) 

# Set unequality/equality signs
f.dir <- c('>=', '<=', '>=', '>=', '>=', '<=') 

# Set right hand side coefficients
f.rhs <- c(300.0, 10.0, 10.0, 8.0, 0.5, 1.0) 

# Find optimal value of objective function
lp('min', f.obj, f.con, f.dir, f.rhs) 

# Find optimal value of decision variables
lp('min', f.obj, f.con, f.dir, f.rhs)$solution
