
function [Dfs, Boundaries] = fourier(Image, n) 
    clc; home;
    close all hidden

    %A
    Img = imread(Image);
    I = (uint8(mean(Img, 3)));
    K = mat2gray(I);
    
    %B
    level = graythresh(K);
    BW = im2bw(K,level);

    %C
    B = bwboundaries(BW);
    Dfs = {};
    Boundaries = {};
    for k = 1:length(B)
        boundary = B{k};
        D = boundary(:,2)+ j * boundary(:,1);
        Df = fft(D);
        [a, b] = size(Df);
        if a > n
            % Translation Invariance
            Df = Df(2:(n + 1));
            Df(1) = 0;
            % Scale Invariance
            Df = Df/abs(Df(2));
            % Orientation Invariance
            Df = abs(Df);
            % collect
            Dfs{end+1} = Df;
            Boundaries{end+1} = boundary;
        end
    end
end