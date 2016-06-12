setwd("~/Documents/kaggle/animal_shelter")
all = read.csv("fix_color_breed.csv")
all$AgeuponOutcome = as.numeric(all$AgeuponOutcome)

train = subset(all, !is.na(OutcomeType))
test = subset(all, is.na(OutcomeType))

logitR = step(glm(oR ~AnimalType+SexuponOutcome+AgeuponOutcome+breed+color+colorm+breedm, data=train,family='binomial'))
logitE = step(glm(oE ~AnimalType+SexuponOutcome+AgeuponOutcome+breed+color+colorm+breedm, data=train,family='binomial'))
logitA = step(glm(oA ~AnimalType+SexuponOutcome+AgeuponOutcome+breed+color+colorm+breedm, data=train,family='binomial'))
logitT = step(glm(oT ~AnimalType+SexuponOutcome+AgeuponOutcome+breed+color+colorm+breedm, data=train,family='binomial'))
logitD = step(glm(oD ~AnimalType+SexuponOutcome+AgeuponOutcome+breed+color+colorm+breedm, data=train,family='binomial'))

logits = cbind(predict(logitA, test), predict(logitD, test), predict(logitE, test), predict(logitR, test), predict(logitT, test))

# calculating probabilities from the logits
outcomes = matrix(rep(0, nrow(logits)*ncol(logits)), ncol=5)
for (i in 1:nrow(outcomes)) {
  temp_vec = exp(logits[i,]) / (1+exp(logits[i,]))
  outcomes[i,] = temp_vec / sum(temp_vec)
}
results = data.frame(ID=1:nrow(outcomes), Adoption=outcomes[,1], Died=outcomes[,2], Euthanasia=outcomes[,3], Return_to_owner=outcomes[,4], Transfer=outcomes[,5])
write.table(x=results, file='stepwise_logit.csv',sep=',',row.name=F,quote=F)
