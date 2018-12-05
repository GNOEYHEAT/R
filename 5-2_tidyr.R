### [tidyr]

## 1. tidyr 패키지를 활용한 데이터 처리

  delivery = read.csv('data/SKT.csv', fileEncoding='UTF-8')
  head(delivery)
  
  # install.packages('tidyr')
  library(tidyr)
  library(dplyr) ## 파이프라인(%>%)을 쓰기 위해
  
  # aggregate( )로 데이터 요약하기
  aggr = aggregate(통화건수 ~ 시군구 + 시간대 + 요일 + 업종, data=delivery, sum)
      
## 1.1 spread( )로 데이터를 여러 열로 나누기(long -> wide)
  
  ## spread(데이터이름, 기준변수이름, 나열할 값)
  aggr_wide = aggr %>% spread(업종, 통화건수) 
  
## 1.2 replace_na( )로 결측값 처리하기
  
  ## replace_na(list(변수1=값, 변수2=값, ...))
  aggr_wide2 = aggr_wide %>% replace_na(list(족발보쌈=0, 중국음식=0, 치킨=0, 피자=0))
  
## 1.3 drop_na( )로 결측값을 포함한 관측치 버리기
  
  ## drop_na(결측값을 찾을 변수1, 변수2, ...) 
  aggr_wide %>% drop_na(치킨, 피자)
    
## 1.4 gather( )로 여러 열을 한 열+구분변수로 만들기(wide->long)
  
  ## gather(데이터이름, 새기준변수이름, 새변수이름, 모을 변수들)
  aggr_long = aggr_wide2 %>% gather(Category, Count, -(시군구:요일))
    
## 1.5 complete( )로 빠져있는 조합 채우기

  # fill= 옵션으로 빈값 채우기                           
  aggr_wide2 %>% complete(시군구, 시간대, 요일, fill=list(족발보쌈=0, 중국음식=0, 치킨=0, 피자=0))
  
## 2. 한꺼번에 여러파일을 처리하기
  
  # 데이터를 불러와서 요약하는 함수 만들기
  
  my_summary = function(file_path){
    loaded = read.csv(file_path, fileEncoding='UTF-8')
    result = loaded %>% 
                gather(시간대, 승객수, H05:H25) %>%
                group_by(구분, 날짜) %>% 
                summarise(SUM = sum(승객수)) %>% 
                spread(구분, SUM)
    return(result)
  }
  
  my_summary('test.csv')
  
  # 폴더 만들기
  dir.create('result')
  
  # 파일 목록 만들기 
  
    # list.files()로 파일 목록 살펴보기 
    list.files('data/subway')
  
    # 패턴과 일치하는 파일 목록 만들기
    list.files('data/subway', pattern='_1612_1')
      ## 패턴과 일치하는 1호선 데이터만 선택하기
  
    # 전체 경로 포함하기  
    list.files('data/subway', full.names=TRUE)
  
### End of script