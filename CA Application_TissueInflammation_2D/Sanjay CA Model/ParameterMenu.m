function varargout = ParameterMenu(varargin)
% PARAMETERMENU MATLAB code for ParameterMenu.fig
%      PARAMETERMENU, by itself, creates a new PARAMETERMENU or raises the existing
%      singleton*.
%
%      H = PARAMETERMENU returns the handle to a new PARAMETERMENU or the handle to
%      the existing singleton*.
%
%      PARAMETERMENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARAMETERMENU.M with the given input arguments.
%
%      PARAMETERMENU('Property','Value',...) creates a new PARAMETERMENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ParameterMenu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ParameterMenu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ParameterMenu

% Last Modified by GUIDE v2.5 17-Aug-2015 12:16:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ParameterMenu_OpeningFcn, ...
                   'gui_OutputFcn',  @ParameterMenu_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ParameterMenu is made visible.
function ParameterMenu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ParameterMenu (see VARARGIN)

% Choose default command line output for ParameterMenu
handles.output = hObject;

titImg=imread('CATitle.png');
axes(handles.mainTitle);
imshow(titImg);
% Initialise  Default Parameters
handles.xCoor=100;
handles.yCoor=100;
handles.zCoor=100;
handles.exprssRte=2;
handles.infRte=4;
handles.P_hc=0.6;
handles.ThR=9;
handles.P_hd=0.5;
handles.N_hd=4;
handles.P_eid=0.45;
handles.P_dh=0.45;
handles.T_lim=10;
handles.L_lim=20;
handles.itrCnt=50;
handles.wbcCnt=100;



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ParameterMenu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ParameterMenu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function xCoor_Callback(hObject, eventdata, handles)
% hObject    handle to xCoor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xCoor as text
%        str2double(get(hObject,'String')) returns contents of xCoor as a double
xCoor=str2double(get(hObject,'String'));
handles.xCoor=xCoor;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function xCoor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xCoor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function yCoor_Callback(hObject, eventdata, handles)
% hObject    handle to yCoor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yCoor as text
%        str2double(get(hObject,'String')) returns contents of yCoor as a double
yCoor=str2double(get(hObject,'String'));
handles.yCoor=yCoor;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function yCoor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yCoor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zCoor_Callback(hObject, eventdata, handles)
% hObject    handle to zCoor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zCoor as text
%        str2double(get(hObject,'String')) returns contents of zCoor as a double
zCoor=str2double(get(hObject,'String'));
handles.zCoor=zCoor;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function zCoor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zCoor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
exprssRte=str2double(get(hObject,'String'));
handles.exprssRte=expressRte;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
infRte=str2double(get(hObject,'String'));
handles.infRte=infRte;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function phc_Callback(hObject, eventdata, handles)
% hObject    handle to phc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phc as text
%        str2double(get(hObject,'String')) returns contents of phc as a double
P_hc=str2double(get(hObject,'String'));
handles.P_hc=P_hc;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function phc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ThR_Callback(hObject, eventdata, handles)
% hObject    handle to ThR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ThR as text
%        str2double(get(hObject,'String')) returns contents of ThR as a double
ThR=str2double(get(hObject,'String'));
handles.ThR=ThR;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function ThR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ThR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PhD_Callback(hObject, eventdata, handles)
% hObject    handle to PhD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PhD as text
%        str2double(get(hObject,'String')) returns contents of PhD as a double
P_hd=str2double(get(hObject,'String'));
handles.P_hd=P_hd;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function PhD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PhD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NhD_Callback(hObject, eventdata, handles)
% hObject    handle to NhD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NhD as text
%        str2double(get(hObject,'String')) returns contents of NhD as a double
N_hd=str2double(get(hObject,'String'));
handles.N_hd=N_hd;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function NhD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NhD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Peid_Callback(hObject, eventdata, handles)
% hObject    handle to Peid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Peid as text
%        str2double(get(hObject,'String')) returns contents of Peid as a double
P_eid=str2double(get(hObject,'String'));
handles.P_eid=P_eid;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Peid_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Peid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pdh_Callback(hObject, eventdata, handles)
% hObject    handle to Pdh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pdh as text
%        str2double(get(hObject,'String')) returns contents of Pdh as a double
P_dh=str2double(get(hObject,'String'));
handles.P_dh=P_dh;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Pdh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pdh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Tlim_Callback(hObject, eventdata, handles)
% hObject    handle to Tlim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Tlim as text
%        str2double(get(hObject,'String')) returns contents of Tlim as a double
P_hd=str2double(get(hObject,'String'));
handles.T_lim=T_lim;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Tlim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Tlim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Llim_Callback(hObject, eventdata, handles)
% hObject    handle to Llim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Llim as text
%        str2double(get(hObject,'String')) returns contents of Llim as a double
L_lim=str2double(get(hObject,'String'));
handles.L_lim=L_lim;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Llim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Llim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in StartSim.
function StartSim_Callback(hObject, eventdata, handles)
% hObject    handle to StartSim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FILENAME, PATHNAME] = uiputfile('*.mat', 'Select Save Data Location');
xCoor=handles.xCoor;
yCoor=handles.yCoor;
zCoor=handles.zCoor;
exprssRte=handles.exprssRte;
infRte=handles.infRte;
P_hc=handles.P_hc;
ThR=handles.ThR;
P_hd=handles.P_hd;
N_hd=handles.N_hd;
P_eid=handles.P_eid;
P_dh=handles.P_dh;
T_lim=handles.T_lim;
L_lim=handles.L_lim;
itrCnt=handles.itrCnt;
wbcCnt=handles.wbcCnt;
save(strcat(PATHNAME,FILENAME),'xCoor','yCoor','zCoor','exprssRte','infRte','P_hc','ThR','P_hd','N_hd','P_eid','P_dh','T_lim','L_lim','PATHNAME','FILENAME','itrCnt','wbcCnt');
close all;
mainRun(PATHNAME,FILENAME);


% --- Executes on button press in ExitSim.
function ExitSim_Callback(hObject, eventdata, handles)
% hObject    handle to ExitSim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function wbcCntFn_Callback(hObject, eventdata, handles)
% hObject    handle to wbcCntFn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wbcCntFn as text
%        str2double(get(hObject,'String')) returns contents of wbcCntFn as a double
wbcCnt=str2double(get(hObject,'String'));
handles.wbcCnt=wbcCnt;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function wbcCntFn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wbcCntFn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iterationsCnt_Callback(hObject, eventdata, handles)
% hObject    handle to iterationsCnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iterationsCnt as text
%        str2double(get(hObject,'String')) returns contents of iterationsCnt as a double
itrCnt=str2double(get(hObject,'String'));
handles.itrCnt=itrCnt;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function iterationsCnt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iterationsCnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
