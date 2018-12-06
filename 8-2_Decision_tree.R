### [Deicision Tree]

## 1. 의사결정나무(Deicision tree)

  # install.packages('rpart')
  # install.packages('rpart.plot')
  
  library(rpart)
  library(rpart.plot)
  
  # 데이터 불러오기
  admission = read.csv('data/binary.csv')
    admission$admit = factor(admission$admit)
    admission$rank  = factor(admission$rank)
  
  head(admission)
    
  # 합격자 예측 트리 모형 만들기
  tree_adm = rpart(admit ~ ., data=admission)

  tree_adm

  # 트리모형 시각화하기
  rpart.plot(tree_adm, cex=1)
  
## 2. application
  
  insurance = read.csv('data/insurance.csv') 
  head(insurance)
  
  tree_ins = rpart(charges ~ ., data=insurance)
  rpart.plot(tree_ins, cex=1)
  
## 2-1. cp
  
  tree_ins = rpart(charges ~ ., data=ins_train, cp=0.001, minbucket=3 )
    ## cp : 기본값 0.01, 작을수록 더 복잡한 모형
    ## 이외에도 minsplit(가지를 뻗기위한 최소한의 그룹크기), minbucket(가지를 뻗은 후의 최소한의 그룹크기) 등 설정 
   
  rpart.plot(tree_ins, cex=1)

  # 테스트 데이터 불러오기
  ins_test = read.csv('data/insurance_test.csv')
  ins_test
  
  predict(tree_ins, ins_test)
  
  # cp의 활용
  printcp(tree_ins)
    ## nsplit : 가지를 뻗은 횟수
    ## 점점 잔가지
  
  plotcp(tree_ins)
    ## 수평선 아래 중 가장 왼쪽 cp값을 추천
  
  # prune( )을 활용한 가지치기
  pruned = prune(tree_ins, cp = 0.005)
  
  rpart.plot(pruned, cex=1)
  prp(pruned, type=1, extra=1)                												
    ## cp를 높이면 가지를 많이쳐서 모형이 단순해지고, 
    ## cp를 낮출수록 가지가 수북해서 모형이 복잡해짐
    
  # 교호작용을 반영한 회귀모형 적합
  
  lm_ins_inter = lm(charges ~ . + bmi:smoker, data=insurance)
  summary(lm_ins_inter)
  
### End of script 