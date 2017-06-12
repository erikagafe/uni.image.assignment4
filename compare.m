function [out] = compare(train, test, t)
    out = [];
    [a, b] = size(train);
    [c, d] = size(test); 
    for i = 1:b
        for n = 1:d
            % testing the Euclidean distance 
            if norm(train{i} - test{n}) < t
                out = [out, n];
            end
        end
    end 
end

