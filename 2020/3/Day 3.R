library(stringr)



input <- readLines("3/input.txt") %>% 
  str_split("")

is.tree <- function(row, col) {
  input[[row]][col]=="#"
} 

count.trees <- function(start.row, start.col, slope.row, slope.col) {
  n.trees <- 0
  rows <- seq(from = start.row, to = length(input), by = slope.row)
  cols <- seq(from = start.col, by = slope.col, length.out = length(rows)) %>% 
    '-'(1) %>% 
    '%%'(length(input[[1]])) %>% 
    '+'(1)
  
  1:length(rows) %>%
    sapply(function(i){
      is.tree(rows[i], cols[i])
    }) %>%
    sum()
    
}


count.trees(1, 1, 1, 3)

