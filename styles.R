
pacman::p_load(tidyverse, tidytext, gutenbergr)

book <- gutenberg_download(863)

book_text_only <- book %>% tail(nrow(book) - 24) %>% head(8484)  # Remove header and footer

book_chapters <- book_text_only %>% 
  mutate(linenumber = row_number(), 
         chapter = cumsum(str_detect(text, regex("^chapter [\\divxlc]", ignore_case = TRUE)))
         ) %>% 
  ungroup()

book_chapters_clean <- book_chapters %>% 
  filter(!(text == ""))


# Remove Chapter and Part Headings:

count_ch <- 0  # Initiate a count for chapters
ch <- 0
rows <- c()  # Initiate empty string of rows to be removed

for (i in 1:nrow(book_chapters_clean)) {
  temp_ch <- book_chapters_clean[i,4]  # Get the chapter number for that row
  if (!(temp_ch == ch)) {  # If the chapter number for our row is not equal to the previous chapter number (i.e. we have moved to a new chapter)
    
    ch <- temp_ch  # Set the new chapter number
    count_ch <- 1  # Set the chapter count to 1
    rows <- c(rows, i)  # Add row to those to be removed
  } else if (temp_ch == ch) {  # Otherwise
    
    count_ch <- count_ch + 1  # Add to our chapter count
    if (count_ch < 3) {  # The chapter headings take up two rows, so if our count is less than 3
      rows <- c(rows, i)  # Add row to those to be removed
    }
  }
}

# Remove those Rows:

book_chapters_clean2 <- book_chapters_clean %>% 
  filter(!row_number() %in% rows)

# Combine Text for each Chapter:

book_chapters_clean3 <- book_chapters_clean2 %>% 
  select(chapter, text) %>% 
  group_by(chapter) %>% 
  mutate(text = paste0(text, collapse = " ")) %>% 
  slice(1) %>% 
  ungroup()

# Remove []:

book_chapters_clean4 <- book_chapters_clean3 

book_chapters_clean4$text <- str_remove_all(book_chapters_clean4$text, "\\[[:print:]+?\\]")

# Remove Stop Words:

data(stop_words)  # Load stop words

tidy_book <- book_chapters_clean4 %>% 
  unnest_tokens(word, text) %>%
  anti_join(stop_words)

write.csv(book_chapters_clean4, "murder_styles.csv")





tmp <- data.frame(text  = c("a"))

i <- 1
while (i <= nrow(book_text_only)) {
  while (i <= nrow(book_text_only) && book_text_only[i,1] == "") {
    i <- i + 1
  }
  text <- ""
  j <- i
  while (j <= nrow(book_text_only) && book_text_only[j,1] != "") {
    text <- paste(text, book_text_only[j,1])
    j <- j + 1
  }
  i <- j
  if (nchar(text) > 0) {
    tmp <- add_row(tmp, text = text)
  }
}

tmp <- tmp %>% tail(nrow(tmp) - 1)

write.table(tmp, 
            file = "styles_paragraphs.txt", 
            sep = ",", 
            col.names = FALSE, 
            row.names = FALSE) 











