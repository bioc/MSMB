\name{ukraine_dists}
\docType{data}
\alias{ukraine_coords}
\alias{ukraine_dists}

\title{Coordinates of and pairwise distances between hero cities and
  oblast capitals in Ukraine}

\description{This dataset is used as an example in the 'Multivariate methods for heterogeneous data' chapter.}

\usage{
  data("ukraine_dists")
  data("ukraine_coords")
}

\format{\code{ukraine_dists} is an object of S3 class \code{dist}.
  \code{ukraine_coords} is a \code{tibble}.
}

\details{
The two datasets were constructed using the R code in the file
\file{ukraine-dists.R} in the \file{scripts} directory of this package.
Briefly, the city and place names are hardcoded in the script,
coordinates were queried from OpenStreetMap using the \code{geo}
function in the \pkg{tidygeocoder}, and pairwise geodesic distances computed
using the \code{geodist} function from the eponymous package.
}


\examples{
   data("ukraine_coords")
   plot(x = ukraine_coords$lon, y = ukraine_coords$lat, pch = 16, cex = 0.7, col = "#0057b7", asp = 1 / cos(pi / 180 * 48))
   text(x = ukraine_coords$lon, y = ukraine_coords$lat, labels = ukraine_coords$city, adj = c(0.5, -0.2))
}

\keyword{datasets}
