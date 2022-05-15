function varargout = gui_equalizer(varargin)
% GUI_EQUALIZER MATLAB code for gui_equalizer.fig
%      GUI_EQUALIZER, by itself, creates a new GUI_EQUALIZER or raises the existing
%      singleton*.
%
%      H = GUI_EQUALIZER returns the handle to a new GUI_EQUALIZER or the handle to
%      the existing singleton*.
%
%      GUI_EQUALIZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_EQUALIZER.M with the given input arguments.
%
%      GUI_EQUALIZER('Property','Value',...) creates a new GUI_EQUALIZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_equalizer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_equalizer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_equalizer

% Last Modified by GUIDE v2.5 15-May-2022 16:14:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_equalizer_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_equalizer_OutputFcn, ...
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
% --- Executes just before gui_equalizer is made visible.
function gui_equalizer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_equalizer (see VARARGIN)

% Choose default command line output for gui_equalizer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);                         
% UIWAIT makes gui_equalizer wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = gui_equalizer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in browse_button.
function browse_button_Callback(hObject, eventdata, handles)

% hObject    handle to browse_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.wav'},'File Selector');
handles.fullpathname = strcat(pathname, filename);
set(handles.fileaddress, 'String', handles.fullpathname)
guidata(hObject, handles)
% --- Executes during object creation, after setting all properties.
function fileaddress_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fileaddress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function slider_1_Callback(hObject, eventdata, handles)
% hObject    handle to slider_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% --- Executes during object creation, after setting all properties.
gain_1 = get(hObject,'Value')
set(handles.slider_1,'value',gain_1);
set(handles.text_1,'String',gain_1);  
guidata(hObject,handles)
function slider_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function text_1_Callback(hObject, eventdata, handles)
% hObject    handle to text_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_1 as text
%        str2double(get(hObject,'String')) returns contents of text_1 as a double

% --- Executes during object creation, after setting all properties.
if (str2num(get(handles.text_1,'String'))>100)
    set(handles.slider_1,'value',100);
elseif  (str2num(get(handles.text_1,'String'))<-100)
    set(handles.slider_1,'value',-100);
else 
set(handles.slider_1,'value',str2num(get(handles.text_1,'String')));
end
guidata(hObject,handles)
function text_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on slider movement.
function slider_2_Callback(hObject, eventdata, handles)
% hObject    handle to slider_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
gain_2 = get(hObject,'Value')
set(handles.slider_2,'value',gain_2);
set(handles.text_2,'String',gain_2);  
guidata(hObject,handles)
function slider_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function text_2_Callback(hObject, eventdata, handles)
% hObject    handle to text_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_2 as text
%        str2double(get(hObject,'String')) returns contents of text_2 as a double


% --- Executes during object creation, after setting all properties.
if (str2num(get(handles.text_2,'String'))>100)
    set(handles.slider_2,'value',100);
elseif  (str2num(get(handles.text_2,'String'))<-100)
    set(handles.slider_2,'value',-100);
else 
set(handles.slider_2,'value',str2num(get(handles.text_2,'String')));
end
guidata(hObject,handles)
function text_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on slider movement.
function slider_3_Callback(hObject, eventdata, handles)
% hObject    handle to slider_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
gain_3 = get(hObject,'Value')
set(handles.slider_3,'value',gain_3);
set(handles.text_3,'String',gain_3);  
guidata(hObject,handles)
% --- Executes during object creation, after setting all properties.
function slider_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function text_3_Callback(hObject, eventdata, handles)
% hObject    handle to text_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_3 as text
%        str2double(get(hObject,'String')) returns contents of text_3 as a double


% --- Executes during object creation, after setting all properties.
if (str2num(get(handles.text_3,'String'))>100)
    set(handles.slider_3,'value',100);
elseif  (str2num(get(handles.text_3,'String'))<-100)
    set(handles.slider_3,'value',-100);
else 
set(handles.slider_3,'value',str2num(get(handles.text_3,'String')));
end
guidata(hObject,handles)
function text_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on slider movement.
function slider_4_Callback(hObject, eventdata, handles)
% hObject    handle to slider_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

gain_4 = get(hObject,'Value')
set(handles.slider_4,'value',gain_4);
set(handles.text_4,'String',gain_4);  
guidata(hObject,handles)
% --- Executes during object creation, after setting all properties.
function slider_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function text_4_Callback(hObject, eventdata, handles)
% hObject    handle to text_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_4 as text
%        str2double(get(hObject,'String')) returns contents of text_4 as a double


% --- Executes during object creation, after setting all properties.
if (str2num(get(handles.text_4,'String'))>100)
    set(handles.slider_4,'value',100);
