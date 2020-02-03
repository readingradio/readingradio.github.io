# Day 1. Programming Basics

#Geoff Williams
#Purdue University 2020

#**Note**: you have options of how you want to run through the script during the tutorial.

#1. Copy and paste from web page (suggested, but you have to go line-by-line in order, and if you skip/miss a #line some of the following lines will not work).

#2. Download the `.R` file and run the code in basic R (not R Studio) by pressing CTRL-Enter (PCs) or Command-Enter (Macs)

#3. Download the `.Rmd` file and run the code line-by-line from the script in Rstudio by pressing the Run button . You will have to install and load packages `knitr` and `rmarkdown`.
#    + `install.packages(c('knitr','rmarkdown'))`
#    + `library(knitr)`
#    + `library(rmarkdown)`

## What is a programming language?

#A programming language is a way of telling a computer what to do. In spoken languages, like English and Spanish, basic sentence structure, technically called **syntax**, includes a subject, a verb, and an object. For example,

#> The dog (subject) fetched (verb) a bone (object)

#In the same sense, programming languages have **syntax**. This syntax mainly consists of **variables** or **objects**, **operators**, and **functions**. Variables are like subjects and objects, and operators and functions are analagous to imperative verbs. In every line of code, you are telling the computer what to do. However, it is important to remember that unlike a spoken language, you have to tell the computer *exactly* what you want it to do.

## Input-Output and operators

#When you are running R, it will *evaluate* each line by line (**input**) you enter in the console, and print the results (**output**). On the next line. If you start a line with a hashtag (`#`), it tells R that the line is a *comment* and won't run it.


## Mathematical operations
5 + 6
5 / 6
5 %/% 6 # Just the numerator
5 %% 6  # Modulo
6 %% 5  # Modulo
10 %% 5 # Modulo

## Logical operations
5 < 6
5 < 5
5 <= 5
TRUE & FALSE
TRUE | FALSE
FALSE | FALSE

## Use of parentheses
(5 + 5) / 2 >= 6


#In R, the most important operator is the arros `<-` which allows you to *re-route the output from a line, and store it in an object*. Every time you use `<-` you create a new object, which you can name anything you want. However, if there is already another *with the same name* in the R Environment (the memory space) of your current session, *using `<-` with that object name will replace it with the new output*. The syntax is such that what ever is on the right side is the **input**, and the left side is the name of the object where you want to store the **output**:

#> `New.object <- Line.of.operations`

#> `(Input)    <-     (Output)`



# make some objects
obj  <- 5
blah <- 6
my.little.pony <- 10

# do stuff with them
obj + blah
my.little.pony * blah
obj < blah

# replace some of your objects with new obj
obj <- obj + 1
obj
obj <- obj + 1
obj

# if you mess up, R is too stupid to figure  it out
my.littl.pony * blah


#Notice that in the last line, we produced an error. It is important to get used to reading errors. In this particular error, it said `'my.littl.pony' not found` because an object named `my.littl.pony` was never created. We made a typo, and R spit out an error at us. Correcting that error is called **debugging**.

## Some other types of objects

#Now we are going to get into more advanced objects. So far, we have just worked with 0-dimensional numeric objects. However, we can also store other types of data, like a `character` or a `logical`, or we can create an object called a `vector` which is a bunch of values of the same type (i.e., all `numeric`, all `character` or all `logical`).


# Make some logical and character objects
isfivelessthanfive <- 5 < 5
isfivelessthanfive
whatismyname <- "Geoff"
whatisyourname <- "Scott"
name2 <- "Scott"
whatismyname == whatisyourname
name2 == whatisyourname


#**Functions** are another, special type of object that takes input (whatever is inside the parentheses), does something with it, and makes output. Functions can have any name just like `logical` and `character` but instead of containing data, they contain code that tells the computer what to do with whats inside the parentheses. When you start R, there are *many* useful, built-in functions that are already in the memory. You can check what type of object something is with the `class()` function.


class(isfivelessthanfive)
class(name2)
class(blah)

# functions are special types of objects
class(class)


#**Vectors**. The function `c()` is very important, because it creates a vector. For **input** it takes objects of the same type, inside the parentheses, separated by commas, and then as **output** it generates a vector. You can check how many things are inside an object with the `length()` function.


# Make vectors
digits <- c(3,1,4,1,5,9)
people <- c("Brian", "Evan", "Lynne", "Geoff")

# See what inputs in there and how long
digits
length(digits)

# Add to the vector
digits <- c(digits, 2)
digits
length(digits)

c(people, "Nick")


#All the values in a vectors have **indices**. You can access objects in a vector with *brackets*, `[]` by putting the index number you want inside the bracket.


