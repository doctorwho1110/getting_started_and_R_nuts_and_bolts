'6.1 Reading and Writing Data
Watch a video of this section¹
There are a few principal functions reading data into R.
• read.table, read.csv, for reading tabular data
• readLines, for reading lines of a text file
• source, for reading in R code files (inverse of dump)
• dget, for reading in R code files (inverse of dput)
• load, for reading in saved workspaces
• unserialize, for reading single R objects in binary form'

'There are analogous functions for writing data to files
• write.table, for writing tabular data to text files (i.e. CSV) or connections
• writeLines, for writing character data line-by-line to a file or connection
• dump, for dumping a textual representation of multiple R objects
• dput, for outputting a textual representation of an R object
• save, for saving an arbitrary number of R objects in binary format (possibly compressed) to a
file.
• serialize, for converting an R object into a binary format for outputting to a connection (or
file).
'

'6.2 Reading Data Files with read.table()

The read.table() function has a few important arguments:

Getting Data In and Out of R 25
• file, the name of a file, or a connection
• header, logical indicating if the file has a header line
• sep, a string indicating how the columns are separated
• colClasses, a character vector indicating the class of each column in the dataset
• nrows, the number of rows in the dataset. By default read.table() reads an entire file.
• comment.char, a character string indicating the comment character. This defalts to "#". If there
are no commented lines in your file, it’s worth setting this to be the empty string "".
• skip, the number of lines to skip from the beginning
• stringsAsFactors, should character variables be coded as factors? This defaults to TRUE
because back in the old days, if you had data that were stored as strings, it was because
those strings represented levels of a categorical variable. Now we have lots of data that is
text data and they don’t always represent categorical variables. So you may want to set this to
be FALSE in those cases. If you always want this to be FALSE, you can set a global option via
options(stringsAsFactors = FALSE). I’ve never seen so much heat generated on discussion
forums about an R function argument than the stringsAsFactors argument.'

'6.3 Reading in Larger Datasets with read.table

With much larger datasets, there are a few things that you can do that will make your life easier and
will prevent R from choking.
• Read the help page for read.table, which contains many hints
• Make a rough calculation of the memory required to store your dataset (see the next section
for an example of how to do this). If the dataset is larger than the amount of RAM on your
computer, you can probably stop right here.

• Set comment.char = "" if there are no commented lines in your file.
• Use the colClasses argument. Specifying this option instead of using the default can make
’read.table’ run MUCH faster, often twice as fast. In order to use this option, you have to know
the class of each column in your data frame. If all of the columns are “numeric”, for example,
then you can just set colClasses = "numeric".'


'7.Using the readr Package
The readr package is recently developed by Hadley Wickham to deal with reading in large flat files
quickly. The package provides replacements for functions like read.table() and read.csv(). The
analogous functions in readr are read_table() and read_csv(). These functions are often much
faster than their base R analogues and provide a few other nice features such as progress meters'

'The importance of the read_csv function is perhaps better understood from an historical perspective.
R’s built in read.csv function similarly reads CSV files, but the read_csv function in readr builds on
that by removing some of the quirks and “gotchas” of read.csv as well as dramatically optimizing
the speed with which it can read data into R. The read_csv function also adds some nice useroriented features like a progress meter and a compact method for specifying column types.
'
library(readr)
teams<-read_csv("data/team_standings.csv")

'The read_csv function will also read compressed files automatically. There is no need to decompress
the file first or use the gzfile connection function. The following call reads a gzip-compressed CSV
file containing download logs from the RStudio CRAN mirror.'

logs <- read_csv("data/2016-07-19.csv.bz2", n_max = 10)

'9. Interfaces to the Outside World
Watch a video of this chapter¹
Data are read in using connection interfaces. Connections can be made to files (most common) or to
other more exotic things.
• file, opens a connection to a file
• gzfile, opens a connection to a file compressed with gzip
• bzfile, opens a connection to a file compressed with bzip2
• url, opens a connection to a webpage
In general, connections are powerful tools that let you navigate files or other external objects.
Connections can be thought of as a translator that lets you talk to objects that are outside of R.
Those outside objects could be anything from a data base, a simple text file, or a a web service API.
Connections allow R functions to talk to all these different external objects without you having to
write custom code for each object.'

'Connections to text files can be created with the file() function.
> str(file)
function (description = "", open = "", blocking = TRUE, encoding = getOption("encoding"),
raw = FALSE, method = getOption("url.method", "default"))
The file() function has a number of arguments that are common to many other connection
functions so it’s worth going into a little detail here.
• description is the name of the file
• open is a code indicating what mode the file should be opened in

The open argument allows for the following options:
• “r” open file in read only mode
• “w” open a file for writing (and initializing a new file)
• “a” open a file for appending
• “rb”, “wb”, “ab” reading, writing, or appending in binary mode (Windows)'

'9.2 Reading Lines of a Text File
Text files can be read line by line using the readLines() function. This function is useful for reading
text files that may be unstructured or contain non-standard data.

For more structured text data like CSV files or tab-delimited files, there are other functions like
read.csv() or read.table().
The above example used the gzfile() function which is used to create a connection to files
compressed using the gzip algorithm. This approach is useful because it allows you to read from
a file without having to uncompress the file first, which would be a waste of space and time.
There is a complementary function writeLines() that takes a character vector and writes each
element of the vector one line at a time to a text file.'

'9.3 Reading From a URL Connection
The readLines() function can be useful for reading in lines of webpages. Since web pages are
basically text files that are stored on a remote server, there is conceptually not much difference
between a web page and a local text file. However, we need R to negotiate the communication
between your computer and the web server. This is what the url() function can do for you, by
creating a url connection to a web server
'

## Open a URL connection for reading
con <- url("https://www.jhu.edu", "r")

## Read the web page
x <- readLines(con)

## Print out the first few lines
head(x)