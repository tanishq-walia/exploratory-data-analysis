
R version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
Copyright (C) 2016 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Workspace loaded from /media/hduser/New Volume/course /course1/exploratory-data-analysis/.RData]

> 
        > 
        > library(swirl)

| Hi! I see that you have some variables saved in your workspace. To keep things running smoothly, I recommend you
| clean up before starting swirl.

| Type ls() to see a list of the variables in your workspace. Then, type rm(list=ls()) to clear your workspace.

| Type swirl() when you are ready to begin.

> swirl()

| Welcome to swirl! Please sign in. If you've been here before, use the same name as you did then. If you are new,
| call yourself something unique.

What shall I call you? tanishq

| Would you like to continue with one of these lessons?

1: Exploratory Data Analysis GGPlot2 Part1
2: Exploratory Data Analysis Graphics Devices in R
3: Getting and Cleaning Data Dates and Times with lubridate
4: Getting and Cleaning Data Grouping and Chaining with dplyr
5: Getting and Cleaning Data Manipulating Data with dplyr
6: R Programming Basic Building Blocks
7: R Programming Sequences of Numbers
8: No. Let me start something new.

Selection: 1

| Attempting to load lesson dependencies...

| Package ‘ggplot2’ loaded correctly!



| We'll start by showing how easy and versatile qplot is. First, let's look at some data which comes with the ggplot2
| package. The mpg data frame contains fuel economy data for 38 models of cars manufactured in 1999 and 2008. Run the
| R command str with the argument mpg. This will give you an idea of what mpg contains.

> str(mpg)
Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	234 obs. of  11 variables:
$ manufacturer: chr  "audi" "audi" "audi" "audi" ...
$ model       : chr  "a4" "a4" "a4" "a4" ...
$ displ       : num  1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...
$ year        : int  1999 1999 2008 2008 1999 1999 2008 1999 1999 2008 ...
$ cyl         : int  4 4 4 4 6 6 6 4 4 4 ...
$ trans       : chr  "auto(l5)" "manual(m5)" "manual(m6)" "auto(av)" ...
$ drv         : chr  "f" "f" "f" "f" ...
$ cty         : int  18 21 20 21 16 18 18 18 16 20 ...
$ hwy         : int  29 29 31 30 26 26 27 26 25 28 ...
$ fl          : chr  "p" "p" "p" "p" ...
$ class       : chr  "compact" "compact" "compact" "compact" ...

| Excellent work!

|============================                                                           |  32%

| We see that there are 234 points in the dataset concerning 11 different characteristics of the cars. Suppose we
| want to see if there's a correlation between engine displacement (displ) and highway miles per gallon (hwy). As we
| did with the plot function of the base system we could simply call qplot with 3 arguments, the first two are the
| variables we want to examine and the third argument data is set equal to the name of the dataset which contains
| them (in this case, mpg). Try this now.

> qplot(displ,hwy,data=mpg)

| Your dedication is inspiring!
        
        |==============================                                                         |  34%

| A nice scatterplot done simply, right? All the labels are provided. The first argument is shown along the x-axis
| and the second along the y-axis. The negative trend (increasing displacement and lower gas mileage) is pretty
| clear. Now suppose we want to do the same plot but this time use different colors to distinguish between the 3
| factors (subsets) of different types of drive (drv) in the data (front-wheel, rear-wheel, and 4-wheel). Again,
| qplot makes this very easy. We'll just add what ggplot2 calls an aesthetic, a fourth argument, color, and set it
| equal to drv. Try this now. (Use the up arrow key to save some typing.)

> qplot(displ,hwy,data=mpg,col=drv)

| You're close...I can feel it! Try it again. Or, type info() for more options.

| Type qplot(displ, hwy, data = mpg, color = drv) at the command prompt.

> qplot(displ,hwy,data=mpg,color=drv)

| You are amazing!
        
        |================================                                                       |  37%

| Pretty cool, right? See the legend to the right which qplot helpfully supplied? The colors
| were automatically assigned by qplot so the legend decodes the colors for you. Notice that
| qplot automatically used dots or points to indicate the data. These points are geoms
| (geometric objects). We could have used a different aesthetic, for instance shape instead of
| color, to distinguish between the drive types.

...

|==================================                                                     |  39%

| Now let's add a second geom to the default points. How about some smoothing function to
| produce trend lines, one for each color? Just add a fifth argument, geom, and using the R
| function c(), set it equal to the concatenation of the two strings "point" and "smooth". The
| first refers to the data points and second to the trend lines we want plotted. Try this now.

> qplot(displ,hwy,data=mpg,color=drv,geom = c("point","smooth"))

| You are really on a roll!

|====================================                                                   |  41%

| Notice the gray areas surrounding each trend lines. These indicate the 95% confidence
| intervals for the lines.

...

|======================================                                                 |  44%

| Before we leave qplot's scatterplotting ability, call qplot again, this time with 3 arguments.
| The first is y set equal to hwy, the second is data set equal to mpg, and the third is color
| set equal to drv. Try this now.


        > qplot(y=hwy, data = mpg, color = drv) 

