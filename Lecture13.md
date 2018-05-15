
```r
# Introduction to Social Data Analytics
# Zack Goodman
# Lecture 12 Group Activity
########################################

# Plotting in R - table/proptable, barplot, hist, boxplot
# Helpful formatting options: names.arg, main, xlab, ylab, abline, lines,
#       freq, breaks
# Reference: Imai 3.3
# 
# Tips:
# The reading will be very helpful in completing this script.
# Remember to use help() if you cannot remember how a function works,
#     for example, help("mean")


# Clear everything in memory
rm(list=ls())

## Set working directory
setwd(" /Users/ziyangwang/Desktop/R")
getwd()

# Load afghan.csv
afghan <- read.csv("afghan.csv")

# Explore data (data frame dimensions, variable names, summary stats, etc.)
dim(afghan)
names(afghan)
summary(afghan)


#-----------------------------------------------------------------------
## 1. table(), prop.table(table()), and barplot()
# What proportion of Afghanis have experienced violence by the ISAF?
# First, generate a table to compare levels of afghan$violent.exp.ISAF
ISAF.table <- table(afghan$violent.exp.ISAF, exclude = NULL)
ISAF.table

# Next, look at percentages of each category of afghan$violent.exp.ISAF
ISAF.ptable <- prop.table(table(afghan$violent.exp.ISAF,
                                exclude = NULL))
ISAF.ptable

# Now we want to visualize our findings as a barplot.
# Be sure to specify a title and axis labels.
barplot(ISAF.ptable,
names.arg = c("No harm", "Harm", "Nonresponse"), 
     main = "Civilian victimization by the ISAF",
      xlab = "Response category",
      ylab   = "Proportion of the respondents", 
      ylim = c(0, 0.7))

# Repeat the exercise for the victimization by Taliban 
#       (that is, use afghan$violent.exp.taliban)
Taliban.ptable <- prop.table(table(afghan$violent.exp.taliban,exclude = NULL))

barplot(Taliban.ptable,
names.arg = c("No harm", "Harm", "Nonresponse"), 
main      = "Civilian victimization by the Taliban",
    xlab  = "Response category",
    ylab = "Proportion of the respondents", 
    ylim  = c(0, 0.7)) 

#------------------------------------------------------------------------
## 2. hist()
# Create a histogram of respondent ages, and add a title + axes labels
hist(afghan$age, freq = FALSE, 
    ylim  = c(0, 0.04), 
    xlab  = "Age", 
    ylab  = "Percent",
    main  = "Distribution of Respondent Age")

# Create a histogram of education. Use `breaks' to choose bins. 
hist(afghan$educ.years, freq = FALSE, 
     breaks = seq(from = -0.5, to = 18.5, by = 1),
  ylab   = "Years of Education", 
  xlab    = "Frequency",
  main    = "Distribution of Respondent Education")

# Add a vertical line at the median education level using abline()
abline(v = median(afghan$educ.years))

# Add a text label "median" at (x, y) = (3, 0.5)
text(x = 3,y = 0.5,"median")

# Add a vertical line at the mean using lines()
lines(x = rep(mean(afghan$educ.years), 2), y = c(-100, 1500))

# Notice the use of rep(x, 2) - it duplicates the value of x twice as a 
#     vector so that the line goes from (x,y) = (mean, -100) to (mean, 1500)

# Can we create a histrogram for afghan$income? Why or why not?
#       Hint: check class(afghan$income)



#------------------------------------------------------------------------
## 3. boxplot()
# Make a box plot of years of education separated by province
boxplot(educ.years ~ province, 
data         = afghan, 
main     = "Education by Province", 
xlab         = "Province",
ylab         = "Years of Education")
# Which provinces are the most educated? Which ones have mean education == 0?
#2 provinces have very low education level.
# Make a boxplot of age separated by each district.
boxplot(age ~ district, 
data         = afghan, 
main       = "Age by District", 
xlab         = "District",
ylab         = "Age in Years")


#------------------------------------------------------------------------
## 4. plot()
# First, load the new data and explore a bit
congress <- read.csv("congress.csv")
head(congress, 10)
summary(congress)

# Subset the data by party
rep <- subset(congress, subset = (party == "Republican"))
dem <- congress[congress$party == "Democrat", ] # alternative method

# Further subset the data by party and by 80th and 112th congress
rep80 <- subset(rep, subset = (congress == 80))
dem80 <- subset(dem, subset = (congress == 80))
rep112 <- subset(rep, subset = (congress == 112))
dem112 <- subset(dem, subset = (congress == 112))

# Assign axis labels and limits to avoid repetition
xlab <- "Economic liberalism/conservatism"
ylab <- "Racial liberalism/conservatism"
lim <- c(-1.5, 1.5)

# Create a scatterplot for the 80th Congress of ideological leanings.
plot(1, type = "n", # Type "n" specifies no plotting
     = lim, 
     = lim, 
     = xlab, 
     = ylab,
     = "80th Congress")
points(, , = 16, = "blue") # democrats
points(, , = 17, = "red") # republicans
text(-0.75, 1, "Democrats")
text(1, -1, "Republicans")
```
