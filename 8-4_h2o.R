### [h2o]

## 0 비우기
  
  rm(list=ls())
  gc()
  gc()
  
    # R 세션 재시작(Ctrl+Shift+F10)
  
## 1 data.table 패키지 활용

  # 패키지 설치하기 불러오기
  if ( !('data.table'      %in% rownames(installed.packages())) ) { install.packages('data.table') }
  library(data.table)

  # 데이터 불러오기(시간 측정)
  Sys.time()
  
  t1 = Sys.time()
    digits = read.csv('data/mnist_train.csv', header=FALSE)
  t2 = Sys.time()
  t2-t1
  
  # data.table 패키지의 fread( )를 활용한 불러오기
  rm(digits)
  gc()
  
  t1 = Sys.time()
    digits = fread('data/mnist_train.csv')
  t2 = Sys.time()
  t2-t1
  
## 2 데이터 살펴보기
  
  # 555번째 관측치 살펴보기
  k = 555
  digits[k, ]
  
  digits_number= digits[k, 785]
  digits_number
  
  digits_image = matrix( unlist(digits[k, -785]), ncol=28)
  digits_image
  
  image(digits_image[, 28:1], col=colorRampPalette(c('white','black'))(256))
    ## 1:784 ; 각 점의 검은 정도, 
    ## 785   ; 해당 이미지의 숫자

  # 785번째 변수를 범주형으로 변환
  digits[ , V785 := factor(V785)]
    ## data.table 형식의 특이한 사용법
  
  # 테스트 데이터 가져오기 
  digits_test = fread('data/mnist_test.csv')
  digits_test[ , V785 := factor(V785)]
  
## 3 h2o의 활용
  
  ## www.h2o.ai
  
  ## JDK 1.8 필요
  
  # 패키지 설치하고 불러오기
  install.packages('RCurl')
  install.packages('jsonlite')

    # install.packages('h2o', type='source', repos='http://h2o-release.s3.amazonaws.com/h2o/rel-wright/6/R')
    # download.packages(pkgs='h2o', type='source', destdir = getwd(), repos='http://h2o-release.s3.amazonaws.com/h2o/rel-wright/6/R')
    
    ## 혹시 설치했던 분은,
    # if ("h2o" %in% rownames(installed.packages())) { remove.packages("h2o") }
  
  install.packages('data/h2o_3.20.0.6.tar.gz', repos=NULL, type='source')

  # H2O 시작하기 
  library(h2o)
  localH2O = h2o.init(nthreads=-1)

    ## nthreads= : 사용할 CPU 코어수(-1은 모든 코어를 의미) 
    ## http://localhost:54321
  
  # 데이터를 h2o 객체로 변환
  d.h2o_train = as.h2o(digits)
  d.h2o_test  = as.h2o(digits_test)
  
## 3.1 의사결정 나무모형 적합
  
  # library(rpart)
  # digits.rpart = rpart(V785 ~., data=digits, method='class')
  # 
  # t.rpart = table(digits_test$V785, predict(digits.rpart, digits_test, type='class'))
  # t.rpart   ## Confusion matrix
 
      # > t.rpart
      #  
      #     0   1   2   3   4   5   6   7   8   9
      # 0 793   4   1   9   6  35  52  55  10  15
      # 1   2 964  35  56   0   0   0  10  67   1
      # 2  72  83 511  61  19   1  54  82 134  15
      # 3  23  20  35 651   7 101  23  20 110  20
      # 4   5  32   6  13 608  30 103  61  59  65
      # 5  70  30   8 100  53 221 125  21 191  73
      # 6  33  39  50  35  69  36 570  38  84   4
      # 7   2  14  36   6  31  24   5 793  61  56
      # 8  12  76  38  75  21 131  64   6 519  32
      # 9   6  17   2  17  39 125  44  86 107 566

  # 1 - sum(diag(t.rpart)) / sum(t.rpart)
    ## 오분류율 : 38.04%
 

## 3.2 Generalized Linear Model (h2o)
  
  # GLM 모형 적합  (h2o)
  digits.glm  = h2o.glm(x=1:784, y=785,
                        training_frame   = d.h2o_train,
                        validation_frame = d.h2o_test,
                        family='multinomial')
  digits.glm

    ## 오분류율 : 743 / 10,000 = 7.43%
  
