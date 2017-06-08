library(shiny)
library(RISmed)
library(ggplot2)

## Input searchText to get dataframe of articles
searchText <- function(searchString){
  search_query <- EUtilsSummary(searchString)
  records<- EUtilsGet(search_query)
  pubmed_data <- data.frame('Title'=ArticleTitle(records),
                            'Abstract'=AbstractText(records),
                            'Date'=as.Date(paste(
                              YearPubmed(records),
                              MonthPubmed(records),
                              DayPubmed(records), sep="-"), format="%Y-%m-%d")
  )
  pubmed_data$Title <- as.character(pubmed_data$Title)
  pubmed_data$Abstract <- as.character(pubmed_data$Abstract)
  pubmed_data$Abstract <- gsub(",", " ", pubmed_data$Abstract, fixed = TRUE)
  return(pubmed_data)
}

## histogram by time
histByTime <- function(df){
  plot <- ggplot(df) + geom_histogram(aes(x=Date))
  return(plot)
}