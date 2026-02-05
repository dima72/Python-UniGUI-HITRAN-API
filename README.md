# Python-UniGUI-HITRAN-API

HITRAN is an acronym for high-resolution transmission molecular absorption database. 
HITRAN is a compilation of spectroscopic parameters that a variety of computer codes use to predict 
and simulate the transmission and emission of light in the atmosphere.

Python-UniGUI-HITRAN-API is a UniGUI web application,  
which utilizes Python's HITRAN API and allows to display  
generated spectra in browser thanks to Bokeh JavaScript chart library. 

Typically, Windows server host has Python and HITRAN API installed.  
Hitran.exe is a windows application utilizing Python4Delphi library to access Python session on the host. 
UniGui server application interacts with Hitran.exe by means IPC allowing to create for each 
user’s session in browser a standalone Python session on the server host. 


<b>Requirements:</b>

PythonUniGui.exe:
1) uniGUI components  http://unigui.com/download/docman </br> 
2) bokeh-2.4.3.min    uploaded by browser from https://cdn.bokeh.org/bokeh/release/bokeh-2.4.3.min.js </br>

Hitran.exe:</br> 
Python4Delphi      https://github.com/pyscripter/python4delphi</br> 

Python for windows must be installed</br>
PythonUniGui.exe and Hitran.exe must be running from the Python folder. e.g C:\Python</br>
HITRAN-API https://hitran.org/</br>

![image](https://github.com/dima72/Python-UniGUI-HITRAN-API/assets/4633233/013d49ab-9d5c-46b4-be96-215f0f0aaa5d)

