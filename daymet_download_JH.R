# Script for importing and filtering NASA's daymet climate data
# 12.VII.23 JH

# Use setwd() because files are too big to easily upload to GitHub.
# Original .tif files are large, so you may need to re-download
# them from your cloud storage before continuing.

# Install & call terra package
# install.packages("terra", dependencies = TRUE)
library(terra)
library(dplyr)

setwd("/usr3/graduate/jnherr/daymet")

# We want to first change the CRS to WGS84, so we'll define that as an object.
newcrs <- "+proj=longlat +datum=WGS84"

# We will also want to crop the new projection, so we can
# define the area of interest (AOI) here:
AOI <- ext(-104, -60, 29, 44)

################################################################################

##### Annual avg. minimum temp. data #####

##### 2019 min. annual temp. #####
# Importing minimum temp. data from 2019
tmin_2019 <- rast("daymet_v4_tmin_annavg_na_2019.tif")
plot(tmin_2019)

# Changing CRS to WGS84
proj_2019t <- terra::project(tmin_2019, newcrs)
crs(proj_2019t)
plot(proj_2019t)

# Creating template raster to project raster onto/transform original projection
template_2019t <- rast(proj_2019t)

# Now projecting the original raster onto the template
proj2_2019t <- terra::project(tmin_2019, template_2019t)
proj2_2019t
plot(proj2_2019t)

# Cropping to area of interest (AOI)
tmin_2019_crop <- crop(proj2_2019t, AOI)
plot(tmin_2019_crop)

# Converting the raster(.tif) file to a dataframe for use in our model
tmin_2019_df <- as.data.frame(tmin_2019_crop, xy=T)
tmin_2019_df # looks good!

# Next rename columns
tmin_2019_df <- tmin_2019_df %>% rename_at("x", ~ "longitude")
tmin_2019_df <- tmin_2019_df %>% rename_at("y", ~ "latitude")
tmin_2019_df <- tmin_2019_df %>% rename_at("daymet_v4_tmin_annavg_na_2019", ~ "temp_min")

# Add columns for year, latitudinal bin (rounded latitude), and lat_yr
tmin_2019_df$latitudinal_bin <- round(tmin_2019_df$latitude)
tmin_2019_df <- tmin_2019_df[order(tmin_2019_df$latitudinal_bin, decreasing=F),]
tmin_2019_df$year <- "2019"
tmin_2019_df$lat_yr <- paste(tmin_2019_df$latitudinal_bin, tmin_2019_df$year, sep="_")
head(tmin_2019_df) # checking...
tail(tmin_2019_df) # looks good


##### 2020 min. annual temp. data #####
tmin_2020 <- rast("daymet_v4_tmin_annavg_na_2020.tif")
plot(tmin_2020)

proj_2020t <- terra::project(tmin_2020, newcrs)
crs(proj_2020t)
plot(proj_2020t)

template_2020t <- rast(proj_2020t)

proj2_2020t <- terra::project(tmin_2020, template_2020t)
proj2_2020t
plot(proj2_2020t)

tmin_2020_crop <- crop(proj2_2020t, AOI)
plot(tmin_2020_crop)

tmin_2020_df <- as.data.frame(tmin_2020_crop, xy=T)
tmin_2020_df

tmin_2020_df <- tmin_2020_df %>% rename_at("x", ~ "longitude")
tmin_2020_df <- tmin_2020_df %>% rename_at("y", ~ "latitude")
tmin_2020_df <- tmin_2020_df %>% rename_at("daymet_v4_tmin_annavg_na_2020", ~ "temp_min")

tmin_2020_df$latitudinal_bin <- round(tmin_2020_df$latitude)
tmin_2020_df <- tmin_2020_df[order(tmin_2020_df$latitudinal_bin, decreasing=F),]
tmin_2020_df$year <- "2020"
tmin_2020_df$lat_yr <- paste(tmin_2020_df$latitudinal_bin, tmin_2020_df$year, sep="_")
head(tmin_2020_df)
tail(tmin_2020_df)


##### 2021 min. annual temp. data #####
tmin_2021 <- rast("daymet_v4_tmin_annavg_na_2021.tif")
plot(tmin_2021)

