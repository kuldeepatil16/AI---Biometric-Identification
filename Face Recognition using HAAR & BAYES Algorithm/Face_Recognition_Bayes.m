clear
close all
path1 = "./Face_Database_Learn/";
path2 = "./Face_Database_Test/";


%% Building the model
% Load images
faceImagesData = loadImagesData(path1,"f",10);
noFaceImagesData = loadImagesData(path1,"n",10);

% Extract haar
faceImagesHaar = extractHaars(faceImagesData);
noFaceImagesHaar = extractHaars(noFaceImagesData);

% Build the  Bayes model (std & mean)
%Mean
faceMeanHaars = mean(faceImagesHaar);
noFaceMeanHaars = mean(noFaceImagesHaar);
% std
faceStdHaars = std(faceImagesHaar);
noFaceStdHaars = std(noFaceImagesHaar);


%% Testing the model
% Deduce probabilities
imagesData = loadImagesData(path2,"c",6);
imagesHaar = extractHaars(imagesData);

probBelFace = getProbabilitiesForFeaturesBelongingToSet(imagesHaar,faceMeanHaars,faceStdHaars);
probBelNoFace = getProbabilitiesForFeaturesBelongingToSet(imagesHaar,noFaceMeanHaars,noFaceStdHaars);

% Probability of face
probFace = transpose(getProbabilitiesFace(probBelFace,probBelNoFace));
% Probability of NO face
probNoFace = transpose(getProbabilitiesNoFace(probBelFace,probBelNoFace));

% Final probabilities

probFaceTotal = prod(probFace);
probNoFaceTotal = prod(probNoFace);

display(probFaceTotal);
display(probNoFaceTotal);


