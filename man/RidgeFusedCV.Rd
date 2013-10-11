\name{RidgeFusedCV}
\alias{RidgeFusedCV}
\title{Ridged Fused Validation Likelihood}
\description{Calculates the Valdiation Likelihood Score for candidate tuning parameters}
\usage{
RidgeFusedCV(X,lambda1,lambda2,Fold,tol=10^(-4),scaleCV=FALSE,INF=FALSE)
}
\arguments{
  \item{X}{A list of length J that contains the data for each class }
  \item{lambda1}{ A vector with all possible Ridge tuning parameters}
  \item{lambda2}{A vector with all possible Ridge Fusion tuning parameters}
  \item{Fold}{A list of length K, the number of folds, where each element is a list of length of the number of classes that contains the indices for the kth fold of the jth class. Fold[[1]][[1]] contains the indices of the first fold in class 1, Fold[[1]][[2]] contains the indices of the first fold of class 2}
  \item{tol}{Convergence tolerance for blockwise coordinate descent algorithm at each grid point}
  \item{scaleCV}{If \code{TRUE} scale invariant method is used}  
  \item{INF}{If \code{TRUE} sets all inverse covariance matrices equal in the result}
} \value{
  An object of class \code{RidgeFusionCV}, basically a list including elements
  \item{Omega}{  a list where each element is the precision matrix estimate for the corresponding element of S }
  \item{BestRidge}{ The ridge grid point that minimizes the validation likelihood score }
  \item{BestFusedRidge}{The fused ridge grid point that minimizes the validation likelihood score }
  \item{CV}{The matrix of validation likelihood scores and the grid points they match}
}
\author{Brad Price}
\examples{
## Creating a toy example with 5 variables
library(mvtnorm)
set.seed(526)
p=5
    Sig1=matrix(0,p,p)
	for(j in 1:p){
		for(i in j:p){          
            Sig1[j,i]=.7^abs(i-j)
            Sig1[i,j]=Sig1[j,i]
            
		}
	}
    Sig2=diag(c(rep(2,p-5),rep(1,5)),p,p)%*%Sig1%*%diag(c(rep(2,p-5),rep(1,5)),p,p)
X1=rmvnorm(100,rep(2*log(p)/p,p),Sig1)
Y=rmvnorm(100,,Sig2)

## Creating a list of the data for each class
Z=list(X1,Y)

Samp=list(0,0)
Samp[[1]]=sample(1:100)
Samp[[2]]=sample(1:100)

## Creating Fold list
Fold1=list(0,0)
for(i in 1:5){
	Fold1[[i]]=list(0,0)
	for(j in 1:2){
		Fold1[[i]][[j]]=Samp[[j]][((20*(i-1))+1):(i*20)]
	}
}

## Calculating Validation likelihood scores for
##tuning parameter grid 10^(-1:1) for Ridge, and 10^(2:3) for Ridge Fusion
Tell=RidgeFusedCV(Z,10^(-1:1),10^(2:3),Fold1,scaleCV=TRUE)
Tell
names(Tell)
}
\keyword{Validation Likelihood}