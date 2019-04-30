Program Main
	Use Types
	Use Gaussquad
	
	Real(Kind=Rkind)			::Val
	Integer(Kind=Ikind)::	Ndegree
	
	Ndegree= 6
	Print*,"*****************************FORTUNE_SAM_OKON*******************************"
	Print*,"         "
 Print*,"This Is The Gauss Formular Approximation: "
 Call Gauss(Val,0.0_Rkind,20.0_Rkind,Ndegree,Func)
 
End Program
