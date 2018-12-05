### [BASIC]
    
## 1. csv파일 불러오기

    # 작업폴더 확인
    getwd()
  
  # csv 불러오기 저장하기 
  test_data = read.csv('test.csv')
  
  # 첫 10개 관측치만 콘솔창에서 보기
  head(test_data, n=10)
    
  # 데이터의 구조(Structure) 살펴보기
  str(test_data)
    
  # 변수이름 확인하기
  names(test_data)
  
  # install.packages('openxlsx')
  # read.xlsx( ) 함수 사용
  library(openxlsx)
  
## 2-1 하나의 범주형 변수 요약하기 
  
  # 분석 대상 변수 선택
  test_data$region
  
  # table( )로 표 만들기
  table(test_data$region)
  
  # barplot( )으로 막대 그래프 그리기
  barplot( table(test_data$region) )
  
  # pie( )로 파이차트 그리기
  pie( table(test_data$region) )
  
## 2-2 하나의 연속형 변수 요약하기 
  
  # 분석 대상 변수 선택하기
  test_data$charges

  # 평균 계산하기 
  mean(test_data$charges)

  # 히스토그램 그리기
  hist(test_data$charges)
  
### End of script