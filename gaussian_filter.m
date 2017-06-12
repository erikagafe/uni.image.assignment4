function [ kernel, kernel_in_matrix ] = guassian_filter(Image, sigma, ws)
     % GUASSIAN_FILTER Summary of this function goes here
     % Detailed explanation goes here
     [x,y] = meshgrid(-ws:ws,-ws:ws);
     Exp_comp = -(x.^2+y.^2)/(2*sigma*sigma);
     kernel = exp(Exp_comp)/(2*pi*sigma*sigma);
     % padding
     kernel_in_matrix = zeros(size(Image));
     wsd = 2 * ws;
     % Copy filter kernel into matrix
     for lin = 1:wsd
         for col = 1:wsd
             kernel_in_matrix(lin,col) = kernel(lin,col);
         end
     end
     % shift the center of the kernel to the corner
     kernel_in_matrix = circshift(kernel_in_matrix,[-wsd/2 -wsd/2]);
end

