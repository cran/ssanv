\name{ss.nonadh}
\alias{ss.nonadh}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Find sample sizes accounting for nonadherence}
\description{
Calculate sample sizes needed for a two-sample difference in means test accounting for nonadherence 
(i.e., noncompliance) in a proportion of subjects.
}
\usage{
ss.nonadh(mu0 = NULL, mu1 = NULL, delta = NULL, sigma0.sq = 1, 
    rho0 = 0, rho1 = 0, ss.ratio = 1, var.ratio = 1, deltaB = 0, 
    sig.level = 0.05, power = 0.8, alternative = c("two.sided", "one.sided"), 
    refinement = NULL,error.fisher=10^-6)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mu0}{ mean of control group}
  \item{mu1}{mean of treatment group}
  \item{delta}{mu0 - mu1 }
  \item{sigma0.sq}{variance of control group}
  \item{rho0}{probability that a subject randomized to control will switch to treatment}
  \item{rho1}{probability that a subject randomized to treatment will switch to control 
(or respond like control subjects)}
  \item{ss.ratio}{n1/n0, where n0 (n1) is sample size of control (treatment) group for proposed study}
\item{var.ratio}{\eqn{\sigma_1^2/\sigma_0^2}{sigma1^2/sigma0^2}, where \eqn{\sigma_0}{sigma0} (\eqn{\sigma_1}{sigma1}) is standard deviation of 
control (treatment) group for proposed study}
  \item{deltaB}{ boundary value between null and alternative hypotheses for one-sided tests (see details)}
  \item{sig.level}{significance level (Type I error)}
  \item{power}{ minimum power that you want the sample size to achieve}
  \item{alternative}{One- or two-sided test}
  \item{refinement}{More precise sample size estimates for certain types of responses, 
possible values: NULL (use asymptotic method), `Normal' or 'N','Bernoulli' or 'B',
and 'Fisher.exact' or 'F'.}
  \item{error.fisher}{bound on the abolute error of the power calculations for the Fisher.exact refinement} 
}
\details{
Calculates the sample sizes for a study designed to test the difference between the means of two groups, 
where a proportion of those randomized to the control regimin switch to the treatment regimin (rho0) 
and a proportion of those randomized to the treatment regimin switch to the control regimin (rho1).

You must supply either \code{mu0} and \code{mu1} or \code{delta}=mu0-mu1. 
The one-sided tests are designed to test either 
\eqn{H_0: \delta \leq \delta_B}{H0: delta <= deltaB} vs. 
\eqn{H_1: \delta > \delta_B}{H1: delta > deltaB} or to test 
\eqn{H_0: \delta \geq \delta_B}{H0: delta >= deltaB} vs. 
\eqn{H_1: \delta < \delta_B}{H1: delta < deltaB}.
The choice of hypotheses is determined by the value of \code{delta}; 
if \code{delta} \eqn{>}{>} \code{deltaB} 
then the former hypotheses are tested, otherwise the latter are.

The responses may be continuous, discrete, or even binary. 
The value \code{refinement} defines different methods related to the response type.
When refinement=NULL, the method is based on asymptotic normal approximation. 
For refinement='Normal' the method is based on the t-distribution derived when the responses are normal. 
For refinement='Bernoulli' the \code{sigma0.sq} and \code{var.ratio} values are defined by 
\code{mu0} and \code{mu1}, and the sample sizes do not use any continuity correction. 
For refinement='Fisher.exact' only the two-sided alternative is allowed and the sample size related to 
exact powers for the 2X2 Fisher exact test are calculated.  

See Fay, Halloran and Follmann (2006) for details. 
}
\value{Object of class "power.htest", a list of the arguments
     (including the computed sample sizes) augmented with 'METHOD' and 'NOTE'
     elements. The values 'n0' and 'n1' are the samples sizes for the two groups, rounded up to the nearest integer.
}
\references{ Fay, M.P., Halloran, M.E., and Follmann, D.A. (2006). `Accounting for Variability in Sample Size Estimation with Applications to 
Nonadherence and Estimation of  Variance and Effect Size' (submitted to Biometrics). }
\author{Michael P. Fay}
\note{ 
If you have a two-sided hypotheses with binary data, then refinement='Fisher.exact' is 
more accurate than refinement='Bernoulli',  but it  takes  considerably longer to run. 
If 'Fisher.exact' is chosen the method uses the \code{\link{uniroot.integer}} function, and 
if you `Esc' during the calculation, intermediate 
exact powers will print. 
}
\seealso{ \code{\link{uniroot.integer}},
  \code{\link{ss.fromdata.neff}}, 
\code{\link{ss.fromdata.pois}},  
\code{\link{ss.fromdata.nvar}}
   }

\examples{

### Suppose treatment will not work on about 30 percent of subjects 
### then rho0=.3 and clinically significant difference in means is .5 
ss.nonadh(delta=.5,rho0=.3)

## Binary data, quick calculation
ss.nonadh(mu0=.1,mu1=.4,refinement="B")
# Calculate Fisher.exact before packaging, took about 8 seconds
#example.of.Fisher.exact<-ss.nonadh(mu0=.1,mu1=.4,refinement="Fisher.exact")
data(example.of.Fisher.exact)
example.of.Fisher.exact

}
\keyword{htest}% at least one, from doc/KEYWORDS
