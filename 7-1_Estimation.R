### [Probability]
    
## 1.1 sample 

  sample(1:10, 4, replace=FALSE, prob=c(0.4, 0.4, 0.1, 0.1, 0,0,0,0,0,0))
  
  
## 1.2 제 18대 대선 출구조사(추정)
    
  # 제 18대 대선   
    ## 기호 1번 득표율 추정 : 50.1 +-0.8% (95% 오차범위) = 49.3 ~ 50.9%
    ## 기호 2번 득표율 추정 : 48.9 +-0.8% (95% 오차범위) = 48.1 ~ 49.7%
    ## 실제 득표율 : 51.6% vs 48.0%
  
  # 데이터 만들기(실제 3천여만명의 투표결과)
  elec_result = rep( c('1_P','2_M','3_E'), c(15773128,	14692632, 128861) )
  length(elec_result)
  
  prop.table(table(elec_result))  
  
  # 6400명 샘플 뽑기
  set.seed(2255)
  result = sample(elec_result, 6400)
  
  # 샘플에서 득표율 계산하기
  table(result)
  table(result)/6400
    ## 17대 대선 출구조사와 동일한 결과
  
  # 동일한 출구조사를 1천번 했다고 가정하기
  p_moon = rep(0, 1000)
  
  for (i in 1:1000){
    sample_i = sample(elec_result, 6400)  
    p_moon[i]= table(sample_i)[2]/6400
  }
  
    ## 실제 득표율은 51.6%/48.0%지만, 표본에 따라 결과는 다를 수 있음 
  
  # 히스토그램 그리기
  hist(p_moon)
  
    ### 현실적으로 출구조사를 천번할 수 없고, 한번의 결과 +-0.6%P로 추정
    ### 신뢰구간 : 신뢰구간을 100번 구하면 (신뢰도)*100번 정도는 실제값이 구간에 "들어올 것으로 기대"
  
## 2. 사다리타기 모의실험

  ## 수리적으로 계산하기힘든 사건의 확률을 모의실험(simulation)으로 확인
  
  # 사용자 함수 만들기
  # 함수이름 = function(요소1=기본값, 요소2=기본값, ...){
  #           함수내용 }

  Ladder = function(n_p=5, n_l=10, pos=2, k=1000){
    
    ## 참여인원, 총 사다리개수, 내위치, 시뮬레이션 횟수
    
    x = matrix(0,ncol=k, nrow=1)
    
    for (i in 1:k){
      result  = 1:n_p
      ladders = sample(1:(n_p-1), n_l, replace=TRUE)
      
      for (j in 1:n_l){ 
        pos1 = ladders[j]
        pos2 = pos1 + 1
        result[c(pos1,pos2)] = result[c(pos2,pos1)]
      }
      
      x[1,i] = which(result==pos)
    }
    
    prop = round(table(x)/k, 2)
    print(prop)
    plot = barplot(prop, col='#377EB8')
    
  } 
  
  # 사다리타기 실행
    ## windows()   /   quartz()
  
  Ladder()
  Ladder(n_p=10, n_l=20, pos=3, k=1000)
  Ladder(10, 100, 10, 1000)
  
### End of script
