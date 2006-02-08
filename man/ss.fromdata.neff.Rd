\name{ss.fromdata.neff}
\alias{ss.fromdata.neff}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Find sample sizes when normal standardized difference is estimated from data}
\description{
Calculate sample sizes for two-sample differences in normal means when standardized difference is estimated from existing data}
\usage{
ss.fromdata.neff(thetahat, m0, m1, ss.ratio = 1, thetaB = 0, 
    sig.level = 0.05, real.power = 0.8, nominal.power = NULL, 
    alternative = c("two.sided", "one.sided"), 
    MINN0 = 2, MAXN0 = Inf, subdivisions = 1000)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{thetahat}{estimated standardized difference in means}
  \item{m0}{sample size from control group of existing data}
  \item{m1}{sample size from treatment group of existing data}
  \item{ss.ratio}{n1/n0, where n0 (n1) is sample size of control (treatment) group for proposed study}
  \item{thetaB}{boundary value between null and alternative hypotheses for one-sided tests (see details)}
  \item{sig.level}{ significance level (Type I error)}
  \item{real.power}{minimum power that you want the sample size to achieve, only .8 or .9 allowed}
  \item{nominal.power}{see details}
  \item{alternative}{One- or two-sided test}
  \item{MINN0}{minimum sample size for control group }
  \item{MAXN0}{maximum sample size for control group}
  \item{subdivisions}{ number of subdivisions for numerical integration}
}
\details{
Calculates the sample sizes for a study designed to test the difference between the means of two groups, 
where it is assumed  that the responses from each group are distributed normally with the same variance. 
The standardized difference in means (\code{thetahat}) is estimated from existing data that is assumed to also follow the 
same normal distribution. The method is inherently conservative, so that with a nominal power of .76 the real power 
will be about .80, and a nominal power of .88 the real power will be about .90. Other values of nominal power are 
allowed, but only real powers of .80 or .90 are allowed. 
The one-sided tests are designed to test either 
\eqn{H_0: \theta \leq \theta_B}{H0: theta <= thetaB} vs. 
\eqn{H_1: \theta > \theta_B}{H1: theta > thetaB} or to test 
\eqn{H_0: \theta \geq \theta_B}{H0: theta >= thetaB} vs. 
\eqn{H_1: \theta < \theta_B}{H1: theta < thetaB}.
The choice of hypotheses is determined by the value of \code{thetahat}; 
if \code{thetahat} \eqn{>}{>} \code{thetaB} 
then the former hypotheses are tested, otherwise the latter are.
 See Fay, Halloran and Follmann (2006) for details. 
}
\value{
Object of class "power.htest", a list of the arguments
     (including the computed sample sizes) augmented with 'METHOD' and 'NOTE'
     elements. The values 'n0' and 'n1' are the samples sizes for the two groups, rounded up to the nearest integer.
}
\references{ Fay, M.P., Halloran, M.E., and Follmann, D.A. (2006). `Accounting for Variability in Sample Size Estimation with Applications to 
Nonadherence and Estimation of  Variance and Effect Size' (submitted to Biometrics). }
\author{Michael P. Fay}
\note{ 
The function \code{ss.fromdata.neff} calls \code{\link{uniroot.integer}}, a function written for this package that 
finds the nearest integer to the root. }
\seealso{ \code{\link{ss.fromdata.nvar}}, 
\code{\link{ss.fromdata.pois}},  
\code{\link{ss.nonadh}},  
\code{\link{uniroot.integer}}
   }
\examples{
ss.fromdata.neff(.588,23,25)
}
\keyword{htest}% at least one, from doc/KEYWORDS
