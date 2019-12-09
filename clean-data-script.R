# Getting Thaler and Deaton's html
scholar1 <- "https://scholar.google.com/citations?user="

# For Richard Thaler
author1 <- "Tvzd5GgAAAAJ"
author1_url <- paste0(scholar1, author1)
download.file(author1_url, 'richard_thaler.html')
#richard_thaler <- read_html('richard_thaler.html')
richard_thaler <- read_html('richard_thaler_Scholar.html')


#For Angus Deaton
author2 <- "rvFjcQIAAAAJ"
author2_url <- paste0(scholar1, author2)
download.file(author2_url, 'angus_deaton.html')
#angus_deaton <- read_html('angus_deaton.html')
angus_deaton <- read_html('angus_deaton_Scholar.html')


# Extracting Thaler's information

thaler_info <- richard_thaler %>% html_nodes(xpath ='//*[@id="gsc_a_b"]') %>% 
  html_nodes(xpath ='tr') %>% html_nodes(xpath ='td') 
step1 = sapply(html_children(thaler_info), html_text)
step1 = step1[step1 != '*']

thaler_df = data.frame(paperName = step1[seq(1, length(step1), 5)],
                        researcher = step1[seq(2, length(step1), 5)],
                        journal = step1[seq(3, length(step1), 5)],
                        citations = step1[seq(4, length(step1), 5)],
                        year = step1[seq(5, length(step1), 5)])

# Extracting Deaton's information

deaton_info <- angus_deaton %>% html_nodes(xpath ='//*[@id="gsc_a_b"]') %>% 
  html_nodes(xpath ='tr') %>% html_nodes(xpath ='td') 
step2 = sapply(html_children(deaton_info), html_text)
step2 = step2[step2 != '*']

deaton_df = data.frame(paperName = step2[seq(1, length(step2), 5)],
                       researcher = step2[seq(2, length(step2), 5)],
                       journal = step2[seq(3, length(step2), 5)],
                       citations = step2[seq(4, length(step2), 5)],
                       year = step2[seq(5, length(step2), 5)])

