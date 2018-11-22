kddata<-read.csv("D:/datascience/data/kddcup.data_10_percent.gz")
kddnames=read.table("D:/datascience/data/kddcup.names",sep=":",skip=1,as.is=T)
colnames(kddata)=c(kddnames[,1],"normal")



#set normal col to two levels:normal=0,non-normal=1
levels(kddata$normal)[which(levels(kddata$normal) !='normal.')] <- "non-normal."
kddata$normal<-as.numeric(factor(kddata$normal,levels = c("normal.","non-normal."))) -1 

kddata_normal<-kddata[which(kddata$normal==0),]
kddata_nonnormal<-kddata[which(kddata$normal==1),]

#set service col to three levels:private,http,others

levels(kddata$service)[which(levels(kddata$service) != "http" & levels(kddata$service) != "private")] <- "others"
kddata$service<-as.numeric(factor(kddata$service,levels = c("private","http","others")))

#train and test
set.seed(1)
kddata_normal<-kddata[which(kddata$normal==0),]
kddata_nonnormal<-kddata[which(kddata$normal==1),]
sample_normal<-sample(seq_len(nrow(kddata_normal)),size=floor(.80*nrow(kddata_normal)))
sample_nonnormal<-sample(seq_len(nrow(kddata_nonnormal)),size=floor(.80*nrow(kddata_nonnormal)))
train_normal<-kddata_normal[sample_normal,]
test_normal<-kddata_normal[-sample_normal,]
train_nonnormal<-kddata_nonnormal[sample_nonnormal,]
test_nonnormal<-kddata_nonnormal[-sample_nonnormal,]
train<-rbind(train_normal,train_nonnormal)
test<-rbind(test_normal,test_nonnormal)
head(train)

#fit in logit model
model1<-glm(normal~service+logged_in+srv_count, family=binomial(link='logit'), data=train)

summary(model1)
fitted.results <- predict(model1,newdata=test,type = 'response')

fitted.results <- ifelse(fitted.results > 0.5,1,0)
confusion<-table(fitted.results,test$normal)
accuracy<-(confusion[1,1]+confusion[2,2])/length(fitted.results)
accuracy
confusion

#k-fold cv
#Create 10 equally size folds
folds <- cut(seq(1,nrow(kddata)),breaks=10,labels=FALSE)

#Perform 10 fold cross validation\n",
for(i in 1:10){
  #Segement your data by fold using the which() function 
  testIndexes <- which(folds==i,arr.ind=TRUE)
  testData <- kddata[testIndexes, ]
  trainData <- kddata[-testIndexes, ]
  model4<-glm(normal~service+logged_in+count+srv_count, family=binomial(link=logit), data=trainData)
  fitted_results4 <- predict(model4,newdata=testData,type = 'response')
  fitted_results_4 <- ifelse(fitted_results4 > 0.5,1,0)
  cm<-confusionMatrix(factor(fitted_results_4),factor(testData$normal),positive="1",dnn = c("prediction","actual"))
}
summary(model4)
cm


library(e1071)
library(ggplot2)

library(lattice)
library(caret)
#k-fold cv
#Create 10 equally size folds
folds = createFolds(kddata$normal, k = 10)
cv = lapply(folds, function(x) {
  training_fold = kddata[-x, ]
  test_fold = kddata[x, ]
  model = glm(normal~service+logged_in+srv_count+count, family=binomial(link=logit), data=training_fold)
  y_pred = predict(model, newdata = test_fold)
  y_pred <- ifelse(y_pred > 0.5,1,0)
  cm<-confusionMatrix(factor(y_pred),factor(test_fold$normal),positive="1",dnn = c("prediction","actual"))
  return(cm$table)
})



folds = createFolds(kddata$normal, k = 10)
cv = lapply(folds, function(x) {
  training_fold = kddata[-x, ]
  test_fold = kddata[x, ]
  classifier = svm(formula = normal ~ service+count, data = training_fold, type = "C-classification", kernel = "linear")
  y_pred = predict(classifier, newdata = test_fold)
  cm = table(test_fold$normal, y_pred)
  accuracy = (cm[1,1] + cm[2,2])/(cm[1,1] + cm[2,2] + cm[1,2] + cm[2,1])
  return(accuracy)
})
cv
Macc = mean(as.numeric(cv))
Macc
classifier <- svm(normal ~ service+count, data = train, type = "C-classification", kernel = "linear")
classifier
