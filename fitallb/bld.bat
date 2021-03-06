%PYTHON% -c "import time; print time.strftime('1.1.0.%%Y.%%m.%%d')" > %SRC_DIR%\__conda_version__.txt

%PYTHON% setup.py install

for %%G in (fitallb.py fitglobalgrain.py fitgloball.py^
 fitgloball_multidet.py) DO (
copy /Y %RECIPE_DIR%\temp.exe %SCRIPTS%\%%G.exe
move /Y %SCRIPTS%\%%G %SCRIPTS%\%%G-script.py)

if errorlevel 1 exit 1
