library(maptools)
library(ggplot2)
library(RColorBrewer)
library(scales)
# Link to shapefile: https://data.sfgov.org/Geographic-Locations-and-Boundaries/Election-Precincts-Zipped-Shapefile-Format-/w3ua-z2my
# reading in shapefile from wherever you have it
shpfile <- '~/Downloads/elect_precincts/Elect_Precincts.shp'
poly = readShapeSpatial(shpfile)
test <- fortify(poly, region="prec_2012")
plot(poly)
ggplot() + geom_map(data=total_data_new, aes(map_id=id, fill=totreg_r), map=test) + expand_limits(x=test$long, y=test$lat) + scale_fill_gradient(limits=c(443, 801), name="Total Registered Voters") + labs(title="Map of SF Precincts (2014)") + theme(panel.background=element_blank(), axis.line=element_blank(), axis.text.x=element_blank(), axis.text.y=element_blank(), axis.title.x=element_blank(), axis.title.y=element_blank(), axis.ticks=element_blank(), text=element_text(family="Trebuchet MS"))

my_greens <- brewer.pal(5, 'Greens')
new_greens <- my_greens[-1]
ggplot() + geom_map(data=total_data_new, aes(map_id=id, fill=PctNew), map=test) + expand_limits(x=test$long, y=test$lat) + labs(title="Voter Registration in Mission District Precincts (2012)") + theme(panel.background=element_blank(), axis.line=element_blank(), axis.text.x=element_blank(), axis.text.y=element_blank(), axis.title.x=element_blank(), axis.title.y=element_blank(), axis.ticks=element_blank(), panel.grid.major=element_blank(), panel.grid.minor=element_blank(), title=element_text(family="Helvetica", size=16), legend.title=element_text(family="Helvetica", size=12), legend.text=element_text(family="Helvetica", size=12)) + scale_fill_gradientn(colours=new_greens, limits=c(.01, 1), labels=percent, na.value="lightslategray", name="Pct. of Precinct's Voting Age Population", oob=censor)
ggplot() + geom_map(data=data_2014, aes(map_id=id, fill=PctNew), map=test) + expand_limits(x=test$long, y=test$lat) + labs(title="Voter Registration in Mission District Precincts (2014)") + theme(panel.background=element_blank(), axis.line=element_blank(), axis.text.x=element_blank(), axis.text.y=element_blank(), axis.title.x=element_blank(), axis.title.y=element_blank(), axis.ticks=element_blank(), panel.grid.major=element_blank(), panel.grid.minor=element_blank(), title=element_text(family="Helvetica", size=16), legend.title=element_text(family="Helvetica", size=12), legend.text=element_text(family="Helvetica", size=12)) + scale_fill_gradientn(colours=new_greens, limits=c(.01, 1), labels=percent, na.value="lightslategray", name="Pct. of Precinct's Voting Age Population", oob=censor)
