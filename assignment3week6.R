
#Read the file
stormevents2002 <- read.csv("C:/Himanshu/R Scripts/stormdetails2002.csv")

#2.	Limit the dataframe to the following columns
datacol <- c("BEGIN_YEARMONTH","EPISODE_ID","STATE","STATE_FIPS","CZ_NAME","CZ_TYPE","CZ_FIPS","EVENT_TYPE")
stormevents2002select <- stormevents2002

#3.	Arrange the data by the state name 
library(dplyr)
stormevents2002new <- arrange(stormevents2002select, STATE)
head(stormevents2002new)


#4.	Change state and county names to title case 
library(stringr)
stormevents2002new$STATE = str_to_title(stormevents2002new$STATE)

#5.	Limit to the events listed by county FIPS 
filter(stormevents2002new, CZ_TYPE == "C")
select(stormevents2002new, -CZ_TYPE)

#6.	Pad the state and county FIPS with a “0” 
library(tidyr)
str_pad(stormevents2002new$STATE_FIPS, width=4, side="left", pad="0")
str_pad(stormevents2002new$CZ_FIPS, width=4, side="left", pad="0")
unite(stormevents2002new, "fips", c("STATE_FIPS","CZ_FIPS"))

#7.	Change all the column names to lower case
rename_all(stormevents2002new, tolower)


#8.	Create Dataframe US states
data("state")
statethreecols<-data.frame(state=state.name, region=state.region, area=state.area)


#9.	Create Dataframe with the number of events 
statenumber <- data.frame(table(stormevents2002new$STATE))
str_to_title(statenumber$Var1)
newstatenumber <- rename(statenumber, c("state"="Var1"))
newstatenumber$state = str_to_title(newstatenumber$state)
mergedstate <- merge(x=newstatenumber,y=statethreecols,by.x="state",by.y="state")

#10 create a plot
library(ggplot2)
stormp <- ggplot(mergedstate, aes(x = area, y = Freq,)) + 
  geom_point(aes(color = region)) + 
  labs(x = "Land area (square miles)",
       y = "# of storm events in 2002" )
print(stormp)