elseif  (str2num(get(handles.text_4,'String'))<-100)
    set(handles.slider_4,'value',-100);
else 
set(handles.slider_4,'value',str2num(get(handles.text_4,'String')));
end
guidata(hObject,handles)
function text_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on slider movement.
function slider_5_Callback(hObject, eventdata, handles)
% hObject    handle to slider_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

gain_5 = get(hObject,'Value')
set(handles.slider_5,'value',gain_5);
set(handles.text_5,'String',gain_5);  
guidata(hObject,handles)
% --- Executes during object creation, after setting all properties.
function slider_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function text_5_Callback(hObject, eventdata, handles)
% hObject    handle to text_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_5 as text
%        str2double(get(hObject,'String')) returns contents of text_5 as a double


% --- Executes during object creation, after setting all properties.
if (str2num(get(handles.text_5,'String'))>100)
    set(handles.slider_5,'value',100);
elseif  (str2num(get(handles.text_5,'String'))<-100)
    set(handles.slider_5,'value',-100);
else 
set(handles.slider_5,'value',str2num(get(handles.text_5,'String')));
end
guidata(hObject,handles)
function text_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on slider movement.
function slider_6_Callback(hObject, eventdata, handles)
% hObject    handle to slider_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
gain_6 = get(hObject,'Value')
set(handles.slider_6,'value',gain_6);
set(handles.text_6,'String',gain_6);  
guidata(hObject,handles)
% --- Executes during object creation, after setting all properties.
function slider_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function text_6_Callback(hObject, eventdata, handles)
% hObject    handle to text_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_6 as text
%        str2double(get(hObject,'String')) returns contents of text_6 as a double


% --- Executes during object creation, after setting all properties.
if (str2num(get(handles.text_6,'String'))>100)
    set(handles.slider_6,'value',100);
elseif  (str2num(get(handles.text_6,'String'))<-100)
    set(handles.slider_6,'value',-100);
else 
set(handles.slider_6,'value',str2num(get(handles.text_6,'String')));
end
guidata(hObject,handles)
function text_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on slider movement.
function slider_7_Callback(hObject, eventdata, handles)
% hObject    handle to slider_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
gain_7 = get(hObject,'Value')
set(handles.slider_7,'value',gain_7);
set(handles.text_7,'String',gain_7);  
guidata(hObject,handles)
% --- Executes during object creation, after setting all properties.
function slider_7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function text_7_Callback(hObject, eventdata, handles)
% hObject    handle to text_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_6 as text
%        str2double(get(hObject,'String')) returns contents of text_6 as a double


% --- Executes during object creation, after setting all properties.
if (str2num(get(handles.text_7,'String'))>100)
    set(handles.slider_7,'value',100);
elseif  (str2num(get(handles.text_7,'String'))<-100)
    set(handles.slider_7,'value',-100);
else 
set(handles.slider_7,'value',str2num(get(handles.text_7,'String')));
end
guidata(hObject,handles)
function text_7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on slider movement.
function slider_8_Callback(hObject, eventdata, handles)
% hObject    handle to slider_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
gain_8 = get(hObject,'Value')
set(handles.slider_8,'value',gain_8);
set(handles.text_8,'String',gain_8);  
guidata(hObject,handles)
% --- Executes during object creation, after setting all properties.
function slider_8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function text_8_Callback(hObject, eventdata, handles)
% hObject    handle to text_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_8 as text
%        str2double(get(hObject,'String')) returns contents of text_8 as a double


% --- Executes during object creation, after setting all properties.
if (str2num(get(handles.text_8,'String'))>100)
    set(handles.slider_8,'value',100);
elseif  (str2num(get(handles.text_8,'String'))<-100)
    set(handles.slider_8,'value',-100);
else 
set(handles.slider_8,'value',str2num(get(handles.text_8,'String')));
end
guidata(hObject,handles)
function text_8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on slider movement.
function slider_9_Callback(hObject, eventdata, handles)
% hObject    handle to slider_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
gain_9 = get(hObject,'Value')
set(handles.slider_9,'value',gain_9);
set(handles.text_9,'String',gain_9);  
guidata(hObject,handles)
% --- Executes during object creation, after setting all properties.
function slider_9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function text_9_Callback(hObject, eventdata, handles)
% hObject    handle to text_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_9 as text
%        str2double(get(hObject,'String')) returns contents of text_9 as a double


% --- Executes during object creation, after setting all properties.
if (str2num(get(handles.text_9,'String'))>100)
    set(handles.slider_9,'value',100);
