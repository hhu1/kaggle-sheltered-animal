setwd("~/Documents/kaggle/animal_shelter")

train = read.csv("train-fixed.csv")
test = read.csv('test-fixed.csv')

train = train[,c(4,6,7,8,9,10)]
test = test[,c(4,5,6,7,8)]

#combine training and testing datasets
test$OutcomeType= NA
all = rbind(train,test)

library("Hmisc")
all$AnimalType= impute(all$AnimalType, 'random')
all$SexuponOutcome = impute(all$SexuponOutcome, 'random')
all$AgeuponOutcome = impute(all$AgeuponOutcome,'median')
all$Breed = impute(all$Breed, 'random')
all$Color = impute(all$Color,'random')

all$oR = all$OutcomeType=='Return_to_owner'
all$oE = all$OutcomeType=='Euthanasia'
all$oA = all$OutcomeType=='Adoption'
all$oT = all$OutcomeType=='Transfer'
all$oD = all$OutcomeType=='Died'

write.table(x=all, file='imputed.csv', row.names=F, sep=',',quote=F)


#mR = glmer(oR~AnimalType+SexuponOutcome+AgeuponOutcome+(1|Breed)+(1|Color), family='binomial',data=all)
