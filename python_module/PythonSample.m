clear; clc;
%Clear python classes during initialize
clear classes;

% Set python interpriter path
pw = PythonWapper('.\python\python.exe');
% Add python script path
pw.AddPath('.\mod');
% Import python script via file name
pw.ImportModule('pyclass');

mod = py.pyclass.sampleclass();
mod.hello()
mod.sum(1,2)