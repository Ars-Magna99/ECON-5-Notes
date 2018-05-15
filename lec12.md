```r
# Introduction to Social Data Analytics
# Zack Goodman
# Lecture 12 Group Activity
########################################

# Tips:
# The reading will be very helpful in completing this script.
# Remember to use help() if you cannot remember how a function works,
#     for example, help("mean")

#1: classes
# Create a vector containing a number and a string. What is its class?
# What is the class of the empty string, "" ? 
# What is the class of the empty vector, c() ?
vec1 <- c(1,"1")
class(vec1)

vec2 <- ("")
class(vec2)

vec3 <- c()
class(vec3)

#2: more classes
a <- c(0.5, 1.75, 2.15)
# There's a command: as.integer(). 
# What happens if you apply it to a vector "a", which contains decimals?
as.integer(a)
# What is the class of a?
class(a)
# Overwrite the third element of "a" as a text string (character).
a[3] <- as.character(a[3])
a
# What is the class of a now?
# Now make the third element of "a" a number again. What is the class of a now?

#3: logicals
logic1 = c(TRUE, TRUE, FALSE, TRUE)
logic2 = c(TRUE, FALSE, FALSE, FALSE)
# a) Evaluate logic1 | logic2 
# b) Evaluate logic1 & logic2 
# What do TRUE and FALSE translate into for integers?
# Is TRUE > FALSE? Why or why not? (hint: coercion)
# Coerce a) and b) to integers, sum, and take the difference, that is
#   compute sum(a) - sum(b). (hint: use as.integer())
# Is 5 < "a" ? Is 5 < "5" ? Why?

#4: subsetting
resume <- read.csv("https://raw.githubusercontent.com/kosukeimai/
           qss/master/CAUSALITY/resume.csv")
# Use summary() to explore the data. How many variables are there?
# Generate a table using table() of resume$race vs resume$call - 
#     first row should have 2278 157. 
# Add margins to the table with the addmargins() function.
# Calculate the mean call rates for blacks and whites using mean() and
#     logical operators. (hint: use [] to subset data.)
# Create a subset of the resume dataframe using subset() that is the
#     names and calls for only the white females. Do the same
#     for black females. You should have 1860 white females and 
#     1886 black females.
# Use mean() to compare the call rates for white and black females. You 
#     should find a difference of 0.3264.
# If time, complete the same calculations for white/black males.

```
