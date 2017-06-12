function [ output_args ] = imageFiltering( input_args )
%IMAGEFILTERING Summary of this function goes here
%   Detailed explanation goes here

    %A
    
    Img = imread('taskA.png');
    I = (uint8(mean(Img, 3)));
    doubleImage = mat2gray(I);

    %B
    
    noiseImage = imnoise(doubleImage,'gaussian',0,0.01);
    
    %C
    
    %the Gaussian filter: the function returns the kernel filter and a
    %matrix of zeros with the kernel filter centralized
    [kernel, kernel_in_matrix] = gaussian_filter(noiseImage, 2, 50);
    
    fft2_image = fft2( noiseImage ); % Fourier of img
    fft2_filter = fft2( kernel_in_matrix ); % Fourier of filter
    F = fft2_image.*fft2_filter; % filter in Fourier space
    ifft2_image = ifft2( F ); % back to spatial domain. 
    
    %D
    
    %logarithmic centered image spectra of the original image
    subplot(2,2,1);
    %c = jet(3);
    %colormap(c);
    imagesc(log(abs(fftshift(fft2(doubleImage)))));     
    title('Orignal image spectra');
    
    %noisy image
    subplot(2,2,2);
    imshow(noiseImage); title('Noisy Image');
    
    %Gaussian filter
    subplot(2,2,3);
    imshow(kernel,[]);title('Gaussian Filter');
    
    %filterd image
    subplot(2,2,4);
    imshow(ifft2_image);title('Filterd Image');
    
end