| Nice work!
        
        |========================================                                               |  46%

| What's this plot showing? We see the x-axis ranges from 0 to 250 and we remember that we had
| 234 data points in our set, so we can infer that each point in the plot represents one of the
| hwy values (indicated by the y-axis). We've created the vector myhigh for you which contains
| the hwy data from the mpg dataset. Look at myhigh now.

> qplot(y=hwy,data=mpg,color=drv)

| One more time. You can do it! Or, type info() for more options.

| Type myhigh at the command prompt.

> myhigh
[1] 29 29 31 30 26 26 27 26 25 28 27 25 25 25 25 24 25 23 20 15 20 17 17 26 23 26 25 24 19 14
[31] 15 17 27 30 26 29 26 24 24 22 22 24 24 17 22 21 23 23 19 18 17 17 19 19 12 17 15 17 17 12
[61] 17 16 18 15 16 12 17 17 16 12 15 16 17 15 17 17 18 17 19 17 19 19 17 17 17 16 16 17 15 17
[91] 26 25 26 24 21 22 23 22 20 33 32 32 29 32 34 36 36 29 26 27 30 31 26 26 28 26 29 28 27 24
[121] 24 24 22 19 20 17 12 19 18 14 15 18 18 15 17 16 18 17 19 19 17 29 27 31 32 27 26 26 25 25
[151] 17 17 20 18 26 26 27 28 25 25 24 27 25 26 23 26 26 26 26 25 27 25 27 20 20 19 17 20 17 29
[181] 27 31 31 26 26 28 27 29 31 31 26 26 27 30 33 35 37 35 15 18 20 20 22 17 19 18 20 29 26 29
[211] 29 24 44 29 26 29 29 29 29 23 24 44 41 29 26 28 29 29 29 28 29 26 26 26

| All that practice is paying off!
        
        |==========================================                                             |  49%

| Comparing the values of myhigh with the plot, we see the first entries in the vector (29, 29,
                                                                                        | 31, 30,...) correspond to the leftmost points in the the plot (in order), and the last entries
| in myhigh (28, 29, 26, 26, 26) correspond to the rightmost plotted points. So, specifying the
| y parameter only, without an x argument, plots the values of the y argument in the order in
| which they occur in the data.

...

|=============================================                                          |  51%

| The all-purpose qplot can also create box and whisker plots.  Call qplot now with 4 arguments.
| First specify the variable by which you'll split the data, in this case drv, then specify the
| variable which you want to examine, in this case hwy. The third argument is data (set equal to
| mpg), and the fourth, the geom, set equal to the string "boxplot"

> qplot(drv,hwy,data=mpg,geom="boxplot" )

| You are doing so well!

|===============================================                                        |  54%

| We see 3 boxes, one for each drive. Now to impress you, call qplot with 5 arguments. The first
| 4 are just as you used previously, (drv, hwy, data set equal to mpg, and geom set equal to the
| string "boxplot"). Now add a fifth argument, color, equal to manufacturer.

> qplot(drv,hwy,data=mpg,geom="boxplot" ,color=manufacturer)

| That's correct!
        
        |=================================================                                      |  56%

| It's a little squished but we just wanted to illustrate qplot's capabilities. Notice that
| there are still 3 regions of the plot (determined by the factor drv). Each is subdivided into
| several boxes depicting different manufacturers.

...

|===================================================                                    |  59%

| Now, on to histograms. These display frequency counts for a single variable. Let's start with
| an easy one. Call qplot with 3 arguments. First specify the variable for which you want the
| frequency count, in this case hwy, then specify the data (set equal to mpg), and finally, the
| aesthetic, fill, set equal to drv. Instead of a plain old histogram, this will again use
| colors to distinguish the 3 different drive factors.

