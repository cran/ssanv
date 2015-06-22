\name{uniroot.integer}
\alias{uniroot.integer}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Find the root of a function to the nearest integer}
\description{
Let f be a monotonic function that changes sign within the interval specified. If f(i)=0 for some i within the interval specified (including the ends of the interval), then the root is i. Otherwise  if \code{pos.side}=TRUE (or FALSE) then \code{uniroot.integer} finds the integer i such that 
f(i) is closest to the sign change and is positive (or negative). 
}
\usage{
uniroot.integer(f, interval, lower = min(interval), upper = max(interval), 
    step.power = 6, step.up = TRUE, pos.side = FALSE, print.steps = FALSE, 
    maxiter = 1000, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{f}{ function for which a root is needed }
  \item{interval}{an interval giving minimum and maximum allowable values for root}
  \item{lower}{minimum allowable root}
  \item{upper}{maximum allowable root}
  \item{step.power}{initial step size is \eqn{2^{step.power}}{2^step.power}}
  \item{step.up}{if TRUE steps up from 'lower', if FALSE steps down from 'upper'}
  \item{pos.side}{if TRUE finds integer, i, closest to the root such that f(i) \eqn{>}{>} zero}
  \item{print.steps}{if TRUE, prints iterations}
  \item{maxiter}{ maximum number of iterations }
  \item{\dots}{additional arguments to 'f'.}
}
\details{
The algorithm evaluates f(i) iteratively, increasing (or decreasing if step.up=FALSE) 
i by \eqn{2^{step.power}}{2^step.power} until either f(i)=0 or f(i) switches sign.
If f(i)=0, then stop. If f(i) switches sign, then the change in  'i' is halved each iteration until convergence. 
}
\value{
A list with the following elements:
  \item{ root}{the integer on the correct side of the root}
  \item{f.root}{value of f at root}
  \item{iter}{number of times f was evaluated}
}
%-\references{  ~ }
\author{Michael P. Fay}
\note{Unlike \code{\link{uniroot}}, the function is not automatically evaluated at both extremes. This makes 
\code{uniroot.integer} an efficient method to use when the calculation time of f(i) 
increases with the value of 'i'. For an example of the importance of this see 
\code{\link{ss.fromdata.pois}}. }
\seealso{\code{\link{uniroot}}, used by \code{\link{ss.fromdata.neff}}, \code{\link{ss.fromdata.pois}},
\code{\link{ss.nonadh}} }
\examples{
root.func<-function(i) i - 500.1 
## initial step sizes = 2^2 =4
uniroot.integer(root.func,c(0,Inf),step.power=2)
## more efficient to use bigger initial step sizes = 2^10 =1024
uniroot.integer(root.func,c(0,Inf),step.power=10,print.steps=TRUE)
}
\keyword{htest}% at least one, from doc/KEYWORDS
