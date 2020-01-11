pulsarstar=read.csv("A:/sem7/ml/ml project/pulsar_stars.csv")
library('rpart')
library('rpart.plot')
pulsarstar=pulsarstar[-9]
pulsarstar[,'train']=ifelse(runif(nrow(pulsarstar))<0.75,1,0)
trainData=pulsarstar[pulsarstar$train==1,]
testData=pulsarstar[pulsarstar$train==0,]
traincol=grep('train',names(trainData))
trainData=trainData[,-traincol]
testData=testData[,-traincol]
treefit=rpart(target_class~.,data=trainData,method='class')
print(treefit)
rpart.plot(treefit,box.col=c("red","green"))
prediction1=predict(treefit,newdata=testData[-9],type='class')
library('caret')
confusionMatrix(prediction1,testData$target_class)
