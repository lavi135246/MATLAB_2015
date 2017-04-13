function varargout = HW5(varargin)
% HW5 MATLAB code for HW5.fig
%      HW5, by itself, creates a new HW5 or raises the existing
%      singleton*.
%
%      H = HW5 returns the handle to a new HW5 or the handle to
%      the existing singleton*.
%
%      HW5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HW5.M with the given input arguments.
%
%      HW5('Property','Value',...) creates a new HW5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HW5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HW5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HW5

% Last Modified by GUIDE v2.5 07-Jun-2015 22:41:41

%==========================================================================
% �H�U�O�t�ιw�]��initialization �i�H���κޥL
%==========================================================================

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HW5_OpeningFcn, ...
                   'gui_OutputFcn',  @HW5_OutputFcn, ...
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

%==========================================================================
% �o�����O�w�]�n��code,�D�n�γ~�b��ӵ{�O��B�檺�ɭԷ|�w���I�s�o��function
%==========================================================================

% --- Executes just before HW5 is made visible.
function HW5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HW5 (see VARARGIN)

% Choose default command line output for HW5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HW5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


%==========================================================================
% �o�����O�w�]�n��code
%==========================================================================
% --- Outputs from this function are returned to the command line.
function varargout = HW5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function Rval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function Gval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function Bval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function FileBtn_Callback(hObject, eventdata, handles)
% hObject    handle to FileBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function EditBtn_Callback(hObject, eventdata, handles)
% hObject    handle to EditBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%==========================================================================
% �o�����OSlider�b�{���ϥΪ��L�{���A�u�nslider���ܤƴN�|�I�s��callback
%==========================================================================
% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% Slider ���ܮɪ�callback
% Slider���ܼƭȪ��ɭԷ|�۰���ܦbslider�W�誺text
rectSize = get(handles.slider1, 'value');   % ����ثeslider���s����
rectSize = round(rectSize);  %��p���I�h����
set(handles.scale_str, 'String', rectSize);  %��ܦbSlider�W����text�̡A���ϥΪ̥i�H���D�ثe�]�w��rect�j�p

%==========================================================================
% �H�U�T��Callback���O�Ω�B�z�T�ӳ]�wRGB�C�⪺edit����A�\�ೣ�O��edit���ܧ󪺮ɭ�
% �N���edit�̪�String�A�èϥ� str2double �N�r���নdouble ����ʺA�N�C����ܨ�text
% ��background���C
%==========================================================================

function Rval_Callback(hObject, eventdata, handles)
% hObject    handle to Rval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rval as text
%        str2double(get(hObject,'String')) returns contents of Rval as a double
info = get(handles.OpenBtn,'userData');
RectColor=info.RectColor;
% Text ���ܮɪ�callback
rval = str2double(get(handles.Rval,'String'));
gval = str2double(get(handles.Gval,'String'));
bval = str2double(get(handles.Bval,'String'));

if rval>255
    msgbox('The number must be under 255', 'Warning!');
    if ~isempty(RectColor(end,1))
        rval=RectColor(end,1);
    else
        rval=0;
    end
    
    R = num2str(ceil(rval*255));
    set( handles.Rval,'String', R);
    set(handles.colorShow, 'backgroundcolor', [rval, gval/255, bval/255]);
else
    set(handles.colorShow, 'backgroundcolor', [rval/255, gval/255, bval/255]); 
end



function Gval_Callback(hObject, eventdata, handles)
% hObject    handle to Gval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Gval as text
%        str2double(get(hObject,'String')) returns contents of Gval as a double
info = get(handles.OpenBtn,'userData');
RectColor=info.RectColor;
% Text ���ܮɪ�callback
rval = str2double(get(handles.Rval,'String'));
gval = str2double(get(handles.Gval,'String'));
bval = str2double(get(handles.Bval,'String'));
if gval>255
    msgbox('The number must be under 255', 'Warning!');
    if ~isempty(RectColor(end,2))
        gval=RectColor(end,2);
    else
        gval=0;
    end
    G = num2str(ceil(gval*255));
    set( handles.Gval,'String', G);
    set(handles.colorShow, 'backgroundcolor', [rval/255, gval, bval/255]);
else
    set(handles.colorShow, 'backgroundcolor', [rval/255, gval/255, bval/255]);  
end


