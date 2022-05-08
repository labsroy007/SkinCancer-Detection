clc
clear

I = imread('C:\Users\bhara\Desktop\project 2017\dataset\ARR dataset\cancerous (1).jpg');

[c1,n] = newcodetest25sep(I);

c1=c1/size(I,1)/size(I,2);

srcFiles = dir('C:\Users\bhara\Desktop\project 2017\dataset\ARR dataset\*.jpg');
for i = 1 : length(srcFiles)
    filename = strcat('C:\Users\bhara\Desktop\project 2017\dataset\ARR dataset\',srcFiles(i).name);
    i2 = imread(filename);
    [c2,n]=newcodetest25sep(i2);
    c2=c2/size(i2,1)/size(i2,2);
d = pdist2(c1',c2') 
end;



