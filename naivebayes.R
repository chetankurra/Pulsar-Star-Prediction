pulsarstar=read.csv("A:/sem7/ml/ml project/pulsar_stars.csv")
View(pulsarstar)
str(pulsarstar)
summary(pulsarstar)
colnames(pulsarstar)
library(e1071)
pulsarstar=pulsarstar[-9]
partition=sample(2,nrow(pulsarstar),replace=TRUE,prob=c(0.7,0.3))

Training=pulsarstar[partition==1,]
Testing=pulsarstar[partition==2,]
Testing_labels=Testing$target_class
nrow(Training)
nrow(Testing)
View(Training)
View(Testing)
library(rminer)
Classifier_1=naiveBayes(target_class~.,Training)
print(Classifier_1)
Bayes_Prediction_1=predict(Classifier_1,Testing)
table(Testing$target_class,Bayes_Prediction_1)
print(Bayes_Prediction_1)
mmetric(Testing$target_class,Bayes_Prediction_1,c("ACC","PRECISION","TPR"))
confusionMatrix(Bayes_Prediction_1,Testing$target_class)

library(ROCR)
pred1 <- prediction(Bayes_Prediction_1,Testing$target_class)
perf1 <- performance(pred1,"tpr","fpr")
plot(perf1)