people[1]
people[3]
digits[6]
digits[7]
digits[8]
digits[c(1,2)]
digits[c(1,2,3)]

# We can perform operations on vectors, and they apply to all the members
digits
digits + 1
digits * 2

digits[8] + 1


#Remember that R will try to do stuff, even if its not what we want. Since we haven't created an 8th index of `digits` we don't have the ability to call that index, and we get `NA`.

#**Note** You can also create a vector with a **colon**.


1:10
1:10 / 2
1:20 - 1


## More advanced objects

#**Matrices** are like vectors but are 2-dimensional objects. The easiest way to create a `matrix` is with the `matrix()` function, which you can tell the number of rows an columns you want in your `matrix`. You can index a matrix with brackets like a vector, but with a row and column separated by a comma.

#> `Name.of.matrix.object[row, column]`

#When you leave the first number in the brackets empty (`[,n]`) you return the conents of the nth column as a `vector`. You can get the nth row by leaving the second part empty (`[,n]`). When you put `[,n]` or `[,n]` on the left side of the `<-` operator, R will populate just the nth column or nth row, respectively. If you leave both row and column blank, it will populate the matrix column by column. 


# Create the matrix
my.matrix <- matrix(nrow=3, ncol=3)
my.matrix

# Populate the matrix
my.matrix[,] <- c(1,1,1,2,2,2,3,3,3)
my.matrix

# Change the 3rd row of the matrix
my.matrix[3,] <- c(4,5,6)
my.matrix

# Use indices to access values in the matrix
my.matrix[1,1]
my.matrix[1,2]
my.matrix[3,1]

# Get a row
my.matrix[,2]

# Get a column
my.matrix[,3]

# Second and third values of second column
my.matrix[2:3,2]


## Tangent: How to read a help page

#Check out the **syntax** for the `matrix()` function, or any other function, by typing a `?` and then the name of the function.


?matrix


#**Description** gives a brief description of what a function does.

#**Usage** provides the syntax. Note that by default, `data = NA`, `nrow = 1`, `ncol = 1`, and `byrow = FALSE`.


## If you type in matrix() with no arguments, you get a 1-by-1 matrix containing NA
matrix()

## If you specify byrow = T, you can populate the matrix by row instead of by column
people
matrix(people, 2, 2)
matrix(people, 2, 2, TRUE)


##**Arguments** are the things you put inside the parenteses when you call a function. On the help page, it tells you what you are allowed to pass as **input**. Note that when you leave out the names of **arguments** when you are calling the function `matrix`, R knows what you are telling it to do based on the order of the **arguments**. If you want to give the **arguments** of the function out of order, you have to specify their names.

#**Details** tells you additional information you might need to understand what a function is doing.

## Manipulating data

#Sometimes, you might want to figure out where a value is in your matrix, or just pull out certain parts of the matrix that match a given value. You can do this with a logical, or with the `which()` command.


# You can make matrices of characters or logicals as well
ppl.matrix <- matrix(people, 2, 2)
ppl.matrix
is.brian <- matrix(people == "Brian", 2, 2)
is.brian

# When you pass a logical to a matrix or vector of the same length, R returns the values for which the input was TRUE
ppl.matrix[is.brian]

# You can do the same with a vector
digits
digits == 9
digits[digits == 9]

# Or you can use the which() command to store the indices for which the logical expression is TRUE
which(digits == 1)
i <- which(digits == 1)
j <- which(digits > 1)
digits
digits[i]
digits[j]


#The **`rownames()`** and **`colnames`** can be used to assign names to columns and rows of a matrix. Instead of using numbers or the which command you can also call columns and rows by their names.


colnames(ppl.matrix)<-c('Teenagers', 'Adults')
ppl.matrix

# Call the column of Xavier alumni
ppl.matrix[, "Adults"]


### Matrix Excercise (10 min)

#> Create a 2-by-3 matrix with a *new* name and populate it row by row with the vector `digits` we created earlier.

#> Create another 2-by-3 matrix with a *different* name and populate it column by column with the values of `digits`.

#> Use the `which()` command to find the index of the value `5` in each of your new matrices.

#> Question: What does which() return for matrices? Compare results from each matrix (by row and column). Use `?which` if needed. (Hint: a matrix is a special, 2-dimensional case of an array)


which(ppl.matrix=="Geoff")
which(ppl.matrix=="Geoff", arr.ind=T)
ppl.matrix


#**Lists** are a totally different type of object where you can basically put lots of different things together, with names, in order. Unlike vectors, matrices, etc. each element of a list can be a completely different type of object, including matrices, vectors, functions, or any type of object you want. To create access the nth element in a list, you can:
#  + use the `$` operator followed by its name.
#  + use double brackets (`[[]]`) with the name or index number of the element inside

