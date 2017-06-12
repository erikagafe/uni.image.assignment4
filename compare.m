function [out] = compare(train, test, t)
    out = [];
    [a, b] = size(test);
    for i = 1:b
        if norm(train - test{i}) < t
            out = [out, i];
        end
    end 
end

