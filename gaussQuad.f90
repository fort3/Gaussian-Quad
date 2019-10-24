module gaussquad

	contains
	function func(x) result(y)
	use types
		real(kind=rkind), intent(in) :: x
		real(kind=rkind) 			 :: y
				
		y = (x)/(sin(x) + 2)	
		!(x)/(sin(x) + 2)	
		!exp(-x*x)
		
	end function func
	
	subroutine gauss(integ,a,b,ndeg,func)
		use types
			real(kind=rkind), intent(in) 	                :: a, b
			real(kind=rkind), intent(out) 					:: integ
			real(kind=rkind)								:: j
			integer(kind=ikind)								:: ndeg,n=1
			real(kind=rkind), dimension(:,:), allocatable	:: c,d
			real(kind=rkind), dimension(:), allocatable		:: x
			integer 																																							  :: i,k,datafile, datfile,io,dfile
		interface
			function func(x) result(y)
				use types
				real(kind=rkind), intent(in)	:: x
				real(kind=rkind)				:: y
			end function func
		end interface	
		
		open(newunit=datfile, file="nodes.mtx")
		open(newunit=datafile, file="weights.mtx")
		
		do
		   read(datfile,*,iostat=io)
		   if (io/=0) exit
		end do
		 print*, ndeg
		
			allocate(c(ndeg,ndeg))
			rewind(datfile)
			
			
			do
		   read(datafile,*,iostat=io)
		   if (io/=0) exit
		end do
		 print*, ndeg
		
			allocate(d(ndeg,ndeg))
			rewind(datafile)
			
			
		allocate(x(ndeg))
		
 	print*, "   "
 	print*, "---------------------nodes-----------------------"	
		
		
			do i=1,ndeg
                read(unit=datfile, fmt=*) c(i,:)
                write(*,*) c(i,:)
			end do
	
		
		print*, "   "
		print*, "---------------------weights-----------------------"
		
		
			do i=1,ndeg
                read(unit=datafile, fmt=*) d(i,:)
                print*, d(i,:)
			end do	
	
						
			print*, "   "
			print*, "-----------------------"
			
			integ = 0.0_rkind
			j = 0.0_rkind		
			
			open(newunit=dfile, file="gaussconverg.mtx")
			
			do k=1,ndeg
				do i=1,ndeg
					x(k) = (b+a)/2.0_rkind + (b-a)*c(k,i)/2.0_rkind
					j = j+ d(k,i) * func(x(k))		
				end do
					integ = j * (b-a)/2.0_rkind
					print *, "n degree: ", n, "integral aproximation: ", integ
					
					write(unit=dfile, fmt=*)integ, abs((1.0_rkind)-integ), log(abs((1.0_rkind)-integ))
					write(*,*)
					
					if(n >= ndeg) then
						print*, "end"
						exit
					else
						n=n+1
					end if
			end do		
			
			close(datfile)
			close(datafile)
			
	end subroutine gauss

	
end module gaussquad
