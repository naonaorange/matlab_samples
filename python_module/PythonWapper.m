classdef PythonWapper
    % This script helps python handling for embedded python.
    % It is recommended to execute "clear classes" function at the first.
    methods
        % Input: python interpriter exe file path
        function obj = PythonWapper(PythonExePath)
            %[pythonDirPath, ~, ~] = fileparts(PythonExePath);
            % Add python path to system pat to run specified python interpriter in
            % matlab
            %if ~contains(getenv('PATH'), pythonDirPath)
            %    setenv('PATH', [pythonDirPath ';' getenv('PATH')]);
            %end
            pe = pyenv;
            if pe.Status == 'NotLoaded'
                if exist(pythonExePath, 'file')
                    pyversion(PythonExePath);
                end
            end
            pyenv
            obj.AddPath('');
        end
        
        % Add sys path to execte original python file.
        % Please add original python path.
        function AddPath(~, Path)
            if count(py.sys.path,path) == 0
                insert(py.sys.path,int32(0),Path);
            end
        end
        
        function ImportModule(~, ModuleName)
            mod = py.importlib.import_module(ModuleName);
            py.importlib.reload(mod);
        end
    end
end