proj_2021t <- terra::project(tmin_2021, newcrs)
crs(proj_2021t)
plot(proj_2021t)

template_2021t <- rast(proj_2021t)

proj2_2021t <- terra::project(tmin_2021, template_2021t)
proj2_2021t
plot(proj2_2021t)

tmin_2021_crop <- crop(proj2_2021t, AOI)
plot(tmin_2021_crop)

tmin_2021_df <- as.data.frame(tmin_2021_crop, xy=T)
tmin_2021_df

tmin_2021_df <- tmin_2021_df %>% rename_at("x", ~ "longitude")
tmin_2021_df <- tmin_2021_df %>% rename_at("y", ~ "latitude")
tmin_2021_df <- tmin_2021_df %>% rename_at("daymet_v4_tmin_annavg_na_2021", ~ "temp_min")

tmin_2021_df$latitudinal_bin <- round(tmin_2021_df$latitude)
tmin_2021_df <- tmin_2021_df[order(tmin_2021_df$latitudinal_bin, decreasing=F),]
tmin_2021_df$year <- "2021"
tmin_2021_df$lat_yr <- paste(tmin_2021_df$latitudinal_bin, tmin_2021_df$year, sep="_")
head(tmin_2021_df)
tail(tmin_2021_df)


##### 2022 min. annual temp. data #####
tmin_2022 <- rast("daymet_v4_tmin_annavg_na_2022.tif")
plot(tmin_2022)

proj_2022t <- terra::project(tmin_2022, newcrs)
crs(proj_2022t)
plot(proj_2022t)

template_2022t <- rast(proj_2022t)

proj2_2022t <- terra::project(tmin_2022, template_2022t)
proj2_2022t
plot(proj2_2022t)

tmin_2022_crop <- crop(proj2_2022t, AOI)
plot(tmin_2022_crop)

tmin_2022_df <- as.data.frame(tmin_2022_crop, xy=T)
tmin_2022_df

tmin_2022_df <- tmin_2022_df %>% rename_at("x", ~ "longitude")
tmin_2022_df <- tmin_2022_df %>% rename_at("y", ~ "latitude")
tmin_2022_df <- tmin_2022_df %>% rename_at("daymet_v4_tmin_annavg_na_2022", ~ "temp_min")

tmin_2022_df$latitudinal_bin <- round(tmin_2022_df$latitude)
tmin_2022_df <- tmin_2022_df[order(tmin_2022_df$latitudinal_bin, decreasing=F),]
tmin_2022_df$year <- "2022"
tmin_2022_df$lat_yr <- paste(tmin_2022_df$latitudinal_bin, tmin_2022_df$year, sep="_")
head(tmin_2022_df)
tail(tmin_2022_df)


##### Annual total precipitation data #####

##### 2019 ann. total precip. data #####
prcp_2019 <- rast("daymet_v4_prcp_annttl_na_2019.tif")
plot(prcp_2019)

proj_2019p <- terra::project(prcp_2019, newcrs)
crs(proj_2019p)
plot(proj_2019p)

template_2019p <- rast(proj_2019p)

proj2_2019p <- terra::project(prcp_2019, template_2019p)
proj2_2019p
plot(proj2_2019p)

prcp_2019_crop <- crop(proj2_2019p, AOI)
plot(prcp_2019_crop)

prcp_2019_df <- as.data.frame(prcp_2019_crop, xy=T)
prcp_2019_df

prcp_2019_df <- prcp_2019_df %>% rename_at("x", ~ "longitude")
prcp_2019_df <- prcp_2019_df %>% rename_at("y", ~ "latitude")
prcp_2019_df <- prcp_2019_df %>% rename_at("daymet_v4_prcp_annttl_na_2019", ~ "prcp")

prcp_2019_df$latitudinal_bin <- round(prcp_2019_df$latitude)
prcp_2019_df <- prcp_2019_df[order(prcp_2019_df$latitudinal_bin, decreasing=F),]
prcp_2019_df$year <- "2019"
prcp_2019_df$lat_yr <- paste(prcp_2019_df$latitudinal_bin, prcp_2019_df$year, sep="_")
head(prcp_2019_df)
tail(prcp_2019_df)


