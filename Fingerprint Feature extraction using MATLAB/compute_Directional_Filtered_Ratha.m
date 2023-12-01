function [Dfilxy, Gxx, Gyy, Gxy] = compute_Directional_Filtered_Ratha(dX, dY, N)
    % Computing the directional filtered matrix and other variables
    % N size of the window i.e. Number of columns and rows

    % Initialize output matrices
    [fil, col] = size(dX);
    Dfilxy = zeros(fil, col);
    Gxx = zeros(fil, col);
    Gyy = zeros(fil, col);
    Gxy = zeros(fil, col);

    % Implementing directional filtering and computation of Gxx, Gyy, Gxy, and Dfilxy here
    for i = 1:fil
        for j = 1:col
            for h = 8:8
                for k = 8:8
                    if (i+h) >=1 && (i+h) <= fil && (j+k) >=1 && (j+k) <= col
            Gxx(i, j) = Gxx(i,j) + dX(i+h, j+k)^2;
            Gyy(i, j) = Gyy(i,j) + dY(i+h, j+k)^2;
            Gxy(i, j) = Gxy(i,j) + dX(i+h, j+k)*dY(i+h, j+k);   
        end
    end
            end
            Dfilxy(i,j) = 0.5 * atan2(2 * Gxy(i,j), (Gxx(i, j) - Gyy(i, j)));
        end
    end
    disp(Dfilxy);
end
