library("lmtest")

model = lm(rating ~ raises + complaints + privileges, attitude)
summary(model)
#R^2 = 0.65
#p-value raises: 0.614    
#p-value complaints: 3.15e-05
#p-value privileges: 0.665    

model1 = lm(raises ~ complaints + privileges, attitude)
summary(model1)
#R^2 = 0.415   
#p-value complaints: 0.00137 
#p-value privileges: 0.54700   

model2 = lm(complaints ~ raises + privileges, attitude)
summary(model2)
#R^2 = 0.4976    
#p-value raises: 0.00137 
#p-value privileges: 0.03593    

model3 = lm(privileges ~ complaints + raises, attitude)
summary(model3)
#R^2 = 0.2707     
#p-value raises: 0.5470   
#p-value complaints: 0.0359    


newmodel = lm(rating ~ complaints, attitude)
summary(newmodel)
#R^2 = 0.6813     
#p-value complaints: 1.988e-08  


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

