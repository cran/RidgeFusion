\name{SSRidgeFused}
\alias{SSRidgeFused}
\title{Semis Supervised Ridge Fusion Model Based Clustering}
\description{Calculates parameters for model based clustering using ridge fusion estimation of precision matrix }
\usage{
SSRidgeFused(Z, Xu, lambda1, lambda2, Scale=FALSE, warm=NULL,tol=.001)
}
\arguments{
  \item{Z}{A list of length J that contains the labeled data for each class }
  \item{Xu}{The unlabeled data}
  \item{lambda1}{ A vector with all possible Ridge tuning parameters}
  \item{lambda2}{A vector with all possible Ridge Fusion tuning parameters}
  \item{Scale}{If \code{TRUE} scale invariant method is used}
  \item{warm}{Default is \code{NULL}, if initialized with mixing distributions for each of the unlabeled data, will use in initialization of parameters}
  \item{tol}{tolerence for convergence criterion of the alphas}
} \value{
  An object of class \code{SSRidgeFusion}, basically a list including elements
  \item{Omega}{  a list where each element is the precision matrix estimate for the corresponding element of S }
  \item{Ridge}{lambda1 }
  \item{FusedRidge}{lambda2 }
  \item{iter}{The number of iterations until the EM algorithm converged}
  \item{Alpha}{Mixing coefficients for each of the unlabeled data points}
  \item{Means}{Class/Cluster Means}
  \item{Pi}{Probability Mass Function for the classes}
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

##Creating Unlabeled data set
Z1=rmvnorm(250,rep(2*log(p)/p,p),Sig1)
Z2=rmvnorm(250,,Sig2)
ZU=rbind(Z1,Z2)
## Running Semi-Supervised Ridge Fused Model based clustering 
Hi=SSRidgeFused(Z,ZU,1,1,Scale=TRUE,warm=NULL)
## Showing example of a warm.start
Hi2=SSRidgeFused(Z,ZU,1,1,Scale=TRUE,warm=Hi$Alphas)
}
\keyword{Semi-Supervised Model Based Clustering}