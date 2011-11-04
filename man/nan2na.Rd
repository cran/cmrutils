\name{nan2na}
\alias{nan2na}
\title{
  Helper Routine
}
\description{
  Replaces non-finite values with \code{NA}s in array-like objects.
}
\usage{
nan2na(x)
}
\arguments{
  \item{x}{
    An array-like object.
  }
}
\value{
  Returns \code{x} with non-finite values replaced with \code{NA}s.
}
\seealso{
  \code{\link{is.finite}}, \code{\link{NA}}.
}
\examples{
  nan2na(Inf)
  nan2na(rep(c(0, -Inf, Inf), 3))
  nan2na(matrix(c(0, Inf, -Inf, 0), 2, 2))
  nan2na(array(c(0, -Inf, Inf, 1, NaN), dim = c(2, 3, 4)))
  nan2na(ts(rep(c(0, -Inf, Inf), 2), frequency = 5))
}
\keyword{ utilities }
