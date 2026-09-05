@echo off

REM Initialize Conda
call C:\Users\Loverboy\anaconda3\Scripts\activate.bat

REM Activate project environment
call conda activate "E:\DEV\PROJECTS\ACTIVE\GIS\LearningGIS\.conda"

REM Go to project folder
cd /d "E:\DEV\PROJECTS\ACTIVE\GIS\LearningGIS"

REM Launch Jupyter Notebook
jupyter notebook

pause