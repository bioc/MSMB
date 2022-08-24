##------------------------------------------------------------
## Create the datasets
## ukraine_dists, ukraine_coords
##------------------------------------------------------------

library("tidygeocoder")
library("geodist")
library("dplyr")

cities = c(
    "Kyiv",
    "Odesa",
    "Sevastopol",
    "Chernihiv",
    "Hostomel",
    "Kharkiv",
    "Kherson",
    "Mariupol",
    "Volnovakha",
    "Cherkasy",
    "Chernivtsi",
    "Dnipro",
    "Donetsk",
    "Kramatorsk",
    "Ivano-Frankivsk",
    "Izium",
    "Khmelnytskyi",
    "Kropyvnytskyi",
    "Luhansk",
    "Lutsk",
    "Lviv",
    "Melitopol",
    "Mykolaiv",
    "Poltava",
    "Rivne",
    "Sumy",
    "Ternopil",
    "Uzhhorod",
    "Vinnytsia",
    "Zaporizhzhia",
    "Zhytomyr",
    "Simferopol",
    "ostriv Zmiinyi")

stopifnot(!any(duplicated(cities)))

if (!(exists("ukraine_coords") && setequal(cities, ukraine_coords$city)))  
   ukraine_coords = geo(
        city = cities,
        country = rep("Ukraine", length(cities)),
        method = "osm",
        lat = "lat",
        long = "lon",
        full_results = TRUE
    )

stopifnot(!any(is.na(ukraine_coords$lat)),
          !any(is.na(ukraine_coords$lon)))

ukraine_dists = geodist(ukraine_coords,
                        paired = TRUE, measure = "geodesic") |>
                as.dist() |>
                `attr<-`("Labels", ukraine_coords$city)

ukraine_dists = ukraine_dists / 1000 # convert from m to km

# assuming this script is run from with the 'inst/scripts' directory of the package as the working directory
save(ukraine_dists,  file = "../../data/ukraine_dists.RData")
save(ukraine_coords, file = "../../data/ukraine_coords.RData")
