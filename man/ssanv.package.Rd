\name{ssanv-package}
\alias{ssanv-package}
\alias{ssanv}
\docType{package}
\title{
Sample Size Adjusted for Nonadherence or Variability of input parameters}
\description{
Calculate sample size for two sample difference in means tests. The function, 
\code{ss.nonadh} accounts for known proportions of nonadherence. There are three 
functions that calculate sample size accounting for the variability that comes from 
estimating parameters from data.  
}
\details{
\tabular{ll}{
Package: \tab ssanv\cr
Type: \tab Package\cr
Version: \tab 1.0-1\cr
Date: \tab 2009-10-13\cr
License: \tab GPL2 \cr
}
This package does adjustments for sample size calculations for two-sample difference in means tests. 
The function \code{ss.nonadh} adjusts for nonadherence, where the responses may be continuous, discrete, or binary.
There are 3 functions which account for variability of estimating parameters from data: 
\code{ss.fromdata.nvar}-- accouts for variability of standard deviation estimate when data are normal 
and the clincially significant difference is known,
\code{ss.fromdata.neff}-- accounts for variability of estimated standardized difference in means when both groups 
come from normal distributions with the same variance,
\code{ss.fromdata.pois}-- accounts for variability of means when both means are estimated from data assumed Poisson. 
}
\author{Michael Fay <mfay@niaid.nih.gov>

Maintainer: Michael Fay <mfay@niaid.nih.gov>
}
\references{ Fay, M.P., Halloran, M.E., and Follmann, D.A. (2007). `Accounting for Variability in Sample Size Estimation with Applications to 
Nonadherence and Estimation of  Variance and Effect Size' Biometrics 63: 465-474. }
\keyword{htest}
%\seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%}
\examples{
### Suppose treatment will not work on about 30 percent of subjects 
### then rho0=.3 and clinically significant difference in means is .5 
ss.nonadh(delta=.5,rho0=.3)

### Suppose you estimate standard deviation of .32 from a sample of size 12
### and the clinically significant difference is .2
ss.fromdata.nvar(delta=.2,sdhat=.32,df=11)
### The usual method is to assume that the standard deviation is known 
### this result is the same as df=Inf
ss.fromdata.nvar(delta=.2,sdhat=.32,df=Inf)
}
