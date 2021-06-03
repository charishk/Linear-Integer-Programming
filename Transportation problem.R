# Reference: https://towardsdatascience.com/operations-research-in-r-transportation-problem-1df59961b2ad

# Import lpSolve package
library(lpSolve)

# Set transportation costs matrix, the objective is to min costs
costs <- matrix(c(10, 2, 20, 11,
                  12, 7, 9, 20,
                  4, 14 , 16, 18), nrow = 3, byrow = TRUE)

# Set customers and suppliers' names
colnames(costs) <- c("Customer 1", "Customer 2", "Customer 3", "Customer 4")
rownames(costs) <- c("Supplier 1", "Supplier 2", "Supplier 3")

# Supply constraints:
# Set unequality/equality signs for suppliers
row.signs <- rep("<=", 3)
# Set right hand side coefficients for suppliers
row.rhs <- c(15, 25, 10)

# Demand constraints:
# Set unequality/equality signs for customers
col.signs <- rep(">=", 4)
# Set right hand side coefficients for customers
col.rhs <- c(5, 15, 15, 15)

# Find optimal value of objective function z 
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)

# Find optimal value of decision variables
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution