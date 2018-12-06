### [Kmeans]

## 1. (시연) 그림의 색 축소
## 이미지파일의 K-means 자율학습(Unsupervised Learning)을 활용한 색깔 축소
## 이미지 파일 속 수만개의 색을 단 수십개의 색으로 효과적으로 줄일 수 있음 

if ( !('reshape2' %in% rownames(installed.packages())) ) { install.packages('reshape2') }
if ( !('png'      %in% rownames(installed.packages())) ) { install.packages('png') }

library(reshape2)
library(png)

# 그림파일 불러오기   
vangogh = readPNG('data/vangogh.png')
vangogh = vangogh[,,-4]
dim(vangogh)

## 행(세로) 1280 픽셀 * 열(가로) 1014 픽셀, 약 130만개 점에 대해
## R(빨강), G(초록), B(파랑) 색의 색깔 값을 3층으로 쌓은 데이터

# windows(width=1280, height=1014)
# par(mar=c(1.1, 1.1, 1.1, 1.1))

# 빈 그림 그리기
plot(0,0, type='n', xlim=c(1,1280), ylim=c(1,1014), axes=FALSE, xlab='', ylab='', asp=1)
## 배경이 흰색으로 변함

# rasterImage 함수로 vangogh 이미지 그리기
rasterImage(vangogh, 1, 1, 1280, 1014)
## rasterImage(이미지데이터, 왼쪽, 아래, 오른쪽, 위)

## 1.1 K-means를 활용한 색상 축소
## 색상데이터 : 3차원 테이블 형태 -> y좌표,x좌표,R,G,B 5개 변수 데이터 형태

# windows(width=300, height=100); par(mfrow=c(1,3))

# melt 함수를 사용해서 3차원 테이블을 행렬로 변환
vg_melt = reshape2::melt(vangogh)
head(vg_melt)
## Var1은 픽셀의 가로위치, Var2는 세로위치, Var3는 RGB를 의미
## 예를 들어, 3번째 관측치의 의미는 "(3, 1) 위치의 점의 빨강값(1)은 0.3058"

# 1개 점의 색상 값 확인 
filter(vg_melt, Var1==11, Var2==12)

# tidyr 패키지의 spread( ) 함수를 사용한 행렬의 재정렬
library(dplyr)
library(tidyr)

vg = vg_melt %>% spread(Var3, value)
head(vg)

# 이름 변경
names(vg) = c('Y','X','R','G','B')
head(vg)

# 사용된 색깔 수 계산
vg %>% select(R, G, B) %>% unique() %>% count()
## 279,635개 색 

# kmeans함수를 활용한 색의 축소
vg.RGB = vg %>% select(R, G, B)
KM.vg = kmeans(vg.RGB, centers=100)
## 28만개색을 비슷한(거리가 가까운)색을 기준으로 100개 그룹으로 묶음

# 100개의 색깔(100개 분류 중심(centroids))
centroids = KM.vg$centers
head(centroids)
# 첫번째 그룹의 중심은 R=?, G=?, B=?

# 각 점의 분류 결과
clusters  = KM.vg$cluster
head(clusters)
# 첫번째 점은 100개의 그룹 중에서 ?번째 그룹에 속함

# 색깔 축소된 그림의 표현
vg.RGB.KM = vangogh 
for (i in 1:3) { 
  vg.RGB.KM[ , ,i] = matrix(centroids[clusters, i], nrow=1014, byrow=TRUE) 
}
## 각점의 R, G, B를 자신이 속한 그룹 중심값으로 변환

plot(0,0, type='n', xlim=c(1,1280), ylim=c(1,1014), axes=FALSE, xlab='', ylab='', asp=1)
rasterImage(vg.RGB.KM, 1, 1, 1280, 1014)

# 색을 15개로 줄이기
KM.vg.2 = kmeans(vg.RGB, centers=15)
centroids.2 = KM.vg.2$centers
clusters.2  = KM.vg.2$cluster

vg.RGB.KM.2 = vangogh
for (i in 1:3) { 
  vg.RGB.KM.2[ , ,i] = matrix(centroids.2[clusters.2, i], nrow=1014, byrow=TRUE) 
}

plot(0,0, type='n', xlim=c(1,1280), ylim=c(1,1014), axes=FALSE, xlab='', ylab='', asp=1)
rasterImage(vg.RGB.KM.2, 1, 1, 1280, 1014)

# 색을 5개로 줄이기
KM.vg.3 = kmeans(vg.RGB, centers=5)
centroids.3 = KM.vg.3$centers
clusters.3  = KM.vg.3$cluster

vg.RGB.KM.3 = vangogh
for (i in 1:3) { 
  vg.RGB.KM.3[ , ,i] = matrix(centroids.3[clusters.3, i], nrow=1014, byrow=TRUE) 
}

plot(0,0, type='n', xlim=c(1,1280), ylim=c(1,1014), axes=FALSE, xlab='', ylab='', asp=1)
rasterImage(vg.RGB.KM.3, 1, 1, 1280, 1014)

### End of Script