elseif  (str2num(get(handles.text_9,'String'))<-100)
    set(handles.slider_1,'value',-100);
else 
set(handles.slider_9,'value',str2num(get(handles.text_9,'String')));
end
guidata(hObject,handles)
function text_9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes during object creation, after setting all properties.
function uibuttongroup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
play_equalizer(hObject, handles); 
play(player);
guidata(hObject,handles)

function play_equalizer(hObject, handles)
global player;

[handles.x,handles.fs] = audioread(handles.fullpathname);
axes(handles.axes1);        
plot(handles.x);                %Original signal in Time Domain
 
axes(handles.axes2); 
x_f=fft(handles.x);
plot(real(x_f))                 %Original signal in Frequency Domain

                                %If the user enters a frequency less than the double of the maximum
                                %frequency range, it get refused and replaced by
                                %32100 Hz [Nyquist rate]                       
 handles.samplerate = str2double(get(handles.sample_rate,'string')); 
 if(handles.samplerate<32000)
     handles.samplerate=32100;
     set(handles.sample_rate,'String','32100')
 end
 %Resampling the signal with the new sampling rate
 handles.Fs=handles.samplerate;
[handles.X]=resample(handles.x,handles.samplerate,handles.fs);

handles.gain_1=str2double(get(handles.text_1,'String'));
handles.gain_2=str2double(get(handles.text_2,'String'));
handles.gain_3=str2double(get(handles.text_3,'String'));
handles.gain_4=str2double(get(handles.text_4,'String'));
handles.gain_5=str2double(get(handles.text_5,'String'));
handles.gain_6=str2double(get(handles.text_6,'String'));
handles.gain_7=str2double(get(handles.text_7,'String'));
handles.gain_8=str2double(get(handles.text_8,'String'));
handles.gain_9=str2double(get(handles.text_9,'String'));
handles.iir=get(handles.iir_radio_2,'value');
handles.fir=get(handles.fir_radio_1,'value');

if(handles.iir == true)
    