function Bval_Callback(hObject, eventdata, handles)
% hObject    handle to Bval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Bval as text
%        str2double(get(hObject,'String')) returns contents of Bval as a double
info = get(handles.OpenBtn,'userData');
RectColor=info.RectColor;
% Text ���ܮɪ�callback
rval = str2double(get(handles.Rval,'String'));
gval = str2double(get(handles.Gval,'String'));
bval = str2double(get(handles.Bval,'String'));
if bval>255
    msgbox('The number must be under 255', 'Warning!');
    if ~isempty(RectColor(end,3))
        bval=RectColor(end,3);
    else
        bval=0;
    end
    B = num2str(ceil(bval*255));
    set( handles.Bval,'String', B);
    set(handles.colorShow, 'backgroundcolor', [rval/255, gval/255, bval]);
else
    set(handles.colorShow, 'backgroundcolor', [rval/255, gval/255, bval/255]); 
end


%==========================================================================
% �o�����OUndo��callback
%==========================================================================
% --------------------------------------------------------------------
function UndoBtn_Callback(hObject, eventdata, handles)
% hObject    handle to UndoBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% ���UUndo�ɡA�n����ثe���쪺���p�Ȧs�_�ӡA���M��Redo�N�䤣�^����U���a��
% �Ȧs��������A�N�i�H���I���O�����̫�@���R���C

info = get(handles.OpenBtn,'userData');  %������s��bOpenBtn��Userdata�������ɡB�ƹ��O��
label = info.label;  %�⤧�e�ƹ��I���b�v���W����m�s��b�@���ܼƤ�
info.label_tmp = label; %��ثe�Ҧ����ƹ��O���s��btmp�̭��A�H�KUndo�R�����̷s���@���O���� Redo�L�k�s�X�w�Q�R�����@������
label(end,:) = []; %�R���̷s�@�����ƹ��O��
info.label = label; %�s��^info�̪�label��

%�H�URectColorR�BRectColor�]�O���@�˪��Ʊ�

RectColor = info.RectColor;  
info.RectColor_tmp = RectColor;
RectColor(end,:) = [];
info.RectColor = RectColor;

RectSize = info.RectSize;
info.RectSize_tmp = RectSize;
RectSize(end,:) = [];
info.RectSize = RectSize;

set(handles.OpenBtn,'UserData', info);  %����������N�n��info�s�^�hOpenBtn����s���
showImg(handles);

%==========================================================================
% �o�����OUndo��callback
%==========================================================================
% --------------------------------------------------------------------
function RedoBtn_Callback(hObject, eventdata, handles)
% hObject    handle to RedoBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Redo��callback
% �o��O��Ȧs����Ӭ��������^�h
info = get(handles.OpenBtn,'userData'); %������s��bOpenBtn��Userdata�������ɡB�ƹ��O��
%�⤧�e�Ȧs���Ҧ��O�����л\�^�h�N�i�H���^Undo���e������
if ~isempty(info.label_tmp) %�P�_�O���O�Ū� �p�G�O�Ū��N��redo
info.label = info.label_tmp; 
info.RectColor = info.RectColor_tmp;
info.RectSize = info.RectSize_tmp;
set(handles.OpenBtn,'UserData', info); %����������N�n��info�s�^�hOpenBtn����s���
showImg(handles);
end

%==========================================================================
% �o�����ODiscard��callback
%==========================================================================
% --------------------------------------------------------------------
function DiscardBtn_Callback(hObject, eventdata, handles)
% hObject    handle to DiscardBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Discard���s��callBack
%���U�h����|���I���O�������R��
info = get(handles.OpenBtn,'userData'); %������s��bOpenBtn��Userdata�������ɡB�ƹ��O��
info.label = [];
info.label_tmp = [];
info.RectColor = [];
info.RectColor_tmp = [];
info.RectSize = [];
info.RectSize_tmp = [];
set(handles.OpenBtn,'UserData', info); %����������N�n��info�s�^�hOpenBtn����s���
showImg(handles);


%==========================================================================
% �o�����OOpenBtn��callback�A�]�N�O��ӵ{�����̮֤ߪ�����
%==========================================================================
% --------------------------------------------------------------------
function OpenBtn_Callback(hObject, eventdata, handles)
% hObject    handle to OpenBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%�}�ɫ��s��callBack
info = get(handles.OpenBtn, 'userdata');  %�}�ɫe�A�n���P�_�O���O�w�g���}�L�ϡA�u�n���g�}�L�ϡA
                                          %�S�}�L�Ainfo�N�|�O�Ū��Aisempty�N�|�^��true
                                          %���}�L�Ainfo�@�w���Qallocate�O����Ŷ��A�ҥHisempty�N�O�^��false
