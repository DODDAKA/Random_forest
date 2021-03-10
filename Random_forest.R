dataset=read.csv("Social_Network_Ads.csv")
dataset=dataset[3:5]
dataset$Purchased=factor(dataset$Purchased,levels = c(0,1))


library(caTools)
set.seed(123)
split=sample.split(dataset$Purchased,SplitRatio = 0.75)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)



training_set[-3]=scale(training_set[-3])
test_set[-3]=scale(test_set[-3])


library(randomForest)
set.seed(123)
classifier=randomForest(x=training_set[-3],y=training_set$Purchased,ntree = 500)
y_pred=predict(classifier,newdata = test_set[-3])

cm=table(test_set[,3],y_pred)
print(cm)
