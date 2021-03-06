# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

install.packages("tm")
install.packages("SnowballC")
install.packages("NLP")
# Load required packages
library(tm, SnowballC)

# Make path to lesson directory
lesson_dir <- file.path(path.package(substring(find("swirl")[1], 9)), "Courses", "qss-swirl", "DISCOVERY1", "federalist")

# Load raw corpus
corpus.raw <- Corpus(DirSource(directory = lesson_dir, pattern = "fp")) 
corpus <- tm_map(corpus.raw, content_transformer(tolower)) # make lower case
corpus <- tm_map(corpus, stripWhitespace) # remove whitespace
corpus <- tm_map(corpus, removePunctuation) # remove punctuation 
corpus <- tm_map(corpus, removeNumbers) # remove numbers
corpus <- tm_map(corpus, removeWords, stopwords("english")) # remove stopwords
corpus <- tm_map(corpus, stemDocument) # stem words

# Load data into a variable for the user
dtm <- DocumentTermMatrix(corpus)