##### 2020 ann. total precip. data #####
prcp_2020 <- rast("daymet_v4_prcp_annttl_na_2020.tif")
plot(prcp_2020)

proj_2020p <- terra::project(prcp_2020, newcrs)
crs(proj_2020p)
plot(proj_2020p)

template_2020p <- rast(proj_2020p)

proj2_2020p <- terra::project(prcp_2020, template_2020p)
proj2_2020p
plot(proj2_2020p)

prcp_2020_crop <- crop(proj2_2020p, AOI)
plot(prcp_2020_crop)

prcp_2020_df <- as.data.frame(prcp_2020_crop, xy=T)
prcp_2020_df

prcp_2020_df <- prcp_2020_df %>% rename_at("x", ~ "longitude")
prcp_2020_df <- prcp_2020_df %>% rename_at("y", ~ "latitude")
prcp_2020_df <- prcp_2020_df %>% rename_at("daymet_v4_prcp_annttl_na_2020", ~ "prcp")

prcp_2020_df$latitudinal_bin <- round(prcp_2020_df$latitude)
prcp_2020_df <- prcp_2020_df[order(prcp_2020_df$latitudinal_bin, decreasing=F),]
prcp_2020_df$year <- "2020"
prcp_2020_df$lat_yr <- paste(prcp_2020_df$latitudinal_bin, prcp_2020_df$year, sep="_")
head(prcp_2020_df)
tail(prcp_2020_df)


##### 2021 ann. total precip. data #####
prcp_2021 <- rast("daymet_v4_prcp_annttl_na_2021.tif")
plot(prcp_2021)

proj_2021p <- terra::project(prcp_2021, newcrs)
crs(proj_2021p)
plot(proj_2021p)

template_2021p <- rast(proj_2021p)

proj2_2021p <- terra::project(prcp_2021, template_2021p)
proj2_2021p
plot(proj2_2021p)

prcp_2021_crop <- crop(proj2_2021p, AOI)
plot(prcp_2021_crop)

prcp_2021_df <- as.data.frame(prcp_2021_crop, xy=T)
prcp_2021_df

prcp_2021_df <- prcp_2021_df %>% rename_at("x", ~ "longitude")
prcp_2021_df <- prcp_2021_df %>% rename_at("y", ~ "latitude")
prcp_2021_df <- prcp_2021_df %>% rename_at("daymet_v4_prcp_annttl_na_2021", ~ "prcp")

prcp_2021_df$latitudinal_bin <- round(prcp_2021_df$latitude)
prcp_2021_df <- prcp_2021_df[order(prcp_2021_df$latitudinal_bin, decreasing=F),]
prcp_2021_df$year <- "2021"
prcp_2021_df$lat_yr <- paste(prcp_2021_df$latitudinal_bin, prcp_2021_df$year, sep="_")
head(prcp_2021_df)
tail(prcp_2021_df)


##### 2022 ann. total precip. data #####
prcp_2022 <- rast("daymet_v4_prcp_annttl_na_2022.tif")
plot(prcp_2022)

proj_2022p <- terra::project(prcp_2022, newcrs)
crs(proj_2022p)
plot(proj_2022p)

template_2022p <- rast(proj_2022p)

proj2_2022p <- terra::project(prcp_2022, template_2022p)
proj2_2022p
plot(proj2_2022p)

prcp_2022_crop <- crop(proj2_2022p, AOI)
plot(prcp_2022_crop)

prcp_2022_df <- as.data.frame(prcp_2022_crop, xy=T)
prcp_2022_df

prcp_2022_df <- prcp_2022_df %>% rename_at("x", ~ "longitude")
prcp_2022_df <- prcp_2022_df %>% rename_at("y", ~ "latitude")
prcp_2022_df <- prcp_2022_df %>% rename_at("daymet_v4_prcp_annttl_na_2022", ~ "prcp")

