install.packages("tidyverse")
library(tidyverse)
install.packages("here")
library(here)
install.packages("skimr")
library(skimr)
install.packages("janitor")
library(janitor)
install.packages("readr")
library(readr)
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)
install.packages('ggplot2')
library(ggplot2)
install.packages("RColorBrewer")
library(RColorBrewer)
daily_activity <- read.csv("dailyActivity_merged.csv")
 sleep_day <- read.csv("sleepDay_merged.csv")
 getwd()
 setwd()
 head(daily_activity)
 colnames(daily_activity)
 head(sleep_day)
 colnames(sleep_day)
 str(daily_activity)
 str(sleep_day)
 which(is.na(daily_activity))
 which(is.na(sleep_day))
 n_distinct(daily_activity$Id)
 n_distinct(sleep_day$Id)
 nrow(daily_activity)
nrow(sleep_day) 

daily_activity %>%
  select(TotalSteps,SedentaryMinutes,Calories) %>%
  summary()
sleep_day %>%
  select(TotalSleepRecords,TotalMinutesAsleep,TotalTimeInBed) %>%
  summary()


ggplot(data=daily_activity, aes(x=TotalSteps, y=SedentaryMinutes)) + 
  geom_point(colour="yellow") + geom_smooth(color = "red")


 ggplot(data=sleep_day) + 
   geom_smooth(mapping=aes(x=TotalMinutesAsleep, y=TotalTimeInBed), color="red") + 
    geom_point(mapping=aes(x=TotalMinutesAsleep, y=TotalTimeInBed), color="yellow") 
 
 ggplot(data=daily_activity) + 
   geom_point(mapping=aes(x=TotalSteps, y=Calories),color="green") + 
    geom_smooth(mapping=aes(x=TotalSteps, y=Calories),color="red")
 
 combined_dataset <- merge(daily_activity, sleep_day, all = TRUE)
 n_distinct(combined_dataset$Id)
 
 ggplot(data=combined_data, aes(x=TotalMinutesAsleep, y=SedentaryMinutes)) +
   geom_point(color="green") +
   geom_smooth(color="brown") +
   geom_line(color="brown") +
   labs(title="Correlation BTW TotalMinutesAsleep and SedentaryMinutes")