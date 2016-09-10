library(ggplot2) 



input <- read.csv("query_152601_plot.csv")
ggplot(input, aes(x=recall, y=precision,group=1,color="red")) + geom_line()+geom_point()+ggtitle("query_152601_plot")

input <- read.csv("query_152602_plot.csv")
ggplot(input, aes(x=recall, y=precision,group=1,color="red")) + geom_line()+geom_point()+ggtitle("query_152602_plot")

input <- read.csv("query_152603_plot.csv")
ggplot(input, aes(x=recall, y=precision,group=1,color="red")) + geom_line()+geom_point()+ggtitle("query_152603_plot")

input <- read.csv("query_152601_original_plot.csv")
ggplot(input, aes(x=recall, y=precision,group=1,color="red")) + geom_line()+geom_point()+ggtitle("query_152601_original_plot")

input <- read.csv("query_152602_original_plot.csv")
ggplot(input, aes(x=recall, y=precision,group=1,color="red")) + geom_line()+geom_point()+ggtitle("query_152602_original_plot")

input <- read.csv("query_152603_original_plot.csv")
ggplot(input, aes(x=recall, y=precision,group=1,color="red")) + geom_line()+geom_point()+ggtitle("query_152603_original_plot")

