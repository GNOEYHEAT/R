### Chapter 3

# d :	확률 밀도(질량) 함수 (probability density/mass function)
# p : 누적 분포 함수 (cummulative distribution function)
# q : 분위수 계산 함수 (quantile function)
# r :	랜덤 샘플 생성 (sample realization)

# norm	정규분포
# exp   지수분포
# beta	베타분포
# gamma	감마분포

windows()
par(mfrow=c(1,2))

## Example 3-1

x <- seq(0,80,1)
d <- dnorm(x, 40.14, 8.52)
d
plot(x, d, type='l', main="Example 3-1")

# x <- rnorm(100, 40.14, 8.52)
# hist(x)

ex3_1 = read.csv("data/Chp3_example 3-1.csv")
hist(ex3_1$x, main = "Example 3-1")


## Example 3-2

x <- seq(50, 250, 1)
y <- dbinom(x, 450, prob = 0.3)
y

plot(x, y, main = "Example 3-2")
lines(x, y, type='o')

# E(x) = 450*0.3 = 135
# Var(X) = 450*0.3*0.7 = 94.5

# x <- rnorm(100, mean = 135, sd = 9.72)
# hist(x)

ex3_2 = read.csv("data/Chp3_example 3-2.csv")
hist(ex3_2$x, right = FALSE, main = "Example 3-2")

n <- 450
p <- 0.3

1-pbinom(100, n, p)
1-pnorm(100, n*p, sqrt(n*p*(1-p)))
1-pnorm(100, mean(ex3_2$x), sd(ex3_2$x))


## Example 3-3

x <- seq(0, 100, 1)
lambda <- 0.1
y <- dexp(x, lambda) # dexp(x, rate = 0.1)
y

plot(x, y, type = 'l', main="Example 3-3")

# x <- rexp (1000, rate = 0.1)
# hist(x, right=FALSE)

ex3_3 = read.csv("data/Chp3_example 3-3.csv")
hist(ex3_3$x, main = "Example 3-3")


## Example 3-4

x <- seq(0, 30, 0.1)
y <- dgamma(x, 20, 1.6)
y

plot(x, y, type = "l", main="Example 3-4")

# x <- rgamma(1000, 20, 1.6)
# hist(x, right=FALSE)

ex3_4 = read.csv("data/Chp3_example 3-4.csv")
hist(ex3_4$x, main = "Example 3-4")


## Example 3-5

x <- seq(0, 1, 0.01)
y <- dbeta(x, 2, 4.8)
y

plot(x, y, type='l', main="Example 3-5")

# x <- rbeta(1000, 2, 4.8)
# hist(x)

ex3_5 = read.csv("data/Chp3_example 3-5.csv")
hist(ex3_5$x, main = "Example 3-5")


## Example 3-6

x <- seq(0, 1, 0.01)
y <- dbeta(x, 2, 5)
y

plot(x, y, type='l', main="Example 3-6")

# x <- rbeta(1000, 2, 5)
# hist(x)

ex3_6 = read.csv("data/Chp3_example 3-6.csv")
hist(ex3_6$x, main = "Example 3-6")

