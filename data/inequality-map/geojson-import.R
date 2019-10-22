## Uploading Geojson file to R when file has NULL columns

#install packages

install.packages("geojsonio")
install.packages("sf")
install.packages("mapview")
install.packages("tidyverse")

#load the packages

library(tidyverse)
library(geojsonio)
library(sf)
library(mapview)

#upload data
df <- geojsonio::geojson_read("data.geojson")

#isolate the important stuff
df<- df$features

#rename columns for later
new.names <- c(
  "type" ,
  names(df[[1]]$properties) ,
  "geometry.type" ,
  "lng" ,
  "lat"
)

#Start creating datafram
point.locations <- df[[1]] %>% as.data.frame()

#Rename columns with your new names
names(point.locations) <- new.names

#Loop through every item in the geojson list
for (i in 2:length(df)) {
  
  t <- df[[i]]$properties %>% unlist()
  
  #Make sure the item doesn't have any null column values
  if (length(t) == 12) {
    
    out.file <- df[[i]] %>% as.data.frame()
    names(out.file) <- new.names
    
    point.locations <- dplyr::bind_rows(point.locations , out.file)
    
  } else {
    message(paste(t[["CMANAME"]] , "has NULL values."))
  }

}

#Make data frame a spatial dataframe ("simple feature")
point.locations.sf <- st_as_sf(point.locations , coords = c("lng" , "lat") , crs = 3347)

#Put it on a map
mapview::mapview(point.locations.sf  , label = point.locations.sf$CMANAME)
   
