\name{RidgeFusionCV-class}
\Rdversion{1.1}
\docType{class}
\alias{RidgeFusionCV-class}
\alias{RidgeFusionCV}
\alias{print,RidgeFusionCV-method}

\title{Class \code{"RidgeFusionCV"}}
\description{
A class for preforming the validation likelihood for joint precision matrix estimation using ridge fusion
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{RidgeFusionCV(...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{BestRidge}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{BestFusedRidge}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{CV}:}{Object of class \code{"matrix"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{print}{\code{signature(x = "RidgeFusionCV")}: ... }
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
showClass("RidgeFusionCV")
}
\keyword{classes}
\usage{
RidgeFusionCV(...)
}
\arguments{
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
