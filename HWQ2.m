
function [out]=HWQ2()
    clc; home;
    close all hidden

    %Fourier descriptors for all images.
     [Df1, bound1] = fourier('trainingB.png', 24);
     [Df2, bound2] = fourier('test2B.jpg', 24);
     [Df3, bound3] = fourier('test1B.jpg', 24);
    
    %Comparing the training image with the other 2 images
    [test1] = compare(Df1, Df2, 0.6);
    [test] = compare(Df1, Df3, 0.6);
    
    %Print the plot to the identified boundery in Test2B.jpg
    subplot(2,1,1);
    imshow('test2B.jpg');
    hold on
    [a, b] = size(test1);
    for k = 1:b
        boundary = bound2{test1(k)};
        plot(boundary(:,2), boundary(:,1), 'b', 'LineWidth', 2);
    end

    %Print the plot to the identified boundery in Test1B.jpg
    subplot(2,1,2);
    imshow('test1B.jpg');
    hold on
    [a, b] = size(test);
    for k = 1:b
        boundary = bound3{test(k)};
        plot(boundary(:,2), boundary(:,1), 'b', 'LineWidth', 5);
    end

end


