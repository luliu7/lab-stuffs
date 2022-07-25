# Lab stuffs
Scrmshaw -> pCRMeval for Summer 2022 

The following R code creates graphs analyzing the data:

* [creating-plots.R](https://github.com/luliu7/lab-stuffs/blob/main/creating-plots.R) creates Box and Whisker plots
  * All methods Percentage Training Set Sensitivity (neg vs orig)
  * All methods Percentage Redfly Recovered (neg vs orig)
  * imm only Percentage Training Set Sensitivity (neg vs orig)
  * imm only Percentage Redfly Recovered (neg vs orig)
  * Per method Percentage Training Set Sensitivity (comparing across methods)
  * Per method Percentage Redfly Recovered (comparing across methods)
  
* [Individual-plots.R](https://github.com/luliu7/lab-stuffs/blob/main/Individual-plots.R) creates bar graphs comparing between each method with some options
  * ```showmethods = TRUE``` allows the graphs to show the individual percentages per method. (Default is FALSE)
  * Original All Methods Percent Redfly Recovered (comparing across methods)
  * Negative All Methods Percent Redfly Recovered (comparing across methods)
  * Original All Methods Percent Training Set Sensitivity (comparing across methods)
  * Negative All Methods Percent Training Set Sensitivity (comparing across methods)
  
* [NegvsOrig.R](https://github.com/luliu7/lab-stuffs/blob/main/NegvsOrig.R) creates bar graphs for each training set comparing between negative and original
  * **_Note that sometimes line 37 doesn't run ("All methods Percent Redfly Recovery"), so you'll need to rerun that one line_**
  * All Methods Percent Redfly Recovered (neg vs orig)
  * All Methods Percent Training Set Sensitivity (neg vs orig)
  * Imm Methods Percent Redfly Recovered (neg vs orig)
  * Imm Methods Percent Training Set Sensitivity (neg vs orig)
____________________________
* [individual-methods-new.R](https://github.com/luliu7/lab-stuffs/blob/main/individual-methods-new.R) creates bar graphs for each training set comparing between negative and original
  * **_Note that sometimes line 37 doesn't run ("All methods Percent Expression Pattern Precision"), so you'll need to rerun that one line_**
  * All Methods Percent Expression Pattern Precision (neg vs orig)
  * All Methods Percent Expression Pattern Recall (neg vs orig)
  * Imm Methods Percent Expression Pattern Precision (neg vs orig)
  * Imm Methods Percent Expression Pattern Recall (neg vs orig)
  
* [boxplot-othertwo.R](https://github.com/luliu7/lab-stuffs/blob/main/boxplot-othertwo.R) creates Box and Whisker plots
  * All methods Percent Expression Pattern Recall (neg vs orig)
  * All methods Percent Expression Pattern Precision (neg vs orig)
  * imm only Percent Expression Pattern Recall (neg vs orig)
  * imm only Percent Expression Pattern Precision (neg vs orig)
  * Per method Percent Expression Pattern Recall (comparing across methods)
  * Per method Percent Expression Pattern Precision (comparing across methods)
  
________________________________
* **[All-in-one.R](https://github.com/luliu7/lab-stuffs/blob/main/boxplot-othertwo.R)** places the boxplots from [creating-plots.R](https://github.com/luliu7/lab-stuffs/blob/main/creating-plots.R) and [boxplot-othertwo.R](https://github.com/luliu7/lab-stuffs/blob/main/boxplot-othertwo.R) onto one single plot
 * For all methods and Imm methods, in order of:
  * Percent Sensitivity
  * Percent Redfly Recovery
  * Percent Expression Pattern Recall
  * Percent Expression Pattern Precision
