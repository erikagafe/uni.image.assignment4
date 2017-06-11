
function [out]=HWQ2()
    clc; home;
    close all hidden

    %A
    Img = imread('trainingB.png');
    I = (uint8(mean(Img, 3)));
    K = mat2gray(I);
%     imshow(K)
    
    %B
    level = graythresh(K)
    BW = im2bw(K,level);
    subplot(2,3,1);
    imshowpair(K,BW,'montage'), title(level)
    
    
    %C
    [B,L] = bwboundaries(BW);
    subplot(2,3,2);
    imshow(label2rgb(L, @jet, [.5 .5 .5]))
    hold on
    for k = 1:length(B)
        boundary = B{k};
        plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
    end
    
    D = boundary(:,2)+ j * boundary(:,1);
    Df = fft(D);
    Df = Df(2:(24 + 1));
    Df = Df/Df(2);
    Df = abs(Df);
 
    
    
    
    
    
    
    Img2 = imread('test2B.jpg');
    I = (uint8(mean(Img2, 3)));
    K = mat2gray(I);
    imshow(K)
    
    level = graythresh(K)
    BW = im2bw(K,level);
    subplot(2,3,1);
    imshowpair(K,BW,'montage'), title(level)
    
    [B,L] = bwboundaries(BW);
    subplot(2,3,2);
    imshow(label2rgb(L, @jet, [.5 .5 .5]))
    hold on
    for k = 1:length(B)
        boundary = B{k};
        plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
    end
    
     D = boundary(:,2)+ j * boundary(:,1);
    Df1 = fft(D)
%     Df1 = Df1(2:(2));
%     Df1 = Df1/Df1(2);
%     Df1 = abs(Df1);
%     
%     D = pdist2(Df,Df1,'euclidean')
%     D = norm(Df - Df1)
    


end


