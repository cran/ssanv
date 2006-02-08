\name{ss.fromdata.nvar}
\alias{ss.fromdata.nvar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Find sample sizes when normal standard deviation is estimated from data}
\description{
Calculate sample sizes for two-sample differences in normal means when the standard deviation (or variance) 
is estimated from existing data.}
}
\usage{
ss.fromdata.nvar(delta, sdhat = NULL, vhat = NULL, 
    df = Inf, ss.ratio = 1, var.ratio = 1, deltaB = 0, 
    sig.level = 0.05, power = 0.8, 
    alternative = c("two.sided", "one.sided"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{delta}{clinically significant difference in means}
  \item{sdhat}{estimate of standard deviation from existing data (must supply either sdhat or vhat)}
  \item{vhat}{estimate of variance from existing data (must supply either sdhat or vhat)}
  \item{df}{ degrees of freedom associated with standard deviation (or variance) estimate}
  \item{ss.ratio}{n1/n0, where n0 (n1) is sample size of control (treatment) group for proposed study}
  \item{var.ratio}{\eqn{\sigma_1^2/\sigma_0^2}{sigma1^2/sigma0^2}, where \eqn{\sigma_0}{sigma0} (\eqn{\sigma_1}{sigma1}) is standard deviation of 
control (treatment) group for proposed study}
  \item{deltaB}{ boundary value between null and alternative hypotheses for one-sided tests (see details)}
  \item{sig.level}{significance level (Type I error)}
  \item{power}{ minimum power that you want the sample size to achieve}
  \item{alternative}{ One- or two-sided test}
}
\details{
Calculates the sample sizes for a study designed to test the difference between the means of two groups, 
where it is assumed  that the responses from each group are distributed normally. 
The standard deviation (sdhat) or variance (vhat) is estimated from existing data 
that is assumed to also follow a normal distribution with variance the same as the control group of 
the proposed study. 
If sdhat (or vhat) is estimated from one group with a sample size of m, then df=m-1.
If sdhat (or vhat) is estimated from two groups with sample sizes of m0 and m1, then df=m0+m1-2.

The one-sided tests are designed to test either 
\eqn{H_0: \delta \leq \delta_B}{H0: delta <= deltaB} vs. 
\eqn{H_1: \delta > \delta_B}{H1: delta > deltaB} or to test 
\eqn{H_0: \delta \geq \delta_B}{H0: delta >= deltaB} vs. 
\eqn{H_1: \delta < \delta_B}{H1: delta < deltaB}.
The choice of hypotheses is determined by the value of \code{delta}; 
if \code{delta} \eqn{>}{>} \code{deltaB}  
then the former hypotheses are tested, otherwise the latter are.

See Fay, Halloran and Follmann (2006) for details. 
}
\value{
Object of class "power.htest", a list of the arguments
     (including the computed sample sizes) augmented with 'METHOD' and 'NOTE'
     elements. The values 'n0' and 'n1' are the samples sizes for the two groups, rounded up to the nearest integer.
}
\references{  Fay, M.P., Halloran, M.E., and Follmann, D.A. (2006). `Accounting for Variability in Sample Size Estimation with Applications to 
Nonadherence and Estimation of  Variance and Effect Size' (submitted to Biometrics). }
\author{Michael P. Fay}
\note{
The function \code{ss.fromdata.nvar} calls \code{\link{find.calibrated.beta}}, a function written for this package 
that finds the calibrated beta value (see Fay, Halloran and Follmann, 2006). 
}
\seealso{  \code{\link{ss.fromdata.neff}}, 
\code{\link{ss.fromdata.pois}},  
\code{\link{ss.nonadh}},  
\code{\link{find.calibrated.beta}}
   }

\examples{
ss.fromdata.nvar(.4,sdhat=.682,df=46)
}
\keyword{htest}% at least one, from doc/KEYWORDS
