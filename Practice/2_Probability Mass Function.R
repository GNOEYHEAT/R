### Chapter 2

# d :	확률 밀도(질량) 함수 (probability density/mass function)
# p : 누적 분포 함수 (cummulative distribution function)
# q : 분위수 계산 함수 (quantile function)
# r :	랜덤 샘플 생성 (sample realization)

# binom 이항분포
# pois 포아송분포

windows()
par(mfrow=c(1,2))

## Example 2-1

n <- 10
x <- c(0:10) # data type = integer
# x <- seq(0, 10, 1) # data type = numeric
p <- 0.2
y <- choose(n, x)*p^x*(1-p)^(n-x)
# y <- dbinom(x, n, p) # dbinom(x, 10, prob=0.2)
y

plot(x, y, main = "Example 2-1")
lines(x, y, type='h')

# x <- rbinom(x, 30, prob=0.2)
# hist(x, right=FALSE)

ex2_1 = read.csv("data/Chp2_example 2-1.csv")
hist(ex2_1$x, right = FALSE, main = "Example 2-1")


## Example 2-2

x <- c(0:3) # data type = integer
# x <- seq(0, 3, 1) # data type = numeric
lambda <- 0.5
y <- lambda^x * exp(-lambda) / factorial(x)
# y <- dpois(x, lambda) # dpois(x, lambda=0.5)
y

plot(x, y, main="Example 2-2")
lines(x, y, type='h')

# x <- rpois(100, lambda=0.5)
# hist(x, right=FALSE, breaks = c(min(x):max(x)))

ex2_2 = read.csv("data/Chp2_example 2-2.csv")
hist(ex2_2$x, right = FALSE, main = "Example 2-2",
     breaks = c(min(ex2_2$x):max(ex2_2$x)))


## Example 2-3

x <- c(0:20) # data type = integer
# x <- seq(0, 20, 1) # data type = numeric
lambda <- 10
y <- lambda^x * exp(-lambda) / factorial(x)
# y <- dpois(x, lambda) # dpois(x, lambda=10)
y

plot(x, y, main="Example 2-3")
lines(x, y, type='h')

# x <- rpois(100, lambda = 10)
# hist(x, right=FALSE, breaks = c(min(x):max(x)))

ex2_3 = read.csv("data/Chp2_example 2-3.csv")
hist(ex2_3$x, right = FALSE, main = "Example 2-3")


## Example 2-4

x <- c(0:2) # data type = integer
# x <- seq(0, 2, 1) # data type = numeric
lambda <- 0.5
y <- lambda^x * exp(-lambda) / factorial(x)
# y <- dpois(x, lambda) # dpois(x, lambda=0.5)
y

plot(x, y, main="Example 2-4")
lines(x, y, type='h')

# x <- rpois(100, lambda = 0.5)
# hist(x, right=FALSE, breaks = c(min(x):max(x)))

ex2_4 = read.csv("data/Chp2_example 2-4.csv")
hist(ex2_4$x, right = FALSE, main = "Example 2-4",
     breaks = c(min(ex2_4$x):max(ex2_4$x)))

