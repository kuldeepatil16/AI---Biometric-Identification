function probBelogingToSet = getProbabilitiesForFeaturesBelongingToSet(imagesHaar,meanHaars,stdHaars)
    [nImages,nFeatures] = size(imagesHaar);
    probBelogingToSet = zeros(nImages,nFeatures);
    
    for i = 1:nImages
        for f = 1:nFeatures
            probBelogingToSet(i,f) = normpdf(imagesHaar(i,f),meanHaars(f),stdHaars(f));
        end
    end
end