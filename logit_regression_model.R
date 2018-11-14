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



