# Introduction to Social Data Analytics
# Zack Goodman
# Section 6 Individual Activity
########################################
#
# Please complete the code below. You can help each other. There is intentionally too much for one 
#     50 minute section - what you don't finish is here for additional practice to build your skills.
#
# Some helpful commands/operators from lecture 11: <- c() length() max() min() range() mean() sum()
#     setwd() getwd() read.csv() load() names() nrow() ncol() dim() summary() write.csv() save() 
#
# Some helpful commands/operators from lecture 12: & | ! TRUE FALSE seq() class() as.numeric() is.character() 
#     typeof() subset() table()
#
# Remember that you can use help() if you forget the syntax for a command.
#
########################################

## Part 0: Save the script as LastName_Section6.R and submit to TritonEd for attendance credit.

## Part 1: Importing and exploring data
# Set your working directory to the location of resume.csv, and import the data frame (remember to *assign* it.)
getwd()
setwd("/Users/ziyangwang/Desktop/R")
resume <- read.csv("resume.csv")
# Check the dimensions of the data frame, and view the variables names using the appropriate functions.
dim(resume)
# Display the first three observations of the data frame. (Bonus: use the head() command to do the same thing.)
resume[1:3,]
head(resume,n=3)
# Display the last three observations of the data frame. (Bonus: use the tail() command to do the same thing.)
resume[4868:4870,]
tail(resume,n = 3 )
# Display summary statistics of the entire data set. Give a summary of the race column.
summary(resume)
# What is the class of the 'sex' column? What are the levels of the 'sex' column? (hint: use levels())
class(resume$sex)
levels(resume$sex)

## Part 2: There's more than one way to skin a cat
# Below is an example of the difference between [] and [[]]. It's very subtle, so be careful.
# What is the difference? (hint: use class().)
class(head(resume[["call"]], 10))  # Double bracket
class(head(resume["call"], 10))  # Single bracket

# If we use the $, what class of object is the following? Which of the above two objects does it resemble?
head(resume$call, 10)

# which() returns the position of elements in a logical vector that are TRUE. Is there any difference between the following?
tail(resume$call[which(resume$race == "black")], 10)
tail(resume$call[resume$race == "black"], 10)

# But! Is there difference between a and b?
a <- which(resume$race == "black")
b <- resume$race == "black"
head(a, 10)
head(b, 10)


## Part 3: Working with data
# Create a new variable, called callB, which is the mean of "call" for those with race = "black"
callB <- mean(resume$call[resume$race=="black"])
# Create a new variable, called callW, which is the mean of "call" for those with race = "white"
callW <- mean(resume$call[resume$race=="white"])
# Calculate the difference of call rates for White minus Black names. You should get about 0.032.
callW - callB
# Often we will want to subset the data to perform analysis on subgroups.
# Create an object BlackMale that contains all data for those in resume with race = "black" and sex = "male".
BlackMale <- subset(resume,select = c("firstname","sex","call"),subset = (race == "black" &  sex == "male"))
# Similarly, create objects BlackFemale, WhiteMale, and WhiteFemale. 
BlackFemale <- subset(resume,select = c("firstname","sex","call"),subset = (race == "black" &  sex == "female"))
WhiteMale <- subset(resume,select = c("firstname","sex","call"),subset = (race == "white" &  sex == "male"))
WhiteFemale <- subset(resume,select = c("firstname","sex","call"),subset = (race == "white" &  sex == "female"))
# Now let's do a comparison across genders.
# Calculate the difference in mean call rates between White/Black males, and between White/Black females. 
# Is there any gender-specific trend?
mean(WhiteFemale$call) - mean(BlackFemale$call)
mean(WhiteMale$call)  - mean(BlackMale$call)


## Part 4: Creating new variables
# Learning in this part will take place by running each line and figuring out what is happening.
# Here we create logical variables for a particular demographic.
resume$BlackFemale <- ifelse(resume$race == "black" & resume$sex == "female", 1, 0)
names(resume)
table(race = resume$race, sex = resume$sex, BlackFemale = resume$BlackFemale)
# If time, you can do the same for the other three classes.

# Instead, suppose we want one variable "type" that identifies each of the four demographics of interest.
resume$type <- NA
# What did that just do? run names(resume)
#created a new variable type 
names(resume)
resume$type[resume$race == "black" & resume$sex == "female"] <- "BlackFemale"
resume$type[resume$race == "black" & resume$sex == "male"] <- "BlackMale"
resume$type[resume$race == "white" & resume$sex == "female"] <- "WhiteFemale"
resume$type[resume$race == "white" & resume$sex == "male"] <- "WhiteMale"
# What did we just do? 
#assign different stirngs to the type according to the sex and race of the observation  
# check object class
class(resume$type)

## coerce resume$type into a factor variable
resume$type <- as.factor(resume$type)
class(resume$type)

## list all levels of the new factor variable
levels(resume$type)

# obtain the number of observations for each level
table(resume$type)
# What do you observe about balance between male and female names in the study?
# Now let's use tapply() to compare the mean call rates across demographics.
# The syntax for tapply() is:
#     tapply(data you want summarize with a stat function, how you want to separate the data, which stat you want to apply).
tapply(resume$call, resume$type, mean)

# Your turn to use tapply().
# Suppose we want to look at call rates across first names.
# First, check if firstname is recognized as a factor variable. If not, use as.factor() to coerce it.
class(resume$firstname)
# Second, generate an object callback.name equal to the mean call rate for each name (hint: use tapply() )
callback.name <- tapply(resume$call, resume$firstname, mean)
# Third, sort callback.name in increasing order using sort().
sort(callback.name)
# Bonus: complete the same analysis in which names are separated by demographic. Which names for each
#     of the four major demographics got the highest call rates?