#> `Name.of.list.object$Name.of.element <- Value`

#> `Name.of.list.object[['Name.of.element']] <- Value`

#> `Name.of.list.obnject[[n]]`

#Note that if you are adding things to a list without an order, the operators above will add each new element


All.the.stuff <- list()
All.the.stuff$digs <- digits
All.the.stuff[['ppl']]  <- people
All.the.stuff$ppl.mat <- ppl.matrix

# You can even put a function in a list
All.the.stuff$f <- colnames

All.the.stuff$ppl.mat
All.the.stuff$ppl
All.the.stuff$f


#Note that when you type in the name of a function object, R outputs the code! This can be very useful.

#**Data Frames** are essentially a hybrid between a matrix and a special case of lists. Each column of a data frame can be a different type of data (i.e., `character`, `logical`, `numeric`) but they all have to be the amse length. You call a column or create a new column with its name after the `$` or its name or number inside single brackets `[,'name']`. You can create a data frame with the `data.frame()` function. Type `?data.frame` to see what type of arguments to give it. 


# Create a new dataframe
new.one <- data.frame(ppl = people, numbers = digits[1:4])
new.one
new.one$numbers

# Add a new column
new.one$lastname <- c("Rago", "Rago", "Frederickson", "Williams")
new.one$job <- c("College", "Highschool", "Real job", "Grad student")
new.one


## More functions

#**`paste()`** Strings things together, separated by whatever you specify in the `sep` argument (default is a whitespace, or `sep = " "`). Type `?paste` to see what type of arguments to give it. Note that in the documentation pages for both `data.frame()` and `paste()` the **Usage** area includes an ellipse `...` as the first argument. If you read **Arguments** you will see that you can provide an unlimited number of character objects to the `paste()` followed by `sep`.


paste(new.one$ppl[1], new.one$ppl[2], new.one$ppl[3])
paste(new.one$ppl[1], new.one$ppl[2], new.one$ppl[3], sep = " and ")

# The 'collapse' argument allows you to give a vector
paste(new.one$ppl[1:3], collapse=" and ")
paste(new.one$ppl, collapse=" and ")


#**`readline()`** Takes use input, and its output can be redirected into an object with `<-` like any other function. Try putting a number, and then try putting a character, into new.one$numbers, and then check it with the `class()` function to see what type of data type. *How does R deal with code that sticks a character in a numeric object?*


## new.one$numbers is a numeric
class(new.one$numbers)

## enter a number as input on the command prompt and see what happened
new.one$numbers[1] <- readline()
new.one
class(new.one$numbers)

## now do the same thing but enter a character
new.one$numbers[1] <- readline()
new.one
class(new.one$numbers)


#**`grep()`** Is fun because it can search for different types of strings or other values.


new.one
grep("Rago", new.one$lastname)
grep("Rago", new.one$lastname)

# If you give it a matrix or data frame, grep returns the number of the matching
columns <- grep("ll", new.one)
new.one[,columns]
rows <- grep("ll", new.one[,columns[1]])
new.one[rows, columns[1]]
rows2 <- grep("ll", new.one[,columns[2]])
new.one[rows2, columns[2]]


### Function Excercise 1 (10 min)

#> Read in three characters using `readline()` into three separate objects called `subj`, `verb`, and `obj`.

#> Put subj, verb, and obj together in a vector of length 3 called `words`.

#> String them together with `paste()` to make a sentence, and store that in a new object `sent`.

#> Use `grep()` to find a pattern in common between multiple elements in `words`.

## Reading in data

#The **`read.csv()`** function is useful. First check that you are in the right drive, and if not, navigate to the proper directory where you have stored the files for the workshop. You can scroll down to Session > Set Working Directory or use `getwd()` and `setwd()` on the command line to see what directory R is working in, and change the directory if necessary.


getwd()
setwd("/Users/will1809/OneDrive/R Workshop")
beetles <- read.csv("WillGinzEnvEnt2019.Fall.csv")


#**`head()`** Looks at just the first six, or a different number of rows specified by `n=`.

#**`names()`** returns the same thing as `colnames()`.

#**`sum()`** sums everything in a vector or matrix up.

#**`rowSums()`** returns a vector containing row sums.

#**`summary()`** computes a nice summary of each column in a data frame.


head(beetles)
names(beetles)
sum(beetles[,-c(1,2)])
rowSums(beetles[,-c(1,2)])
beetles$Total <- rowSums(beetles[,-c(1,2)])
summary(beetles)


## Install, load, and use a package

