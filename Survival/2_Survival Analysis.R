# install.packages("survival")
library(survival)

death_time = c(3,5,7,11,12,13,17,18)
status=c(1,0,1,0,1,1,1,1)

Surv(death_time, status)

fit = survfit(Surv(death_time, status)~1)
summary(fit)

plot(fit, ylab="Survival", xlab="Days" , mark.time=T)

plot(fit, ylab="Cumulative hazard H(ti)", xlab="Days", fun="cumhaz", mark.time=T)

death_time = sample(1:50, 100, replace=TRUE)
status = sample(1:0, 100, replace=TRUE)
group = c(rep(0,50), rep(1,50))
group <- factor(group)
fit = survfit(Surv(death_time, status)~group)

plot( fit, ylab="Survival", xlab="Days", col=c("red","blue"), lty=1:2, mark.time=T)
legend("topright", legend=levels(group), col=c("red","blue"), lty=1:2)

##################

data(colon)
attach(colon)
str(colon)

fit = survfit(Surv(time, status)~1, data=colon)
plot(fit, ylab="Survival", xlab="Days", mark.time=T)

fit = survfit(Surv(time, status==1)~sex, data=colon)
plot(fit, ylab="Survival", xlab="Days", col=c("red","blue"), lty=1:2, mark.time=T)
legend("topright", legend=c("female", "male"), col=c("red","blue"), lty=1:2)

fit = survfit(Surv(time, status==1)~rx, data=colon)
plot(fit, ylab="Survival", xlab="Days", col=1:3, lty=1:3, mark.time=T)
legend("topright", legend=levels(rx), col=1:3, lty=1:3)

age_group <- ifelse(age<50,0,1)
fit = survfit(Surv(time, status==1)~age_group, data=colon)
plot(fit, ylab="Survival", xlab="Days", col=1:2, lty=1:2, mark.time=T)
legend("topright", legend=c("age<50","age>=50"), col=1:2, lty=1:2)

