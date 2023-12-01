function [xNuc, yNuc] = compute_Core_Pointcare(Image)
  % Use uigetfile to select a .pgm image
    [Image, ~] = uigetfile('*.pgm', 'Fingerprint');
    if isequal(Image, 0)
        disp('User canceled the operation.');
        return;
    end
    % Load the selected image
    I = imread(Image);

    % Check if the image is grayscale, and convert it if necessary
    if size(I, 3) == 3
        I = rgb2gray(I);
    end

    % Define the number of directions (8 directions)
    numDirections = 8;

    % Get the size of the input image
    [rows, cols] = size(I);

    % Initialize the arrays to store xNuc and yNuc
    xNuc = zeros(rows, cols);
    yNuc = zeros(rows, cols);

    % Compute Pointcaré features for each pixel in the image
    for i = 1:rows
        for j = 1:cols
            % Initialize the sum of angles
            sumOfAngles = 0;

            % Calculate angles between the pixel (i, j) and its neighbors
            for k = 1:numDirections
                % Calculate the coordinates of the neighboring pixel
                ni = round(i + cos((2 * pi * k) / numDirections));
                nj = round(j + sin((2 * pi * k) / numDirections));

                % Wrap around if the coordinates exceed image boundaries
                ni = max(1, min(rows, ni));
                nj = max(1, min(cols, nj));

                % Calculate the angle between the current pixel and its neighbor
                angle = atan2d(double(I(ni, nj)) - double(I(i, j)), nj - j);

                % Add the angle to the sum
                sumOfAngles = sumOfAngles + angle;
            end

            % Store the computed feature in xNuc and yNuc
            xNuc(i, j) = sumOfAngles;
            yNuc(i, j) = sumOfAngles;
        end
    end
   

    % Display it
    figure;
    subplot(1, 2, 1);
    imshow(I);
    title('Original Image');
    subplot(1, 2, 2);
    imshow(uint8(xNuc)); % Display xNuc as an image
    title('Pointcaré Feature (xNuc)');
    colormap('jet'); % Apply a colormap for visualization
    colorbar; % Show colorbar

end
