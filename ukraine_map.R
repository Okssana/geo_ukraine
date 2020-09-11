# Read this shape file with the rgdal library. 
library(rgdal)

# gadm36_UKR_1.shp is already downloaded
getwd()

my_spdf <- readOGR( 
  dsn= paste0(getwd(),"/ukraine_shapefiles/Administation_levels/gadm36_UKR_1.shp") , 
  verbose=FALSE
)

# Information about a file
summary(my_spdf)
length(my_spdf)
head(my_spdf@data)

library(broom) # to tidy a map

spdf_fortified <- tidy(my_spdf, region = "NAME_1") # Check the name of region carefully 

# Plot it
library(ggplot2)

ggplot() +
  geom_polygon(data = spdf_fortified, 
               aes( x = long, y = lat, group = group), fill="#69b3a2", color="white") +
  theme_void() 



