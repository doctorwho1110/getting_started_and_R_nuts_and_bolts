'10. Subsetting R Objects
Watch a video of this section¹
There are three operators that can be used to extract subsets of R objects.
• The [ operator always returns an object of the same class as the original. It can be used to select
multiple elements of an object
• The [[ operator is used to extract elements of a list or a data frame. It can only be used to
extract a single element and the class of the returned object will not necessarily be a list or
data frame.
• The $ operator is used to extract elements of a list or data frame by literal name. Its semantics
are similar to that of [[.
'

'10.1 Subsetting a Vector
Vectors are basic objects in R and they can be subsetted using the [ operator.
'
x<-c("a", "b", "c", "c", "d", "a")
x[1]
x[1:4]
x[c(1, 3, 4)]

'10.2 Subsetting a Matrix
Matrices can be subsetted in the usual way with (i,j) type indices. Here, we create simple 2×3 matrix
with the matrix function.
'
x<-matrix(1:6,2,3)
x
x[1, 2]

'10.3 Subsetting Lists
Lists in R can be subsetted using all three of the operators mentioned above, and all three are used
for different purposes.'

x <- list(foo = 1:4, bar = 0.6)

'The [[ operator can be used to extract single elements from a list. Here we extract the first element
of the list.
'
x[[1]]

'10.7 Removing NA Values
Watch a video of this section⁵
A common task in data analysis is removing missing values (NAs).'

x <- c(1, 2, NA, 4, NA, 5)
bad<-is.na(x)
x[!bad]

