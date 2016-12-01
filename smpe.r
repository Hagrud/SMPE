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
data = read.cs("archive_quicksort/measurements.csv")
plot(data)
```
