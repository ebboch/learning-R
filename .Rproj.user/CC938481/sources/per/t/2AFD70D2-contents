library(ggplot2)
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
#data(mpg, package = 'ggplot2')
head(mpg)
head(msleep)

### packages
# handling packages differently
ggplot2::ggplot(data=ggplot2::mpg, ggplot2::aes(x=displ, y=hwy)) + ggplot2::geom_point()

### nice piece of code
d <- data.frame(x = c(1, NA, 3))
print(d)
d[is.na(d$x)] <- 0
print(d)

### organizing intermediate values
# dot notation
data <- data.frame(revenue = c(2, 1, 2),
                   sort_key = c('b', 'c', 'a'),
                   stringsAsFactors = FALSE) #apparently FALSE by default
print(data)
. <- data
. <- .[order(.$sort_key), , drop = FALSE]
.$ordered_sum_revenue <- cumsum(.$revenue)
.$fraction_revenue_seen <- .$ordered_sum_revenue/sum(.$revenue)
result <- .
print(result)

#using dplyr alternative -- equivalent to the above
library('dplyr')
result <- data %>%
  arrange(., sort_key) %>%
  mutate(., ordered_sum_revenue = cumsum(revenue)) %>%
  mutate(., fraction_revenue_seen = ordered_sum_revenue/sum(revenue))
# arrange <-> order and mutate <-> assignment in dplyr
# %>% is magrittr's pipe symbol
# check dot pipe %.>% from wrapr package

### explanation of drop=FALSE
m <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE)
print(m[, 2]) #becomes a list, structure is dropped
print(m[, 2, drop = FALSE]) #to stop structure from being dropped

### the data frame class
d <- data.frame(col1 = c(1:3), col2 = c(-1:1))
d$col3 <- d$col1 + d$col2
print(d)

### Working with data from files -- loading well-structured data
setwd('/home/blap/docs/prog/R/nina-zumel/PDSwR2/UCICar')
uciCar <- read.table(
  'car.data.csv', #filename or URL
  sep = ',',
  header = TRUE, #expect a header line
  stringsAsFactors = TRUE #convert string values to factos (default behavior)
  )
# if data is within a .gz file, read.table() will automatically decompress it
View(uciCar)
class(uciCar$persons[1]) #typeof is less useful; reveals how the object's storage is implemented
print(uciCar$persons[1])
dim(uciCar)
head(uciCar)
help(class(uciCar))
help(class(uciCar$persons)) #what's a factor exactly?
str(uciCar) #gives you structure for an object?
summary(uciCar) #counter

# saveRDS? str?

### Using R with less-structured data
setwd()



