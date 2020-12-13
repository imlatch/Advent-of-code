library(magrittr)
library(data.table)
library(stringr)

input <- "2/input.txt" %>% 
  readLines() %>% 
  as.data.table() 

colnames(input) <- "input"

input[, c("policy", "pass"):=tstrsplit(input, ":", fixed = T)][
  , c("count", "pol.letter"):=tstrsplit(policy, " ", fixed = T)
][
  , c("count.min", "count.max"):=tstrsplit(count, "-", fixed = T)
][
  , "occurence":=str_count(pass, pol.letter)
][
  , c("policy", "count"):=NULL
][
  between(occurence, count.min, count.max), .N
]



#part 2
input[
  ,':='(pos1.letter=substr(trimws(pass), count.min, count.min),
       pos2.letter=substr(trimws(pass), count.max, count.max))
][
  xor(pos1.letter==pol.letter, 
      pos2.letter==pol.letter),
  .N
]

