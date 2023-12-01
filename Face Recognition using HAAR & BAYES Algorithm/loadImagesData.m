function imagesData = loadImagesData(path,file,samples)
    imagesData = zeros(6,6,samples);
    for i = 1:samples
        imagesData(:,:,i) = load(path + file + i + ".txt");
    end
end

