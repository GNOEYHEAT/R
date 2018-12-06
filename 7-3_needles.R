### [Needle practice]

Needle = function(n=100,l=0.8,k1=10,k2=10){
	k=0
	N_inside=0
	plot(0,type="n",xlim=c(0,k1),ylim=c(0,k2),xlab="",ylab="",axes=FALSE, main=paste(n," Needles with length ",l))
	abline(v=0:k1,h=0:k2,lty=2)
	repeat{
		k=k+1;
		x1 = runif(1,0,k1)
		x2 = runif(1,0,k2)
		th = runif(1,0,pi)
		X1=c(x1+cos(th)*l/2,x1-cos(th)*l/2)
		X2=c(x2+sin(th)*l/2,x2-sin(th)*l/2)
		floor1=floor(X1);		floor2=floor(X2)
		Bi = (floor1[1]==floor1[2] & floor2[1]==floor2[2])
		COL = 2 + Bi*2
		lines(X1,X2,lwd=2,col=COL)
		Sys.sleep(0.1)
		N_inside=N_inside+Bi;	

		if (k==n) break
		}
	mtext(side=1,text=paste(N_inside," of ",n," needles are inside"))
	abline(v=0:k1,h=0:k2,lty=2)
	}

# run

Needle()
