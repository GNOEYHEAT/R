# install.packages("survival")
library(survival)

KM_time <- c(2,3,4,5,8)
KM_status <- c(0,0,0,1,1)

km_fit <- survfit(Surv(KM_time, KM_status)~1)
plot(km_fit)

km_fit <- survfit(Surv(KM_time, KM_status)~0)
plot(km_fit, mark=3)