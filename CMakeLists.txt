cmake_minimum_required(VERSION 3.11)
project(smash LANGUAGES Fortran)

option(ENABLE_MPI "MPI parallelization" ON)
if(ENABLE_MPI)
  find_package(MPI REQUIRED)
endif()
option(ENABLE_OPENMP "OpenMP parallelization" ON)
if(ENABLE_OPENMP)
  find_package(OpenMP REQUIRED)
endif()

find_package(BLAS REQUIRED)
find_package(LAPACK REQUIRED)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/bin")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/lib")

add_subdirectory(src)
add_subdirectory(visual)
