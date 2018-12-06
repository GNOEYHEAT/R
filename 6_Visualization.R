### [Visualization]

## 0. Package

  library(dplyr)
  library(tidyr)

  # install.packages('ggplot2') ## ggplot2 : 모든 것을 함수로 수정 가능한 그래프
  # install.packages('plotly') ## plotly  : D3.js 기반 반응형 그래프
  # install.packages('ggmap') ## ggmap   : 구글 지도를 활용한 지도 시각화
  # install.packages('RColorBrewer')

  library(ggplot2)
  library(plotly)
  # library(ggmap)
  library(RColorBrewer)

## 1. ggplot2
  
  load('data/NHIS.RData')
  
  head(NHIS)
  str(NHIS)

    
  # 성별 진료건수 막대그래프
  
    # barplot( table(NHIS$SEX) )
  
    NHIS %>% ggplot(aes(x=SEX, fill=AGE_GROUP)) + geom_bar(position = 'dodge') + scale_fill_manual( values=colorRampPalette(c('#C5D632','#494933'))(18))
  

  # 연령대/진료과목별 총진료비 열지도
  
  agg = NHIS %>% group_by(AGE_GROUP, DSBJT_CD) %>% summarise(mean_AMT = mean(EDEC_TRAMT))
  agg
  
    ## heatmap( )
    agg_wide = agg %>% spread(DSBJT_CD, mean_AMT)
    agg_wide2= as.matrix(agg_wide[,-1] )
    agg_wide2[is.na(agg_wide2)] = 0
    rownames(agg_wide2) = agg_wide$AGE_GROUP
    heatmap(agg_wide2)
  
  agg %>% 
    ggplot(aes(AGE_GROUP, DSBJT_CD, fill=mean_AMT)) + 
    geom_tile() +
    scale_fill_gradient(low='white', high='#494933')
  
  # 연령대별 상자그림
    
    NHIS %>% ggplot(aes(AGE_GROUP, EDEC_TRAMT)) + geom_boxplot()
  
## 2. plotly

  agg
  
  plot_ly(x=~AGE_GROUP, y=~DSBJT_CD, z=~mean_AMT, 
          data=agg, type='heatmap')
  
  
  plot_ly(x=rnorm(10), y=rnorm(10), z=rnorm(10), color=sample(1:2, 10, replace=TRUE) )
  
### End of script
