library("lmtest")

model = lm(rating ~ raises + complaints + privileges, attitude)
summary(model)


model1 = lm(raises ~ complaints + privileges, attitude)
summary(model1)

model2 = lm(complaints ~ raises + privileges, attitude)
summary(model2)

model3 = lm(privileges ~ complaints + raises, attitude)
summary(model3)



newmodel = lm(rating ~ complaints, attitude)
summary(newmodel)

newmodel1 = lm(rating ~ complaints + I(raises^2), attitude)
summary(newmodel1)

newmodel2 = lm(rating ~ complaints + I(privileges^2), attitude)
summary(newmodel2)

newmodel3 = lm(rating ~ complaints + I(privileges * raises), attitude)
summary(newmodel3)

newmodel4 = lm(rating ~ complaints + log(raises), attitude)
summary(newmodel4)

newmodel5 = lm(rating ~ complaints + log(privileges), attitude)
summary(newmodel5)

