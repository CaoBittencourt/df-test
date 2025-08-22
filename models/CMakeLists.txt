# project settings
cmake_minimum_required(VERSION 4.0)
set(CMAKE_CXX_STANDARD_REQUIRED 23)
project(models)

# input/output settings
set(ROOT ${CMAKE_CURRENT_SOURCE_DIR}/..)
set(MODELS ${ROOT}/models)
set(LIBRARIES ${ROOT}/lib)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${ROOT}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${ROOT})

# targets
set(dfTest ${MODELS}/main.cc)

# source files and header files
set(libInc ${LIBRARIES})

# create binary
add_executable(
  dfTestBin
  ${dfTest}

  # "${LIBRARIES}/DataFrame.h"
)
set_property(
  TARGET
  dfTestBin
  PROPERTY
  OUTPUT_NAME
  "df"
)

add_library(
  libDataFrame
  INTERFACE
  ${LIBRARIES}/DataFrame/include/DataFrame/DataFrame.h
  ${LIBRARIES}/DataFrame/include/DataFrame/DataFrameExports.h
  ${LIBRARIES}/DataFrame/include/DataFrame/DataFrameFinancialVisitors.h
  ${LIBRARIES}/DataFrame/include/DataFrame/DataFrameMLVisitors.h
  ${LIBRARIES}/DataFrame/include/DataFrame/DataFrameOperators.h
  ${LIBRARIES}/DataFrame/include/DataFrame/DataFrameStatsVisitors.h
  ${LIBRARIES}/DataFrame/include/DataFrame/DataFrameTransformVisitors.h
  ${LIBRARIES}/DataFrame/include/DataFrame/DataFrameTypes.h
  ${LIBRARIES}/DataFrame/include/DataFrame/RandGen.h
)

# add include directories
target_include_directories(
  libDataFrame
  INTERFACE
  ${LIBRARIES}/DataFrame/include
)

target_include_directories(
  dfTestBin
  PRIVATE
  ${ROOT}
)

# paths for statically-linked libraries
target_link_directories(
  dfTestBin
  PRIVATE
  ${LIBRARIES}
)

# add statically-linked libraries
target_link_libraries(
  dfTestBin
  PRIVATE
  libDataFrame
)
