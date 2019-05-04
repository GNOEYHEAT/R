require(survival)

aml

class(aml)
str(aml)

(aml.Surv <- with(aml, Surv(time, status)))

# aml.survfit <- survfit(aml.Surv ~ aml$x)
aml.survfit <- survfit(Surv(time, status) ~ x, aml)
aml.survfit
summary(aml.survfit)

# plot(aml.survfit)
# levels(aml$x)
plot(aml.survfit, lty=1:2)

K <- length(aml.survfit$strata)
LEGEND <- attr(aml.survfit$strata, "names")
plot(aml.survfit, lty=1:K)
legend("topright", LEGEND, lty=1:K)

# plot(aml.survfit, lty=1:2)
# legend("topright", c("Maintained", "Nonmaintained"), lty=1:2)