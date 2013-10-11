\name{SSRidgeFusedCV}
\alias{SSRidgeFusedCV}
\title{Tuning Parameter Selection For Semi-Supervised Ridge Fusion Model Based Clustering via EM Validation Likelihood}
\description{Calculates validation scores for possible tuning parameters for Semi-Supervised Ridge Fusion Model Based Clustering}
\usage{
SSRidgeFusedCV(X,Xu,Lam1,Lam2,Fold,FoldU,scaleCV=FALSE,tolCV=0.01)
}
\arguments{
  \item{X}{A list of length J that contains the labeled data for each class }
  \item{Xu}{The unlabeled data}
  \item{Lam1}{ A vector with all possible Ridge tuning parameters}
  \item{Lam2}{A vector with all possible Ridge Fusion tuning parameters}
  \item{scaleCV}{If \code{TRUE} scale invariant method is used}
	\item{Fold}{see Ridge Fused CV usage}
	\item{FoldU}{ A list of length of the number of validation sets containing the indices of each set for the unlabeled data} 
	\item{tolCV}{ Covergence tolerance for each iteration of the cross validation via validation likelihood}
}	 
   \value{
  An object of class \code{RidgeFusionCV}, basically a list including elements
  \item{Omega}{  a list where each element is the inverse covariance matrix estimate for the corresponding element of S }
  \item{BestRidge}{The grid point of lambda1 that minimizes the validation score }
  \item{BestFusedRidge}{The grid point of lambda2 that minimizes the validation score }
  \item{CV}{Matrix containing the full grid of points that were input and the validation scores}
}
\author{Brad Price}
\examples{
\dontrun{
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


## Creating Validation sets for unlabeled data
SampU=sample(1:500)
FoldU1=list(0,0)
for(i in 1:5){
	FoldU1[[i]]=SampU[((100*(i-1)+1)):(i*100)]
}


Hello=SSRidgeFusedCV(Z,ZU,10^(-2:-1),10^(-3:1),Fold1,FoldU1,scaleCV=FALSE)
}
}
\keyword{EM Validation Likelihood}