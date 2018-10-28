# Data in two numeric vectors

# ++++++++++++++++++++++++++

# Weight of the mice / pig before treatment

before <-c(200.1, 190.9, 192.7, 213, 241.4, 196.9, 172.2, 185.5, 205.2, 193.7)

# Weight of the mice /pig after treatment

after <-c(392.9, 393.2, 345.1, 393, 434, 427.9, 422, 383.9, 392.3, 352.2)

# Create a data frame

my_data <- data.frame( 
  
  group = rep(c("before", "after"), each = 10),
  
  weight = c(before,  after)
  
)

my_data
 
# to know wat all is there in your data 
library("dplyr")
group_by(my_data, group) %>% # all the below lines are applied to this line 
  summarise(
    count = n(),
    mean = mean(weight, na.rm = TRUE),
    sd = sd(weight, na.rm = TRUE)
  )

# Compute t-test
res <- t.test(weight ~ group, data = my_data, paired = TRUE)
res

#if you want to test whether the average weight before treatment is less than the average weight after treatment, type this:

result <- t.test(weight ~ group, data = my_data, paired = TRUE,
                 alternative = "less")

# greater
result
str(result)

#if you want to test whether the average weight before treatment is less than the average weight after treatment, type this:

result <- t.test(weight ~ group, data = my_data, paired = TRUE,
                 alternative = "greater")

# greater
result
str(result)

#  one sample t-test
# Compare Mean against population for Sample
# Between two mutually  exclusive groups

# Assumption

# The two populations have the same variance. This assumption is called the assumption of homogeneity of variance.
# The populations are normally distributed.
# Each value is sampled independently from each other value. This assumption requires that each subject provide only one value. If a subject provides two scores, then the scores are not independent.

# The degrees of freedom is the number of independent estimates of variance on which MSE ( mean suqre Error) is based.

# one-sample t-test is used to compare the mean of one sample to a known standard (or theoretical/hypothetical) mean (??).


mean(my_data$weight)
# One-sample t-test
res <- t.test(my_data$weight, mu = 25)
# Printing the results
res

mean(my_data$weight)
# One-sample t-test
res <- t.test(my_data$weight, mu = 300)
# Printing the results
res


## Two-Samples T-test 

## The unpaired two-samples t-test is used to compare the mean of two independent groups. 


# Compute t-test
res <- t.test(before, after, var.equal = TRUE)
res


#Shapiro-Wilk test:
  shapiro.test(my_data$weight) # => p-value = 0.6993

# p > 0.05 = Noramality
# otherwise Not a Normal

# From the normality plots, we conclude that the data may come from normal distributions.














