## 3.3 Random Forest (h2o)
  digits.rf  = h2o.randomForest(x=1:784, y=785, 
                                training_frame   = d.h2o_train, 
                                validation_frame = d.h2o_test,
                                seed=2018)
  digits.rf
    ## 오분류율 : 331 / 10,000 = 3.31%
  
  ?h2o.randomForest
  
  
  # 변수의 중요도 확인 
  h2o.varimp(digits.rf) 

## 3.4 Gradient Boosting Machine (h2o)
  digits.gbm  = h2o.gbm(x=1:784, y=785,
                        training_frame   = d.h2o_train,
                        validation_frame = d.h2o_test)
  digits.gbm
    
    ## 오분류율 : 414 / 10,000 = 4.14%
  
  ?h2o.gbm
  
  # 변수의 중요도 확인 
  h2o.varimp(digits.gbm)
   
## 3.5 Deep Learning (h2o)
  # digits.dl  = h2o.deeplearning(x=1:784, y=785,
  #                               training_frame   = d.h2o_train,
  #                               validation_frame = d.h2o_test)
  # digits.dl
    
  ?h2o.deeplearning
  
## 3.6 grid( )를 활용한 최적값 찾기
  
  # 기본값 : ntrees = 50, max_depth = 5,
  # nfolds = 3 : train 데이터를 3등분해서 교차 검증 
  
      # grid = h2o.grid("gbm", x = 1:784, y = 785,
      #                 training_frame = d.h2o_train,
      #                 nfolds = 3,
      #                 hyper_params = list(ntrees = c(30,50,70,100),
      #                                      max_depth=c(3,5,10,20)),
      #                 seed=2018)
      # grid

        # > grid
        # H2O Grid Details
        # ================
        # 
        # Grid ID: Grid_GBM_digits_model_R_1529451336821_6 
        # Used hyper parameters: 
        #   -  max_depth 
        #   -  ntrees 
        # Number of models: 16 
        # Number of failed models: 0 
        # 
        # Hyper-Parameter Search Summary: ordered by increasing logloss
        #    max_depth ntrees                                        model_ids             logloss
        # 1         10     70 Grid_GBM_digits_model_R_1529451336821_6_model_10 0.11090907298732688
        # 2         10    100 Grid_GBM_digits_model_R_1529451336821_6_model_14 0.11261387177220672
        # 3          5    100 Grid_GBM_digits_model_R_1529451336821_6_model_13 0.11687246212453253
        # 4         10     50  Grid_GBM_digits_model_R_1529451336821_6_model_6  0.1195552306643889
        # 5         20     70 Grid_GBM_digits_model_R_1529451336821_6_model_11 0.12989920203458172
        # 6         20     50  Grid_GBM_digits_model_R_1529451336821_6_model_7 0.13129100675219182
        # 7          5     70  Grid_GBM_digits_model_R_1529451336821_6_model_9 0.13839500252159362
        # 8         20    100 Grid_GBM_digits_model_R_1529451336821_6_model_15 0.13923137448486164
        # 9         10     30  Grid_GBM_digits_model_R_1529451336821_6_model_2  0.1603726867279971
        # 10        20     30  Grid_GBM_digits_model_R_1529451336821_6_model_3 0.16195064540959997
        # 11         5     50  Grid_GBM_digits_model_R_1529451336821_6_model_5 0.16788492066146374
        # 12         3    100 Grid_GBM_digits_model_R_1529451336821_6_model_12 0.20139450123974328
        # 13         3     70  Grid_GBM_digits_model_R_1529451336821_6_model_8 0.24203884638294515
        # 14         5     30  Grid_GBM_digits_model_R_1529451336821_6_model_1 0.24653323085847703
        # 15         3     50  Grid_GBM_digits_model_R_1529451336821_6_model_4 0.29982713032363273
        # 16         3     30  Grid_GBM_digits_model_R_1529451336821_6_model_0  0.4278467702790846
  
  # 
  ## 10/ 70이 최적(기본값 5/50)
  
  digits.gbm  = h2o.gbm(x=1:784, y=785,
                        max_depth = 10,
                        ntrees = 70, 
                        training_frame   = d.h2o_train,
                        validation_frame = d.h2o_test)
  digits.gbm
    
    ## 오분류율 : 277 / 10,000 = 2.77% ( < 4.14% )
  
## 3.7 모형 다운로드

  h2o.download_pojo(digits.gbm, path=getwd())
  
### End of script