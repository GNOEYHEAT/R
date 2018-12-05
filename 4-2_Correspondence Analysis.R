### [Correspondence Analysis]

## 1. 범주형 변수의 대응분석(Correspondence Analysis)
    ## 교차표의 행 백분율에 대한 차원축소기법 
    ## 즉, 2개의 범주형 변수에 대한 요약
    
## 1.0 ca 패키지 불러오기
  #install.packages('ca')    
  library(ca) 
  
  smoke = as.matrix(smoke)
  smoke
  
##1.1 대응분석 예제

  # 행 백분율, 열 백분율
  prop.table(smoke, 1)    
  prop.table(smoke, 2) 
  
  heatmap(smoke, scale='none', col=colorRampPalette(c('white', '#E41A1C'))(100))

      # 열별 행비율의 차이에 대한 카이제곱검정
      chisq.test(smoke)

  # 대응분석 실행하기
  ca.smoke = ca(smoke)
  print(ca.smoke)
  
  # 행렬도(biplot) 그리기 
  plot(ca.smoke)
  
    ## 서로 가까울 수록 상대적으로 관련이 깊음
    ## 원점에 가까울 수록 큰 특징이 없음
    ## 표에서 관측치가 적은 수준은 가볍기 때문에 멀리 날아갈 수 있음
  
### End of script