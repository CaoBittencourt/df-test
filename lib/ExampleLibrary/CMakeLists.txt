# project settings
cmake_minimum_required(VERSION 4.0)
project(ExampleLibrary)

# output settings
set(
  CMAKE_ARCHIVE_OUTPUT_DIRECTORY
  ${CMAKE_CURRENT_SOURCE_DIR}/..
)

# source files and header files
file(GLOB_RECURSE SOURCES "*.cc")
file(GLOB_RECURSE HEADERS "*.h")

# create statically-linked library
add_library(
  ${PROJECT_NAME}
  STATIC
  ${SOURCES}
  ${HEADERS}
)
