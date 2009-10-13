\name{ss.fromdata.pois}
\alias{ss.fromdata.pois}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Find sample sizes when 2 Poisson means are estimated from data }
\description{
Calculate sample sizes for two-sample differences in Poisson means when means are estimated from existing data}
\usage{
ss.fromdata.pois(xbar0, xbar1, m0, m1, ss.ratio = 1, sig.level = 0.05, 
    real.power = 0.8, nominal.power = NULL, 
    alternative = c("two.sided", "one.sided"), MINN0 = 1, MAXN0 = 10^5)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{xbar0}{ mean from control group of existing data }
  \item{xbar1}{ mean from treatment group of existing data}
  \item{m0}{sample size of control group of existing data}
  \item{m1}{sample size of treatment group of existing data}
  \item{ss.ratio}{n1/n0, where n0 (n1) is sample size of control (treatment) group for proposed study}
  \item{sig.level}{ significance level (Type I error)}
  \item{real.power}{minimum power that you want the sample size to achieve, only .8 or .9 allowed}
  \item{nominal.power}{see details}
  \item{alternative}{One- or two-sided test}
  \item{MINN0}{minimum sample size for control group }
  \item{MAXN0}{maximum sample size for control group}
}
\details{
Calculates the sample sizes for a study designed to test the difference between the means of two groups, 
where it is assumed  that the responses from both groups are distributed Poisson. 
The means from each group (\code{xbar0} and \code{xbar1}) come from existing data that is assumed to also follow the 
same Poisson distributions. The method is inherently conservative, so that with a nominal power of .77 the real power 
will be about .80, and a nominal power of .89 the real power will be about .90. Other values of nominal power are 
allowed, but only real powers of .80 or .90 are allowed. 
If mu0 and mu1 are the means from the two groups, 
the one-sided tests are designed to test either 
\eqn{H_0: \mu_0 \leq \mu_1}{H0: mu0 <= mu1} vs. 
\eqn{H_1: \mu_0 > \mu_1}{H1: mu0 > mu1} or to test 
\eqn{H_0: \mu_0 \geq \mu_1}{H0: mu0 >= mu1 } vs. 
\eqn{H_1: \mu_0 < \mu_1}{H1: mu0 < mu1}. 
We estimate \eqn{\mu_0}{mu0} and \eqn{\mu_1}{mu1} with 
\eqn{\hat{\mu}_0 = xbar0 + \frac{1}{2m_0} }{mu0hat=xbar0 + 1/(2m0)}
and 
\eqn{\hat{\mu}_1 = xbar1 + \frac{1}{2m_1} }{mu1hat=xbar1 + 1/(2m1)}.
The choice of hypotheses is determined by the value of \eqn{\hat{\mu}_0}{mu0hat} 
and \eqn{\hat{\mu}_1}{mu1hat}; 
if \eqn{\hat{\mu}_0 > \hat{\mu}_1}{mu0hat > mu1hat} then the former hypotheses are tested, otherwise the latter are.
 See Fay, Halloran and Follmann (2007) for details. 
}
\value{Object of class "power.htest", a list of the arguments
     (including the computed sample sizes) augmented with 'METHOD' and 'NOTE'
     elements. The values 'n0' and 'n1' are the samples sizes for the two groups, rounded up to the nearest integer.
}
\references{ Fay, M.P., Halloran, M.E., and Follmann, D.A. (2007). `Accounting for Variability in Sample Size Estimation with Applications to 
Nonadherence and Estimation of  Variance and Effect Size' Biometrics 63: 465-474. }
\author{Michael P. Fay}
\note{ 
The function \code{ss.fromdata.pois} calls \code{\link{uniroot.integer}}, a function written for this package that 
finds the nearest integer to the root. }
\seealso{ \code{\link{ss.fromdata.nvar}}, 
\code{\link{ss.fromdata.neff}},  
\code{\link{ss.nonadh}},  
\code{\link{uniroot.integer}}
   }

\examples{
ss.fromdata.pois(1.65,.88,23,25)
}
\keyword{htest}% at least one, from doc/KEYWORDS
