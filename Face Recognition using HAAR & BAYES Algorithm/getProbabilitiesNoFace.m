function probFace = getProbabilitiesNoFace(probBelFace,probBelNoFace)
    [m,n] = size(probBelFace);
    probFace = zeros(m,n);
    for i = 1:m
        for j = 1:n
            probFace(i,j) = probBelNoFace(i,j) / (probBelFace(i,j) + probBelNoFace(i,j));
        end
    end
end

