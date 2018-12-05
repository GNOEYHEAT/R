### [Principal Component Analysis]

## 1. �ּ��км�

  protein = read.table('data/protein.txt', header=TRUE, row.names=1)
  
  str(protein)
  
  # Ž���������ͺм� (���������, ��������� ��)
  pairs(protein, pch=16)
  round( cor(protein), 1)
  
      # ����������� �ð�ȭ
      # install.packages('ellipse')
      library(ellipse)
      col.cor = colorRampPalette(c('#E41A1C', 'white', '#377EB8'))(11)
      plotcorr(cor(protein), col=col.cor[(cor(protein)*5+6)]) 
 
  # �ּ��км� ����
      
  pc.protein = princomp(protein, cor=TRUE)
    ## princomp(�������̸�, cor=T Ȥ�� cov=FALSE)
    ## cor(������) ; ������ ���迡 ����
    ## cov(���л�)   ; ��ü �л��� ũ�⿡ ����
  
  str(pc.protein)
    ## $loadings ; �� �ּ��к��� ������ �ɸ� ����ġ
    ## $scores   ; ���ο� ��(�ּ���)�� ���� ������� �� ����ġ�� ���ο� ��ǥ(Coordinates)
  
  summary(pc.protein)
  
  # �ּ��км� ��ĵ�(biplot) �׸���
  # par(mfrow=c(1,2))
  biplot( pc.protein, choices=1:2); abline(v=0, h=0, lty=2)
   ## �������� ������ ����, �������� ����ġ

### End of script  