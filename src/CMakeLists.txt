add_library(libsmash
  basis.F90
  dft.F90
  dftfunc.F90
  ecp.F90
  ecpder.F90
  ecpfunc.F90
  fileio.F90
  geom.F90
  grad1.F90
  grad2.F90
  gradient.F90
  guess.F90
  int1.F90
  int2.F90
  int2elec.F90
  int2sp.F90
  int2spd1.F90
  int2spd2.F90
  int2spd3.F90
  int2spd4.F90
  lebedev.F90
  machine.F90
  main.F90
  math.F90
  memory.F90
  module.F90
  modulefmt.F90
  modulerys.F90
  mp2.F90
  mp2grad.F90
  parallel.F90
  prop.F90
  rysquad.F90
  scf.F90
  scflib.F90
)
set_target_properties(libsmash PROPERTIES OUTPUT_NAME smash)
install(TARGETS libsmash DESTINATION lib)

if(MPI_FOUND)
  target_link_libraries(libsmash PUBLIC MPI::MPI_Fortran)
else()
  target_compile_definitions(libsmash PRIVATE noMPI)
endif()
if(OpenMP_FOUND)
  target_link_libraries(libsmash PUBLIC OpenMP::OpenMP_Fortran)
endif()

add_executable(smash start.F90)
target_link_libraries(smash libsmash LAPACK::LAPACK BLAS::BLAS)
install(TARGETS smash DESTINATION bin)
