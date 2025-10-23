# retrieve data
# call up MAP rasters where they're used
# read in model outputs also
ind_shp <- st_read("districts")
ind_map <- rast("ind_map.grd")

razzes <- paste0("data/", list.files("data"))

# need to be a bit careful here as model inputs get read in in radians
covs <- lapply(razzes[grepl(".flt$", razzes)], function(ras){
  tmp <- rast(ras)
  if (res(tmp)[1] < 0.001){
    # values(ind_map) <- values(tmp)
    # tmp <- ind_map
    ext(tmp) <- as.vector(ext(tmp)) * 180 / pi
  }

  tmp
}) %>%
  rast()

covs

# but anyway, here's how to get more recent PfPR from MAP (and accessibility, temp suitability, etc.)
library(malariaAtlas)

listRaster()