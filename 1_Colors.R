### [COLORS]

## 1. R 색상 체계

  # R은 HEX 코드를 사용, 대표색은 이름으로 지정가능
  # R(빨강), G(초록), B(파랑)을 16진수 00(0)~FF(255)로 표현

  # plot 함수로 색깔 점 찍기
  plot(0,0, pch=16, cex=10, col='black')
  
  # "#RRGGBB" HEX코드 활용
  plot(0,0, pch=16, cex=10, col='#11AA22')
  
  # 기업 CI 색상 예제 
    # SAMSUNG Blue
      ## R20  + G40  + B160
    # LG Red
      ## R165 + G0   + B52
    # SK Red
      ## R234 + G0   + B44
    
  # rgb() 함수를 활용한 HEX코드 생성
  rgb( 20/255,  40/255, 160/255)
  rgb(165/255,   0/255,  52/255)
  rgb(234/255,   0/255,  44/255)

## 2. 그라데이션색 만들기
  
  # colorRampPalette()로 그라데이션 색 만들기 
  colorRampPalette(c('#1428A0', 'white', '#A50034'))(100)
  plot(1:100, rep(0,100), pch=16, col=colorRampPalette(c('#1428A0', 'white', '#A50034'))(100))

## 3. RColorBrewer 패키지 활용하기

  # install.packages('RColorBrewer')
  library(RColorBrewer)

    # 새창 window
    windows() 
  
    # 새창 mac 
    quartz()

  # 패키지 내 모든 색상조합 확인  
  display.brewer.all()

  # 우리가 사용할 색깔
  mycol = brewer.pal(9, 'Set1')
  plot(1:9, rep(1, 9), pch=16, cex=10, col=mycol)
  
  # 불투명한 색깔 만들기 
  mycol2 = paste0(mycol, '60') ## Alpha(투명도)를 16진수로 표현
  plot(1:9, rep(1, 9), pch=16, cex=15, col=mycol2)
  
### End of script