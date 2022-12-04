call "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat" -arch=x64
IF exist .\build ( rmdir /s/q .\build )
mkdir .\build
cd .\build
git pull
git submodule update --init --recursive
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLAF_BACKEND=skia -DSKIA_DIR=..\deps\skia -DSKIA_LIBRARY_DIR=..\deps\skia\out\Release-x64 -DSKIA_LIBRARY=..\deps\skia\out\Release-x64\skia.lib -G Ninja ..
ninja aseprite