prcp_2022_df$latitudinal_bin <- round(prcp_2022_df$latitude)
prcp_2022_df <- prcp_2022_df[order(prcp_2022_df$latitudinal_bin, decreasing=F),]
prcp_2022_df$year <- "2022"
prcp_2022_df$lat_yr <- paste(prcp_2022_df$latitudinal_bin, prcp_2022_df$year, sep="_")
head(prcp_2022_df)
tail(prcp_2022_df)

##### Combining dataframes #####

##### Min. temp. data frames #####
tmin_2019_2022 <- rbind(tmin_2019_df, tmin_2020_df, tmin_2021_df, tmin_2022_df)
head(tmin_2019_2022)
tail(tmin_2019_2022)

# Adding a column that takes the total average minimum temp.
# over 2019 - 2022 for each "latitudinal_bin" (avg_temp_min)
# and then subtracts this mean from the annual avg. temp_min
# for each lat_yr (named dev_temp_min)
tmin_2019_2022_lmer <- tmin_2019_2022 %>%
  select(temp_min, latitudinal_bin, lat_yr) %>%
  group_by(latitudinal_bin) %>%
  mutate(avg_temp_min = mean(temp_min)) %>%
  ungroup() %>%
  group_by(lat_yr) %>%
  mutate(dev_temp_min = mean(temp_min) - avg_temp_min) %>%
  ungroup() %>%
  select(dev_temp_min, lat_yr) %>%
  group_by(lat_yr) %>%
  distinct()


##### Total annual precipitation data frames #####
prcp_2019_2022 <- rbind(prcp_2019_df, prcp_2020_df, prcp_2021_df, prcp_2022_df)
head(prcp_2019_2022)
tail(prcp_2019_2022)

# Same treatment for the total annual precipitation data
prcp_2019_2022_lmer <- prcp_2019_2022 %>%
  select(prcp, latitudinal_bin, lat_yr) %>%
  group_by(latitudinal_bin) %>%
  mutate(avg_prcp = mean(prcp)) %>%
  ungroup() %>%
  group_by(lat_yr) %>%
  mutate(dev_prcp = mean(prcp) - avg_prcp) %>%
  ungroup() %>%
  select(dev_prcp, lat_yr) %>%
  group_by(lat_yr) %>%
  distinct()

# Note - negative values in the "dev_temp_min" or "dev_prcp" mean that the
# average annual "tmin" or "prcp" in that latitude and year are lower than the
# average at that latitude across the years 2019 - 2022.

# To create the linear model without year as a random effect, I'll also create
# a separate climate df with min. temp. and prcp averaged across 2019 -22
# for each latitudinal bin.

##### Avg. minimum temperature from 2019 - 2022 #####
tmin_2019_2022_lm1 <- tmin_2019_2022 %>%
  select(temp_min, latitudinal_bin) %>%
  group_by(latitudinal_bin) %>%
  mutate(avg_temp_min = mean(temp_min)) %>%
  ungroup() %>%
  select(avg_temp_min, latitudinal_bin) %>%
  group_by(latitudinal_bin) %>%
  distinct()

##### Avg. precipitation from 2019 - 2022 #####
prcp_2019_2022_lm1 <- prcp_2019_2022 %>%
  select(prcp, latitudinal_bin) %>%
  group_by(latitudinal_bin) %>%
  mutate(avg_prcp = mean(prcp)) %>%
  ungroup() %>%
  select(avg_prcp, latitudinal_bin) %>%
  group_by(latitudinal_bin) %>%
  distinct()


##### Joining tmin and prcp dataframes together for LMER #####
climate_lmer_df <- full_join(tmin_2019_2022_lmer, prcp_2019_2022_lmer, by = "lat_yr")
climate_lmer_df = climate_lmer_df %>%
  select(lat_yr, dev_temp_min, dev_prcp)

write.csv(daymet_climate_df, 'climate_lmer_df.csv')

##### Joining tmin and prcp dataframes together for LM1 #####
climate_lm1_df <- full_join(tmin_2019_2022_lm1, prcp_2019_2022_lm1, by = "latitudinal_bin")
climate_lm1_df = climate_lm1_df %>%
  select(latitudinal_bin, avg_temp_min, avg_prcp)
head(climate_lm1_df)

write.csv(climate_lm1_df, 'climate_lm1_df.csv')
