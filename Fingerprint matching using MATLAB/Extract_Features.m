function Extract_Features(filename,flag)
img1 = imread(filename);
if ndims(img1) == 3; img1 = rgb2gray(img1); end  % Color Images
disp(['Extracting features from ' filename ' ...']);
fir=ext_finger(img1,0);
fir=fir(fir(:,3)<5,:);
if flag ==1
    figure;
    imshow(img1);
    hold on
    fir1=find(fir(:,3)==1);
    fir3=find(fir(:,3)==3);   
    plot(fir(fir1,1),fir(fir1,2),'r+');
    plot(fir(fir3,1),fir(fir3,2),'bo');
end
filename2=filename; filename2(end-1)='x'; filename2(end)='t';
save(filename2,'fir','-ascii');
end