if isempty(info)
    %�p�Ginfo���šA���N�N���٨S���L�A�N�i�H�}�l�i��}�ɡB��l��
    [fileName, filePath] = uigetfile('*.*');
    SrcImg = imread([filePath fileName]);
    displayAdjust(handles, SrcImg);   % �}�����ɤ���A���F�n�վ�axes��width�Bheight���~
                                      % �٭n�P�_�o�i�Ϧ��S���W�X��Ӥ������j�p
    % �Nslider��l�ơA���l��value�]��3�A�̤j���Ȭ�101�B�̤p��3 
    % sliderstep �O���C���@�Uslider���k�䪺���s���slider�n�W��h�ֶZ��
    set(handles.slider1, 'value', 3, 'max', 101, 'min', 3, 'sliderstep', [2/100 2/100]); 

    %=============================================================
    % OpenBtn��userdata���A info�O�Ω��x�s�Ҧ���ƪ��Ҧb
    % SrcImg �O�s��}�Ҫ�����
    % label �O�ΨӰO����e�ƹ��I���L���y��
    % RectSize �O�ΨӰO���C���I�U�ƹ��ɡA��ɳ]�w��Rectangle��Size
    % RectColor �O�ΨӰO���C���I�U�ƹ��ɡA��ɳ]�w��Rectangle��Color
    % tmp�������O�ΨӦb�i��Undo�ɼȦs��U���p
    % isSaved �O�ΨӰO���b�����{���άO���}���ɮɦ��S���s�ɹL 1�N�O��  0�N�O�S��
    %=============================================================
    
    info = struct('SrcImg', SrcImg, 'label', [], 'label_tmp', [], 'RectSize', [], 'RectSize_tmp',[], 'RectColor', [], 'RectColor_tmp', [], 'isSaved', 0);            
    set(hObject, 'userdata', info);      

    showImg(handles);  %��ܹϤ�
    
    guidata(hObject, handles);  %guidata �O��s�Ҧ����󪺪��p
    
else
    %�p�Ginfo�w�Qallocate�L�@�q�O����A���N��{���H�Q�B��A�}�ɫe�N�n�߰ݬO�_�n�s��
    if info.isSaved == 0
        btn = questdlg('Do you want to save the image?', 'Warning!');
         if strcmp(btn,'Yes')  %Yes�N�O�����s�ɺ��᭫�s�}��
            saveImage(handles);
            info = [];
            set(handles.OpenBtn,'UserData', info);
            OpenBtn_Callback(hObject, eventdata, handles);
         else  %��L�N�O���s�ɨç�info�M�ź��᭫�s�}��
            info = [];
            set(handles.OpenBtn,'UserData', info); 
            OpenBtn_Callback(hObject, eventdata, handles);
        end
    end
end

%==========================================================================
% �o�����OSaveBtn��callback�A�u�O²��I�s�禡��handles�ǹL�h���s�ɪ��ʧ@
%==========================================================================
% --------------------------------------------------------------------
function SaveBtn_Callback(hObject, eventdata, handles)
% hObject    handle to SaveBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%�s�ɫ��s��callBack
saveImage(handles);


%==========================================================================
% �o�����O��{�����n�Q�������|�B�@��code
%==========================================================================
% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure

%�{�������ɷ|�۰ʩI�s�o��function
info = get(handles.OpenBtn,'userData');
if info.isSaved == 0
    btn = questdlg('Do you want to save the image?', 'Warning!');
    if strcmp(btn,'Yes')
        saveImage(handles);
    end
    
end

delete(hObject);



%=====================================================================================%
% �H�U�O�ۭq��function
%=====================================================================================%

%=====================================================================================%
% displayAdjust �O�ھڼv���j�p�վ�figure �H�� axes���j�p
%=====================================================================================%

function displayAdjust(handles, SrcImg)

imgW = size(SrcImg,2); %���o�v�����e
imgH = size(SrcImg,1); %���o�v������
panelPos = get(handles.uipanel1, 'Position'); %���o�]�wRGB�C�⨺���panel�b��ӵe������m�P�e��

figPos = get(handles.figure1, 'Position'); %���o��ӵe���b�ù��W����m�P�e��  

% �Ҧ�Position�^�Ǫ���Ƭ�1*4���}�C�A�������O�� [x y w h] 

