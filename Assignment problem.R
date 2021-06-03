# Reference: https://towardsdatascience.com/operations-research-in-r-assignment-problem-4a1f92a09ab

# Import lpSolve package
library(lpSolve)

# Set assignment costs matrix, obj is min total costs
costs <- matrix(c(15, 10, 9,
                  9, 15, 10,
                  10, 12 ,8), nrow = 3, byrow = TRUE)

# Print assignment costs matrix
costs

# Find optimal value of objective function z
lp.assign(costs)

# Find optimal value of decision variables
lp.assign(costs)$solution