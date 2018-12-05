### [Relation]

  ins = read.csv('data/insurance.csv')

## 1. 두 개의 범주형 변수의 요약
  
  # 첫번째 변수 선택
  table(ins$sex)
  
  # 두번째 변수 선택
  table(ins$smoker)
  
  # table( ) 함수로 교차표(Contigency table) 만들기
  t=table(ins$sex, ins$smoker) ## table(변수1, 변수2)
  
## 1-1. 교차표의 활용
  
  # 백분율 계산
  prop.table(t)

  # 행백분율 계산
  prop.table(t, 1)  
    
  # 열백분율 계산
  prop.table(t, 2)
  
  # 열지도 그리기
  heatmap(t)
  heatmap(prop.table(t, 1), Rowv=NA, scale='none', col=colorRampPalette(c('white', '#494933'))(100))
  
## 2. 두 개의 연속형 변수의 관계 확인 
  
  # 첫번째 변수 선택
  hist(ins$charges)

  # 두번째 변수 선택
  hist(ins$age)

  # 산점도(Scatterplot) 그리기
  plot(ins$age, ins$charges, pch=16) ## "pch=" :  점모양

  # (추가로) 1개 범주형 변수를 색깔로 표현 가능
  plot(ins$age, ins$charges, pch=16, col=ins$smoker)
  
  # 상관계수
  cor(ins$age, ins$charges)
  
    ## 상관계수 예제
    heights = read.csv('data/heights.csv')
    plot(heights$father, heights$son, pch=16, col='#377EB880')
    abline(v=mean(heights$father), h=mean(heights$son), lty=2)
    cor(heights$father, heights$son)
  
## 3. 1개 연속형 변수와 1개 범주형 변수의 관계 확인

  # 첫번째 변수 선택
  hist(ins$charges)
  
  # 두번째 변수 선택
  table(ins$region)

  # region별 charges의 상자그림 그리기
  boxplot(charges ~ region, data=ins)
    ## 모형식 "관심변수 ~ 설명변수/그룹변수, data=데이터이름"
  
  # region별 charges의 평균 계산하기
  aggregate(charges ~ region, data=ins, mean)

### End of script 