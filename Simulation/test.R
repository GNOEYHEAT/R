### shiny : https://shiny.rstudio.com/gallery/

# install.packages("shiny")
library(shiny)
# install.packages("plotly")
library(plotly)

## Simulation (excel)

a<-1351         # 총 x수
b<-58717.66     # 기준비용1
c<-32200        # 기준비용2
y_0<-4773       # 기준값1
x_delta<-50     # x축 감소분
y_delta<-50     # y축 감소분
y_unit<-3.533   # 기준단위

x<-seq(from = a ,by = -x_delta, length.out = 10) # x축
x
y<-seq(from = y_0 ,by = -y_delta, length.out = 10)   # y축
y

# x<-c(1351,1301,1251,1201,1151,1101,1051,1001,951,901)    # x축
# y<-c(4773,4723,4673,4623,4573,4523,4473,4423,4373,4323)  # y축

# 산출식 : z=b*x*y_unit*39+c*(y/y_unit-x)*y_unit*32

z<-matrix(0, 10, 10)

for(i in 1:10){
  for(j in 1:10){
    z[i,j]<-(b*x[i]*y_unit*39+c*(y[j]/y_unit-x[i])*y_unit*32) # 계산식
  }
}

z # 총 비용

## 3D visualization

plot_ly (
  type = 'surface',
  z = ~z,
  x = x,
  y = y
  )
