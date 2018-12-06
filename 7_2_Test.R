### [Test]

    ## 색깔 설정
    library(RColorBrewer)
    mycol = brewer.pal(9, 'Set1')
    mycol2 = paste0(mycol, '60')

## 1. 두 연속형 변수의 관계 탐색

  heights = read.csv('data/heights.csv')
  
  head(heights)
  
  summary(heights)
  boxplot(heights)
  
  plot(x=heights$father, y=heights$son, pch=16, col=mycol2[1])
    abline(v=mean(heights$father), h=mean(heights$son), lty=2)

  cor(heights)
  cor(x=heights$father, y=heights$son)
  
  # 의미있는 상관계수 인지, 유의성 검정
  cor.test(x=heights$father, y=heights$son)
    
## 2. 하나의 연속형 변수와 하나의 범주형 변수의 관계 탐색
  
  ins = read.csv('data/insurance.csv')
  
  head(ins)
  
  mean(ins$charges)
  
  aggregate(charges ~ sex, data=ins, mean)
  boxplot(charges ~ sex, data=ins)
  
  aggregate(charges ~ smoker, data=ins, mean)
  boxplot(charges ~ smoker, data=ins)
  
  # 의미있는 평균 차이인지, 유의성 검정
    ## 분산분석(ANOVA;ANalysis Of VAriance)
  summary( aov(charges ~ sex, data=ins) )
  summary( aov(charges ~ smoker, data=ins) )
  
## 3. 두 범주형 변수의 관계 탐색
    
  t = table(ins$sex, ins$smoker)
  t
  
  prop.table(t, 1)
  prop.table(t, 2)
  
  heatmap( prop.table(t, 1),  scale='none', col=colorRampPalette(c('white', '#E41A1C'))(100))
  heatmap( prop.table(t, 2),  scale='none', col=colorRampPalette(c('white', '#E41A1C'))(100))
  
  # 의미있는 관계인지, 유의성 검정
    ## 독립성 검정(=교차표에 대한 카이제곱 검정)
  chisq.test(t)

### End of script