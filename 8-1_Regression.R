### [Regression]

## 1. Linear Regression

  # read
  heights = read.csv('data/heights.csv')
  
  # scatter plot, correlation
  plot(heights, pch=16, col='#E84D0D40')
    abline(v = mean(heights$father),  h = mean(heights$son) , lty=2)
  
  # linear regression
  lm_height = lm(son ~ father, data=heights)
  
  summary(lm_height)
    
    # trend line
    abline(a =mean(heights$son)-mean(heights$father), b=1 , lty=2)
  
    # summary trend line  
    abline(a =86.07198, b= 0.51409 , lwd=2)
    points(x=c(164, 172, 180), y=86.07198 + c(164, 172, 180) *0.51409, pch=16)
    
## 2. ANalysis Of Variance
    
    ## 관심변수 : 연속형
    ## 설명변수 : 범주형
    
    ## 그룹간의 평균값 차이를 확인  
  
  private_edu = read.csv('data/private_edu.csv', fileEncoding='UTF-8')
  
  str(private_edu)
  head(private_edu)      
    
  # 지역구분 :서울, 학교급구분 :고등학교 선택
  library(dplyr)
  p_e_sub = private_edu %>% filter(지역구분=='서울', 학교급구분=='고등학교')  
    
  # 전체 평균 사교육비(연간)
  mean(p_e_sub$사교육비)
  
  # 학생성적구분 별 평균 사교육비 계산
  aggr = aggregate(사교육비 ~ 학생성적구분, data=p_e_sub, mean)
  names(aggr) = c('학생성적구분', '성적평균사교육비')
  aggr 
  
  # 그룹(학생성적구분)별 상자그림
  boxplot( 사교육비~학생성적구분, data=p_e_sub )

  # aov( )함수를 활용한 분산분석
  summary( aov(사교육비~학생성적구분, data=p_e_sub) )

  # 지역구분/행정구역/학교급구분/성별/가계소득수준 ? 
  summary( aov(사교육비~학교급구분+성별+가계소득수준, data=private_edu) )
    ## 변수이름1*변수이름2 -> 변수의 개별효과 + 교호작용(Interaction, 시너지효과/감쇄효과)
  
## 3. Logistic Regression
  
  admission = read.csv('data/binary.csv')
    admission$admit = factor(admission$admit)
    admission$rank  = factor(admission$rank)
  
  head(admission)
  
  # 로지스틱 회귀모형 만들기
    glm_adm = glm(admit ~ ., data=admission, family='binomial')
  summary(glm_adm)
  
  # 합격확률 예측하기
  new_student = read.csv('data/new_stu.csv')
    new_student$rank = factor(new_student$rank)
    
  new_student
  
  predict(glm_adm, new_student, type = 'response')

### End of script