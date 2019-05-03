### Chapter 5_2

## Example 5_2-1

ex5_2_1 = read.csv("data/Chp5-2_example 5-2-1.csv")
ex5_2_1

mean(ex5_2_1$y)
sd(ex5_2_1$y)

t.test(ex5_2_1$y, data = ex5_2_1,
       alt="greater", conf.level=.95) # alternative = greater, less : 단측검정

## Example 5_2-2

ex5_2_2 = read.csv("data/Chp5-2_example 5-2-2.csv")
ex5_2_2

# 표본이 정규분포에서 추출된 것인지 검정
# shapiro.test(ex5_2_2$y)
# p-value = 0.8884로 유의수준(0.05)보다 크므로 표본은 정규분포에서 추출됨

mean(ex5_2_2$y)
sd(ex5_2_2$y)

# install.packages("TeachingDemos")
library(TeachingDemos)

# One sample Chi-square test for a population variance
sigma.test(ex5_2_2$y, sigma = 0.01,
           alt="greater", conf.level=.95) # sigma = sd, sigmasq = var
