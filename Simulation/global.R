# install.packages("shiny")
# install.packages("plotly")
library(shiny)
library(plotly)

## Simulation

a<-1351         # 총 x수
b<-58717.66     # 기준비용1
c<-32200        # 기준비용2
y_0<-4773       # 기준값1
# x_delta<-50   # x축 감소분
# y_delta<-50   # y축 감소분
# y_unit<-3.533   # 기준단위

x_range<-(1351-900)+1   # 900이상 1351이하
# x_range # 452
y_range<-(4773-3182)+1  # 3182이상 4773이하
# y_range # 1592

x<-seq(from = a, by = -1, length.out = x_range)   # x축
# x
y<-seq(from = y_0, by = -1, length.out = y_range) # y축
# y

z<-matrix(0, x_range, y_range)