if figPos(4) < imgH
    if figPos(3) < imgW
        % 'Units', 'pixels' �O�j��b���o���󪺤j�p�� �Hpixel�����
        set(handles.figure1, 'Units', 'pixels', 'Position', [figPos(1) figPos(2) imgW (imgH+panelPos(4))]); 
        %�p�G��Ӥ������e�����p��Ū�J���v���A���N�n�⫰���������e�w��imgW�B���h�O�n�]�w���v��������imgH�b�[�W�����̭��J����Panel������
    else
        set(handles.figure1, 'Units', 'pixels', 'Position', [figPos(1) figPos(2) figPos(3) (imgH+panelPos(4))]); 
        %�p�G�u�����������׳��p��Ū�J���v�������A�Ȼݭn�N���������׳]�w���v��������imgH�b�[�W�����̭��J����Panel������
    end
else
    if figPos(3) < imgW
        set(handles.figure1, 'Units', 'pixels', 'Position', [figPos(1) figPos(2) imgW figPos(4)]); 
        %�p�G�u���������e�׳��p��Ū�J���v�����e�A��s�e�קY�i
    end
end

% ��s���ǭ����e������A�A��sAxes���e��
axesPos = get(handles.axes1,'Position'); 
set(handles.axes1, 'Units', 'pixels', 'Position', [axesPos(1), axesPos(2) size(SrcImg,2), size(SrcImg,1)]);


%=====================================================================================%
% ax_bdfcn �O�Ω�Ĳ�o�ƹ��I�U�h���ɭԪ��ʧ@�A�禡�W�٥i�H�H�N���
%=====================================================================================%
function [] = ax_bdfcn(hObject, eventdata, handles)

info = get(handles.OpenBtn,'userData');

if ~isempty(info)  %���U�ƹ��e�n���P�_ �O���O�w�g�}�ɹL�A�p�G���}�ɹL info���|�O�Ū�
    %�p�Ginfo�w����ơA�N�N��w�}�L�Ϩæ��@�Ƿƹ��I���������A�]���A�s�W�@���ƹ��O���ɭn�����ª�Ū�X�ӡA�M���s�����append�i�h
    label = info.label;    
    RectSize = info.RectSize;
    RectColor = info.RectColor;
    
    % �����U�]�w���C��H�Τj�p
    rval = str2double(get(handles.Rval,'String'));
    gval = str2double(get(handles.Gval,'String'));
    bval = str2double(get(handles.Bval,'String'));
    Rsize = round(get(handles.slider1, 'value'));
    
    % Rectangle ���C��
    color = [rval/255 gval/255 bval/255];
    
    currPt = get(gca, 'CurrentPoint');
    x0 = currPt(1,1)-floor(Rsize/2);
    y0 = currPt(1,2)-floor(Rsize/2); 
    x1 = currPt(1,1)+floor(Rsize/2);
    y1 = currPt(1,2)+floor(Rsize/2);
    xSize = Rsize;
    ySize = Rsize;
    
    %�P�_�nø�s����ɦ��S���W�X�v�������
    if x0 < 1
        x0 = 1;
    end
    if x1 > size(info.SrcImg,2)        
        xSize = Rsize - (x1 - size(info.SrcImg,2)) - 1;
    end
    if y0 < 1
        y0 = 1;
    end
    if y1 > size(info.SrcImg,1)
        ySize = Rsize - (y1 - size(info.SrcImg,1)) - 1;
    end
    
    %�b"�ثe������e��"�Wø�s�@�Ӥ���A�٨S�g�J����ɸ�
    rectangle('Position',[x0, y0, xSize, ySize], 'LineWidth', 1, 'edgecolor', color, 'FaceColor', color); 
    
    %��s�ƹ��I���O��
    label = [label; [currPt(1,1) currPt(1,2)]];
    info.label = label;

    %��s�ƹ��I���ɷ�U��rect�C��]�w
    RectColor = [RectColor; color];
    info.RectColor = RectColor;
    
    %��s�ƹ��I���ɷ�U��rect Size�]�w
    RectSize = [RectSize; Rsize];
    info.RectSize = RectSize;
    
    %��sUndo����
    info.label_tmp=[]; 
    info.RectColor_tmp=[];
    info.RectSize_tmp=[];
    
    %�N�s��Ʀs�^OpenBtn��
    set(handles.OpenBtn,'UserData', info);    
end
     
