\name{time365}
\alias{time365toDate}
\alias{time365fromDate}
\title{
  Helper Time-Series Routines
}
\description{
  Converts beetween \code{\link{Date}} objects and sampling times of
  daily time series with the natural time period of 1 year.
}
\usage{
time365toDate(x)
time365fromDate(x)
}
\arguments{
  \item{x}{
    A vector of sampling times (\code{time365toDate}) or dates
    (\code{time365fromDate}).
  }
}
\details{
  A simple approach to modelling daily time series with the natural time
  period of 1 year is to use \code{\link{ts}} object with
  \eqn{\code{frequency} = 365}, that is to assume no leap days.
  
  \code{time365fromDate} returns \code{NA} for the leap day February 29.
}
\value{
  A vector of dates (\code{time365fromDate}) or sampling times
  (\code{time365toDate}).
}
\seealso{
  \code{\link{time}}.
}
\examples{
  ## non-leap year
  x <- ts(1:4, start = c(1991, 58), frequency = 365)
  time365toDate(time(x))
  d <- seq.Date(as.Date('1991-02-27'), as.Date('1991-03-02'), 1)
  time365fromDate(d)

  ## leap year
  x <- ts(1:4, start = c(1992, 58), frequency = 365)
  time365toDate(time(x))
  d <- seq.Date(as.Date('1992-02-27'), as.Date('1992-03-02'), 1)
  time365fromDate(d)

  x <- seq(1900, 2100, by = 1/365)
  stopifnot(all(abs(x - time365fromDate(time365toDate(x))) <
                getOption("ts.eps")))
}
\keyword{ utilities }
\keyword{ ts }
