##************************************************************************************************************
## Jin Li
## Compagnie du Froid, S.A.
## Test on the assumption that 1°C deviation from the mean summer temperature results in a 3% change in ice-
## cream volume growth in three regions: Italy, Spain, and Franch
##************************************************************************************************************

#*****************************************************************
#  All Three Regions
#*****************************************************************
# test the general rule of thumb on all three regions data combined
setwd("~./temperature")
#Read data
general <- read.table("general.txt",sep=",",header=T)
summary(general)
boxplot(general$Volume_Growth~general$Temperature)
general.lm<-lm(general$Volume_Growth ~ general$Temperature)
general.lm

# Call:
#   lm(formula = general$Volume_Growth ~ general$Temperature) 
# 
# Coefficients:
#   (Intercept)  general$Temperature  
# -85.090            3.193  
summary(general.lm)

# 
# Call:
#   lm(formula = general$Volume_Growth ~ general$Temperature)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -8.2444 -2.1429  0.4063  2.3124  9.1556 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)      -85.090     13.507  -6.300 4.00e-07 ***
#   general$Temperature    3.193      0.452   7.064 4.38e-08 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 3.648 on 33 degrees of freedom
# Multiple R-squared:  0.6019,  Adjusted R-squared:  0.5899 
# F-statistic:  49.9 on 1 and 33 DF,  p-value: 4.375e-08

coef(general.lm) # Model's Coefficient
#    (Intercept) general$Temperature 
#     -85.089601        3.192894 
resid(general.lm) # gives residual error for Y
# 
# 1          2          3          4          5          6          7 
# -1.4429145 -2.1885990  1.9291651 -1.4566237 -4.3764153  0.6027700  0.4063228 
# 8          9         10         11         12         13         14 
# -2.3515455 -2.0972300 -2.4393617 -4.5550983  0.7799277 -1.1814934  4.3712968 
# 15         16         17         18         19         20         21 
# 2.6956643  4.3941390 -0.1586511  3.0306904 -6.4114413  0.7850059 -0.5779406 
# 22         23         24         25         26         27         28 
# -0.7743878 -8.2444399 -5.2601765 -1.7743878 -2.5901244  4.1256122  4.0728221 
# 29         30         31         32         33         34         35 
# 9.1555601  0.4692693  3.7499798  0.4956643  0.4306904  0.6834805  5.7027700 

plot(fitted(general.lm)) # gives the predicted values for Y

# 1         2         3         4         5         6         7         8 
# 8.142915  5.588599 13.570835 19.956624  2.076415 10.697230 12.293677 13.251546 
# 9        10        11        12        13        14        15        16 
# 10.697230  9.739362 11.655098  9.420072  8.781493 14.528703  7.504336 15.805861 
# 17        18        19        20        21        22        23        24 
# 10.058651  5.269310  4.311441  2.714994 10.377941 11.974388 16.444440 18.360176 
# 25        26        27        28        29        30        31        32 
# 11.974388 13.890124 11.974388  6.227178 16.444440  4.630731  4.950020  7.504336 
# 33        34        35 
# 5.269310 11.016519 10.697230 

layout(matrix(1:4,2,2)) 
plot(general.lm)

layout(matrix(1,1))
plot(general$Temperature, general$Volume_Growth,xlab=expression(paste("Temperature (",degree,"C)")),ylab="Volume Growth (%)",main="Linear Model in All Three Regions") # adding regression line to plot
abline(general.lm) 

plot(predict(general.lm))

plot( residuals(general.lm ) ~ fitted.values(general.lm) )
abline(general.lm) 

#########################################################################
#              France
#########################################################################/
france <- read.table("France.txt",sep=",",header=T)
summary(france)
france.lm<-lm(france$Volume_Growth ~ france$Temperature)
france.lm

# Call:
#   lm(formula = france$Volume_Growth ~ france$Temperature)
# 
# Coefficients:
#   (Intercept)  france$Temperature  
# -101.526               3.695  

summary(france.lm)
# Call:
#   lm(formula = france$Volume_Growth ~ france$Temperature)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -3.3312 -1.3787 -0.0108  1.5298  2.8518 
# 
# Coefficients:
#   Estimate                Std. Error    t value    Pr(>|t|)    
#   (Intercept)        -101.5262    12.3536  -8.218 5.05e-06 ***
#   france$Temperature    3.6950     0.4125   8.958 2.19e-06 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 1.9 on 11 degrees of freedom
# Multiple R-squared:  0.8795,  Adjusted R-squared:  0.8685 
# F-statistic: 80.25 on 1 and 11 DF,  p-value: 2.194e-06

layout(matrix(1:4,2,2)) 
plot(france.lm)

layout(matrix(1,1))
plot(france$Temperature, france$Volume_Growth,xlab=expression(paste("Temperature (",degree,"C)")),ylab="Volume Growth (%)",main="Linear Model for France") # adding regression line to plot
abline(france.lm) 
confint(france.lm, 'france$Temperature', level=0.95)

#**********************************************
#  Spain
#**********************************************
spain <- read.table("Spain.txt",sep=",",header=T)
summary(spain)
spain.lm<-lm(spain$Volume_Growth ~ spain$Temperature)
spain.lm
summary(spain.lm)
layout(matrix(1:4,2,2)) 
plot(spain.lm)
layout(matrix(1,1))
plot(spain$Temperature, spain$Volume_Growth,xlab=expression(paste("Temperature (",degree,"C)")),ylab="Volume Growth (%)",main="Linear Model for Spain") # adding regression line to plot
abline(spain.lm) 

# Call:
#   lm(formula = spain$Volume_Growth ~ spain$Temperature)
# 
# Coefficients:
#   (Intercept)  spain$Temperature  
# -70.367              2.677  
# 
# Call:
#   lm(formula = spain$Volume_Growth ~ spain$Temperature)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -6.6862 -1.3169  0.1892  2.9107  5.9770 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)   
# (Intercept)       -70.3666    23.3234  -3.017  0.01172 * 
#   spain$Temperature   2.6769     0.7739   3.459  0.00534 **
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 4.123 on 11 degrees of freedom
# Multiple R-squared:  0.521,  Adjusted R-squared:  0.4774 
# F-statistic: 11.96 on 1 and 11 DF,  p-value: 0.005344

#************************************************
# Italy
#***********************************************
italy <- read.table("Italy.txt",sep=",",header=T)
summary(italy)
italy.lm<-lm(italy$Volume_Growth ~ italy$Temperature)
italy.lm
summary(italy.lm)
layout(matrix(1:4,2,2)) 
plot(italy.lm)
layout(matrix(1,1))
plot(italy$Temperature, italy$Volume_Growth,xlab=expression(paste("Temperature (",degree,"C)")),ylab="Volume Growth (%)",main="Linear Model for Italy") # adding regression line to plot
abline(italy.lm) 
# 
# Call:
#   lm(formula = italy$Volume_Growth ~ italy$Temperature)
# 
# Coefficients:
#   (Intercept)  italy$Temperature  
# -130.934              4.862  
# 
# Call:
#   lm(formula = italy$Volume_Growth ~ italy$Temperature)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -3.7130 -0.9613 -0.5889  1.9215  2.5249 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)       -130.9343    18.9149  -6.922 0.000227 ***
#   italy$Temperature    4.8620     0.6431   7.561 0.000131 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 2.296 on 7 degrees of freedom
# Multiple R-squared:  0.8909,  Adjusted R-squared:  0.8753 
# F-statistic: 57.16 on 1 and 7 DF,  p-value: 0.0001305
