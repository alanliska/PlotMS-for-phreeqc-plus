FC = /path/to/cross-compiler/prefix-gfortran
F77 = /path/to/cross-compiler/prefix-gfortran
CC = /path/to/cross-compiler/prefix-gcc

FPFLAGS = -DWITH_JSON=0

FFLAGS =  -ffree-line-length-none -fbacktrace -O2 -g -DNDEBUG -pie -fdefault-real-8 -fdefault-double-8 -fPIC

F77FLAGS = -ffree-line-length-none -fbacktrace -O2 -g -DNDEBUG -pie -fdefault-real-8 -fdefault-double-8 -fPIC

CFLAGS= -O2 -g -DNDEBUG -fPIC -pie

LIB = ./libplotms.a ../../libs-x86/liblapack.a ./libmctc.a ../../libs-x86/libblas.a

INC = -I./mctc-lib-src/include/mctc -I./mctc-lib-src/include -I.

LDFLAGS = -pie -static -fPIC
	
MCTCLIB = mctc-lib-src/src/mctc/env/accuracy.o \
mctc-lib-src/src/mctc/env/error.o \
mctc-lib-src/src/mctc/env/system.o \
mctc-lib-src/src/mctc/env.o \
mctc-lib-src/src/mctc/env/testing.o \
mctc-lib-src/src/mctc/io/filetype.o \
mctc-lib-src/src/mctc/io/codata2018.o \
mctc-lib-src/src/mctc/io/constants.o \
mctc-lib-src/src/mctc/io/convert.o \
mctc-lib-src/src/mctc/io/resize.o \
mctc-lib-src/src/mctc/io/structure/info.o \
mctc-lib-src/src/mctc/io/symbols.o \
mctc-lib-src/src/mctc/io/structure.o \
mctc-lib-src/src/mctc/io/utils.o \
mctc-lib-src/src/mctc/io/read/aims.o \
mctc-lib-src/src/mctc/io/read/cjson.o \
mctc-lib-src/src/mctc/io/read/ctfile.o \
mctc-lib-src/src/mctc/io/read/gaussian.o \
mctc-lib-src/src/mctc/io/read/genformat.o \
mctc-lib-src/src/mctc/io/read/pdb.o \
mctc-lib-src/src/mctc/io/read/qchem.o \
mctc-lib-src/src/mctc/io/read/qcschema.o \
mctc-lib-src/src/mctc/io/read/turbomole.o \
mctc-lib-src/src/mctc/io/read/vasp.o \
mctc-lib-src/src/mctc/io/read/xyz.o \
mctc-lib-src/src/mctc/io/read.o \
mctc-lib-src/src/mctc/io/write/aims.o \
mctc-lib-src/src/mctc/io/math.o \
mctc-lib-src/src/mctc/io/write/cjson.o \
mctc-lib-src/src/mctc/io/write/ctfile.o \
mctc-lib-src/src/mctc/io/write/gaussian.o \
mctc-lib-src/src/mctc/io/write/genformat.o \
mctc-lib-src/src/mctc/io/write/pdb.o \
mctc-lib-src/src/mctc/io/write/qchem.o \
mctc-lib-src/src/mctc/version.o \
mctc-lib-src/src/mctc/io/write/qcschema.o \
mctc-lib-src/src/mctc/io/write/turbomole.o \
mctc-lib-src/src/mctc/io/write/vasp.o \
mctc-lib-src/src/mctc/io/write/xyz.o \
mctc-lib-src/src/mctc/io/write.o \
mctc-lib-src/src/mctc/io.o

PLOTMSLIB = 	src/xtb_mctc_accuracy.o \
src/boxmuller.o \
src/entries.o \
src/isotopes.o \
src/readcommon.o \
src/readl.o \
src/version.o \
src/xtb_mctc_constants.o \
src/xtb_mctc_convert.o \
src/xtb_mctc_resize.o \
src/xtb_mctc_symbols.o

PLOTMS =	src/main.o

all:  libmctc.a libplotms.a plotms strip
	
libmctc.a:  $(MCTCLIB) 
	ar qc libmctc.a $(MCTCLIB) 
	ranlib libmctc.a

libplotms.a:  $(PLOTMSLIB) 
	ar qc libplotms.a $(PLOTMSLIB) 
	ranlib libplotms.a

plotms:  $(PLOTMS) 
	$(FC) $(FFLAGS) $(PLOTMS) $(LDFLAGS) -o plotms $(LIB) 
	
strip:
	/path/to/cross-compiler/prefix-strip plotms
	
clean: 
	find . -name "*.o" -type f -delete
	find . -name "*.mod" -type f -delete
	find . -name "*.smod" -type f -delete
	find . -name "*.a" -type f -delete
	find . -name "*.so" -type f -delete
	find . -name "*.so.6" -type f -delete
	find . -name "*.so.6.6.0" -type f -delete
	find . -name "*.in" -type f -delete
	find . -name "plotms" -type f -delete
#rm -rf  *.o *.a *.so *~ *.mod xtb

%.o: %.c
	$(CC) $(INC) $(CFLAGS) -c $< -o $@

%.o: %.f
	$(FC) $(INC) $(F77FLAGS) -c $< -o $@
	
%.o: %.F
	$(FC) $(INC) $(F77FLAGS) -c $< -o $@

%.o: %.f90
	$(FC) $(INC) $(FFLAGS) -c $< -o $@
	
%.o: %.F90
	$(FC) $(INC) $(FFLAGS) -c $< -o $@

mctc-lib-src/src/mctc/io/read/cjson.o: mctc-lib-src/src/mctc/io/read/cjson.F90
	$(FC) $(INC) $(FPFLAGS) $(FFLAGS) -c $< -o $@
mctc-lib-src/src/mctc/io/read/qcschema.o: mctc-lib-src/src/mctc/io/read/qcschema.F90
	$(FC) $(INC) $(FPFLAGS) $(FFLAGS) -c $< -o $@
