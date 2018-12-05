### [Correspondence Analysis]

## 1. ������ ������ �����м�(Correspondence Analysis)
    ## ����ǥ�� �� ������� ���� ������ұ�� 
    ## ��, 2���� ������ ������ ���� ���
    
## 1.0 ca ��Ű�� �ҷ�����
  #install.packages('ca')    
  library(ca) 
  
  smoke = as.matrix(smoke)
  smoke
  
##1.1 �����м� ����

  # �� �����, �� �����
  prop.table(smoke, 1)    
  prop.table(smoke, 2) 
  
  heatmap(smoke, scale='none', col=colorRampPalette(c('white', '#E41A1C'))(100))

      # ���� ������� ���̿� ���� ī����������
      chisq.test(smoke)

  # �����м� �����ϱ�
  ca.smoke = ca(smoke)
  print(ca.smoke)
  
  # ��ĵ�(biplot) �׸��� 
  plot(ca.smoke)
  
    ## ���� ����� ���� ��������� ������ ����
    ## ������ ����� ���� ū Ư¡�� ����
    ## ǥ���� ����ġ�� ���� ������ ������ ������ �ָ� ���ư� �� ����
  
### End of script