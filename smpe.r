---
title: "SMPE"
author: "pep"
date: "December 1, 2016"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(ggplot2)
```

```{r}
data = read.csv("archive_quicksort/_measurements.csv")
plot(data)
show(data)
```
We take the data provided by the teacher and plot it to have an overview.

```{r}
ggplot(data, aes(x=Size, y=Time, color = factor(Type))) + geom_point()
```

We try to analyse this data by te linear regression. But as we can see, this data does not provide much information, so we don't get the result as expected.
```{r}
#test = aggregate(dataSeq$Time, by=list(Category=dataSeq$Size), FUN=mean)
dataSeq = data[data$Type==" Sequential",]
reg <- lm(data = dataSeq, dataSeq$Time~I(dataSeq$Size*log(dataSeq$Size)))
plot(reg)
summary(reg)
```
We need more data to make the conclusion. So we do some new experiments, and here is the result.

```{r}
data_1 = read.csv("archive_quicksort/measurements_computer1.csv")
#data_2 = read.csv("archive_quicksort/measurements_computer2.csv")
#data_3 = read.csv("archive_quicksort/measurements_computer3.csv")

ggplot(data_1, aes(x=Size, y=Time, color = factor(Type))) + geom_point()
```
On this experiment, we see tat the parallel algorithm have a bigger variance than the others. We can observe that comparing to the first experiment, for the large n, parallel algorithm runs much faster than the two others. But in this experiment, it runs very slow comparing to the two others. 






#Furthermore, 








```{r}
#ggplot(data, aes(x=Size, y=Time, color = factor(Type))) + coord_trans(x = "log2", y = "log2") + #geom_point()
```

```{r}
#dataSeq = data[data$Type==" Sequential",]
#ggplot(dataSeq, aes(x=Size, y=Time))  + coord_trans(x = "log2", y = "log2") + geom_point()
```