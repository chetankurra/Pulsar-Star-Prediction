pulsarstar=read.csv("A:/sem7/ml/ml project/pulsar_stars.csv")
summary(pulsarstar)
View(pulsarstar)
mean(pulsarstar$Mean.of.the.integrated.profile)
median(pulsarstar$Mean.of.the.integrated.profile)
var(pulsarstar$Mean.of.the.integrated.profile)
sd(pulsarstar$Mean.of.the.integrated.profile)
boxplot(pulsarstar$Mean.of.the.DM.SNR.curve~ pulsarstar$target_class)
boxplot(pulsarstar$Mean.of.the.integrated.profile ~ pulsarstar$target_class)
cor(pulsarstar$Mean.of.the.integrated.profile,pulsarstar$Mean.of.the.DM.SNR.curve)
plot(density(pulsarstar$Mean.of.the.integrated.profile))
qqnorm(pulsarstar$Mean.of.the.integrated.profile)
plot(x = pulsarstar$Excess.kurtosis.of.the.integrated.profile,y = pulsarstar$Excess.kurtosis.of.the.DM.SNR.curve,
     xlab = "Excess kurtosis of the integrated profile",
     ylab = "Excess kurtosis of the DM SNR curve",
     main = "Excess kurtosis of the integrated profile vs Excess kurtosis of the DM SNR curve"
)
plot(x = pulsarstar$Mean.of.the.integrated.profile,y = pulsarstar$Mean.of.the.DM.SNR.curve,
     xlab = "Mean of the integrated profile",
     ylab = "Mean of the DM SNR curve",
     main = "Mean of the integrated profile vs Mean of the DM SNR curve"
)
hist(pulsarstar$Mean.of.the.integrated.profile)
hist(pulsarstar$Mean.of.the.DM.SNR.curve)