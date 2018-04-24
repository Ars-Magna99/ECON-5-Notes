 
 

 
 *get data from a website
 infile str14 country setting effort change ///
 using http://data.princeton.edu/wws509/datasets/effort.raw, clear
 
 * paint a simple scattorplot ,specify y first, then x
 graph twoway scatter change setting
 
 * paint a fitted regression line
 graph twoway (scatter setting effort) /// 
              (lfit setting effort)
 //graph twoway (scatter change setting)||(lfit change setting)
 
 *put confidence bands
 graph twoway (lfitci setting effort) ///
              (scatter setting effort)

 *label the y-axis and turn-off the legend
 graph twoway (lfitci setting effort) ///
             (scatter setting effort) ///
           , ytitle("Fertility Decline") legend (off) 
 * mark the point 
  graph twoway (lfitci setting effort) ///
                (scatter setting effort, mlabel(country))
				
 * change the position of the label
   gen pos=3
   replace pos = 11 if country == "TrinidadTobago"
   replace pos = 9 if country == "CostaRica"
   replace pos = 2 if country == "Panama" | country == "Nicaragua"
	
   graph twoway (lfitci change setting) ///
         (scatter change setting, mlabel(country) mlabv(pos) ) 	
		 
 * complete version
     graph twoway (lfitci change setting) ///
     (scatter change setting, mlabel(country) mlabv(pos) ) ///
     ,title("Fertility Decline by Social Setting") ///
     ytitle("Fertility Decline") ///
     legend(ring(0) pos(5) order(2 "linear fit" 1 "95% CI")) 
	 
 * using data on U.S. life expectanc
   sysuse uslifeexp,clear
 * 
   graph twoway line le_bmale le_wmale year ///
          ,title("U.S life expectancy") subtitle("Males") ///
		  legend(order(1 "black" 2 "white"))
		  
 * graph twoway line le_wmale le_bmale year ///
    , title("U.S. Life Expectancy") subtitle("Males") ///
      legend( order(1 "white" 2 "black") ring(0) pos(5) )
	  
 * bar graph
   sysuse citytemp,clear
   graph bar tempjan tempjul, over(region)  bargap(10) intensity(70) ///
   title("mean temperature") legend(order(1 "january" 2 "july"))
 * 
   forvalues i=1/4 {
      capture drop x`i' d`i'
      kdensity tempjan if region== `i', generate(x`i'  d`i')
   }
   gen zero = 0
   
  *
  twoway rarea d1 zero x1, color("blue%50") ///
   ||  rarea d2 zero x2, color("purple%50") ///
   ||  rarea d3 zero x3, color("orange%50")  ///
   ||  rarea d4 zero x4, color("red%50") ///
         title(January Temperatures by Region) ///
         ytitle("Smoothed density") ///
       legend(ring(0) pos(2) col(1) order(2 "NC" 1 "NE" 3 "S" 4 "W")) 
   
		  
	 
