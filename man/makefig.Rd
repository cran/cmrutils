\name{makefig}
\alias{makefig}
\title{
  Helper Plotting Routine
}
\description{
  Sets up graphical device and plots figure. For PDF device, also takes
  care of embedding fonts (see Details).
}
\usage{
makefig(plotfun, ..., device = c('default', 'pdf', 'svg'),
        width = 8, height = 6, scale = pointsize/12, pointsize = 12, 
        filename = 'Rplot', family = 'Helvetica')
}
\arguments{
  \item{plotfun}{
    A function which does the actual plotting.
  }
  \item{\dots}{
    Additional arguments passed to \code{plotfun}.
  }
  \item{device}{
    The type of graphical device.
  }
  \item{width, height}{
    The \emph{unscaled} width and height of the graphics region in
    inches. Actual size is \code{c(width, height)*scale}.
  }
  \item{scale}{
    The scaling factor. Is 1 for the default \code{pointsize}.
  }
  \item{pointsize}{
    The base font size in points.
  }
  \item{filename}{
    The filename for PDF or SVG device. If "standard" extension is
    missing, it is added automagically.
  }
  \item{family}{
    The font family for PDF device (see Details).
  }
}
\details{
  For PDF device, function does font embedding via call to
  \code{\link{embedFonts}}. The package provides additional font
  families \code{"CMRoman"}, \code{"CMSans"} which work nicely with
  cyrillics. These families are based on CM-Super font package by
  Vladimir Volovich and CMSYASE symbol font by Paul Murrell.

  Both metric (\file{*.afm}) and outline (\file{*.pfb}) files for the
  \code{"CMRoman"}, \code{"CMSans"} fonts are provided with the
  package. This allows to embed these fonts even if they are not
  installed in the system.
}
\value{
  Returns the result value of call to \code{plotfun} \emph{invisibly}.
}
\seealso{
  \code{\link{dev.new}}, \code{\link{pdf}}, \code{\link{svg}},

  Paul Murrell (2005?) Using Computer Modern Fonts in R Graphics.
  \url{http://www.stat.auckland.ac.nz/~paul/R/CM/CMR.html}
}
\examples{
  x <- rnorm(10)

  myplot <- function(x, legend, ...)
  {
    plot(x, ..., pch = 1)
    legend('bottomright', bg = 'white',
           legend = legend, pch = 1)
  }

  makefig(myplot, x = x, legend = 'Simulation')
  makefig(myplot, x = x, legend = 'Simulation', pointsize = 8)

\donttest{
  makefig(myplot, x = x, legend = 'Simulation',
          device = 'pdf', filename = 'embedding.pdf', family = 'CMSans')

  mapply(makefig, device = c('window', 'pdf', 'svg'),
         MoreArgs = list(plotfun = myplot, x = x, legend = 'Simulation',
           filename = 'test', family = 'CMSans'))
}
}
\keyword{ utilities }
\keyword{ hplot }
