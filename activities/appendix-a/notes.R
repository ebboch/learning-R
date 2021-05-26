### Appendix A
### Starting with R
# R comes from S. S evolved to S+
# <<- and ->> asignment operators
#   They are intendend to write values outside of the current execution
#   environment

x <- 1
good <- function() {x <- 5}
print(x)
good()
print(x)

bad <- function() {x <<- 5}
bad()
print(x)

# Many R operations are called vectorized
# The vectorized logic operators are ==, &, and |

x <- c(1, 2, 3)
y <- c(1, 2, 4)
x == y
identical(x, y) # yields FALSE

# && and || **only** work on scalars, not vectors. Always use && and || in
# if() statements. Never use & or | in if() statements. Prefer & and | when
# working with general data

# R also supplies a vectorized sector called ifelse(,,). The basic R-language
# if() statement isn't vectorized

# Every item in R is an object and has a type definition called a class
# Use the class() command for that

# R has 2 object-oriented systems
# S3
# Methods are global functions and are not strongly associated with object 
# definitions, prototyps or interfaces
# S4
# ...

# In R each reference to a value is isolated: changes to one reference are not
# seen by other references

a <- c(1, 2)
b <- a
print(b)
a[[1]] <- 5
print(a)
print(b)

### Primary R data types
# Vectors (or arrays)
class(c(1, 2, 'cat'))
class(c(1, 2))

# Scalars are just length-1 vectors
# R's most common types of vectors are these:
  # Numeric - arrays of double precision floating-point numbers
  # Character - arrays of strings
  # Factor - arrays of strings chosen from a fixed set of possibilities
  # Logical - arrays of TRUE / FALSE
  # NULL - the empty vector c(), which has type NULL
length(NULL)
is.null(c())

# R numbers vectors as starting from 1
a <- c(1,2,3)
print(a[[1]])
b <- 1:10
c <- rep('a', 4) # c <- rep('a', times=4)

# vectors can store ONLY ONE type of object
# lists can store MORE THAN ONE type of object
# named lists is the third type of lists
a <- list(6, 'something')
b <- list('a'=6, 'b'='else')
c <- list(a=6, b='else')
print(a)
print(b)
print(c)
identical(b, c)
names(b)
print(b$a)
print(b[c('a', 'b', 'b', 'a')])

# R list label operation (such as $) allow partial matches
# this behaviour can be disabled with options(warnPartialMatchDollar=TRUE)
b <- list('arbol' = 'hoja')
print(b$a)

# [[]] is strictly the correct operator for selecting a sinle element from
# a list or a vector 
ex = list(a='b')[c('a', 'a')]

# [[]] behaves differently with lists and vectors
# you should never use [] when [[]] can be used
class(ex)
class(list(a='b')[['a']])
c('a', 'b')[[7]]
c('a', 'b')[7]
c('a', 'b')[NA]

# Data frames
d <- data.frame(x=c(1,2), y=c('x', 'y'))
d

# the correct way to read a column out of a df is
# [[]] or $
class(d[['x']])
class(d$x)
class(d[[1]])

# also common
class(d[, 'x'])
class(d['x']) # a df. The above are vectors

# to access rows use
# d[rowSet,] // d(rowSet,, drop=FALSE) // subset(d, rowSet)
class(d[c(FALSE, TRUE)])
class(d[c(FALSE, TRUE), ])
d[c(FALSE, TRUE),, drop=FALSE]
subset(d, c(TRUE, FALSE))
# all above are dfs

d[1,] # for a single row

# some useful functions on dfs
# dim() // summary() // colnames()

d[1, 'y'] # for individual cells

# look for the model.matrix() function

# The two primary ways to populate dfs are read.table() and db connectors


### Matrices
# dfs are lists of columns
# matrices are lists of rows and every cell is of the same type

# use drop=FALSE when indexing matrices


### NULL and NA (not available) values
# NULL is just an alias for c()
#   carries no type info
#   cannot represent missing scalar values

# for missing scalar values we have NA
#   represents missing or unavailable data
#   can represent any type of scalar (not just floating point)
#   won't get a printed warning, code doesn't halt
NA+1 # = NA

# look for paste() function


### Factors
# a factor is just a string value chosen from a specified set of values called
# levels
# They are exactly the right data type to represent the different values or
# levels of categorical variables
factor('red', levels=(c('red', 'orange')))
factor('apple', levels=c('red', 'orange'))
factor(c('red', 'orange', 'red', 'red'), levels=c('red', 'orange'))

x <- c('red', 'pink', 'orange', 'pink', 'red', 'red', 'orange')
factor(x)

d <- data.frame(x=factor(c('a', 'b', 'c')), y=c(1, 2, 3))
m <- lm(y-0+x, data=d)
print(predict(m, newdata=data.frame(x='b'))[[1]])
# ...


### Slots
# Object slots are addressed with the @ operator
# try the slotNames() operator
# Slots and objects (in particular S3 and S4 object systems) are advanced
# topics not covered in this book!


### Using databases with R
# DBI::dbReadTable()
# data.table
# sparklyr
# rquery or dbplyr query generators

## Running db queries using a query generator
# What is Codd?
library('rquery')



m = c('1'='one', '2'='two')
print(m)




