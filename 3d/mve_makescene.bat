:: gdalinfo C:\per\dev\gdal
echo on
rem set NLS_LANG=SWEDISH_SWEDEN.WE8ISO8859P1
rem set NLS_LANG=AMERICAN_SWEDEN.UTF8
rem set NLS_LANG=SWEDISH_SWEDEN.UTF8
rem chcp 1250
rem chcp 1252 verkar krävas för att åäö i filnamn, sökväg ska fungera
rem chcp 1252
set cur_hh=%time:~0,2%
if %cur_hh% lss 10 (set cur_hh=0%time:~1,1%)
set starttime=%date:~0,4%%date:~5,2%%date:~8,2%_%cur_hh%%time:~3,2%%time:~6,2%

Set CURRENTDIR=%CD%

:: 0. Sätt sökvägar:
set MVE_HOME="C:\bin\mve\mve-20151014-win64\mve-20151014-win64"
set GDAL_DATA="C:\Program Files\QGIS Lyon\share\epsg_csv"

set FILE="C:\per\data\mapillary\2016_03_20_12_49_23_203\2016_03_20_12_49_23_397.jpg"
::set FILE="C:\bilder\UKCamera\20140517_153348.jpg"
::set FILE="C:\bilder\torgny\Bild051.jpg"
set FILE="C:\per\dev\mapillary\downloads\6W2F1fxN-M-4QM3KvVDjIQ\0000.jpeg"
set FILE="C:\per\dev\mapillary\downloads\thumb-2048.jpg"
set FILE=C:\per\data\mapillary\2016_03_24_16_39_42_647___Mapillary\2016_03_24_16_39_42_824.jpg

set IMAGEDIR=2016_03_24_16_39_42_647___Mapillary
::set IMAGEDIR=2016_03_20_12_50_04_310
set IMAGEDIRWITHPATH=C:\per\data\mapillary\%IMAGEDIR%\
set SCENEDIR=C:\per\dev\mapillary\%IMAGEDIR%
set SCENEDIR="C:\per\dev\mapillary\%IMAGEDIR%"
set SCENEDIR=C:/per/dev/mapillary/%IMAGEDIR%
set SCENEDIR=%IMAGEDIR%
set SCENEDIR=.\%IMAGEDIR%

set LOG_FILE_NAME=%SCENEDIR%\mve_log_%starttime%.log

::Funkar
::%MVE_HOME%\makescene -i %IMAGEDIRWITHPATH% %SCENEDIR% >> %LOG_FILE_NAME%
::%MVE_HOME%\sfmrecon %SCENEDIR% >> %LOG_FILE_NAME%
::%MVE_HOME%\dmrecon -s2 %SCENEDIR% >> %LOG_FILE_NAME%
::%MVE_HOME%\scene2pset -F2 %SCENEDIR% %SCENEDIR%\pset-L2.ply >> %LOG_FILE_NAME%
::%MVE_HOME%\fssrecon %SCENEDIR%\pset-L2.ply %SCENEDIR%\surface-L2.ply >> %LOG_FILE_NAME%
%MVE_HOME%\meshclean -t10 %SCENEDIR%\surface-L2.ply %SCENEDIR%\surface-L2-clean.ply >> %LOG_FILE_NAME%

set stoptime=%date:~0,4%%date:~5,2%%date:~8,2%_%cur_hh%%time:~3,2%%time:~6,2%
echo Bearbetning av data slut: %stoptime% >> %LOG_FILE_NAME%
