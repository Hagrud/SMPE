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

ggplot(data_1, aes(x=Size, y=Time, color = factor(Type))) + geom_point()
```
On this experiment, we see tat the parallel algorithm have a bigger variance than the others. We can observe that comparing to the first experiment, for the large n, parallel algorithm runs much faster than the two others. But in this experiment, it runs very slow comparing to the two others. 



```{r}
dataSeq_1 = data_1[data$Type==" Sequential",]
reg <- lm(data = dataSeq_1, dataSeq_1$Time~I(dataSeq_1$Size*log(dataSeq_1$Size)))
summary(reg)
```

```{r}

graph = ggplot(dataSeq_1, aes(x=Size, y=Time, color = factor(Type))) + geom_point()

graph + geom_smooth(method = "lm", formula = y ~ I(x*log(x))) +  geom_smooth(method = "lm", formula = y ~ x, color="black") 
```

```{r}
dataBIn_1 = data_1[data$Type==" Built-in",]
reg <- lm(data = dataBIn_1, dataBIn_1$Time~I(dataBIn_1$Size*log(dataBIn_1$Size)))
summary(reg)
graph = ggplot(dataBIn_1, aes(x=Size, y=Time, color = factor(Type))) + geom_point()

graph + geom_smooth(method = "lm", formula = y ~ I(x*log(x)))
```
The built-in method give almost the same results that the sequential one, we can assume they can be implemented the same way?


```{r}
dataPar_1 = data_1[data$Type==" Parallel",]
reg <- lm(data = dataPar_1, dataPar_1$Time~I(dataPar_1$Size*log(dataPar_1$Size)))
summary(reg)
graph = ggplot(dataPar_1, aes(x=Size, y=Time, color = factor(Type))) + geom_point()

graph + geom_smooth(method = "lm", formula = y ~ I(x*log(x)))
```


We see that the parallel aglorithm have a totally different result between the two dataset, we decide to make another experiments with others computers.


```{r}
data_2 = read.csv("archive_quicksort/measurements_computer2.csv")
data_3 = read.csv("archive_quicksort/measurements_computer3.csv")

ggplot(data, aes(x=Size, y=Time, color = factor(Type))) + geom_point()
ggplot(data_1, aes(x=Size, y=Time, color = factor(Type))) + geom_point()
ggplot(data_2, aes(x=Size, y=Time, color = factor(Type))) + geom_point()
ggplot(data_3, aes(x=Size, y=Time, color = factor(Type))) + geom_point()
```
Two computer on our workbench seems to not take advantage of the parallelism, maybe because of their architecture.

```{r}
```
```{r}
```







```{r}
#ggplot(data, aes(x=Size, y=Time, color = factor(Type))) + coord_trans(x = "log2", y = "log2") + #geom_point()
```

```{r}
#dataSeq = data[data$Type==" Sequential",]
#ggplot(dataSeq, aes(x=Size, y=Time))  + coord_trans(x = "log2", y = "log2") + geom_point()
```