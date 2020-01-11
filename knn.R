pulsarstar=read.csv("A:/sem7/ml/ml project/pulsar_stars.csv")
y<-pulsarstar[-9]
str(y)
summary(y)
View(y)
table(pulsarstar$target_class)
round(prop.table(table(pulsarstar$target_class))*100,digits=1)
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }
pulsarstar_n <- as.data.frame(lapply(pulsarstar[1:8], normalize))
summary(pulsarstar_n)
ind<-sample(2,nrow(pulsarstar),replace=TRUE,prob=c(0.7,0.3))
trainData=pulsarstar_n[ind==1,]-
testData=pulsarstar_n[ind==2,]
View(trainData)
View(testData)
pulsarstar_train_labels=y[ind==1,9]
pulsarstar_test_labels=y[ind==2,9]
library(class)
pulsarstar_test_pred<-knn(train=trainData,test=testData,cl=pulsarstar_train_labels,k=3,prob=TRUE)
print(pulsarstar_test_pred)
library(rminer)
mmetric(pulsarstar_test_labels,pulsarstar_test_pred,c("ACC","PRECISION","F1","TPR"))
library(gmodels)
CrossTable(x=pulsarstar_test_labels,y=pulsarstar_test_pred,chisq =FALSE)
table(pulsarstar_test_pred,pulsarstar_test_labels)
library(caret)
confusionMatrix(pulsarstar_test_pred,pulsarstar_test_labels)
x<-pulsarstar[-9]
testData1=x[ind==2,]
library(ROCR)
pred1 <- prediction(attr(pulsarstar_test_pred,"prob"),testData1$target_class)
perf1 <- performance(pred1,"tpr","fpr")
plot(perf1,main = "ROC curve for KNN")
auc <- performance(pred,"auc")
auc <- unlist(slot(auc, "y.values"))
auc
