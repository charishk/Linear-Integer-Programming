# Reference: https://towardsdatascience.com/integer-programming-in-r-33ee6f48a3c8

# Import lpSolve package
library(lpSolve)

# Set coefficients of the objective function
f.obj <- c(8, 11, 6, 4) # max z = 8x1 + 11x2 + 6x3 + 4x4

# Set matrix corresponding to coefficients of constraints by rows
# s.t. 5x1 + 7x2 + 0x3 + 3x4 <= 14
# 8x1 + 0x2 + 4x3 + 4x4 <= 12
# 2x1 + 10x2 + 6x3 + 4x4 <= 15
# x1, x2, x3, x4 ∈ {0,1}
f.con <- matrix(c(5, 7, 0, 3,
                  8, 0, 4, 4,
                  2, 10, 6, 4), nrow = 3, byrow = TRUE)

# Set unequality/equality signs
f.dir <- c("<=",
           "<=",
           "<=")

# Set right hand side coefficients
f.rhs <- c(14,
           12,
           15)

# Find optimal value of objective function z (19)
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:4, all.bin = TRUE)

# Find optimal value of decision variables
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:4, all.bin = TRUE)$solution

# Shadow price of constraints and decision vars
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:4, compute.sens = TRUE, all.bin = TRUE)$duals

# Lower and upper limits (range of allowable increase & decrease)
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:4, compute.sens = TRUE, all.bin = TRUE)$duals.from
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:4, compute.sens = TRUE, all.bin = TRUE)$duals.to
