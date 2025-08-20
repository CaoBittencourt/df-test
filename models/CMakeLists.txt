# project settings
cmake_minimum_required(VERSION 4.0)

# input/output settings
set(ROOT ${CMAKE_CURRENT_SOURCE_DIR}/..)
set(MODELS ${ROOT}/models)
set(LIBRARIES ${ROOT}/lib)

# set(SOURCE ${ROOT}/src)
# set(CMAKE ${ROOT}/cmake)
# set(CONAN ${ROOT}/conan)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${ROOT}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${ROOT})

set(CMAKE_BUILD_TYPE Release)

# set(CMAKE_TOOLCHAIN_FILE "${CONAN}/build/${CMAKE_BUILD_TYPE}/generators/conan_toolchain.cmake")
project(models)

# # cmake functions and macros
# include(${CMAKE}/utils.cmake)

# targets
set(dfLocalSrc ${MODELS}/main.cc)

# source files and header files
set(libInc ${LIBRARIES}/DataFrame/include)

file(GLOB_RECURSE headersDataFrame ${libInc}/DataFrame/*.h)

# create binary
add_executable(
  dfLocalBin
  ${dfLocalSrc}
  ${headersDataFrame}
)
set_property(
  TARGET
  dfLocalBin
  PROPERTY
  OUTPUT_NAME
  "df"
)

# add include directories
# target_include_directories(
# dfLocalBin
# PRIVATE
# ${ROOT}
# )
target_include_directories(
  dfLocalBin
  PRIVATE
  ${ROOT}
  "${LIBRARIES}/DataFrame/include"
)

# paths for statically-linked libraries
target_link_directories(
  dfLocalBin
  PRIVATE
  ${LIBRARIES}
)

# add statically-linked libraries
target_link_libraries(
  dfLocalBin
  PRIVATE
  DataFrame
)
