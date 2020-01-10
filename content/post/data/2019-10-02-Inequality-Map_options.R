tf <- point.locations.sf.transform %>% 
  left_join(point.locations.sf.transform %>% 
              as.tibble() %>% 
              select(CMANAME , gini01 , gini06 , gini11 , gini16) %>% 
              mutate_at(c("gini01" , "gini06" , "gini11" , "gini16") , dplyr::percent_rank) %>% 
              mutate(gini01_bin = if_else(gini01 > .75 , 4 , 
                                          if_else(gini01 > .5 , 3 , 
                                                  if_else(gini01 > .25 , 2 , 1))), 
                     gini06_bin = if_else(gini06 > .75 , 4 , 
                                          if_else(gini06 > .5 , 3 , 
                                                  if_else(gini06 > .25 , 2 , 1))),
                     gini11_bin = if_else(gini11 > .75 , 4 , 
                                          if_else(gini11 > .5 , 3 , 
                                                  if_else(gini11 > .25 , 2 , 1))),
                     gini16_bin = if_else(gini16 > .75 , 4 , 
                                          if_else(gini16 > .5 , 3 , 
                                                  if_else(gini16 > .25 , 2 , 1))),
              ) %>% select(CMANAME , gini01_bin , gini06_bin , gini11_bin , gini16_bin) , 
            by = "CMANAME")


  
leaflet(tf) %>% 
  addProviderTiles(provider = providers$CartoDB.Positron) %>%
  #addCircleMarkers defines size in terms of metres - they're too similar in size
  addCircleMarkers(#radius = 50*(qlogis(point.locations.sf.transform$gini01)),
                   color = "#3182bd" ,
                   fillColor = "#9ecae1" ,
                   fillOpacity = .6 , 
                   radius = ~ gini01_bin*2 ,
                   weight = 2 ,
                   label = ~CMANAME , 
                   group = "Gini Coefficient 2001") %>% 
  addCircleMarkers( color = "#3182bd" ,
                    fillColor = "#9ecae1" ,
                    fillOpacity = .6 , 
                    radius = ~ gini06_bin*2 ,
                    weight = 2 ,
                    label = ~CMANAME , 
                    group = "Gini Coefficient 2006") %>% 
  addCircleMarkers( color = "#3182bd" ,
                  fillColor = "#9ecae1" ,
                  fillOpacity = .6 , 
                  radius = ~ gini11_bin*2 ,
                  weight = 2 ,
                  label = ~CMANAME , 
                  group = "Gini Coefficient 2011") %>%
  addCircleMarkers( color = "#3182bd" ,
                    fillColor = "#9ecae1" ,
                    fillOpacity = .6 , 
                    radius = ~ gini16_bin*2 ,
                    weight = 2 ,
                    label = ~CMANAME , 
                    group = "Gini Coefficient 2016") %>%
  addLayersControl(
                    baseGroups = c("Gini Coefficient 2001", "Gini Coefficient 2006" , "Gini Coefficient 2011" , "Gini Coefficient 2016"),
                  )
