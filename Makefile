c= gfortran -fimplicit-none -fbounds-check -fbacktrace -g -g3 -fdefault-real-8 -O0 -finit-real=nan 

all_objs := types.o gaussQuad.o

all: main.o $(all_objs)
	$c -g -o mygauss main.o $(all_objs)

types.o: types.f90
	$c -c types.f90

gaussQuad.o: types.o gaussQuad.f90
	$c -c gaussQuad.f90

main.o: $(all_objs) main.f90
	$c -c main.f90 

clean:
	rm -rf*.o *.mod
