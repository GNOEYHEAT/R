### [Clustering]

## 1. 계층적 군집화

  # read
  agecity = read.csv('data/agecity.csv', row.names=1, fileEncoding='UTF-8')
    agecity = as.matrix(agecity)

  # heatmap
  heatmap( prop.table(agecity, 2),  scale='none',  col=colorRampPalette(c('white','#E41A1C'))(100), Rowv=NA)

  # Dendrogram 
    ## keep.dendro=TRUE로 Dendrogram 저장 
  hm = heatmap( prop.table(agecity, 2),  scale='none',  col=colorRampPalette(c('white','#E41A1C'))(100), Rowv=NA,
                keep.dendro=TRUE)
  class(hm$Colv)
  plot(hm$Colv)

  # hclust 형식으로 변환하기
  hh = as.hclust(hm$Colv)

  # cutree( ) 함수로 3개의 그룹으로 나누기
  cutree(hh, k = 3)

  # 4개의 그룹으로 나누기 
  cutree(hh, k = 4)
  
## 2. K-평균 군집화를 활용한 관심사별 청소년 그룹

  # read
  teens = read.csv('data/teens.csv', header=T)

  head(teens)
  str(teens)
  summary(teens)
    
      # (+1) 로그변환 및 표준화
      interests = teens[4:39]
      log_interests = log(interests+1)
      z_interests = scale(log_interests)
      
  # K-means 적용 (K=5)
  set.seed(13579)
    ## 그룹 평균 초기값 고정
  kmeans_teen = kmeans(z_interests, 5)

  # 군집화 결과 및 인사이트 확인

  kmeans_teen$size
    # 군집별 크기 확인

  kmeans_teen$centers
    # 군집의 중앙점(centers) 확인

  # 군집별 관심사 도출
  centers = kmeans_teen$centers
  names_teens = colnames(centers)

  # 각 군집별 상위 관심사 10개 확인
    ## 개인함수 생성
  
  bp_interests = function(k = 1){
    g_interests =  order(centers[k,], decreasing=TRUE)[1:10]
    for(i in g_interests){  barplot(centers[,i], col=1:5, main = names_teens[i]) }
  }

  par(mfrow=c(2,5))
  
  bp_interests(1)
  bp_interests(2)
  bp_interests(3)
  bp_interests(4)
  bp_interests(5)

  # 군집화 결과의 활용

  #데이터에 군집ID(cluster ID) 적용
  teens$cluster = kmeans_teen$cluster

  # 처음 5개 데이터 확인
  teens[1:5, c('cluster', 'female', 'age', 'friends')]

  # 군집별 평균 나이
  aggregate(age ~ cluster, mean, data = teens)

  # 군집별 여자 비율
  aggregate(female ~ cluster, mean, data = teens)
    
  # 군집별 친구 수의 평균
  aggregate(friends ~ cluster, mean, data = teens)
    bp_interests(2)

### End of script