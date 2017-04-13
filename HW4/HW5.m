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
% 以下是系統預設的initialization 可以不用管他
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
% 這部分是預設好的code,主要用途在整個程是剛運行的時候會預先呼叫這個function
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
% 這部分是預設好的code
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
% 這部分是Slider在程式使用的過程中，只要slider有變化就會呼叫的callback
%==========================================================================
% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% Slider 改變時的callback
% Slider改變數值的時候會自動顯示在slider上方的text
rectSize = get(handles.slider1, 'value');   % 抓取目前slider內存的值
rectSize = round(rectSize);  %把小數點去除掉
set(handles.scale_str, 'String', rectSize);  %顯示在Slider上面的text裡，讓使用者可以知道目前設定的rect大小

%==========================================================================
% 以下三個Callback都是用於處理三個設定RGB顏色的edit元件，功能都是有edit有變更的時候
% 就抓取edit裡的String，並使用 str2double 將字串轉成double 爾後動態將顏色顯示到text
% 的background中。
%==========================================================================

function Rval_Callback(hObject, eventdata, handles)
% hObject    handle to Rval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rval as text
%        str2double(get(hObject,'String')) returns contents of Rval as a double
info = get(handles.OpenBtn,'userData');
RectColor=info.RectColor;
% Text 改變時的callback
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
% Text 改變時的callback
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
% Text 改變時的callback
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
% 這部分是Undo的callback
%==========================================================================
% --------------------------------------------------------------------
function UndoBtn_Callback(hObject, eventdata, handles)
% hObject    handle to UndoBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 按下Undo時，要先把目前做到的狀況暫存起來，不然按Redo就找不回剛按下的地方
% 暫存完畢之後，就可以把點擊記錄的最後一筆刪掉。

info = get(handles.OpenBtn,'userData');  %先抓取存放在OpenBtn的Userdata中的圖檔、滑鼠記錄
label = info.label;  %把之前滑鼠點擊在影像上的位置存放在一個變數內
info.label_tmp = label; %把目前所有的滑鼠記錄存放在tmp裡面，以免Undo刪除掉最新的一筆記錄後 Redo無法叫出已被刪掉的一筆紀錄
label(end,:) = []; %刪掉最新一筆的滑鼠記錄
info.label = label; %存放回info裡的label中

%以下RectColorR、RectColor也是做一樣的事情

RectColor = info.RectColor;  
info.RectColor_tmp = RectColor;
RectColor(end,:) = [];
info.RectColor = RectColor;

RectSize = info.RectSize;
info.RectSize_tmp = RectSize;
RectSize(end,:) = [];
info.RectSize = RectSize;

set(handles.OpenBtn,'UserData', info);  %都做完之後就要把info存回去OpenBtn內更新資料
showImg(handles);

%==========================================================================
% 這部分是Undo的callback
%==========================================================================
% --------------------------------------------------------------------
function RedoBtn_Callback(hObject, eventdata, handles)
% hObject    handle to RedoBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Redo的callback
% 這邊是把暫存的整個紀錄拷貝回去
info = get(handles.OpenBtn,'userData'); %先抓取存放在OpenBtn的Userdata中的圖檔、滑鼠記錄
%把之前暫存的所有記錄都覆蓋回去就可以取回Undo之前的紀錄
if ~isempty(info.label_tmp) %判斷是不是空的 如果是空的就不redo
info.label = info.label_tmp; 
info.RectColor = info.RectColor_tmp;
info.RectSize = info.RectSize_tmp;
set(handles.OpenBtn,'UserData', info); %都做完之後就要把info存回去OpenBtn內更新資料
showImg(handles);
end

%==========================================================================
% 這部分是Discard的callback
%==========================================================================
% --------------------------------------------------------------------
function DiscardBtn_Callback(hObject, eventdata, handles)
% hObject    handle to DiscardBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Discard按鈕的callBack
%按下去之後會把點擊記錄全部刪除
info = get(handles.OpenBtn,'userData'); %先抓取存放在OpenBtn的Userdata中的圖檔、滑鼠記錄
info.label = [];
info.label_tmp = [];
info.RectColor = [];
info.RectColor_tmp = [];
info.RectSize = [];
info.RectSize_tmp = [];
set(handles.OpenBtn,'UserData', info); %都做完之後就要把info存回去OpenBtn內更新資料
showImg(handles);


%==========================================================================
% 這部分是OpenBtn的callback，也就是整個程式中最核心的部分
%==========================================================================
% --------------------------------------------------------------------
function OpenBtn_Callback(hObject, eventdata, handles)
% hObject    handle to OpenBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%開檔按鈕的callBack
info = get(handles.OpenBtn, 'userdata');  %開檔前，要先判斷是不是已經有開過圖，只要曾經開過圖，
                                          %沒開過，info就會是空的，isempty就會回傳true
                                          %有開過，info一定有被allocate記憶體空間，所以isempty就是回傳false
