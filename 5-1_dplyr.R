### [dplyr]

## 1. dplyr 패키지를 활용한 요약

  # install.packages('dplyr')
  library(dplyr)

  delivery = read.csv('data/SKT.csv', fileEncoding='UTF-8')
  head(delivery)

## 1.1 slice( )로 특정 행만 불러오기
  # slice(delivery, c(1,3,5:10))

## 1.2 filter( )로 조건에 맞는 데이터 행만 불러오기
  # filter(delivery, 시군구=='성북구', 요일 %in% c('토', '일'), 업종=='피자' | 통화건수>=100)
    ## 'OR'은 | 로 연결, 'AND'는 ,로 연결

## 1.3 arrange( )로 정렬하기(오름차순)
  # arrange(delivery, desc(시군구), 요일, 업종)

## 1.4 select( )로 변수를 선택하거나 제외하기
  # select(delivery, -요일)

## 1.5 unique( )로 반복 내용제거하기
  # unique( select(delivery, 업종) )

## 1.6 mutate( )로 기존 변수를 활용한 새로운 변수 추가하기 
  # mutate(delivery, 새요일=paste0(요일, '요일'))

## 1.7 group_by( )로 그룹 지정해주기
  # delivery_grp = group_by(delivery, 시군구)

## 1.8 summarize( )로 요약 하기
  # summarise(delivery_grp, mean(통화건수), m = min(통화건수), M = max(통화건수))
  
## 1.9 count( )로 그룹별 개수 세기
  # count(delivery, 시군구)
  # summarise(delivery_grp, length(통화건수))
  
## 1.10 파이프라인( %>% )을 활용한 연속작업

  new_data = delivery %>% filter(업종=='중국음식') %>% group_by(시군구) %>% 
            summarise(mean_call = mean(통화건수)) %>% arrange(desc(mean_call))
  
  # 결과를 csv파일로 저장
  write.csv(new_data, 'result.csv', row.names=FALSE)

### End of script