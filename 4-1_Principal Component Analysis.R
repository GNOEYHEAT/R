### [Principal Component Analysis]

## 1. 주성분분석

  protein = read.table('data/protein.txt', header=TRUE, row.names=1)
  
  str(protein)
  
  # 탐색적데이터분석 (산점도행렬, 상관계수행렬 등)
  pairs(protein, pch=16)
  round( cor(protein), 1)
  
      # 상관계수행렬의 시각화
      # install.packages('ellipse')
      library(ellipse)
      col.cor = colorRampPalette(c('#E41A1C', 'white', '#377EB8'))(11)
      plotcorr(cor(protein), col=col.cor[(cor(protein)*5+6)]) 
 
  # 주성분분석 실행
      
  pc.protein = princomp(protein, cor=TRUE)
    ## princomp(데이터이름, cor=T 혹은 cov=FALSE)
    ## cor(상관계수) ; 변수의 관계에 초점
    ## cov(공분산)   ; 전체 분산의 크기에 초점
  
  str(pc.protein)
    ## $loadings ; 각 주성분별로 변수에 걸린 가중치
    ## $scores   ; 새로운 축(주성분)에 의해 만들어진 각 관측치의 새로운 좌표(Coordinates)
  
  summary(pc.protein)
  
  # 주성분분석 행렬도(biplot) 그리기
  # par(mfrow=c(1,2))
  biplot( pc.protein, choices=1:2); abline(v=0, h=0, lty=2)
   ## 빨간색은 기존의 변수, 검은색은 관측치

### End of script  