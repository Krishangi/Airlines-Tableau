#Data Table 
library(data.table)
library(stringr)

#Make a copy of table
yr2016=copy(X2016)

#Check the data type of table
class(yr2016)

#convert to Data Table
setDT(yr2016)

#Check if converted ( must be a data.table)
class(yr2016)

#summary (look at data table summary to understand data better)
str(yr2016)

#not available data sorting (TRUE means-> NA)
is.na(yr2016)

#count of NA data summary
table(is.na(yr2016))

#Look at missing data columnwise
is.na(yr2016$FL_DATE)

#List only the column names from the table
names(yr2016)

#If there is no missing data, it will show only FALSE
#column 1 - FL_DATE
unique(is.na(yr2016$FL_DATE))
#column 2 - OP_CARRIER
unique(is.na(yr2016$OP_CARRIER))
#column 3 - OP_CARRIER_FL_NUM
table(is.na(yr2016$OP_CARRIER_FL_NUM))
#column 4 - ORIGIN
unique((is.na(yr2016$ORIGIN)))
#column 5 - DEST
unique(is.na(yr2016$DEST))
#column 6
unique(is.na(yr2016$CRS_DEP_TIME))
#column 7
unique(is.na(yr2016$DEP_TIME)) #HAS NA VALUES
table(is.na(yr2016$DEP_TIME)) #COunt of NA VALUES
#column 8
unique(is.na(yr2016$DEP_DELAY))  #HAS NA VALUES
table(is.na(yr2016$DEP_DELAY))
#column 9
unique(is.na(yr2016$TAXI_OUT)) 
table(is.na(yr2016$TAXI_OUT))
#column 10
unique(is.na(yr2016$WHEELS_OFF)) 
table(is.na(yr2016$WHEELS_OFF))
#COLUMN11
unique(is.na(yr2016$WHEELS_ON)) 
table(is.na(yr2016$WHEELS_ON))
#COLUMN 12
unique(is.na(yr2016$TAXI_IN)) 
table(is.na(yr2016$TAXI_IN))
#COLUMN 13
unique(is.na(yr2016$CRS_ARR_TIME)) #NO NA
#Column 14
unique(is.na(yr2016$ARR_TIME)) 
table(is.na(yr2016$ARR_TIME))
#column 15
unique(is.na(yr2016$ARR_DELAY)) 
table(is.na(yr2016$ARR_DELAY)) 
#COLUMN 16
unique(is.na(yr2016$CANCELLED)) # NO NA

#COLUMN 17
unique(is.na(yr2016$CANCELLATION_CODE))  #LOOK AT DATA AGAIN
table(is.na(yr2016$CANCELLATION_CODE))

#COLUMN 18
unique(is.na(yr2016$DIVERTED)) #no na
table(is.na(yr2016$DIVERTED))

#COLUMN 19
unique(is.na(yr2016$CRS_ELAPSED_TIME))
table(is.na(yr2016$CRS_ELAPSED_TIME))

#COLUMN 20
unique(is.na(yr2016$ACTUAL_ELAPSED_TIME)) 
table(is.na(yr2016$ACTUAL_ELAPSED_TIME))
#COLUMN 21
unique(is.na(yr2016$AIR_TIME)) 
table(is.na(yr2016$AIR_TIME))
#COLUMN 22
unique(is.na(yr2016$DISTANCE)) 
table(is.na(yr2016$DISTANCE))
#column 23
unique(is.na(yr2016$CARRIER_DELAY))
table(is.na(yr2016$CARRIER_DELAY))   # TABLE MARKED FOR DELETION

#COLUMN 24
unique(is.na(yr2016$WEATHER_DELAY)) 
table(is.na(yr2016$WEATHER_DELAY))   # TABLE MARKED FOR DELETION

#COLUMN 25
unique(is.na(yr2016$NAS_DELAY)) 
table(is.na(yr2016$NAS_DELAY))   # TABLE MARKED FOR DELETION

#COLUMN 26
unique(is.na(yr2016$SECURITY_DELAY)) 
table(is.na(yr2016$SECURITY_DELAY))    # TABLE MARKED FOR DELETION
#COLUMN 27
unique(is.na(yr2016$LATE_AIRCRAFT_DELAY))
table(is.na(yr2016$LATE_AIRCRAFT_DELAY))    # TABLE MARKED FOR DELETION

#deleting columns from 23 to 28
#covert yr2016 from data table to data frame type
setDF(yr2016)
#check if conversion successful
class(yr2016)
#perfom deletion
del2016<- yr2016[-c(23:28)]
#names of available columns after deletion
names(del2016)
#convert del2016 from data frame to data table
setDT(del2016)
#check class
class(del2016)

#Attaching del2016
attach(del2016)

#Removing Rows with NA values in DEP_TIME and DEP_DELAY 
#since these are determining columns 
del2016=del2016[!is.na(DEP_TIME), ]
table(is.na(DEP_TIME))

del2016=del2016[!is.na(DEP_DELAY), ]
table(is.na(WHEELS_OFF))

#Removing Rows with NA values in WHEELS_OFF, WHEELS_ON, TAXI_IN, TAXI_OUT
del2016=del2016[!is.na(WHEELS_OFF), ]
del2016=del2016[!is.na(WHEELS_ON), ]
del2016=del2016[!is.na(TAXI_IN), ]
del2016=del2016[!is.na(TAXI_OUT), ]

#CHECK PROPER DATA TYPES OF COLUMNS
str(del2016)

#unique values in CANCELLED
unique(CANCELLED)

#data frame
setDF(del2016)
#Covert to categorical 
