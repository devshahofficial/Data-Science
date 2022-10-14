# http://stats.stackexchange.com/questions/31066/what-is-the-influence-of-c-in-svms-with-linear-kernel
# http://stackoverflow.com/questions/21827776/plot-margins-for-support-vector-machine

rm(list=ls(all=TRUE))

x1s <- c(.5,1,1,2,3,3.5,     1,3.5,4,5,5.5,6)
x2s <- c(3.5,1,2.5,2,4,1.2,  5.8,3,4,5,4,1)
ys <- c(rep(+1,6),          rep(-1,6))
my.data <- data.frame(x1=x1s, x2=x2s, type=as.factor(ys))
my.data
#install.packages('e1071')
library('e1071')

# use one of the following two options
svm.model <- svm(type ~ ., data=my.data,
          type='C-classification', kernel='linear', scale=FALSE, cost = 0.1) # cost = 10 or 0.1
svm.model

# svm.model$index is the indices of support vectors
plot(my.data[,-3],col=(ys+3)/2, pch=19, xlim=c(-1,6), ylim=c(-1,6))
points(my.data[svm.model$index,c(1,2)],col="blue",cex=2) 

x1min = min(x1s); x1max = max(x1s);
x2min = min(x2s); x2max = max(x2s);

coef1 = sum(svm.model$coefs*x1s[svm.model$index]);
coef2 = sum(svm.model$coefs*x2s[svm.model$index]);
lines(c(x1min,x1max),  (svm.model$rho-coef1*c(x1min, x1max))/coef2)
lines(c(x1min,x1max),  (svm.model$rho+1-coef1*c(x1min, x1max))/coef2, lty=2)
lines(c(x1min,x1max),  (svm.model$rho-1-coef1*c(x1min, x1max))/coef2, lty=2)

