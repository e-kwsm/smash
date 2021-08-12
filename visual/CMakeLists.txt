add_executable(vtk-generator vtk-generator.F90)
add_executable(cube-generator cube-generator.F90)

if(OpenMP_FOUND)
  target_link_libraries(vtk-generator OpenMP::OpenMP_Fortran)
  target_link_libraries(cube-generator OpenMP::OpenMP_Fortran)
endif()
