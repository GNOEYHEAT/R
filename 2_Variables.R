### [Variables]

## 1. 행렬(Matrix)

  m = matrix(1:12, ncol=3)
  
  nrow(m) # 행의 개수
  
  ncol(m) # 열의 개수 
  
  dim(m) # 차원  
  
    ## 여러가지 괄호의 활용 
    ## () : 함수 
    ## [] : 인덱스
    ## {} : 묶음용  
    
## 2. 데이터 프레임(data.frame)
  
  # matrix 형식의 단점(모두 문자/숫자로 통일)
  m[1, 1] = 'F'
  m
  
  # R에서 데이터는 data.frame를 기본 형식으로 활용
  # read.csv( ) 등으로 데이터를 불러오면 자동으로 data.frame 형식으로 지정
  # 각 변수들은 특성에 맞게 int(integer:정수), num(numeric:숫자), factor(범주형) 형식으로 지정
  
## 3. 형 변환
  
  # as.numeric()
  # as.character()
  # as.Date()

### End of script