# Aseprite

[![build](https://github.com/aseprite/aseprite/actions/workflows/build.yml/badge.svg)](https://github.com/aseprite/aseprite/actions/workflows/build.yml)
[![Discourse Community](https://img.shields.io/badge/discourse-community-brightgreen.svg?style=flat)](https://community.aseprite.org/)
[![Discord Server](https://discordapp.com/api/guilds/324979738533822464/embed.png)](https://discord.gg/Yb2CeX8)

## Introduction

**Aseprite** is a program to create animated sprites. Its main features are:

* Sprites are composed of [layers &amp; frames](https://www.aseprite.org/docs/timeline/) as separated concepts.
* Support for [color profiles](https://www.aseprite.org/docs/color-profile/) and different [color modes](https://www.aseprite.org/docs/color-mode/): RGBA, Indexed (palettes up to 256 colors), Grayscale.
* [Animation facilities](https://www.aseprite.org/docs/animation/), with real-time [preview](https://www.aseprite.org/docs/preview-window/) and [onion skinning](https://www.aseprite.org/docs/onion-skinning/).
* [Export/import](https://www.aseprite.org/docs/exporting/) animations to/from [sprite sheets](https://www.aseprite.org/docs/sprite-sheet/), GIF files, or sequence of PNG files (and FLC, FLI, JPG, BMP, PCX, TGA).
* [Multiple editors](https://www.aseprite.org/docs/workspace/#drag-and-drop-tabs) support.
* [Layer groups](https://imgur.com/x3OKkGj) for organizing your work, and [reference layers](https://twitter.com/aseprite/status/806889204601016325) for rotoscoping.
* Pixel-art specific tools like [Pixel Perfect freehand mode](https://imgur.com/0fdlNau), [Shading ink](https://www.aseprite.org/docs/shading/), [Custom Brushes](https://twitter.com/aseprite/status/1196883990080344067), [Outlines](https://twitter.com/aseprite/status/1126548469865431041), [Wide Pixels](https://imgur.com/1yZKUcs), etc.
* Other special drawing tools like [Pressure sensitivity](https://twitter.com/aseprite/status/1253770784708886533), [Symmetry Tool](https://twitter.com/aseprite/status/659709226747625472), [Stroke and Fill](https://imgur.com/7JZQ81o) selection, [Gradients](https://twitter.com/aseprite/status/1126549217856622597).
* [Tiled mode](https://twitter.com/pixel__toast/status/1132079817736695808) useful to draw patterns and textures.
* [Transform multiple frames/layers](https://twitter.com/aseprite/status/1170007034651172866) at the same time.
* [Lua scripting capabilities](https://www.aseprite.org/docs/scripting/).
* [CLI - Command Line Interface](https://www.aseprite.org/docs/cli/) to automatize tasks.
* [Quick Reference / Cheat Sheet](https://www.aseprite.org/quickref/) keyboard shortcuts ([customizable keys](https://imgur.com/rvAUxyF) and [mouse wheel](https://imgur.com/oNqFqVb)).
* [Reopen closed files](https://twitter.com/aseprite/status/1202641475256881153) and [recover data](https://www.aseprite.org/docs/data-recovery/) in case of crash.
* Undo/Redo for every operation and support for [non-linear undo](https://imgur.com/9I42fZK).
* [More features &amp; tips](https://twitter.com/aseprite/status/1124442198651678720)

## Issues

There is a list of
[Known Issues](https://github.com/aseprite/aseprite/issues) (things
to be fixed or that aren't yet implemented).

If you found a bug or have a new idea/feature for the program,
[you can report them](https://github.com/aseprite/aseprite/issues/new).

## Support

You can ask for help in:

* [Aseprite Community](https://community.aseprite.org/)
* [Aseprite Discord Server](https://discord.gg/Yb2CeX8)
* Official support: [support@aseprite.org](mailto:support@aseprite.org)
* Social networks and community-driven places:
  [Twitter](https://twitter.com/aseprite/),
  [Facebook](https://facebook.com/aseprite/),
  [YouTube](https://www.youtube.com/user/aseprite),
  [Instagram](https://www.instagram.com/aseprite/).

# Windows-only compilation instructions
Note, you'll need git installed and already in your environment variables path.
## Pre-build instructions (environment setup)
_ * note, you only need to do this setup once_
1. Install [Visual Studio Community 2022] with the "Desktop development with C++" Workload + "Windows 10.0.18362.0 SDK" (this step will take a while so continue with the rest of the pre-build instructions while this runs in the background).
2. Install the latest version of [CMake](https://cmake.org) (3.16 or greater)
3. Download [Ninja](https://ninja-build.org), unzip, and copy ninja.exe to C:\Program Files\CMake\bin
5. Go to a directory where you will put Aseprite in and open a command prompt from there.
6. Run command -> git clone --recursive https://github.com/aseprite/aseprite.git
7. Run command -> mkdir aseprite/deps/ (i.e. create a deps directory inside your newly create aseprite directory, you could also just do so manually)
8. Run command -> mkdir aseprite/build/
9. Download [Skia library - `aseprite-m102` branch](https://github.com/aseprite/skia/releases), unzip, and copy skia directory to aseprite/deps

## Manual build instructions
_* note, you can skip manual build and just use the provided build.bat - these instructions are just here for context of what that build script is doing. 
You can skip steps 4 and 5 if you don't want to update your local repo to the latest from the master branch._
1. Once VS2022 has been installed, open command prompt (cmd.exe) or re-use the previously opened one.
2. Run command -> call "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat" -arch=x64 (note, just using developer command prompt directly won't work, the 'arch=x64' part is essential for a successful build).
3. Run command -> cd <your_repo_path>/aseprite/build
4. Run command -> git pull
5. Run command -> git submodule update --init --recursive
6. Run command -> cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLAF_BACKEND=skia -DSKIA_DIR=..\deps\skia -DSKIA_LIBRARY_DIR=..\deps\skia\out\Release-x64 -DSKIA_LIBRARY=..\deps\skia\out\Release-x64\skia.lib -G Ninja ..
7. Run command -> ninja aseprite
8. aseprite is ready for use, find executable at aseprite\build\bin\aseprite.exe

If you ever need to or want to re-compile aseprite, make a backup of your aseprite\build\bin folder and delete everything else in your build folder, otherwise it will conflict with your new build. Once the build folder is clean, follow these build instructions to compile again.

# Additional Details

## Authors

Aseprite is being developed by [Igara Studio](https://igara.com/):

* [David Capello](https://davidcapello.com/)
* [Gaspar Capello](https://github.com/Gasparoken)
* [Martín Capello](https://github.com/martincapello)

## Credits

The default Aseprite theme was introduced in v0.8, created by:

* [Ilija Melentijevic](https://ilkke.net/)

A modified dark version of this theme introduced in v1.3-beta1 was created by:

* [Nicolas Desilets](https://twitter.com/MapleGecko)
* [David Capello](https://twitter.com/davidcapello)

Aseprite includes color palettes created by:

* [Richard "DawnBringer" Fhager](http://pixeljoint.com/p/23821.htm), [16 colors](http://pixeljoint.com/forum/forum_posts.asp?TID=12795),  [32 colors](http://pixeljoint.com/forum/forum_posts.asp?TID=16247).
* [Arne Niklas Jansson](http://androidarts.com/), [16 colors](http://androidarts.com/palette/16pal.htm), [32 colors](http://wayofthepixel.net/index.php?topic=15824.msg144494).
* [ENDESGA Studios](https://twitter.com/ENDESGA), [EDG16 and EDG32](https://forums.tigsource.com/index.php?topic=46126.msg1279124#msg1279124), and [other palettes](https://twitter.com/ENDESGA/status/865812366931353600).
* [Hyohnoo Games](https://twitter.com/Hyohnoo), [mail24](https://twitter.com/Hyohnoo/status/797472587974639616) palette.
* [Davit Masia](https://twitter.com/DavitMasia), [matriax8c](https://twitter.com/DavitMasia/status/834862452164612096) palette.
* [Javier Guerrero](https://twitter.com/Xavier_Gd), [nyx8](https://twitter.com/Xavier_Gd/status/868519467864686594) palette.
* [Adigun A. Polack](https://twitter.com/adigunpolack), [AAP-64](http://pixeljoint.com/pixelart/119466.htm), [AAP-Splendor128](http://pixeljoint.com/pixelart/120714.htm), [SimpleJPC-16](http://pixeljoint.com/pixelart/119844.htm), and [AAP-Micro12](http://pixeljoint.com/pixelart/121151.htm) palette.
* [PineTreePizza](https://twitter.com/PineTreePizza), [Rosy-42](https://twitter.com/PineTreePizza/status/1006536191955623938) palette.

It tries to replicate some pixel-art algorithms:

* [RotSprite](http://forums.sonicretro.org/index.php?showtopic=8848&st=15&p=159754&#entry159754) by Xenowhirl.
* [Pixel perfect drawing algorithm](https://deepnight.net/blog/tools/pixel-perfect-drawing/) by [Sébastien Bénard](https://twitter.com/deepnightfr) and [Carduus](https://twitter.com/CarduusHimself/status/420554200737935361).

Thanks to [third-party open source projects](docs/LICENSES.md), to
[contributors](https://www.aseprite.org/contributors/), and all the
people who have contributed ideas, patches, bugs report, feature
requests, donations, and help me to develop Aseprite.

## License

This program is distributed under three different licenses:

1. Source code and official releases/binaries are distributed under
   our [End-User License Agreement for Aseprite (EULA)](EULA.txt). Please check
   that there are [modules/libraries in the source code](src/README.md) that
   are distributed under the MIT license
   (e.g. [laf](https://github.com/aseprite/laf),
   [clip](https://github.com/aseprite/clip),
   [undo](https://github.com/aseprite/undo),
   [observable](https://github.com/aseprite/observable),
   [ui](src/ui), etc.).
2. You can request a special
   [educational license](https://www.aseprite.org/faq/#is-there-an-educational-license)
   in case you are a teacher in an educational institution and want to
   use Aseprite in your classroom (in-situ).
3. Steam releases are distributed under the terms of the
   [Steam Subscriber Agreement](http://store.steampowered.com/subscriber_agreement/).

You can get more information about Aseprite license in the
[FAQ](https://www.aseprite.org/faq/#licensing-&-commercial).
