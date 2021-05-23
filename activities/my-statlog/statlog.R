# Let's start by reading chapter 1
# Definitely not useful. It mostly talks about the main components in a data
# science project. Useful for reference in the future

# What are we doing here exactly? Basically
# - loading the data
# - using the data documentation to map column names and column fields
# - saving the resulting data frame for later use

# What's next? Going for the appendix A of the book
# Why? To get a better grip and understanding of the language itself
# Mainly for having a basic exposure of the different data types and structures
# managed in R and the way R handles them

### Using R with less-structured data
setwd('/home/blap/docs/prog/R/nina-zumel/PDSwR2/Statlog')

# read dataframe ----
d <- read.table('german.data',
                sep  =  " ",
                stringsAsFactors  =  FALSE, header  =  FALSE)

# get column names from the data documentation, from here: 
# http://archive.ics.uci.edu/ml/datasets/Statlog+(German+Credit+Data)
colnames(d) <- c('Status_of_existing_checking_account', 'Duration_in_month',
                 'Credit_history', 'Purpose', 'Credit_amount', 'Savings_account_bonds', 
                 'Present_employment_since',
                 'Installment_rate_in_percentage_of_disposable_income',
                 'Personal_status_and_sex', 'Other_debtors_guarantors',
                 'Present_residence_since', 'Property', 'Age_in_years',
                 'Other_installment_plans', 'Housing',
                 'Number_of_existing_credits_at_this_bank', 'Job',
                 'Number_of_people_being_liable_to_provide_maintenance_for',
                 'Telephone', 'foreign_worker', 'Good_Loan')


# print what we've done so far
str(d)

# according to the data documentation, we construct the following mapping
# using = instead of <-
# definition of mapping vector ---------
mapping <- c('A11'  =  '... < 0 DM',
             'A12'  =  '0 < =  ... < 200 DM',
             'A13'  =  '... > =  200 DM / salary assignments for at least 1 year',
             'A14'  =  'no checking account',
             'A30'  =  'no credits taken/all credits paid back duly',
             'A31'  =  'all credits at this bank paid back duly',
             'A32'  =  'existing credits paid back duly till now',
             'A33'  =  'delay in paying off in the past',
             'A34'  =  'critical account/other credits existing (not at this bank)',
             'A40'  =  'car (new)',
             'A41'  =  'car (used)',
             'A42'  =  'furniture/equipment',
             'A43'  =  'radio/television',
             'A44'  =  'domestic appliances',
             'A45'  =  'repairs',
             'A46'  =  'education',
             'A47'  =  '(vacation - does not exist?)',
             'A48'  =  'retraining',
             'A49'  =  'business',
             'A410'  =  'others',
             'A61'  =  '... < 100 DM',
             'A62'  =  '100 < =  ... < 500 DM',
             'A63'  =  '500 < =  ... < 1000 DM',
             'A64'  =  '.. > =  1000 DM',
             'A65'  =  'unknown/ no savings account',
             'A71'  =  'unemployed',
             'A72'  =  '... < 1 year',
             'A73'  =  '1 < =  ... < 4 years',
             'A74'  =  '4 < =  ... < 7 years',
             'A75'  =  '.. > =  7 years',
             'A91'  =  'male : divorced/separated',
             'A92'  =  'female : divorced/separated/married',
             'A93'  =  'male : single',
             'A94'  =  'male : married/widowed',
             'A95'  =  'female : single',
             'A101'  =  'none',
             'A102'  =  'co-applicant',
             'A103'  =  'guarantor',
             'A121'  =  'real estate',
             'A122'  =  'if not A121 : building society savings agreement/life insurance',
             'A123'  =  'if not A121/A122 : car or other, not in attribute 6',
             'A124'  =  'unknown / no property',
             'A141'  =  'bank',
             'A142'  =  'stores',
             'A143'  =  'none',
             'A151'  =  'rent',
             'A152'  =  'own',
             'A153'  =  'for free',
             'A171'  =  'unemployed/ unskilled - non-resident',
             'A172'  =  'unskilled - resident',
             'A173'  =  'skilled employee / official',
             'A174'  =  'management/ self-employed/highly qualified employee/ officer',
             'A191'  =  'none',
             'A192'  =  'yes, registered under the customers name',
             'A201'  =  'yes',
             'A202'  =  'no')

# use a for loop to map keys with values ------
for(ci in colnames(d)) {
  if(is.character(d[[ci]])) {
    d[[ci]] <- as.factor(mapping[d[[ci]]])
  }
}

# write GoodLoan or BadLoan instead of 1s and 2s -----
d$Good_Loan <- as.factor(ifelse(d$Good_Loan == 1, 'GoodLoan', 'BadLoan'))

# save d object as creditdata.RDS file ----
vars <- setdiff(colnames(d), 'Good_Loan')
creditdata <- d

saveRDS(creditdata, "creditdata.RDS")

### Finalmente... ----
### We've worked through this example BUT feeling doubtful about
### the language. Maybe taking a look at the appendix is what I'm looking
### for.... I wouldn't want to look at the CRAN **manual** right away
### I'd rather go there only if there's no better option