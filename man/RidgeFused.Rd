\name{RidgeFused}
\alias{RidgeFused}
\title{Ridged Fused Inverse Covariance Matrix Estimation}
\description{Calculates the ridge fusion precision estimator for multiple classes}
\usage{
RidgeFused(S,lambda1,lambda2,nc,tol=10^(-7), maxiter=1e3,warm.start=NULL,scale=FALSE)
}
\arguments{
	A list is returned where the elements are:
  \item{S}{A list of length J that contains the sample covariance estimators of each class }
  \item{lambda1}{ Ridge tuning parameter, must be greater than or equal to 0}
  \item{lambda2}{Ridge Fusion tuning parameter, must be greater than or equal to 0}
  \item{nc}{ A vector of length J that contains the sample size of each class }
  \item{tol}{Convergence tolerance for blockwise coordinate descent algorithm}
  \item{maxiter}{The number of iterations the algorithm will run if convergence tolerance is not met}
  \item{warm.start}{If \code{NULL} no warm start is used.  If initialized with a list of positive definite inverse covariance matrix estimates of length J, will use them as initialization for the algorithm.}
  \item{scale}{If \code{FALSE} scale invariant method is used}  
} 
\value{
  An object of class \code{RidgeFusion}, basically a list including elements
  \item{Omega}{  a list where each element is the inverse covariance matrix estimate for the corresponding element of S }
  \item{Ridge}{ lambda1 }
  \item{FusedRidge}{lambda2 }
  \item{iter}{Number of iterations until convergence}
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
## Creating a list to use as S
S=list(0,0)	
S[[1]]=(99/100)*cov(X1)
S[[2]]=(99/100)*cov(Y)

## Creating the vector of sample sizes
nc2=c(100,100)

## Running RidgeFused scale invariant method for tuning parameters lambda1=1 ,lambda2=2
A=RidgeFused(S,1,2,nc2,scale=TRUE)
A
names(A)
}
\keyword{Inverse covariance matrix estimation}