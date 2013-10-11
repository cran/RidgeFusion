\name{RidgeFusion-class}
\Rdversion{1.1}
\docType{class}
\alias{RidgeFusion-class}
\alias{RidgeFusion}
\alias{print,RidgeFusion-method}

\title{Class \code{"RidgeFusion"}}
\description{
A class for jointly estimating the precision matrix with ridge fusion
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{RidgeFusion(...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{Omega}:}{Object of class \code{"list"} ~~ }
    \item{\code{Ridge}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{FusedRidge}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{iter}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{print}{\code{signature(x = "RidgeFusion")}: ... }
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
showClass("RidgeFusion")
}
\keyword{classes}
\usage{
RidgeFusion(...)
}
\arguments{
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
