\name{brcalymphnode}
\docType{data}
\alias{brcalymphnode}

\title{Coordinates and cell types in a histopathology slides of a breast
  cancer patients lymph node.}

\description{}
\usage{
  data("brcalymphnode")
}

\format{A \code{data.frame}.}

\details{
This dataset is used as an example in the 'Image data' chapter. See
there for more details.
}


\examples{
   data("brcalymphnode")
   plot(x = brcalymphnode$x, y = brcalymphnode$y, pch=".", col = brcalymphnode$class)
}

\keyword{datasets}