if isempty(info)
    %如果info為空，那就代表都還沒做過，就可以開始進行開檔、初始化
    [fileName, filePath] = uigetfile('*.*');
    SrcImg = imread([filePath fileName]);
    displayAdjust(handles, SrcImg);   % 開完圖檔之後，除了要調整axes的width、height之外
                                      % 還要判斷這張圖有沒有超出整個介面的大小
    % 將slider初始化，把初始值value設為3，最大的值為101、最小為3 
    % sliderstep 是指每按一下slider左右邊的按鈕整個slider要增減多少距離
    set(handles.slider1, 'value', 3, 'max', 101, 'min', 3, 'sliderstep', [2/100 2/100]); 

    %=============================================================
    % OpenBtn的userdata中， info是用於儲存所有資料的所在
    % SrcImg 是存放開啟的圖檔
    % label 是用來記錄當前滑鼠點擊過的座標
    % RectSize 是用來記錄每次點下滑鼠時，當時設定的Rectangle的Size
    % RectColor 是用來記錄每次點下滑鼠時，當時設定的Rectangle的Color
    % tmp結尾的是用來在進行Undo時暫存當下狀況
    % isSaved 是用來記錄在關掉程式或是重開圖檔時有沒有存檔過 1就是有  0就是沒有
    %=============================================================
    
    info = struct('SrcImg', SrcImg, 'label', [], 'label_tmp', [], 'RectSize', [], 'RectSize_tmp',[], 'RectColor', [], 'RectColor_tmp', [], 'isSaved', 0);            
    set(hObject, 'userdata', info);      

    showImg(handles);  %顯示圖片
    
    guidata(hObject, handles);  %guidata 是更新所有物件的狀況
    
else
    %如果info已被allocate過一段記憶體，那代表程式以被運行，開檔前就要詢問是否要存檔
    if info.isSaved == 0
        btn = questdlg('Do you want to save the image?', 'Warning!');
         if strcmp(btn,'Yes')  %Yes就是先做存檔爾後重新開檔
            saveImage(handles);
            info = [];
            set(handles.OpenBtn,'UserData', info);
            OpenBtn_Callback(hObject, eventdata, handles);
         else  %其他就是不存檔並把info清空爾後重新開檔
            info = [];
            set(handles.OpenBtn,'UserData', info); 
            OpenBtn_Callback(hObject, eventdata, handles);
        end
    end
end

%==========================================================================
% 這部分是SaveBtn的callback，只是簡單呼叫函式把handles傳過去做存檔的動作
%==========================================================================
% --------------------------------------------------------------------
function SaveBtn_Callback(hObject, eventdata, handles)
% hObject    handle to SaveBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%存檔按鈕的callBack
saveImage(handles);


%==========================================================================
% 這部分是當程式正要被關閉的會運作的code
%==========================================================================
% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure

%程式關閉時會自動呼叫這個function
info = get(handles.OpenBtn,'userData');
if info.isSaved == 0
    btn = questdlg('Do you want to save the image?', 'Warning!');
    if strcmp(btn,'Yes')
        saveImage(handles);
    end
    
end

delete(hObject);



%=====================================================================================%
% 以下是自訂的function
%=====================================================================================%

%=====================================================================================%
% displayAdjust 是根據影像大小調整figure 以及 axes的大小
%=====================================================================================%

function displayAdjust(handles, SrcImg)

imgW = size(SrcImg,2); %取得影像的寬
imgH = size(SrcImg,1); %取得影像的高
panelPos = get(handles.uipanel1, 'Position'); %取得設定RGB顏色那邊該panel在整個畫面的位置與寬高

figPos = get(handles.figure1, 'Position'); %取得整個畫面在螢幕上的位置與寬高  

% 所有Position回傳的資料為1*4的陣列，元素分別為 [x y w h] 

if figPos(4) < imgH
    if figPos(3) < imgW
        % 'Units', 'pixels' 是強制在取得元件的大小時 以pixel為單位
        set(handles.figure1, 'Units', 'pixels', 'Position', [figPos(1) figPos(2) imgW (imgH+panelPos(4))]); 
        %如果整個介面的寬高都小於讀入的影像，那就要把城式介面的寬定成imgW、高則是要設定成影像的高度imgH在加上介面裡面既有的Panel的高度
    else
        set(handles.figure1, 'Units', 'pixels', 'Position', [figPos(1) figPos(2) figPos(3) (imgH+panelPos(4))]); 
        %如果只有介面的高度都小於讀入的影像的高，僅需要將介面的高度設定成影像的高度imgH在加上介面裡面既有的Panel的高度
    end
else
    if figPos(3) < imgW
        set(handles.figure1, 'Units', 'pixels', 'Position', [figPos(1) figPos(2) imgW figPos(4)]); 
        %如果只有介面的寬度都小於讀入的影像的寬，更新寬度即可
    end
end

% 更新完藉面的寬高之後，再更新Axes的寬高
axesPos = get(handles.axes1,'Position'); 
set(handles.axes1, 'Units', 'pixels', 'Position', [axesPos(1), axesPos(2) size(SrcImg,2), size(SrcImg,1)]);


%=====================================================================================%
% ax_bdfcn 是用於觸發滑鼠點下去的時候的動作，函式名稱可以隨意更改
%=====================================================================================%
function [] = ax_bdfcn(hObject, eventdata, handles)

