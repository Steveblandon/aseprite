# Windows-only compilation instructions
# Pre-build instructions (environment setup)
1. Install [Visual Studio Community 2022](https://visualstudio.microsoft.com/downloads/) (2019 or greater) with the "Desktop development with C++" Workload
2. Install the latest version of [CMake](https://cmake.org) (3.16 or greater)
3. Download [Ninja](https://ninja-build.org) build system
4. unzip Ninja and copy ninja.exe to C:\Program Files\CMake\bin
5. git clone --recursive https://github.com/aseprite/aseprite.git
6. mkdir aseprite/build (i.e. create a build directory inside your newly create aseprite directory)
7. Download [Skia library - `aseprite-m102` branch](https://github.com/aseprite/skia/releases)
8. mkdir aseprite/build/deps
9. unzip Skia and copy contents to aseprite/deps

# build instructions
1. Open developer command prompt for VS XXXX (XXXX here being the version you downloaded and installed with the C++ workload
2. cd to <your_repo_path>/aseprite/build
3. git pull
4. git submodule update --init --recursive
5. cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLAF_BACKEND=skia -DSKIA_DIR=.\deps\skia -DSKIA_LIBRARY_DIR=.\deps\skia\out\Release-x64 -DSKIA_LIBRARY=.\deps\skia\out\Release-x64\skia.lib -G Ninja ..
6. ninja aseprite
7. aseprite is ready for use, find executable at aseprite\build\bin\aseprite.exe

### GCC compiler

In case that you are using the pre-compiled Skia version, you must use
the clang compiler and libc++ to compile Aseprite. Only if you compile
Skia with GCC, you will be able to compile Aseprite with GCC, and this
is not recommended as you will have a performance penalty doing so.

# Using shared third party libraries

If you don't want to use the embedded code of third party libraries
(i.e. to use your installed versions), you can disable static linking
configuring each `USE_SHARED_` option.

After running `cmake -G`, you can edit `build/CMakeCache.txt` file,
and enable the `USE_SHARED_` flag (set its value to `ON`) of the
library that you want to be linked dynamically.
