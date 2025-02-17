# Install and load the arules and arulesViz packages
install.packages("arules")
install.packages("arulesViz")
library(arules)
library(arulesViz)

# Example market basket dataset (can be replaced with your own data)
# Use built-in "Groceries" dataset from the arules package
data("Groceries")
summary(Groceries)

# Inspect the first few transactions
inspect(Groceries[1:5])

# Apply the Apriori algorithm to find association rules
rules = apriori(data = Groceries, 
                parameter = list(supp = 0.01, conf = 0.5)) # Minimum support and confidence

# Inspect the rules
summary(rules)
inspect(rules[1:5])

# Sort rules by confidence and inspect top 5 rules
rules_sorted = sort(rules, by = "confidence", decreasing = TRUE)
inspect(rules_sorted[1:5])

# Visualize the rules
# Scatter plot of rules
plot(rules, method = "scatterplot", measure = c("support", "confidence"), shading = "lift")

# Grouped matrix plot
plot(rules, method = "grouped")

# Graph-based visualization
plot(rules, method = "graph", engine = "igraph")
