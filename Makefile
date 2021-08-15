# Makefile for OpenMPI based on Intel fortran compiler
F90 = mpif90
CPPFLAGS =
MODDIR_FLAG = -module
LIB = -mkl=parallel
OPT = -qopenmp -i8 -xHOST
SRC =   basis.F90 geom.F90 guess.F90 fileio.F90 int1.F90 machine.F90 main.F90 math.F90 \
	memory.F90 scf.F90 scflib.F90 int2.F90 int2elec.F90 int2sp.F90 int2spd1.F90 \
	int2spd2.F90 int2spd3.F90 int2spd4.F90 gradient.F90 rysquad.F90 \
	dft.F90 dftfunc.F90 lebedev.F90 mp2.F90 mp2grad.F90 grad1.F90 grad2.F90 ecp.F90 \
	ecpfunc.F90 ecpder.F90 parallel.F90 start.F90 prop.F90
MOD = module.F90 modulefmt.F90 modulerys.F90
OBJ = $(addprefix obj/,$(SRC:.F90=.o))
OBJM= $(addprefix obj/,$(MOD:.F90=.o))
OBJS= $(OBJM) $(OBJ)
OBJDIR= obj
.SUFFIXES:
.SUFFIXES: .F .F90 .o

smash : $(OBJS)
	$(F90) -o bin/smash $(OPT) $(OBJS) $(LIB)

libsmash.a : $(filter-out $(OBJDIR)/start.o,$(OBJS))
	$(AR) $(ARFLAGS) $(OBJDIR)/libsmash.a $^

$(OBJDIR)/%.o : src/%.F90
	$(F90) $(CPPFLAGS) $(OPT) $(MODDIR_FLAG) $(OBJDIR) -o $@ -c $<

$(OBJ): $(addprefix src/,$(MOD))

clean :
	rm -f $(OBJDIR)/* bin/smash
