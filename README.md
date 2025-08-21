# Issues when Testing the DataFrame Library

# Clone Repo
```bash
git clone --depth 1 --recurse-submodules https://github.com/CaoBittencourt/df-test.git df && cd df
```

# Test Library
## Build Static Libraries
```bash
cd lib
mkdir -p build
cd build
cmake ..
make
cd ../..
```

- `ExampleLibrary` is a sample library that uses the directory structure I prefer
  - Uses CMake
- `MCTS` is a library I need for running the Monte Carlo Tree Search algorithm
  - Uses make files, so I had to write a CMake file for it
- `DataFrame` is the data frame library for C++
  - Uses CMake

The CMake file in `lib/CMakeLists.txt` builds all three libraries.

## Build an Example Model
```bash
cd models
mkdir -p build
cd build
cmake ..
make
cd ../..
```
