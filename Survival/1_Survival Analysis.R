## 1. Kaplan-Meier

# install.packages("survival")
library(survival)

KM_time <- c(3,4,5,5,5,6,8,8,9,12)
KM_status <- c(1,1,1,1,0,1,1,1,0,1)

KM_fit <- survfit(Surv(KM_time, KM_status) ~ 1)
plot(KM_fit)

time1 <- c(6,6,6,6,7,9,10,10,11,13,16,17,19,20,22,23,25,32,32,34,35)
status1 <- c(1,1,1,0,1,0,1,0,0,1,1,0,0,0,1,1,0,0,0,0,0)
time2 <- c(1,1,2,2,3,4,4,5,5,8,8,8,8,11,11,12,12,15,17,22,23)
status2 <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

time <-c(time1, time2)
status <- c(status1, status2)

group <- c(rep(0, 21), rep(1,21))

fit <- survfit(Surv(time, status, type="right")~group)
summary(fit)

plot(fit, ylab="Survival", xlab="Days", col=c("red", "blue"), lty=1:2, mark=3)
legend(25,1,c("treatment", "placebo"), col=c("red", "blue"), lty=1:2)

## 2. Log Rank Test

LR_time <- c(5,5,6,7,9,12,15,18,20,25,1,1,2,5,5,5,6,10)
LR_status <- c(1,0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1)
LR_treatment <- c(rep(1,10), rep(2,8))

LR_diff<-survdiff(Surv(LR_time, LR_status) ~ LR_treatment)
LR_diff

A <- c(3,4,6,7,10,10)
a <- c(1,1,0,1,1,0)
B <- c(2,2,4,5,8,10)
b <- c(1,1,1,0,1,1)
C <- c(1,2,3,5,7,9)
c <- c(1,1,1,1,1,1)

s_time <- c(A, B, C)
s_status <- c(a, b, c)
s_group <- c(1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3)

s_diff <- survdiff(Surv(s_time, s_status) ~ s_group)
s_diff

data <- data.frame(v1 = c(19,24,8,17,17,34,34,4,17,10,5,27,21,18,16,7,12,24,8,8,8,11,23,12,15,8,8,25,8,11),
                   v2 = c(1,0,1,0,0,0,0,1,0,1,1,0,0,0,0,1,0,1,1,0,1,0,0,0,0,0,1,0,1,0),
                   v3 = c(rep(1, 11), rep(2, 19)),
                   v4 = c(1,1,1,1,1,1,2,2,2,3,3,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,3,3,3))

strata_diff <- survdiff(Surv(data$v1, data$v2) ~ data$v3 + strata(data$v4))
strata_diff