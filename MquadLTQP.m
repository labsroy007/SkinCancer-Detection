%function[c1,n]= newcodetest25sep(I)
 I = imread('C:\Users\varun\Desktop\sample-melanoma.jpg');
   B=rgb2gray(I);
    b = imbinarize(B);
    m=edge(b,'sobel');
   c=imcomplement(m);
   I=B;
  [a b] = size(I);
     final_row=a;
     final_col=b;
     row_start=1;
     row_end=7;
     column_start=1;
     index_i=1;
     index_j=1;
     A=I;
     nisheet=2;
     WeightMatrix = [8 4 2; 16 0 1; 32 64 128];
 while row_end<=final_row
     column_start=1;
     column_end=7;
     index_j=1;
     while column_end<=final_col
         B=A(row_start : row_end, column_start : column_end);
         Q = cat(3,B(1:3,1:3), B(1:3,5:7),B(5:7,1:3),B(5:7,1:3));
         for i=1:4
             lower = Q(2,2,i) - nisheet;
             upper = Q(2,2,i) + nisheet;
             for j=1:3
                   for k=1:3
                       if(j==2 && k==2)
                           Q(j,k,i)=0;
                       else
                        if Q(j,k,i)<=lower
                            Q(j,k,i)= -1;
                        elseif Q(j,k,i)>=upper
                            Q(j,k,i)= 1;
                        else
                            Q(j,k,i) = 0;
                        end
                       end
                   end
             end
             for j=1:2
                 for k=1:3
                     for l=1:3
                         if j==1
                             if Q(k,l,i)<=0
                                 ltp(k,l,j)=0;
                             else
                                 ltp(k,l,j)=1;
                             end
                         else
                             if Q(k,l,i)<0
                                 ltp(k,l,j)=1;
                             else
                                 ltp(k,l,j)=0;
                             end
                         end
                     end
                 end
                 ltp(:,:,j)=ltp(:,:,j)*WeightMatrix;
                 sum1=0;
                 for k=1:3
                     for l=1:3
                       sum1=sum1+ltp(k,l,j);  
                     end
                 end
                 if j==1
                     alpha(i)=sum1;
                 else
                     beta(i)=sum1;
                 end
             end
         end
         
         img1(index_i,index_j)=min(alpha);
        
         img2(index_i,index_j)=min(beta);
         index_j=index_j+1;
         column_start=column_start+1;
         column_end=column_end+1;
     end
     index_i=index_i+1;
     row_start=row_start+1;
     row_end=row_end+1;
 end
 %imshowpair(m,img1,'diff');

 %figure,imshow(img2);
%figure,imshow(img2);
 %[c1,n] = imhist(img1);
%  figure,imhist(img1);
%  figure,imhist(img2);

imhist(img2)
