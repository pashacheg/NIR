library("lmtest")

model = lm(rating ~ raises + complaints + privileges, attitude)
summary(model)


model1 = lm(raises ~ complaints + privileges, attitude)
summary(model1)

model2 = lm(complaints ~ raises + privileges, attitude)
summary(model2)

model3 = lm(privileges ~ complaints + raises, attitude)
summary(model3)
