# Windows-only compilation instructions
Note, you'll need git installed and already in your environment variables path.
# Pre-build instructions (environment setup)
1. Install [Visual Studio Community 2022] with the "Desktop development with C++" Workload + "Windows 10.0.18362.0 SDK" (this step will take a while so continue with the rest of the pre-build instructions while this runs in the background).
2. Install the latest version of [CMake](https://cmake.org) (3.16 or greater)
3. Download [Ninja](https://ninja-build.org), unzip, and copy ninja.exe to C:\Program Files\CMake\bin
5. Go to a directory where you will put Aseprite in and open a command prompt from there.
6. Run command -> git clone --recursive https://github.com/aseprite/aseprite.git
7. Run command -> mkdir aseprite/deps/ (i.e. create a deps directory inside your newly create aseprite directory, you could also just do so manually)
8. Run command -> mkdir aseprite/build/
9. Download [Skia library - `aseprite-m102` branch](https://github.com/aseprite/skia/releases), unzip, and copy skia directory to aseprite/deps

# build instructions
1. Once VS2022 has been installed, open command prompt (cmd.exe) or re-use the previously opened one.
2. Run command -> call "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat" -arch=x64 (note, opening developer command prompt won't work, the arch=x64 part is essential for a successful build).
3. Run command -> cd <your_repo_path>/aseprite/build
4. Run command -> git pull
5. Run command -> git submodule update --init --recursive
6. Run command -> cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLAF_BACKEND=skia -DSKIA_DIR=..\deps\skia -DSKIA_LIBRARY_DIR=..\deps\skia\out\Release-x64 -DSKIA_LIBRARY=..\deps\skia\out\Release-x64\skia.lib -G Ninja ..
7. Run command -> ninja aseprite
8. aseprite is ready for use, find executable at aseprite\build\bin\aseprite.exe
9. If you ever need to or want to re-compile aseprite, make a backup of your bin and delete everything in your build folder, otherwise it will conflict with your new build. Once the build folder is clean, follow these build instructions to compile again.
