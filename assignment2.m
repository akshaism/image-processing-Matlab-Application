function varargout = assignment2(varargin)
% ASSIGNMENT2 MATLAB code for assignment2.fig
%      ASSIGNMENT2, by itself, creates a new ASSIGNMENT2 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT2 returns the handle to a new ASSIGNMENT2 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT2.M with the given input arguments.
%
%      ASSIGNMENT2('Property','Value',...) creates a new ASSIGNMENT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before assignment2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to assignment2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help assignment2

% Last Modified by GUIDE v2.5 20-Mar-2018 08:30:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @assignment2_OpeningFcn, ...
                   'gui_OutputFcn',  @assignment2_OutputFcn, ...
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


% --- Executes just before assignment2 is made visible.
function assignment2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to assignment2 (see VARARGIN)

% Choose default command line output for assignment2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes assignment2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = assignment2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
I = rgb2gray(I);
C=double(I);


for i=1:size(C,1)-2
    for j=1:size(C,2)-2
      %Sobel mask for x-direction:
      Gx=((2*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(2*C(i,j+1)+C(i,j)+C(i,j+2)));        
      %Sobel mask for y-direction:
      Gy=((2*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(2*C(i+1,j)+C(i,j)+C(i+2,j)));
        %The gradient of the image
        I(i,j)=abs(Gx)+abs(Gy);
       I(i,j)=sqrt(Gx.^2+Gy.^2);
      
    end
end

Threshold = 35;
I = max(I, Threshold);
I(I==round(Threshold))=0;
I = uint8(I);
%figure,imshow(~I);
axes(handles.axes1)
imshow((I))


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
I = rgb2gray(I);
I = im2double (I);
a= [-1 -1 -1;0 0 0;1 1 1]/6;
b= [-1 0 1;-1 0 1;-1 0 1]/6;
Gx=abs(conv2(I,b,'same'));
Gy=abs(conv2(I,a,'same'));
G = sqrt(Gx.^2 + Gy.^2);
I = G;
%Threshold = 0.08995;
%I = G > Threshold;

axes(handles.axes1)
imshow((I))
%I = edge(I,'Prewitt', [], 'both', 'nothinning');
%axes(handles.axes1)
%imshow((I))

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
%I = imread('miami-1409763_1280.jpg');
I =rgb2gray(I);
I = im2double(I);
m = zeros(3,3,8);
m(:,:,1) = [-3 -3 5; -3 0 5; -3 -3 5];
m(:,:,2) = [-3 5 5; -3 0 5; -3 -3 -3];
m(:,:,3) = [5 5 5; -3 0 -3; -3 -3 -3];
m(:,:,4) = [5 5 -3; 5 0 -3; -3 -3 -3];
m(:,:,5) = [5 -3 -3; 5 0 -3; 5 -3 -3];
m(:,:,6) = [-3 -3 -3; 5 0 -3; 5 5 -3];
m(:,:,7) = [-3 -3 -3; -3 0 -3; 5 5 5];
m(:,:,8) = [-3 -3 -3; -3 0 5; -3 5 5];
Am=zeros(size(I,1), size(I,2),8);
for i=1:8
    %I = im2double(I);
    Am(:,:,i) = imfilter(I,m(:,:,i),'same');
end
Ak = max(Am,[],3);
n = 255 / (max(Ak(:)) - min(Ak(:)));
I = uint8(n * Ak);
axes(handles.axes1)
figure, imshow(I);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
I = rgb2gray(I);
I = im2double(I);
[m,n]=size(I);
L(1:m,1:n)=0;
for i=1:m-1
    for j=1:n-1
        L(i,j)=-1*I(i,j)+0+0+1*I(i+1,j+1);
    end
end
M(1:m,1:n)=0;
for i=1:m-1
    for j=1:n-1
        M(i,j)=0-1*I(i,j+1)+1*I(i+1,j)+0;
    end
end
N=sqrt((M.^2)+(L.^2));
axes(handles.axes1)
imshow(N)
%robertsResult = edge(I,'roberts');
%imshow(robertsResult);
%imshow(N)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I

I = rgb2gray(I);
I = im2double(I);
lap = [1 1 1; 1 -8 1; 1 1 1]; %// Change - Centre is now positive
resp = imfilter(I, lap, 'conv'); %// Change

%// Change - Normalize the response image
minR = min(resp(:));
maxR = max(resp(:));
resp = (resp - minR) / (maxR - minR);

%// Change - Adding to original image now
sharpened = I + resp;

%// Change - Normalize the sharpened result
minA = min(sharpened(:));
maxA = max(sharpened(:));
sharpened = (sharpened - minA) / (maxA - minA);

%// Change - Perform linear contrast enhancement
sharpened = imadjust(sharpened, [60/255 200/255], [0 1]);
%subplot(1,3,1);imshow(a); title('Original image');
%subplot(1,3,2);imshow(resp); title('Laplacian filtered image');
axes(handles.axes1);
figure,imshow(resp);
figure,imshow(sharpened);
%title('Sharpened image');
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.jpg';'*.bmp'},'File Selector');


%I=imread((answer));
global I
I=imread(strcat(pathname,filename));
axes(handles.axes1)
imshow(I)

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get the name of the file that the user wants to save.
F = getframe(handles.axes1);
Image = frame2im(F);
imwrite(Image, 'Image.jpg')