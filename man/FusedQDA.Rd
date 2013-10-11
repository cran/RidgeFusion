\name{FusedQDA}
\alias{FusedQDA}
\title{Quadratic Discriminant Analysis with Ridge Fused Inverse Covariance Estimation}
\description{Calculates the parameter estimates associated with quadratic discriminant analysis }
\usage{
FusedQDA(X,Lambda1,Lambda2,scaleC=FALSE)
}
\arguments{
  \item{X}{A list where each element contains the data of a different class }
  \item{Lambda1}{ Ridge tuning parameter, must be greater than or equal to 0}
  \item{Lambda2}{Ridge Fusion tuning parameter, must be greater than or equal to 0}
  \item{scaleC}{If \code{TRUE} scale invariant method is used}  
} \value{
  An object of class \code{RidgeFusedQDA}, basically a list including elements
  \item{Omega}{  a list where each element is the inverse covariance matrix estimate for the corresponding element of X }
  \item{Means}{A list of class means}
  \item{Pi}{Class Proportions}
  \item{Lambda1}{}
  \item{Lambda2}{}
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
Z=list(X1,Y)
A2=FusedQDA(Z,10,10,scale=TRUE)
names(A2)
}
\keyword{Quadratic Discriminant Analysis}