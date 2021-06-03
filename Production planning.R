# Reference: https://medium.com/swlh/production-planning-optimization-with-r-48b225fcd06e

# Import lpSolve package
library(lpSolve)

# Set coefficients of the objective function z = max profit
f.obj <- c(15, 25, 15, 63, 45, 50, 10, 45) # these are manual margin and auto margin

# Set matrix corresponding to coefficients of constraints by rows
f.con <- matrix(c(1, 1, 0, 0, 0, 0, 0, 0,     # demand constraint of product 1 (upper bound)
                  1, 1, 0, 0, 0, 0, 0, 0,     # demand constraint of product 1 (lower bound)
                  0, 0, 1, 1, 0, 0, 0, 0,     # demand constraint of product 2
                  0, 0, 0, 0, 1, 1, 0, 0,     # demand constraint of product 3
                  0, 0, 0, 0, 0, 0, 1, 1,     # demand constraint of product 4
                  3, 0, 5, 0, 4, 0, 4, 0,     # supply constraint of manual fabrication
                  8, 0, 12, 0, 10, 0, 9, 0,   # supply constraint of manual assembly
                  2, 0, 3, 0, 5, 0, 2, 0,     # supply constraint of manual test
                  0, 5, 0, 6, 0, 7, 0, 4,     # supply constraint of automatic fabrication
                  0, 4, 0, 5, 0, 8, 0, 5),    # supply constraint of automatic assembly/test
                nrow = 10, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=", ">=", "<=", "<=", "<=", "<=", "<=", "<=", "<=", "<=")

# Set right hand side coefficients
f.rhs <- c(3000, 1500, 2500, 2000, 3200, 16000, 30000, 15000, 24000, 20000)

# Find optimal value of obj function
lp("max", f.obj, f.con, f.dir, f.rhs, all.int = TRUE)

# Find optimal value of decision variables
lp("max", f.obj, f.con, f.dir, f.rhs, all.int = TRUE)$solution