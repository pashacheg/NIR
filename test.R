library("lmtest")

# модель rating ~  raises + complaints + privileges


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
vif(newmodel1)
#complaints: 1.717006    
#I(raises^2): 1.717006 
summary(newmodel1)
#R^2 = 0.6602 


newmodel2 = lm(rating ~ complaints + I(privileges^2), attitude)
vif(newmodel2)
#complaints: 1.410326            
#I(privileges^2): 1.410326         
summary(newmodel2)
#R^2 = 0.6626 


newmodel3 = lm(rating ~ complaints + I(privileges * raises), attitude)
vif(newmodel3)
#complaints: 1.904371            
#I(privileges * raises): 1.904371  



newmodel4 = lm(rating ~ complaints + log(raises), attitude)
vif(newmodel4)
#complaints: 1.893824                
#log(raises): 1.893824     


newmodel5 = lm(rating ~ complaints + log(privileges), attitude)
vif(newmodel5)
#complaints: 1.478612
#log(privileges): 1.478612
summary(newmodel5)
#R^2 = 0.6579 



#
# значит, лучшая модель rating ~ complaints
#

#
# доверительный интервал [a, b] для коэффиуента complaints
#

coef = 0.75461
stdError = 0.09

crit_stud = qt(0.95, 28)

a = coef - crit_stud * stdError # 0.6
b = coef + crit_stud * stdError # 0.9

# получили интервал [0.6, 0.9]

# <* доверительный интервал для прогнозного значения *>
#         для y = 0.75x + 14.37 в точке x = 80
#-----------------------------------------------------------
#
x = 80
y = 0.75 * x + 14.37 # 74.37

a = y - crit_stud * stdError # 74.2169
b = y + crit_stud * stdError # 74.5231

# интервал [74.22, 74.52]
