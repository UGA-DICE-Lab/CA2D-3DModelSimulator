function varargout = Test1(varargin)
% TEST1 MATLAB code for Test1.fig
%      TEST1, by itself, creates a new TEST1 or raises the existing
%      singleton*.
%
%      H = TEST1 returns the handle to a new TEST1 or the handle to
%      the existing singleton*.
%
%      TEST1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST1.M with the given input arguments.
%
%      TEST1('Property','Value',...) creates a new TEST1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Test1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Test1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Test1

% Last Modified by GUIDE v2.5 17-Aug-2015 12:51:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Test1_OpeningFcn, ...
                   'gui_OutputFcn',  @Test1_OutputFcn, ...
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


% --- Executes just before Test1 is made visible.
function Test1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Test1 (see VARARGIN)

% Choose default command line output for Test1
handles.output = hObject;
titImg=imread('CATitle.png');
axes(handles.Title1);
imshow(titImg);
load('TempReader.mat');
whos
load(strcat(PATHNAME,FILENAME));
whos
handles
handles.xCoor=xCoor;
handles.yCoor=yCoor;
handles.zCoor=zCoor;
handles.exprssRte=exprssRte;
handles.infRte=infRte;
handles.P_hc=P_hc;
handles.ThR=ThR;
handles.P_hd=P_hd;
handles.N_hd=N_hd;
handles.P_eid=P_eid;
handles.P_dh=P_dh;
handles.T_lim=T_lim;
handles.L_lim=L_lim;
handles.itrCnt=itrCnt;
handles.wbcCnt=wbcCnt;
handles.iterData=iterData;
handles.tissueSz=tissueSz;
handles.healCnt=healCnt;
handles.infCnt=infCnt;
handles.deaCnt=deaCnt;
handles.immCnt=immCnt;



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Test1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Test1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function layer_1_Callback(hObject, eventdata, handles)
% hObject    handle to layer_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of layer_1 as text
%        str2double(get(hObject,'String')) returns contents of layer_1 as a double
lay1=str2double(get(hObject,'String'));
handles.lay1=lay1;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function layer_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to layer_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Layer_2_Callback(hObject, eventdata, handles)
% hObject    handle to Layer_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Layer_2 as text
%        str2double(get(hObject,'String')) returns contents of Layer_2 as a double
lay2=str2double(get(hObject,'String'));
handles.lay2=lay2;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Layer_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Layer_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Layer_3_Callback(hObject, eventdata, handles)
% hObject    handle to Layer_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Layer_3 as text
%        str2double(get(hObject,'String')) returns contents of Layer_3 as a double
lay3=str2double(get(hObject,'String'));
handles.lay3=lay3;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Layer_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Layer_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Layer_4_Callback(hObject, eventdata, handles)
% hObject    handle to Layer_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Layer_4 as text
%        str2double(get(hObject,'String')) returns contents of Layer_4 as a double
lay4=str2double(get(hObject,'String'));
handles.lay4=lay4;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Layer_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Layer_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Layer_5_Callback(hObject, eventdata, handles)
% hObject    handle to Layer_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Layer_5 as text
%        str2double(get(hObject,'String')) returns contents of Layer_5 as a double
lay5=str2double(get(hObject,'String'));
handles.lay5=lay5;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Layer_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Layer_5 (see GCBO)
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
iterData=handles.iterData;
tissueSz=handles.tissueSz;
healCnt=handles.healCnt;
infCnt=handles.infCnt;
deaCnt=handles.deaCnt;
immCnt=handles.immCnt;
timeSeries=0:2:itrCnt*2;
for i=1:itrCnt
epthMat=iterData{i}.epthMat;
wbcMat=iterData{i}.wbcMat;
graphicGen(epthMat(1:xCoor,1:yCoor,handles.lay1),tissueSz,handles.layer1);
graphicGen(epthMat(1:xCoor,1:yCoor,handles.lay2),tissueSz,handles.layer2);
graphicGen(epthMat(1:xCoor,1:yCoor,handles.lay3),tissueSz,handles.layer3);
graphicGen(epthMat(1:xCoor,1:yCoor,handles.lay4),tissueSz,handles.layer4);
graphicGen(epthMat(1:xCoor,1:yCoor,handles.lay5),tissueSz,handles.layer5);

axes(handles.para1);hold on;
plot([0 itrCnt*2],[0 0],timeSeries(1:i),healCnt(1:i),'-b');label('all','Healthy Epithelial Cells','','');grid on;
axes(handles.para2);hold on;
plot([0 itrCnt*2],[0 0],timeSeries(1:i),infCnt(1:i),'-b');label('all','Infected Cells','','');grid on;
axes(handles.para3);hold on;
plot([0 itrCnt*2],[0 0],timeSeries(1:i),immCnt(1:i),'-b');label('all','Immune Cells','Time (Hours)','');grid on;

pause(0.1)
end


    
    
    
    


% --- Executes on button press in ParamSim.
function ParamSim_Callback(hObject, eventdata, handles)
% hObject    handle to ParamSim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in SimStop.
function SimStop_Callback(hObject, eventdata, handles)
% hObject    handle to SimStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function layer1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to layer1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate layer1


% --- Executes during object creation, after setting all properties.
function StartSim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartSim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
if (get(hObject,'Value') == get(hObject,'Max'))
   
end

function DispLayer_Callback(hObject, eventdata, handles)
% hObject    handle to DispLayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DispLayer as text
%        str2double(get(hObject,'String')) returns contents of DispLayer as a double
disp_lay=str2double(get(hObject,'String'));
handles.disp_lay=disp_lay;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function DispLayer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DispLayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
