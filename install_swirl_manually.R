#install using manual process
library(swirl)
install_course_zip("~/swirl_courses-master.zip", multi=TRUE, 
                   which_course="Getting_and_Cleaning_Data")
swirl()

# copy data from a location
# pathlocation is saved as an object
# query the data once imported to mydf
mydf <- read.csv(file = path2csv, stringsAsFactors = FALSE)
dim(mydf)
head(mydf)

# load dplyr
library(dplyr)
packageVersion("dplyr")

# load mydf into a df tbl
cran <- tbl_df(mydf)
rm("mydf") # remove old df

cran # look at how good the tbl_df view is

# use select,  easier than using $ and also returns in the same order you specify in 
select(cran, ip_id, package,country) 

5:20 # create sequence of numbers 

select(cran, r_arch:country) # usig the colon operator to specify the columns
select(cran, country:r_arch) # ^ same as above only in reverse order

select(cran, -time) # select minus one column

-(5:20) # to get a a inverse negative set of numbers 

select(cran,-(X:size)) # omit columns

filter(cran, package == "swirl") # filter 
filter(cran, r_version == "3.1.1", country == "US") # multiple filters 
filter(cran, r_version <= "3.0.2", country == "IN") # using less than or equal type statements
filter(cran, country == "US" | country == "IN") # either conditon is true statement
filter(cran, size > 100500, r_os == "linux-gnu")
filter(cran, !is.na(r_version)) # give me all the items on the column that are not NA 


# arrange function
cran2 <- select(cran, size:ip_id) # create copy of original df
arrange(cran2, ip_id) # arrange by 
