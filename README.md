# Python-UniGUI-HITRAN-API
 Python, UniGUI, HITRAN API
 
Python-UniGUI-HITRAN-API is a UniGUI web application,  
which utilizes Python's HITRAN API for spectroscopy and allows to display  
generated spectra in browser thanks to Bokeh JavaScript chart library. 

Typically, Windows server host has Python and HITRAN API installed.  
Hitran.exe is a windows application utilizing Python4Delphi library to access Python session on the host. 
UniGui server application interacts with Hitran.exe by means IPC allowing to create for each 
user’s session in browser a standalone Python session on the server host. 


Requirements:

PythonUniGui.exe:
uniGUI components  http://unigui.com/download/docman
bokeh-2.4.3.min    uploaded by browser from https://cdn.bokeh.org/bokeh/release/bokeh-2.4.3.min.js 

Hitran.exe:
Python4Delphi      https://github.com/pyscripter/python4delphi

Python for windows must be installed
PythonUniGui.exe and Hitran.exe must be running from the Python folder. e.g C:\Python