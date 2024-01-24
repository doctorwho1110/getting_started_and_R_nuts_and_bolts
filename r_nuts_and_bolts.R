
#Declaring a variable
x<-1
print(x)

#Declaring an integer sequence
y<-1:20
y

#Data Types - R Objects and Attributes

'5.3 R Objects
R has five basic or “atomic” classes of objects:
  • character
  • numeric (real numbers)
  • integer
  • complex
  • logical (True/False)
  
  The most basic type of R object is a vector. Empty vectors can be created with the vector() function.
There is really only one rule about vectors in R, which is that A vector can only contain objects
of the same class.
But of course, like any good rule, there is an exception, which is a list, which we will get to a bit later.
A list is represented as a vector but can contain objects of different classes. Indeed, that’s usually
why we use them.
There is also a class for “raw” objects, but they are not commonly used directly in data analysis and
I won’t cover them here.
'

'5.4 Numbers
Numbers in R are generally treated as numeric objects (i.e. double precision real numbers). This
means that even if you see a number like “1” or “2” in R, which you might think of as integers, they
are likely represented behind the scenes as numeric objects (so something like “1.00” or “2.00”). This
isn’t important most of the time…except when it is.
If you explicitly want an integer, you need to specify the L suffix. So entering 1 in R gives you a
numeric object; entering 1L explicitly gives you an integer object.
There is also a special number Inf which represents infinity. This allows us to represent entities like
1 / 0. This way, Inf can be used in ordinary calculations; e.g. 1 / Inf is 0.
'

'5.5 Attributes
R objects can have attributes, which are like metadata for the object. These metadata can be very
useful in that they help to describe the object. For example, column names on a data frame help to
tell us what data are contained in each of the columns. Some examples of R object attributes are
• names, dimnames
• dimensions (e.g. matrices, arrays)
• class (e.g. integer, numeric)
• length
• other user-defined attributes/metadata
Attributes of an object (if any) can be accessed using the attributes() function. Not all R objects
contain attributes, in which case the attributes() function returns NULL
'

'5.6 Creating Vectors
The c() function can be used to create vectors of objects by concatenating things together.
'
x <- c(0.5, 0.6) ## numeric
x <- c(TRUE, FALSE) ## logical
x <- c(T, F) ## logical
x <- c("a", "b", "c") ## character
x <- 9:29 ## integer
x <- c(1+0i, 2+4i) ## complex

'5.7 Mixing Objects
There are occasions when different classes of R objects get mixed together. Sometimes this happens
by accident but it can also happen on purpose.'

y <- c(1.7, "a") ## character
y <- c(TRUE, 2) ## numeric
y <- c("a", TRUE) ## character

'5.8 Explicit Coercion
Objects can be explicitly coerced from one class to another using the as.* functions, if available.'

x<-0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

'Sometimes, R can’t figure out how to coerce an object and this can result in NAs being produced.'

x<-c("a","b","c")
as.numeric(x)
as.logical(x)
as.complex(x)

'5.9 Matrices
Matrices are vectors with a dimension attribute. The dimension attribute is itself an integer vector
of length 2 (number of rows, number of columns)
'
m<-matrix(nrow = 2,ncol = 3)
dim(m)
attributes(m)

m<-matrix(1:6,nrow = 2,ncol = 3) # constructed with column-wise
m

'Matrices can also be created directly from vectors by adding a dimension attribute'
m<-1:10
m
dim(m)<-c(2,5)
m

'Matrices can be created by column-binding or row-binding with the cbind() and rbind() functions.'
x<-1:3
y<-10:12
cbind(x,y)
rbind(x,y)

'5.10 Lists
Lists are a special type of vector that can contain elements of different classes. Lists are a very
important data type in R and you should get to know them well. Lists, in combination with the
various “apply” functions discussed later, make for a powerful combination.
Lists can be explicitly created using the list() function, which takes an arbitrary number of
arguments.'

x<-list(1,"a",TRUE,1+4i)
x

'5.11 Factors
Factors are used to represent categorical data and can be unordered or ordered. One can think of
a factor as an integer vector where each integer has a label. Factors are important in statistical
modeling and are treated specially by modelling functions like lm() and glm().
Using factors with labels is better than using integers because factors are self-describing. Having a
variable that has values “Male” and “Female” is better than a variable that has values 1 and 2.
Factor objects can be created with the factor() function.
'
x <- factor(c("yes", "yes", "no", "yes", "no"))
table(x)
unclass(x)
#attr(,"levels")

'Often factors will be automatically created for you when you read a dataset in using a function like
read.table(). Those functions often default to creating factors when they encounter data that look
like characters or strings.
The order of the levels of a factor can be set using the levels argument to factor(). This can be
important in linear modelling because the first level is used as the baseline level.'

x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes","no"))

'5.12 Missing Values
Missing values are denoted by NA or NaN for q undefined mathematical operations.
• is.na() is used to test objects if they are NA
• is.nan() is used to test for NaN
• NA values have a class also, so there are integer NA, character NA, etc.
• A NaN value is also NA but the converse is not true'

x<-c(1,2,NA,10,3)
is.na(x)
is.nan()

x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x) #NAN is also NA value


