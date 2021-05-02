# Reference: https://towardsdatascience.com/linear-programming-in-r-444e9c199280

# Import lpSolve package
library(lpSolve)

# Set coefficients of the objective function
f.obj <- c(5, 7) # objective function: max z = 5x1 + 7x2

# Set matrix corresponding to coefficients of constraints by rows
# s.t. 1x1+0x2 <= 16
# 2x1 + 3x2 <= 19
# 1x1 + 1x2 <= 8
# x1, x2 >= 0 
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(1, 0,
                  2, 3,
                  1, 1), nrow = 3, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           "<=")

# Set right hand side coefficients
f.rhs <- c(16,
           19,
           8)

# Find optimal value of the objective function z
lp("max", f.obj, f.con, f.dir, f.rhs)

# Find optimal value of decision variables
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

# Shadow prices of the constraints (0, 2, 1) and decision vars (0, 0)
lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens=TRUE)$duals

# Lower limits and upper limits (range of allowable increase & decrease)
lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens=TRUE)$duals.from
lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens=TRUE)$duals.to



