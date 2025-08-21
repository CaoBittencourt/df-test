# project settings
cmake_minimum_required(VERSION 4.0)
set(CMAKE_CXX_STANDARD_REQUIRED 23)
project(libraries)

# input/output settings
set(LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${LIBRARIES})

# build libraries that use cmake
# note: "ExampleLibrary" outputs .a to lib/
execute_process(
  COMMAND bash -c "mkdir -p ${LIBRARIES}/DataFrame/build &&
  cd ${LIBRARIES}/DataFrame/build &&
  cmake -DCMAKE_BUILD_TYPE=Release -DHMDF_BENCHMARKS=0 -DHMDF_EXAMPLES=0 -DHMDF_TESTING=0 .. &&
  make &&
  mv *.a ${LIBRARIES} &&
  cd ${LIBRARIES}
  "
)

execute_process(
  COMMAND bash -c "mkdir -p ${LIBRARIES}/ExampleLibrary/build &&
  cd ${LIBRARIES}/ExampleLibrary/build &&
  cmake .. &&
  make &&
  cd ${LIBRARIES}
  "
)

# build libraries that don't use cmake
set(mctsDir ${LIBRARIES}/mcts)
set(mctsLib mcts)

file(GLOB_RECURSE mctsSources ${mctsDir}/mcts/**.cc ${mctsDir}/mcts/**.cpp ${mctsDir}/mcts/**.cxx ${mctsDir}/mcts/**.c)
file(GLOB_RECURSE mctsHeaders ${mctsDir}/mcts/**.hh ${mctsDir}/mcts/**.hpp ${mctsDir}/mcts/**.hxx ${mctsDir}/mcts/**.h)

# targets
add_library(
  ${mctsLib}
  STATIC
  ${mctsSources}
  ${mctsHeaders}
)
