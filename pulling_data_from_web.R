library(XML)

# grab data from website
doc.html = htmlTreeParse('http://www.johnstonsarchive.net/policy/abortion/usa/ab-usa-AL.html',
                         useInternal = TRUE)

# split into table rows
doc.entries = unlist(xpathApply(doc.html, '//td', xmlValue))

# figure out the table shape
Ncols = 14 # I counted this from the website itself
Nyears = length(doc.entries) / Ncols
idx = seq(1, length(doc.entries), Ncols)

# Make a data frame to 
AL_data = data.frame(doc.entries[idx])
names(AL_data) <- "year"
AL_data$live_births = doc.entries[idx + 1]

# Todo:
#  1. complete the AL table by adding all other columns. Ideally, you'll have a list of column names and will programatically create the table
#  2. See if you can find a way to programmatically make a bunch of data frames (or even better, one huge dataframe!) containing all data from all states.