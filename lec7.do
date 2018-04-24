第七节课的笔记和主要任务
本节课主要学习了一些简单的STATA制图命令。
比如
graph twoway line [yvar] [xvar], options
graph twoway scatter [yvar] [xvar],options
graph bar [yvar1] [yvar],over[] options
graph box [yvar]],over [] options

//name()
  lcolor()
  legend(order())
  box (1,fcolor(orange) lcolor(green))
  



/*	Econ 5/Poli 5D, Lecture 7
	Zack Goodman
	In-class Team Activity
	April 23, 2018
	
Instructions:
Below is some partially completed code. Using the comments as a guide,
finish the code. Remember to use the "help" command when needed. I 
recommend trying each line of code in the command window before moving on
in the do file. You may ask questions and help others around you.
********************************************************************/

// Start-up commands
capture log close
clear all

/*******************************************************************/

*	Change your directory
cd "/Users/ziyangwang/Desktop/STATA"


/*	Start a log called lec3.txt Remember to use the options that make the 
	log file txt format and overwrite exisiting files of the same name.*/
log using lec3.txt, text replace

*	Open the built-in dataset uslifeexp (done for you)
	sysuse uslifeexp


/*	Explore the dataset a bit - check out what variables are present, what 
	values they take, how many observations, etc.*/
    br
	
/*	Time for some plots! Recall the general format for plots in Stata:
	graph [twoway] graphtype argument
	Remember to use the help command if you forget the syntax.*/
	
*	Start up command to avoid error messages
	graph drop _all

	/*	1. Plot a line graph of U.S. life expectancy versus time. Add a title
		relevant to the graph. Capitalize the y-axis title. Name the plot.*/
    graph twoway line le year, name("g1") ///
	title("U.S. life expectancy versus time") ///


	/*	2. Plot two line graphs, in the same coordinate axes, of male and female
		life expectancy. Add a title, capitalize the y-axis title, add a legend,
		and name the plot. Change the colors of the two lines to colors other 
		than blue and red.*/
		graph twoway  line le_male le_female year  ///
		              , title("U.S. life expectancy versus time") ///
					  name("g2") ///
			          ytitle("Life exprectancy") ///
					  xtitle("Year") ///
					  legend(order(1 "male" 2 "female")) ///
					  lcolor(orange green)
					

	
	/* 	3. Now let's combine your two plots into the same screen using 
		graph combine. Remember to name your plot. */
		graph combine g1 g2, name("g3")

/* 	Now we are going to switch datasets to try a different kind of plot.
	Feel free to explore the dataset to get a feel for the variables.*/
	    sysuse citytemp, clear
	
	/*	4. Plot a bar graph of the average temperature in both January and 
		July for all divisions (in the same plot). Create a sensible title, 
		legend, and axis titles. Change the colors to something other than 
		the default. Bonus: overlap the bars within the same region to 
		save space. HINT: use the option "nofill" to remove the empty columns.*/
	    graph bar tempjan tempjuly ,over(division) ///
		          name("g4") ///
title("Average temperature in both January and July for all divisions") ///
         legend(order(1 "Average January Temperature" 2 "Average July Temperature")) ///
		 ytitle("Temperature")
		             
	
	/*	5. Create box plots for July temperatures for each of the divisions.
		Change the color to something other than the default. Add a title and
		axis titles. */
		graph box tempjuly ,over(division) ///
		name("g5") ///
		title("Box plots for July temperatures for each of the divisions") ///
		box (1,fcolor(orange) lcolor(green))

	
* close log
log close
