library(magrittr)
library(data.table)


#Part 1
input <- 
  readLines("D:/R/Advent of Code/2020/1/input.txt") %>% 
  as.numeric()


product <- expand.grid(input, input) %>% 
  as.data.table() %>% 
  .[, ':='(sum = Var1 + Var2, prod = Var1 * Var2)] %>% 
  .[sum==2020]

product


#Part 2
product.3 <- expand.grid(input, input, input) %>% 
  as.data.table() %>% 
  .[, ':='(sum = Var1 + Var2 + Var3, prod = Var1 * Var2 * Var3)] %>% 
  .[sum==2020]

product.3