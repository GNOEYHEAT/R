### Chapter 4

## Example 4-1

ex4_1 = read.csv("data/Chp4_example 4-1.csv")

mean(ex4_1$x)
sd(ex4_1$x)

summary(ex4_1$x)
str(ex4_1$x)

t.test(ex4_1$x,                   # weight vector for t-test
       alternative = "two.sided", # alternative = c("less", "greater", "two-sided")
       mu = 50.0,                 # mu of population
       conf.level = 0.95)         # confidence level or confidence coefficient (1-α)