%lowpass 0-170
 [b1,a1] = IIR170(handles.Fs);                 % defined function
 filteredSignal1 = filter(b1,a1,handles.X);
 filteredSignal1g = power(10,handles.gain_1/20)*filteredSignal1;
 handles.X1 = filteredSignal1g;
 f1=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal1));
 title('LowPass Filtered Signal Time Domain');
 subplot(3,2,4)
 plot(real(fft(filteredSignal1)));
 title('LowPass Filtered signal in Frequency Domain');
 subplot (3,2,5)
 plot(real(filteredSignal1g));
 title('LowPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal1g)));
 title('LowPass Filtered Signal in Frequency Domain + GAIN');
 
 
%170-310 bandpass
 [b2, a2] = IIR310(handles.Fs);
 filteredSignal2 = filter(b2, a2, handles.X);
 filteredSignal2g = power(10,handles.gain_2/20)*filteredSignal2;
 handles.X2 = filteredSignal2g;
 f2=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal2));
 title('BandPass Signal Time Domain [170-300 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal2)));
 title('BandPass Filtered signal in Frequency Domain  [170-300 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal2g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal2g)));
 title('BandPass Filtered Signal in Frequency Domain [170-300 Hz] + GAIN');
 


%310-600 bandpass
 [b3, a3] = IIR600(handles.Fs);
 filteredSignal3 = filter(b3, a3, handles.X);
 filteredSignal3g = power(10,handles.gain_3/20)*filteredSignal2;
 handles.X3 = filteredSignal3g;
 f3=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal3));
 title('BandPass Signal Time Domain [310-600 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal3)));
 title('BandPass Filtered signal in Frequency Domain  [310-600 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal2g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal3g)));
 title('BandPass Filtered Signal in Frequency Domain [310-600 Hz] + GAIN');
 
 %600-1000 bandpass
 [b4, a4] = IIR1k(handles.Fs);
 filteredSignal4 = filter(b4, a4, handles.X);
 filteredSignal4g = power(10,handles.gain_4/20)*filteredSignal2;
 handles.X4 = filteredSignal4g;
 f4=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal4));
 title('BandPass Signal Time Domain [600-1000 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal4)));
 title('BandPass Filtered signal in Frequency Domain  [600-1000 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal4g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal4g)));
 title('BandPass Filtered Signal in Frequency Domain [600-1000 Hz] + GAIN');
 
 %1000-3000 bandpass
 [b5, a5] = IIR3k(handles.Fs);
 filteredSignal5 = filter(b5, a5, handles.X);
 filteredSignal5g = power(10,handles.gain_5/20)*filteredSignal5;
 handles.X5 = filteredSignal5g;
 f5=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal5));
 title('BandPass Signal Time Domain [1000-3000 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal5)));
 title('BandPass Filtered signal in Frequency Domain  [1000-3000 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal5g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal5g)));
 title('BandPass Filtered Signal in Frequency Domain [1000-3000 Hz] + GAIN');
 
 %3000-6000 bandpass
 [b6, a6] = IIR6k(handles.Fs);
 filteredSignal6 = filter(b6, a6, handles.X);
 filteredSignal6g = power(10,handles.gain_6/20)*filteredSignal6;
 handles.X6 = filteredSignal6g;
 f6=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal6));
 title('BandPass Signal Time Domain [3000-6000 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal6)));
 title('BandPass Filtered signal in Frequency Domain  [3000-6000 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal6g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal6g)));
 title('BandPass Filtered Signal in Frequency Domain [3000-6000 Hz] + GAIN');
 
 %6000-12000 bandpass
 [b7, a7] = IIR12k(handles.Fs);
 filteredSignal7 = filter(b7, a7, handles.X);
 filteredSignal7g = power(10,handles.gain_7/20)*filteredSignal7;
 handles.X7 = filteredSignal7g;
 f7=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal7));
 title('BandPass Signal Time Domain [6000-12000 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal7)));
 title('BandPass Filtered signal in Frequency Domain  [6000-12000 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal7g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal7g)));
 title('BandPass Filtered Signal in Frequency Domain [6000-12000 Hz] + GAIN');
 
 %12000-14000 bandpass
 [b8, a8] = IIR14k(handles.Fs);
 filteredSignal8 = filter(b8, a8, handles.X);
 filteredSignal8g = power(10,handles.gain_8/20)*filteredSignal8;
 handles.X8 = filteredSignal8g;
 f8=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal8));
 title('BandPass Signal Time Domain [12000-14000 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal8)));
 title('BandPass Filtered signal in Frequency Domain  [12000-14000 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal8g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal8g)));
 title('BandPass Filtered Signal in Frequency Domain [12000-14000 Hz] + GAIN');
 
 %bandpass8
 [b9, a9] = IIR16k(handles.Fs);
 filteredSignal9 = filter(b9, a9, handles.X);
 filteredSignal9g = power(10,handles.gain_9/20)*filteredSignal9;
 handles.X9 = filteredSignal9g;
 f8=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal9));
 title('BandPass Signal Time Domain [12000-14000 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal9)));
 title('BandPass Filtered signal in Frequency Domain  [12000-14000 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal9g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal9g)));
 title('BandPass Filtered Signal in Frequency Domain [12000-14000 Hz] + GAIN');
 
 
end

if(handles.fir == true)
    
%lowpass 0-170
 [b1,a1] = lowpass(handles.Fs);                 % defined function
 filteredSignal1 = filter(b1,a1,handles.X);
 filteredSignal1g = power(10,handles.gain_1/20)*filteredSignal1;
 handles.X1 = filteredSignal1g;
 f1=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal1));
 title('LowPass Filtered Signal Time Domain');
 subplot(3,2,4)
 plot(real(fft(filteredSignal1)));
 title('LowPass Filtered signal in Frequency Domain');
 subplot (3,2,5)
 plot(real(filteredSignal1g));
 title('LowPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal1g)));
 title('LowPass Filtered Signal in Frequency Domain + GAIN');
 
 
%170-310 bandpass
 [b2, a2] = FIR300(handles.Fs);
 filteredSignal2 = filter(b2, a2, handles.X);
 filteredSignal2g = power(10,handles.gain_2/20)*filteredSignal2;
 handles.X2 = filteredSignal2g;
 f2=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal2));
 title('BandPass Signal Time Domain [170-300 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal2)));
 title('BandPass Filtered signal in Frequency Domain  [170-300 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal2g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal2g)));
 title('BandPass Filtered Signal in Frequency Domain [170-300 Hz] + GAIN');
 


%310-600 bandpass
 [b3, a3] = FIR600(handles.Fs);
 filteredSignal3 = filter(b3, a3, handles.X);
 filteredSignal3g = power(10,handles.gain_3/20)*filteredSignal2;
 handles.X3 = filteredSignal3g;
 f3=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal3));
 title('BandPass Signal Time Domain [310-600 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal3)));
 title('BandPass Filtered signal in Frequency Domain  [310-600 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal2g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal3g)));
 title('BandPass Filtered Signal in Frequency Domain [310-600 Hz] + GAIN');
 
 %600-1000 bandpass
 [b4, a4] = FIR1k(handles.Fs);
 filteredSignal4 = filter(b4, a4, handles.X);
 filteredSignal4g = power(10,handles.gain_4/20)*filteredSignal2;
 handles.X4 = filteredSignal4g;
 f4=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal4));
 title('BandPass Signal Time Domain [600-1000 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal4)));
 title('BandPass Filtered signal in Frequency Domain  [600-1000 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal4g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal4g)));
 title('BandPass Filtered Signal in Frequency Domain [600-1000 Hz] + GAIN');
 
 %1000-3000 bandpass
 [b5, a5] = FIR3k(handles.Fs);
 filteredSignal5 = filter(b5, a5, handles.X);
 filteredSignal5g = power(10,handles.gain_5/20)*filteredSignal5;
 handles.X5 = filteredSignal5g;
 f5=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal5));
 title('BandPass Signal Time Domain [1000-3000 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal5)));
 title('BandPass Filtered signal in Frequency Domain  [1000-3000 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal5g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal5g)));
 title('BandPass Filtered Signal in Frequency Domain [1000-3000 Hz] + GAIN');
 
 %3000-6000 bandpass
 [b6, a6] = FIR6k(handles.Fs);
 filteredSignal6 = filter(b6, a6, handles.X);
 filteredSignal6g = power(10,handles.gain_6/20)*filteredSignal6;
 handles.X6 = filteredSignal6g;
 f6=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal6));
 title('BandPass Signal Time Domain [3000-6000 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal6)));
 title('BandPass Filtered signal in Frequency Domain  [3000-6000 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal6g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal6g)));
 title('BandPass Filtered Signal in Frequency Domain [3000-6000 Hz] + GAIN');
 
 %6000-12000 bandpass
 [b7, a7] = FIR12k(handles.Fs);
 filteredSignal7 = filter(b7, a7, handles.X);
 filteredSignal7g = power(10,handles.gain_7/20)*filteredSignal7;
 handles.X7 = filteredSignal7g;
 f7=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal7));
 title('BandPass Signal Time Domain [6000-12000 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal7)));
 title('BandPass Filtered signal in Frequency Domain  [6000-12000 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal7g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal7g)));
 title('BandPass Filtered Signal in Frequency Domain [6000-12000 Hz] + GAIN');
 
 %12000-14000 bandpass
 [b8, a8] = FIR14k(handles.Fs);
 filteredSignal8 = filter(b8, a8, handles.X);
 filteredSignal8g = power(10,handles.gain_8/20)*filteredSignal8;
 handles.X8 = filteredSignal8g;
 f8=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal8));
 title('BandPass Signal Time Domain [12000-14000 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal8)));
 title('BandPass Filtered signal in Frequency Domain  [12000-14000 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal8g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal8g)));
 title('BandPass Filtered Signal in Frequency Domain [12000-14000 Hz] + GAIN');
 
 %bandpass8
 [b9, a9] = FIR16k(handles.Fs);
 filteredSignal9 = filter(b9, a9, handles.X);
 filteredSignal9g = power(10,handles.gain_9/20)*filteredSignal9;
 handles.X9 = filteredSignal9g;
 f8=figure('Position', [150, -105, 2500, 2500]);
 subplot (3,2,1)
 plot(real(handles.X));
 title('Original Signal Time Domain');
 subplot(3,2,2)
 plot(real(fft(handles.X)));
 title('Original Signal in frequency domain');
 subplot (3,2,3)
 plot(real(filteredSignal9));
 title('BandPass Signal Time Domain [12000-14000 Hz]');
 subplot(3,2,4)
 plot(real(fft(filteredSignal9)));
 title('BandPass Filtered signal in Frequency Domain  [12000-14000 Hz]');
 subplot (3,2,5)
 plot(real(filteredSignal9g));
 title('BandPass Filtered Signal Time Domain + GAIN');
 subplot(3,2,6)
 plot(real(fft(filteredSignal9g)));
 title('BandPass Filtered Signal in Frequency Domain [12000-14000 Hz] + GAIN');
 
end


%-The amplified output signals in time domain to form composite signal-
 handles.XT = handles.X1+handles.X2+handles.X3+handles.X4+handles.X5+handles.X6+handles.X7+handles.X8+handles.X9;
 player = audioplayer(handles.XT, handles.Fs);
 axes(handles.axes3); 
 plot(handles.XT);                  %The composite signal in time domain
 axes(handles.axes4); 
 ytFreq=fft(handles.XT);
 plot(real(ytFreq));                %The composite signal in frequency domain
 wavwrite(handles.XT,handles.Fs,'TEST_MODIFIED.wav');

guidata(hObject,handles)


%lowpass170 IIR
function [b, a] = IIR170(fs)
n = 3; %order
Fc=170; %cutoff
Wc = Fc/((fs)/2);
[b, a] = butter(n,Wc,'low');
fvtool(b, a,'Fs',fs)

%bandpass170-310 IIR
function [b, a] = IIR310(fs)
n = 3;
f1=171;
f2=310;
[b, a] = butter(n,[f1 f2]/(fs/2),'bandpass');
fvtool(b, a,'Fs',fs)

%bandpass310-600 IIR
function [b, a] = IIR600(fs)
n = 3;
f1=310;
f2=600;
[b,a] = butter(n,[f1 f2]/(fs/2),'bandpass');
fvtool(b,a,'Fs',fs)

%bandpass600-1000 IIR
function [b, a] = IIR1k(fs)
n = 3;
f1=600;
f2=1000;
[b,a] = butter(n,[f1 f2]/(fs/2),'bandpass');
fvtool(b,a,'Fs',fs)

%bandpass1000-3000 IIR
function [b, a] = IIR3k(fs)
n = 3;
f1=1000;
f2=3000;
[b,a] = butter(n,[f1 f2]/(fs/2),'bandpass');
h = fvtool(b,a,'Fs',fs)
h.Analysis = 'phase';
legend(h,'Phase plot')

%bandpass3000-6000 IIR
function [b, a] = IIR6k(fs)
n = 3;
f1=3000;
f2=6000;
[b,a] = butter(n,[f1 f2]/(fs/2),'bandpass');
fvtool(b,a,'Fs',fs)

%bandpass6000-12000 IIR
function [b, a] = IIR12k(fs)
n = 3;
f1=6000;
f2=12000;
[b,a] = butter(n,[f1 f2]/(fs/2),'bandpass');
fvtool(b,a,'Fs',fs)

%bandpass1200-14000 IIR
function [b, a] = IIR14k(fs)
n = 3;
f1=1200;
f2=14000;
[b,a] = butter(n,[f1 f2]/(fs/2),'bandpass');
fvtool(b,a,'Fs',fs)

%bandpass1400-16000 IIR
function [b, a] = IIR16k(fs)
n = 3;
f1=1400;
f2=16000;
[b,a] = butter(n,[f1 f2]/(fs/2),'bandpass');
fvtool(b,a,'Fs',fs)

%lowpass FIR
function [b1, a1] = lowpass (fs)
n = 300;
Fc=170;
Wc=Fc/(fs/2);
a1=1;
b1=fir1(n,Wc,'low');
fvtool(b1,a1,'Fs',fs)

%bandpass170-310 FIR
function [b, a] = FIR300(fs)
n = 300;
f1=171;
f2=310;
a=1;
b=fir1(n,[f1/(fs/2) f2/(fs/2)],'bandpass');
fvtool(b,a,'Fs',fs);

%bandpass310-600 FIR
function [b, a] = FIR600(fs)
n = 300;
f1=311;
f2=600;
a=1;
b=fir1(n,[f1/(fs/2) f2/(fs/2)],'bandpass');
fvtool(b,a,'Fs',fs);

%bandpass600-1000 FIR
function [b, a] = FIR1k(fs)
n = 300;
f1=601;
f2=1000;
a=1;
b=fir1(n,[f1/(fs/2) f2/(fs/2)],'bandpass');
fvtool(b,a,'Fs',fs);

%bandpass1000-3000 FIR
function [b, a] = FIR3k(fs)
n = 300;
f1 = 1001;
f2 = 3000;
a = 1;
b=fir1(n,[f1/(fs/2) f2/(fs/2)],'bandpass');
fvtool(b,a,'Fs',fs);

%bandpass3000-6000 FIR
function [b, a] = FIR6k(fs)
n = 300;
f1 = 3001;
f2 = 6000;
a = 1;
b=fir1(n,[f1/(fs/2) f2/(fs/2)],'bandpass');
fvtool(b,a,'Fs',fs);
%bandpass6000-12000
function [b, a] = FIR12k(fs)
n = 300;
f1 = 6001;
f2 = 12000;
a = 1;
b=fir1(n,[f1/(fs/2) f2/(fs/2)],'bandpass');
fvtool(b,a,'Fs',fs);
%bandpass12000-14000 FIR
function [b, a] = FIR14k(fs)
n = 300;
f1 = 12001;
f2 = 14000;
a = 1;
b=fir1(n,[f1/(fs/2) f2/(fs/2)],'bandpass');
fvtool(b,a,'Fs',fs);
%bandpass14000-16000 FIR
function [b, a] = FIR16k(fs)
n = 300;
f1 = 14001;
f2 = 16000;
a = 1;
b=fir1(n,[f1/(fs/2) f2/(fs/2)],'bandpass');
fvtool(b,a,'Fs',fs);

% --- Executes on button press in Pop.
function Pop_Callback(hObject, eventdata, handles)
% hObject    handle to Pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
gain_1 = -1.5;
gain_2 = 3.9;
gain_3 = 5.4;
gain_4 = 4.5;
gain_5 =  0.9;
gain_6 = -1.5;
gain_7 = -1.8;
gain_8= -2.1;
gain_9 = -2.1;
set(handles.slider_1,'value',gain_1);
set(handles.slider_2,'value',gain_2);
set(handles.slider_3,'value',gain_3);
set(handles.slider_4,'value',gain_4);
set(handles.slider_5,'value',gain_5);
set(handles.slider_6,'value',gain_6);
set(handles.slider_7,'value',gain_7);
set(handles.slider_8,'value',gain_8);
set(handles.slider_9,'value',gain_9);
set(handles.text_1, 'String',gain_1);
set(handles.text_2, 'String',gain_2);
set(handles.text_3, 'String',gain_3);
set(handles.text_4, 'String',gain_4);
set(handles.text_5, 'String',gain_5);
set(handles.text_6, 'String',gain_6);
set(handles.text_7, 'String',gain_7);
set(handles.text_8, 'String',gain_8);
set(handles.text_9, 'String',gain_9);
play_equalizer(hObject,handles)
play(player)
guidata(hObjbect,handles)

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to fileaddress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fileaddress as text
%        str2double(get(hObject,'String')) returns contents of fileaddress as a double

% --- Executes on button press in Reggae.
function Reggae_Callback(hObject, eventdata, handles)
% hObject    handle to Reggae (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
gain_1 = 0;
gain_2 = 0;
gain_3 = -0.3;
gain_4 = -2.7;
gain_5 =  0;
gain_6 = 2.1;
gain_7 = 4.5;
gain_8= 3;
gain_9 = 0.6;
set(handles.slider_1,'value',gain_1);
set(handles.slider_2,'value',gain_2);
set(handles.slider_3,'value',gain_3);
set(handles.slider_4,'value',gain_4);
set(handles.slider_5,'value',gain_5);
set(handles.slider_6,'value',gain_6);
set(handles.slider_7,'value',gain_7);
set(handles.slider_8,'value',gain_8);
set(handles.slider_9,'value',gain_9);
set(handles.text_1, 'String',gain_1);
set(handles.text_2, 'String',gain_2);
set(handles.text_3, 'String',gain_3);
set(handles.text_4, 'String',gain_4);
set(handles.text_5, 'String',gain_5);
set(handles.text_6, 'String',gain_6);
set(handles.text_7, 'String',gain_7);
set(handles.text_8, 'String',gain_8);
set(handles.text_9, 'String',gain_9);
play_equalizer(hObject,handles)
play(player)
guidata(hObjbect,handles)
% --- Executes on button press in Rock.
function Rock_Callback(hObject, eventdata, handles)
% hObject    handle to Rock (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
gain_1 = 4.5;
gain_2 = -3.6;
gain_3 = -6.6;
gain_4 = -2.7;
gain_5 =   2.1;
gain_6 =6;
gain_7 = 7.5;
gain_8= 7.8;
gain_9 = 7.8;
set(handles.slider_1,'value',gain_1);
set(handles.slider_2,'value',gain_2);
set(handles.slider_3,'value',gain_3);
set(handles.slider_4,'value',gain_4);
set(handles.slider_5,'value',gain_5);
set(handles.slider_6,'value',gain_6);
set(handles.slider_7,'value',gain_7);
set(handles.slider_8,'value',gain_8);
set(handles.slider_9,'value',gain_9);
set(handles.text_1, 'String',gain_1);
set(handles.text_2, 'String',gain_2);
set(handles.text_3, 'String',gain_3);
set(handles.text_4, 'String',gain_4);
set(handles.text_5, 'String',gain_5);
set(handles.text_6, 'String',gain_6);
set(handles.text_7, 'String',gain_7);
set(handles.text_8, 'String',gain_8);
set(handles.text_9, 'String',gain_9);
play_equalizer(hObject,handles)
play(player)
guidata(hObjbect,handles)


% --- Executes on button press in Techno.
function Techno_Callback(hObject, eventdata, handles)
% hObject    handle to Techno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
gain_1 = 4.8;
gain_2 = 4.2;
gain_3 = 1.5;
gain_4 = -2.4;
gain_5 =   -3.3;
gain_6 =-1.5;
gain_7 = 1.5;
gain_8= 5.1;
gain_9 = 5.7;
set(handles.slider_1,'value',gain_1);
set(handles.slider_2,'value',gain_2);
set(handles.slider_3,'value',gain_3);
set(handles.slider_4,'value',gain_4);
set(handles.slider_5,'value',gain_5);
set(handles.slider_6,'value',gain_6);
set(handles.slider_7,'value',gain_7);
set(handles.slider_8,'value',gain_8);
set(handles.slider_9,'value',gain_9);
set(handles.text_1, 'String',gain_1);
set(handles.text_2, 'String',gain_2);
set(handles.text_3, 'String',gain_3);
set(handles.text_4, 'String',gain_4);
set(handles.text_5, 'String',gain_5);
set(handles.text_6, 'String',gain_6);
set(handles.text_7, 'String',gain_7);
set(handles.text_8, 'String',gain_8);
set(handles.text_9, 'String',gain_9);
play_equalizer(hObject,handles)
play(player)
guidata(hObjbect,handles)


% --- Executes on button press in Party.
function Party_Callback(hObject, eventdata, handles)
% hObject    handle to Party (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
gain_1 = 5.4;
gain_2 = 0;
gain_3 = 0;
gain_4 = 0;
gain_5 =   0;
gain_6 =0;
gain_7 = 0;
gain_8= 0;
gain_9 = 5.4;
set(handles.slider_1,'value',gain_1);
set(handles.slider_2,'value',gain_2);
set(handles.slider_3,'value',gain_3);
set(handles.slider_4,'value',gain_4);
set(handles.slider_5,'value',gain_5);
set(handles.slider_6,'value',gain_6);
set(handles.slider_7,'value',gain_7);
set(handles.slider_8,'value',gain_8);
set(handles.slider_9,'value',gain_9);
set(handles.text_1, 'String',gain_1);
set(handles.text_2, 'String',gain_2);
set(handles.text_3, 'String',gain_3);
set(handles.text_4, 'String',gain_4);
set(handles.text_5, 'String',gain_5);
set(handles.text_6, 'String',gain_6);
set(handles.text_7, 'String',gain_7);
set(handles.text_8, 'String',gain_8);
set(handles.text_9, 'String',gain_9);
play_equalizer(hObject,handles)
play(player)
guidata(hObjbect,handles)


% --- Executes on button press in Pause.
function Pause_Callback(hObject, eventdata, handles)
% hObject    handle to Pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
pause(player);
guidata(hObject,handles)

% --- Executes on button press in resume.
function resume_Callback(hObject, eventdata, handles)
% hObject    handle to resume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
resume(player);
guidata(hObject,handles)


function sample_rate_Callback(hObject, eventdata, handles)
% hObject    handle to sample_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sample_rate as text
%        str2double(get(hObject,'String')) returns contents of sample_rate as a double


% --- Executes during object creation, after setting all properties.
function sample_rate_CreateFcn(hObject, ~, handles)
% hObject    handle to sample_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Classical.
function Classical_Callback(hObject, eventdata, handles)
% hObject    handle to Classical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
gain_1 = 0;
gain_2 = 0;
gain_3 = 0;
gain_4 = 0;
gain_5 =  0;
gain_6 =0;
gain_7 = -0.3;
gain_8= -5.8;
gain_9 = -6;
set(handles.slider_1,'value',gain_1);
set(handles.slider_2,'value',gain_2);
set(handles.slider_3,'value',gain_3);
set(handles.slider_4,'value',gain_4);
set(handles.slider_5,'value',gain_5);
set(handles.slider_6,'value',gain_6);
set(handles.slider_7,'value',gain_7);
set(handles.slider_8,'value',gain_8);
set(handles.slider_9,'value',gain_9);
set(handles.text_1, 'String',gain_1);
set(handles.text_2, 'String',gain_2);
set(handles.text_3, 'String',gain_3);
set(handles.text_4, 'String',gain_4);
set(handles.text_5, 'String',gain_5);
set(handles.text_6, 'String',gain_6);
set(handles.text_7, 'String',gain_7);
set(handles.text_8, 'String',gain_8);
set(handles.text_9, 'String',gain_9);
play_equalizer(hObject,handles)
play(player)
guidata(hObjbect,handles)



% --- Executes on button press in fir_radio_1.
function fir_radio_1_Callback(hObject, eventdata, handles)
% hObject    handle to fir_radio_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fir_radio_1


% --- Executes on button press in iir_radio_2.
function iir_radio_2_Callback(hObject, eventdata, handles)
% hObject    handle to iir_radio_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of iir_radio_2


% --- Executes during object creation, after setting all properties.
function slider_25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
