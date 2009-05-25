\name{slice}
\alias{slice}
\title{
  Helper Routine
}
\description{
  Slices array by specified dimension.
}
\usage{
slice(x, MARGIN, n)
}
\arguments{
  \item{x}{
    An array-like object.
  }
  \item{MARGIN}{
    An integer giving the dimension to slice by.
  }
  \item{n}{
    Number of slice.
  }
}
\value{
  Returns array of dimensions \code{dim(x)[-MARGIN]}. The corresponding
  dimnames are preserved.
}
\seealso{
  \code{\link{slice.index}}.
}
\examples{
  x <- 1:10
  slice(x, 1, 1)

  x <- matrix(1:4, 2, 2)
  rownames(x) <- c("Row 1", "Row 2")
  colnames(x) <- c("Col 1", "Col 2")
  x
  slice(x, 1, 1)
  slice(x, 1, 2)
  slice(x, 2, 1)
  slice(x, 2, 2)

  x <- array(1:24, dim = c(2, 3, 4))
  dimnames(x) <- list(letters[1:2], letters[3:5], letters[6:9])
  x
  slice(x, 1, 1) 
  slice(x, 2, 1)
  slice(x, 3, 1)
}
\keyword{ utilities }
