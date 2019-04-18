

Packages <- c("qdap", "tm" )
lapply(Packages, library, character.only = TRUE)

con <- file("en_US.twitter.txt", "r")

readLines(con, 1) ## Read the first line of text 
readLines(con, 1) ## Read the next line of text 
readLines(con, 5) ## Read 5 lines of text 
close(con) ## It's important to close the connection when you are done

#Create Text vector of 
txt_vector <- readLines(con, 5)

#Look at the top 10 Terms used in the text
term_count <- freq_terms(txt_vector, 5)
plot(term_count)


#Create volatile Corpse
text_source <- VectorSource(txt_vector)
text_corpus <- VCorpus(text_source)
print(text_corpus)
content(text_corpus[[2]])


#Clean Corpus
badwords <- c("damn", "shit")

clean_text_corpus <- tm_map(text_corpus, removePunctuation)
clean_text_corpus <- tm_map(clean_text_corpus, content_transformer(tolower))
clean_text_corpus <- tm_map(clean_text_corpus, removeWords, badwords)
clean_text_corpus <- tm_map(clean_text_corpus, stripWhitespace)

content(text_corpus[[2]])
content(clean_text_corpus[[2]])




