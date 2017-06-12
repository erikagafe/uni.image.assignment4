
function [Dfs] = fourier(Image, n) 
    %A
    Img = imread(Image);
    I = (uint8(mean(Img, 3)));
    K = mat2gray(I);
%     imshow(K)
    
    %B
    level = graythresh(K);
    BW = im2bw(K,level);
    subplot(2,3,1);
    imshowpair(K,BW,'montage'), title(level);

    %C
    B = bwboundaries(BW);
    subplot(2,3,2);
    imshow(BW)
    hold on
    Dfs = {};
    for k = 1:length(B)
        boundary = B{k};
        plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2)
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
        end
    end
 
end