> qplot(hwy, data=mpg,fill=drv         )
`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

| You got it right!

|=====================================================                                  |  61%

| See how qplot consistently uses the colors. Red (if 4-wheel drv is in the bin) is at the
| bottom of the bin, then green on top of it (if present), followed by blue (rear wheel drv).
| The color lets us see right away that 4-wheel drive vehicles in this dataset don't have gas
| mileages exceeding 30 miles per gallon.

...

|=======================================================                                |  63%

| It's cool that qplot can do this so easily, but some people may find this multi-color
| histogram hard to interpret. Instead of using colors to distinguish between the drive factors
| let's use facets or panels. (That's what lattice called them.) This just means we'll split the
                               | data into 3 subsets (according to drive) and make 3 smaller individual plots of each subset in
                               | one plot (and with one call to qplot).
                               
                               ...
                               
                               |=========================================================                              |  66%
                               
                               | Remember that with base plot we had to do each subplot individually. The lattice system made
                               | plotting conditioning plots easier. Let's see how easy it is with qplot.
                               
                               ...
                               
                               |===========================================================                            |  68%
                               
                               | We'll do two plots, a scatterplot and then a histogram, each with 3 facets. For the
                               | scatterplot, call qplot with 4 arguments. The first two are displ and hwy and the third is the
                               | argument data set equal to mpg. The fourth is the argument facets which will be set equal to
                               | the expression . ~ drv which is ggplot2's shorthand for number of rows (to the left of the ~)
                               | and number of columns (to the right of the ~). Here the . indicates a single row and drv
                               | implies 3, since there are 3 distinct drive factors. Try this now.
                               
                               > qplot(drv,hwy,data=mpg,facets = .~drv )
                               
                               | Not exactly. Give it another go. Or, type info() for more options.
                               
                               | Type qplot(displ, hwy, data = mpg, facets = . ~ drv) at the command prompt.
                               
                              
                               > qplot(displ, hwy, data = mpg, facets = . ~ drv)
                               
                               | You nailed it! Good job!
                               
                               |==============================================================                         |  71%
                               
                               | The result is a 1 by 3 array of plots. Note how each is labeled at the top with the factor
                               | label (4,f, or r). This shows us more detailed information than the histogram. We see the
                               | relationship between displacement and highway mileage for each of the 3 drive factors.
                               
                               ...
                               
                               |================================================================                       |  73%
                               
                               | Now we'll do a histogram, again calling qplot with 4 arguments. This time, since we need only
                               | one variable for a histogram, the first is hwy and the second is the argument data set equal
                               | to mpg. The third is the argument facets which we'll set equal to the expression drv ~ . .
                               | This will give us a different arrangement of the facets. The fourth argument is binwidth. Set
                               | this equal to 2. Try this now.
                              
                               | Type qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2) at the command prompt.
                               
                               > qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2)
                               
                               | You're the best!
                                       
                                       |==================================================================                     |  76%
                               
                               | The facets argument, drv ~ ., resulted in what arrangement of facets?
                               
                               1: 1 by 3
                               2: 2 by 2
                               3: huh?
                               4: 3 by 1
                               
                               Selection: 4
                               
                               | You got it right!
                                       
                                       |====================================================================                   |  78%
                               
                               | Pretty good, right? Not too difficult either. Let's review what we learned!
                               
                               ...
                               
                               |======================================================================                 |  80%
                               
              
                               
                               | Which function did we invoke the most in this lesson?
                               
                               1: hist
                               2: scatterplot
                               3: xyplot
                               4: qplot
                               5: gplot
                               
                               Selection: 4
                               
                               | Excellent job!
                               
                               |========================================================================               |  83%
                               
                               | Which types of plot does qplot plot?
                               
                               1: box and whisker plots
                               2: histograms
                               3: all of the others
                               4: scatterplots
                               
                               Selection: 3
                               
                               | Perseverance, that's the answer.
                               
                               |==========================================================================             |  85%
                               
                               | What does the gg in ggplot2 stand for?
                               
                               1: grammar of graphics
                               2: good graphics
                               3: good grief
                               4: goto graphics
                               
                               Selection: 1
                               
                               | Your dedication is inspiring!
                                       
                                       |============================================================================           |  88%
                               
                               | True or False? The geom argument takes a string for a value.
                               
                               1: False
                               2: True
                               
                               Selection: 2
                               
                               | You got it right!
                                       
                                       |===============================================================================        |  90%
                               
                               | True or False? The data argument takes a string for a value.
                               
                               1: False
                               2: True
                               
                               Selection: 1
                               
                               | Perseverance, that's the answer.
                               
                               |=================================================================================      |  93%
                               
                               | True or False? The binwidth argument takes a string for a value.
                               
                               1: False
                               2: True
                               
                               Selection: 1
                               
                               | Great job!
                               
                               |===================================================================================    |  95%
                               
                               | True or False? The user must specify x- and y-axis labels when using qplot.
                               
                               1: False
                               2: True
                               
                               Selection: 1
                               
                               | You are really on a roll!
                               
                               |=====================================================================================  |  98%
                               
                               | Congrats! You've finished plot 1 of ggplot2. In the next lesson the plot thickens.
                               
                               ...
                               
                               |=======================================================================================| 100%
                               
                               | Would you like to receive credit for completing this course on Coursera.org?
                               
                               1: No
                               2: Yes
                               
                               Selection: 2
                               What is your email address? walia.tanishq@gmail.com
                               What is your assignment token? TVQ2UCFzrSWsPbio
                               Grade submission succeeded!
                                       
                                       | You got it right!
                                       
                                       | You've reached the end of this lesson! Returning to the main menu...

| Would you like to continue with one of these lessons?

1: Exploratory Data Analysis Graphics Devices in R
2: Getting and Cleaning Data Dates and Times with lubridate
3: Getting and Cleaning Data Grouping and Chaining with dplyr
4: Getting and Cleaning Data Manipulating Data with dplyr
5: R Programming Basic Building Blocks
6: R Programming Sequences of Numbers
7: No. Let me start something new.