### Chapter 5

## Example 5-1

ex5_1 = read.csv("data/Chp5-1_example 5-1.csv")
ex5_1

t.test(y ~ group, data = ex5_1,
       var.equal=T, alt="two.sided") # var.equal = True : 등분산성 가정

## Example 5-2

ex5_2 = read.csv("data/Chp5-1_example 5-2.csv")
ex5_2

t.test(y ~ group, data = ex5_2,
       var.equal=T, alt="two.sided", conf.level=.90) # conf.level = confidence level of the interval.

## Example 5-3

ex5_3 = read.csv("data/Chp5-1_example 5-3.csv")
ex5_3

t.test(y ~ group, data = ex5_3,
       var.equal=T, alt="two.sided") # var.equal = True : 등분산성 가정

## Example 5-4

ex5_4 = read.csv("data/Chp5-1_example 5-4.csv")
ex5_4

t.test(y ~ group, data = ex5_4,
       var.equal=F, alt="two.sided") # var.equal = FALSE : 이분산성 가정

## Example 5-5

ex5_5 = read.csv("data/Chp5-1_example 5-5.csv")
ex5_5

t.test(ex5_5$Karlsruhe.Method, ex5_5$Lehigh.Method,
       paired=T, alt="two.sided") # paired = TRUE : 대응표본 t검정

## Example 5-6

ex5_6 = read.csv("data/Chp5-1_example 5-6.csv")
ex5_6

t.test(ex5_6$Group1, ex5_6$Group2,
       paired=T, alt="two.sided", conf.level=.90) # conf.level = confidence level of the interval.

## Example 5-7

ex5_7 = read.csv("data/Chp5-1_example 5-7.csv")
ex5_7

var.test(y ~ group, data = ex5_7,
         alt="two.sided", conf.level=.95) # var.equal = FALSE : 이분산성 가정