%=====================================================================================%
% saveImage �O�Ω�s�ɡA��n�s�ɪ��ɭԴN��ƹ��I�L���a��b�v���W�e����A���ۦs��
%=====================================================================================%
function [] = saveImage(handles)
info = get(handles.OpenBtn,'userData');
label = info.label;
RectColor = info.RectColor;
RectSize = info.RectSize;
img = info.SrcImg;
 
%�N�Ϲ���R�BG�BB�T�h�����X�ӡA���}�i��B�z
imgR = img(:,:,1);
imgG = img(:,:,2);
imgB = img(:,:,3);
 
%�H�U�j��O��Ҧ��I���L����m�BRect���C��Τj�p��Ū�X�ӡA�M��b�v���W�e���
for k = 1 : size(label,1)
     %Ū���ƹ��I���L���y�СB��ɳ]�w��Rect�j�p�P�C��
     x0 = label(k,1);
     y0 = label(k,2);
     r = RectColor(k,1);
     g = RectColor(k,2);
     b = RectColor(k,3);     
     Rsize = RectSize(k);
     
     %�P��R�BG�BB�T�h�@�����C�⪺�ʧ@�A�d�򳣬O�ѥ��W��k�U
     imgR(x0-floor(Rsize/2):x0+floor(Rsize/2), y0-floor(Rsize/2):y0+floor(Rsize/2)) = r*255;
     imgG(x0-floor(Rsize/2):x0+floor(Rsize/2), y0-floor(Rsize/2):y0+floor(Rsize/2)) = g*255;
     imgB(x0-floor(Rsize/2):x0+floor(Rsize/2), y0-floor(Rsize/2):y0+floor(Rsize/2)) = b*255;        
end

resImg = cat(3,imgR, imgG, imgB);
[fileName, filePath] = uiputfile('*.*');
imwrite(resImg, [filePath fileName]);

info.isSaved = 1;
set(handles.OpenBtn,'UserData', info); 


%=====================================================================================%
% showImg �O�Ω���ܵ��G�C �o�����̭��n���N�O set(h,'ButtonDownFcn',{@ax_bdfcn, handles}); �o��!
% �C���I�s�o��function���ɭԡA�N�|�ⴿ�g�I�L���a��@�@�s�X�ӵM��b�e���W�e�X���
%=====================================================================================%
function [] = showImg(handles)    
    % �����X�w���J�����ɥH�ά������ƹ��O��
    info = get(handles.OpenBtn,'userData');
    label = info.label;
    RectColor = info.RectColor;
    RectSize = info.RectSize;
            
    axes(handles.axes1); %�n�baxes�W��ܹϤ��N�n���U�o����O   
    h = image(info.SrcImg);  %�ŧi�s��image����ɡA�n�N�o�Ӥ���handle���Ǧ^��
                             %�]���o�Ӥ���ä��s�b��{�����������A�O�s�ŧi�n�Ψ���ܹϸ򱵨��ƹ��I����
                             %�ҥH�������D�쩳�ثe������handle
    axis off
    axis equal    
    
    %show�X�v������AŪ���ƹ��I���������M��}�l�e����W�h    
    for k = 1 : size(label,1)
        Rsize = RectSize(k);
        x0 = label(k,1)-floor(Rsize/2);
        y0 = label(k,2)-floor(Rsize/2); 
        x1 = label(k,1)+floor(Rsize/2);
        y1 = label(k,2)+floor(Rsize/2);
        xSize = Rsize;
        ySize = Rsize;

        %�b��ܫe�A�P�_�@�����S���W�L���
        if x0 < 1
            x0 = 1;
        end
        if x1 > size(info.SrcImg,2)        
            xSize = Rsize - (x1 - size(info.SrcImg,2)) - 1;
        end
        if y0 < 1
            y0 = 1;
        end
        if y1 > size(info.SrcImg,1)
            ySize = Rsize - (y1 - size(info.SrcImg,1)) - 1;
        end
        color = [RectColor(k,1) RectColor(k,2) RectColor(k,3)];
        rectangle('Position',[x0, y0, xSize, ySize], 'LineWidth', 1, 'FaceColor',color, 'edgecolor', color);   
    end
    
    % ��W���ŧi��image����handle�PBottonDown�o�ӷƹ��I���ƥ󰵳s��
    % @ax_bdfcn ����h�o��image���󦳱�����ƹ��I���ɡA�I�s '@'�᭱���禡�A���Ӥ�������handles�ǹL�h
    set(h,'ButtonDownFcn',{@ax_bdfcn, handles});      