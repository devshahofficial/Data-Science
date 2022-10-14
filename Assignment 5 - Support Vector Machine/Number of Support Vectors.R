# http://stackoverflow.com/questions/35850004/limit-the-number-of-support-vectors-in-r-svm-package-e1071
# Example explaining number of support vectors
#remove.packages("ggplot2") # Unisntall ggplot
#install.packages("ggplot2") # Install it again

library(e1071)
library(ggplot2)

X = rnorm(1000)
Y = rnorm(1000)
ys <- c(rep(+1,1000), rep(-1,1000))
ys_color <- c(rep("red",1000), rep("green",1000))
data = data.frame(X, Y, Z = as.factor(X + Y > 0))
model = svm(formula = Z ~ X + Y, data = data, kernel = "linear")

svm(formula = Z ~ X + Y, data = data, kernel = "linear")
ggplot(data, aes(X, Y, col = Z)) + geom_point()
plot(model, data, X ~ Y, slice = list(X = 3, Y = 4))

# Reduced number of support vectors as the cost increases
# With decreasing cost the margin increases with the effect that more and more poins are now lying in the margin area.
# The more points lie in the margin area, the more support vectors you have.

svm(formula = Z ~ X + Y, data = data, kernel = "linear", cost = 10)
ggplot(data, aes(X, Y, col = Z)) + geom_point()
plot(model, data, X ~ Y, slice = list(X = 3, Y = 4))

# An alternative plot of support vectors and margins
# svm.model$index is the indices of support vectors
svm.model <- svm(formula = Z ~ X + Y, data = data, kernel = "linear", cost = 0.1)
summary(svm.model)

#select the colors that will be used
library(RColorBrewer)
#all palette available from RColorBrewer
display.brewer.all()
#we will select the first 4 colors in the Set1 palette
cols<-brewer.pal(n=2,name="Set1")
#cols contain the names of four different colors
#create a color vector corresponding to levels in the T1 variable in dat
cols_t1<-cols[data$Z]

#ggplot(data, aes(X, Y, col = Z)) + geom_point()
plot(Y ~ X, data[,-3], col=cols_t1, pch=19, xlim=c(-2,2), ylim=c(-2,2))
points(data[svm.model$index,c(1,2)],col="blue",cex=2) 

xmin = min(X); xmax = max(X);
ymin = min(Y); ymax = max(Y);

coef1 = sum(svm.model$coefs*X[svm.model$index]);
coef2 = sum(svm.model$coefs*Y[svm.model$index]);
lines(c(xmin,xmax), (svm.model$rho-coef1*c(xmin, xmax))/coef2)
lines(c(xmin,xmax), (svm.model$rho+1-coef1*c(xmin, xmax))/coef2, lty=2)
lines(c(xmin,xmax), (svm.model$rho-1-coef1*c(xmin, xmax))/coef2, lty=2)

