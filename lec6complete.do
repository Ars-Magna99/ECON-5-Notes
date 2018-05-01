/*	Econ 5/Poli 5D Lecture 6
	In-class Small Group Activity
	April 18, 2018
	
Instructions:
Below is some partially completed code. Using the comments as a guide,
finish the code. Remember to use the "help" command when needed. I 
recommend trying each line of code in the command window before moving on
in the do file. You may ask questions and help others around you.
********************************************************************/

// Start-up commands
capture log close
clear

/*******************************************************************/

//1. Change your directory to the correct path.
cd "C:\Users\Owner\Documents\UCSD\Econ 5\Lectures\6"

//2. Create a log file
log using lec6log.txt, text replace

//3. Load happiness.dta
use happiness.dta

//4. Eliminate the variables fiscalfree, milspending, and cty
drop fiscalfree milspending cty

//5. Show summary statistics for the variables happins, govt_size, and area
sum happins govt_size area

//6. Create a new variable called "avg_happins" = mean(happins)
egen avg_happins = mean(happins)

//6.5 Show the value of ln_happins
display avg_happins

//7. Create a new variable called "ln_happins" = ln(happins)
gen ln_happins = ln(happins)

//7.5 Add a label to ln_happins (in quotes below)
//注意一下，这里很容易忘记写中间的var.记住，label和rename有区别，固定格式是“ label var 变量名 “目标标签”   ”
label var ln_happins "Natural logarithm of the happiness index"

//7.75 Create a variable "happins_high" = 1 if >3.3, otherwise 0, and
// label appropriately
gen happins_high = 1 if happins > 3.3
replace happins_high = 0 if happins <= 3.3

//8. Change the name of country_name to countryname
rename country_name countryname

//8.5 Show the first 10 country names in alphabetical order
list countryname in 1/10

//9. Show the country names whose happins is greater than 3.4
//	(should have 8 total)
list countryname if happins > 3.4

//9.5 Show the country names whose happins is greater than 3.5 OR less than
//	2.5 (should have 5 total)
list countryname if happins > 3.5 | happins < 2.5

//10. Show the frequency of values for financialfree when proprights = 90 and 
//	happpins > 3 (should have 20 observations total)
tab financialfree if proprights == 90 & happins > 3


log close