#Go to `https://cran.r-project.org` and click on `packages` in the middle of the screen. Click on `Table of available packages, sorted by name` and then hit ctrl-F (PC) or command-F (mac) and type in `doBy` and press enter. Click on `doBy` package to see the description. Where it says `Reference manual`, click on `doBy.pdf`. This describes all the functions available in a packages. We are going to use the `summaryBy()` function to compute summary statistics. Note that this function is listed under `by-summary` in the manual. It takes a formula, a basic syntax used to tell R to do something to data, treating the left side of the tilde `~` as a function of the right side. You also have to provide a data frame and (`data = `) and a function or list of functions you want to use to summarize the data.

#> `Dependent` ~ `Independent`

#> `Response` ~ `Thing by which to consider response`

#In this case, we are going to summarize the columns with numbers of beetles by family and species with mean, standard deviation, max and min using `mean()`, `sd()`, `min()` and `max()` functions. We are going to use the `.` on the left side of the `formula` to tell R we want to summarize for all values of other columns.

#But first, our data is not formatted properly for summaryBy. We need to convert it from a matrix of years into a data frame with one row for each observation of each species in each year. Then we need to 


#install.packages('doBy')
library(doBy)

#install.packages('reshape2')
library(reshape2)

melt.beetles <- melt(beetles)
head(melt.beetles)

summaryBy(. ~ Species + family, data = melt.beetles, FUN = sum)

summary.beetles <- summaryBy(. ~ Species, data = melt.beetles, FUN = c(sum, mean, sd, min, max, length))
head(summary.beetles)

summaryBy(. ~ family, data = melt.beetles, FUN = c(mean, sd, min, max, length))


#What if we wanted to add this information to our originial data frame? we can use the function `cbind()`.


# First, check that the rows are in the same order with dim() and rownames()
summary.beetles$Species
beetles$Species

# We can put them in the right order using rownames
rownames(summary.beetles) <- summary.beetles$Species

summary.beetles[beetles$Species,] ## look at the output to check they line up

# We don't need the Species column becausethatwouldbe redundant
new.data.frame <- cbind(beetles, summary.beetles[beetles$Species,-1])
new.data.frame

# write to a file with write.csv
write.csv(new.data.frame, "Beetles.summary.csv")


## Factors

#Notice there is another type of data involved in data frames, a factor. Use `str` to see the `class` of each column of a dataframe


str(beetles)


#`Species` and `family` are both data type `Factor`. A factor is a way for R to store coded character data efficiently. For each unique value in the column, R assigns a number. If we want to reorder a factor, we need to re order its levels with `factor(levels =)`

#Using the `plot()` function, we can display data. Maybe we wanted to make a rank abundance curve. Lets start by ordering our beetle species with `order()`. Type in `?orderBy` for a description of how it works.

#Type in `?par` to see all the plotting parameters. Look at the following:



library(doBy)

# sort data frame in decreasing order
head(orderBy(~ -Total, new.data.frame))
tail(orderBy(~ -Total, new.data.frame))

# try to plot species abundance curve
ordered.data <- orderBy(~ -Total, new.data.frame)
plot(ordered.data$Species, log(ordered.data$Total)) ### thats not what we want

# re order its levels with `factor(levels =)`
new.data.frame$Species <- factor(new.data.frame$Species, levels = orderBy(~ -Total, new.data.frame)$Species)
plot(new.data.frame$Species, new.data.frame$Total)

# make the plot lineas instead of points
par(mar=c(10,5,5,5))
plot(new.data.frame$Species, log(new.data.frame$Total), las=2, ylab="Log abundance", xlab="", cex.axis=0.5)

# you can add a line to the existing plot with lines() which has the same 
lines(new.data.frame$Species, log(new.data.frame$Total))


#Note that even though the plot was plotted with the x axis in the correct order, the points are drawn in the order of the original data.frame. To get around this, we'll also have to reorder the data.frame.


# Run this command again to re-order the data frame, which now has the factor levels in the proper order
ordered.data <- orderBy(~ -Total, new.data.frame)
plot(ordered.data$Species, log(ordered.data$Total), las=2, ylab="Log abundance", xlab="", cex.axis=0.5)
lines(ordered.data$Species, log(ordered.data$Total))


## Excercise

#> Start a new script with File > New File > R Script if you are in RStudio or File > New Document in R

#> Plot the log mean +/- sd of the beetle species (in order) using the function `plot`

#+ Read in the original data
#+ Make a new column with mean + standard error
#+ Make a new column with mean - standard error
#+ Log-transform the three new columns
#+ Plot the log mean
#+ Add dotted lines in different colors (`?par`) for log  mean +/- SE
#+ Add a legend with this code


legend("topright", legend = c("Mean", "+/- SE"), lty=c(1,2), col=c("black","blue"))


