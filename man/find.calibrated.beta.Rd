\name{find.calibrated.beta}
\alias{find.calibrated.beta}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Find calibrated beta}
\description{
Called by \code{\link{ss.fromdata.nvar}}. Finds calibrated beta (1-power) for use when estimating 
standard deviation from data in sample size calculations for differences in two normal means.
}
\usage{
find.calibrated.beta(beta, df, alpha = 0.05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{beta}{ 1-nominal.power}
  \item{df}{degrees of freedom}
  \item{alpha}{one-sided significance level of test }
}
\details{
See \code{\link{ss.fromdata.nvar}}.
}
\value{
Calibrated beta value = 1 - calibrated power.
}
\references{ Fay, M.P., Halloran, M.E., and Follmann, D.A. (2007). `Accounting for Variability in Sample Size Estimation with Applications to 
Nonadherence and Estimation of  Variance and Effect Size' Biometrics 63: 465-474. }
\author{Michael P. Fay}
%-\note{ }
\seealso{ \code{\link{ss.fromdata.nvar}} }
\examples{
## see Table 2 of Fay et al 2006.
1-find.calibrated.beta(.2,12,.025)

}
\keyword{htest}% at least one, from doc/KEYWORDS
