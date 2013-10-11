\name{SSRidgeFusion-class}
\Rdversion{1.1}
\docType{class}
\alias{SSRidgeFusion-class}
\alias{SSRidgeFusion}
\alias{predict,SSRidgeFusion-method}
\alias{print,SSRidgeFusion-method}
\alias{predict.SSRidgeFusion}

\title{Class \code{"SSRidgeFusion"}}
\description{
A class to implement semi-supervised model based clustering with ridge fusion precision matrix estimation
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{SSRidgeFusion(...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{Alphas}:}{Object of class \code{"matrix"} ~~ }
    \item{\code{Means}:}{Object of class \code{"list"} ~~ }
    \item{\code{Pi}:}{Object of class \code{"vector"} ~~ }
    \item{\code{Omega}:}{Object of class \code{"list"} ~~ }
    \item{\code{Ridge}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{FusedRidge}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{iter}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Extends}{
Class \code{"\linkS4class{RidgeFusion}"}, directly.
}
\section{Methods}{
  \describe{
    \item{predict}{\code{signature(object = "SSRidgeFusion")}: ... }
    \item{print}{\code{signature(x = "SSRidgeFusion")}: ... }
	 }
}
%%\references{
%%  ~~put references to the literature/web site here~~
%%}
\author{
Brad Price
}
%%\note{
%%  ~~further notes~~
%%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%%\seealso{
%%  ~~objects to See Also as \code{\link{~~fun~~}}, ~~~
%%  ~~or \code{\linkS4class{CLASSNAME}} for links to other classes ~~~
%%}
\examples{
showClass("SSRidgeFusion")
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
Class=predict(Hi,Z1,class=TRUE)
Score=predict(Hi,Z1,class=FALSE)
}
\keyword{classes}
\usage{
SSRidgeFusion(...)
predict.SSRidgeFusion(object,newdata,class=TRUE,...)
}
\arguments{
  \item{\dots}{Optional Arguments}
  \item{object}{An object of RidgeFusedQDA}
\item{newdata}{data to be predicted}
\item{class}{if TRUE then predicted classes are returned if false QDA scores are returned}
}
