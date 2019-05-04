# install.packages("coin")
library(coin)

str(glioma)

plot(survfit(Surv(time,event)~group, data=glioma),lty=2:1,
     main="Survival rate of Glioma", ylab = "Probability", xlab = "Survival Time in Month", xlim=c(-2,72)) 
legend("topright",lty=2:1,c("Control","Treated"),bty="n")

logrank_test(Surv(time,event)~group, data=glioma, distribution="exact")

cox.out<-coxph(Surv(time,event)~group,data=glioma) 
summary(cox.out)

par(mfrow=c(1,2)) 
g3 <- subset(glioma, histology == "Grade3") 
plot(survfit(Surv(time, event) ~ group, data = g3),
     main = "Grade III Glioma", lty = 2:1, ylab = "Probability", xlab = "Survival Time in Month", xlim = c(-2, 72)) 
legend("bottomleft", lty = 2:1, c("Control", "Treated"), bty = "n")

gbm <- subset(glioma, histology == "GBM") 
plot(survfit(Surv(time, event) ~ group, data = gbm),
     main = "Grade IV Glioma", lty = 2:1, ylab = "Probability", xlab = "Survival Time in Month", xlim = c(-2, 72)) 
legend("topright", lty = 2:1, c("Control", "Treated"), bty = "n")
       
logrank_test(Surv(time, event) ~ group, data = g3, distribution = "exact")

logrank_test(Surv(time, event) ~ group, data = gbm, distribution = "exact")

cox.g3<-coxph(Surv(time,event)~group,data=g3) 
summary(cox.g3)

cox.gbm<-coxph(Surv(time,event)~group,data=gbm)
summary(cox.gbm)