% FINGERPRINT ALIGNING
%
% Argument:   M1 -  First Minutiae 
%             M2 -  Second Minutiae
%             display_flag
%               
% Returns:    S - Similarity Measure
%             M1 -  First Minutiae aligned
%             M2 -  Second Minutiae aligned
%

function [T1,T2,bi,bj,ba] = Transform_fingerprints( M1, M2,display_flag )
    [bi,bj,ba] = Transform_parameters( M1, M2);
    T2=transform(M2,bj);
    T2=transform2(T2,ba*pi/360);
    T1=transform(M1,bi);  
    if display_flag==1
        plot_data(T1,1);
        plot_data(T2,2);
    end
end

