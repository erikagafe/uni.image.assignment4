
function [out]=HWQ2()
    clc; home;
    close all hidden

    Df1 = fourier('trainingB.png', 24);
    train = Df1{1};
   
    Df2 = fourier('test2B.jpg', 24);
    %Dfs3 = fourier('test1B.jpg', 24)
    
    [test] = compare(train, Df2, 1)
    
   % Df2(test(1))
    
    B = bwboundaries(Df2(test(1)));
%     imshow('test2B.jpg');
%     hold on
%     for k = 1:length(B)
%         boundary = B{k};
%         plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 10);
%     end

end