info = get(handles.OpenBtn,'userData');

if ~isempty(info)  %按下滑鼠前要先判斷 是不是已經開檔過，如果有開檔過 info不會是空的
    %如果info已有資料，就代表已開過圖並有一些滑鼠點擊的紀錄，因此再新增一筆滑鼠記錄時要先把舊的讀出來，然後把新的資料append進去
    label = info.label;    
    RectSize = info.RectSize;
    RectColor = info.RectColor;
    
    % 抓取當下設定的顏色以及大小
    rval = str2double(get(handles.Rval,'String'));
    gval = str2double(get(handles.Gval,'String'));
    bval = str2double(get(handles.Bval,'String'));
    Rsize = round(get(handles.slider1, 'value'));
    
    % Rectangle 的顏色
    color = [rval/255 gval/255 bval/255];
    
    currPt = get(gca, 'CurrentPoint');
    x0 = currPt(1,1)-floor(Rsize/2);
    y0 = currPt(1,2)-floor(Rsize/2); 
    x1 = currPt(1,1)+floor(Rsize/2);
    y1 = currPt(1,2)+floor(Rsize/2);
    xSize = Rsize;
    ySize = Rsize;
    
    %判斷要繪製方塊時有沒有超出影像的邊界
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
    
    %在"目前的元件畫面"上繪製一個方塊，還沒寫入到圖檔裡
    rectangle('Position',[x0, y0, xSize, ySize], 'LineWidth', 1, 'edgecolor', color, 'FaceColor', color); 
    
    %更新滑鼠點擊記錄
    label = [label; [currPt(1,1) currPt(1,2)]];
    info.label = label;

    %更新滑鼠點擊時當下的rect顏色設定
    RectColor = [RectColor; color];
    info.RectColor = RectColor;
    
    %更新滑鼠點擊時當下的rect Size設定
    RectSize = [RectSize; Rsize];
    info.RectSize = RectSize;
    
    %更新Undo紀錄
    info.label_tmp=[]; 
    info.RectColor_tmp=[];
    info.RectSize_tmp=[];
    
    %將新資料存回OpenBtn中
    set(handles.OpenBtn,'UserData', info);    
end
     
%=====================================================================================%
% saveImage 是用於存檔，當要存檔的時候就把滑鼠點過的地方在影像上畫方塊，接著存檔
%=====================================================================================%
function [] = saveImage(handles)
info = get(handles.OpenBtn,'userData');
label = info.label;
RectColor = info.RectColor;
RectSize = info.RectSize;
img = info.SrcImg;
 
%將圖像中R、G、B三層分離出來，分開進行處理
imgR = img(:,:,1);
imgG = img(:,:,2);
imgB = img(:,:,3);
 
%以下迴圈是把所有點擊過的位置、Rect的顏色及大小都讀出來，然後在影像上畫方塊
for k = 1 : size(label,1)
     %讀取滑鼠點擊過的座標、當時設定的Rect大小與顏色
     x0 = label(k,1);
     y0 = label(k,2);
     r = RectColor(k,1);
     g = RectColor(k,2);
     b = RectColor(k,3);     
     Rsize = RectSize(k);
     
     %同時R、G、B三層作改變顏色的動作，範圍都是由左上到右下
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
% showImg 是用於顯示結果。 這部分最重要的就是 set(h,'ButtonDownFcn',{@ax_bdfcn, handles}); 這行!
% 每次呼叫這個function的時候，就會把曾經點過的地方一一叫出來然後在畫面上畫出方塊
%=====================================================================================%
function [] = showImg(handles)    
    % 先取出已載入的圖檔以及相關的滑鼠記錄
    info = get(handles.OpenBtn,'userData');
    label = info.label;
    RectColor = info.RectColor;
    RectSize = info.RectSize;
            
    axes(handles.axes1); %要在axes上顯示圖片就要先下這行指令   
    h = image(info.SrcImg);  %宣告新的image元件時，要將這個元件的handle給傳回來
                             %因為這個元件並不存在於現有的介面中，是新宣告要用來顯示圖跟接受滑鼠點擊的
                             %所以必須知道到底目前的元件handle
    axis off
    axis equal    
    
    %show出影像之後，讀取滑鼠點擊的紀錄然後開始畫方塊上去    
    for k = 1 : size(label,1)
        Rsize = RectSize(k);
        x0 = label(k,1)-floor(Rsize/2);
        y0 = label(k,2)-floor(Rsize/2); 
        x1 = label(k,1)+floor(Rsize/2);
        y1 = label(k,2)+floor(Rsize/2);
        xSize = Rsize;
        ySize = Rsize;

        %在顯示前再判斷一次有沒有超過邊界
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
    
    % 把上面宣告的image元件的handle與BottonDown這個滑鼠點擊事件做連結
    % @ax_bdfcn 為當h這個image元件有接受到滑鼠點擊時，呼叫 '@'後面的函式，把整個介面中的handles傳過去
    set(h,'ButtonDownFcn',{@ax_bdfcn, handles});      