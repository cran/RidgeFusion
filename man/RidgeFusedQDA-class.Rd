\name{RidgeFusedQDA-class}
\Rdversion{1.1}
\docType{class}
\alias{RidgeFusedQDA-class}
\alias{RidgeFusedQDA}
\alias{predict,RidgeFusedQDA-method}
\alias{print,RidgeFusedQDA-method}
\alias{predict.RidgeFusedQDA}

\title{Class \code{"RidgeFusedQDA"}}
\description{
A class for implementing quadratic discriminant analysis with joint precision matrix estimation using ridge fusion
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{RidgeFusedQDA(...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{Omega}:}{Object of class \code{"list"} ~~ }
    \item{\code{Means}:}{Object of class \code{"list"} ~~ }
    \item{\code{Pi}:}{Object of class \code{"vector"} ~~ }
    \item{\code{lambda1}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{lambda2}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{predict}{\code{signature(object = "RidgeFusedQDA")}: ... }
    \item{print}{\code{signature(x = "RidgeFusedQDA")}: ... }
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
showClass("RidgeFusedQDA")
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
Class=predict(A2,X1,class=TRUE)
Score=predict(A2,X1,class=FALSE)
}
\keyword{classes}
\usage{
RidgeFusedQDA(...)
predict.RidgeFusedQDA(object,newdata,class=TRUE,...)

}
\arguments{
  \item{\dots}{Optional Arguments}
\item{object}{An object of RidgeFusedQDA}
\item{newdata}{data to be predicted}
\item{class}{if TRUE then predicted classes are returned if false QDA scores are returned}
}
