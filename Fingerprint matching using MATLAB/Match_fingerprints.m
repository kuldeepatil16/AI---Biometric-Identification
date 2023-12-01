% FINGERPRINT MATCHING SCORE
% Argument:   ff1 -  First transformed Fingerprint 
%             ff2 -  Second transformed Fingerprint
% Returns:    Distance

function Distance = Match_fingerprints(ff1,ff2)
%%TO DO
if length(ff1)> length(ff2)
    m = ff1;
    n = ff2;
else
    m = ff2;
    n = ff1;
end

P = zeros(length(m));
mapped = zeros(length(n));
lenmap = 1;
for i=1:length(m)
    dis= 1000;
    k=0;
    for j=1:length(n)
   
        if mm(n(j,:),m(i,:)) == 1
            if mapped(j) == 0
                k=j;
                dis = min(dis,D(m(i,:),n(j,:),lenmap));
            end
        end
    end
    
    if k ~= 0
        mapped(k)=1;
lenmap = lenmap + 1;
P(i) = k;
else
   P(i) = 0;
 end
end
Distance = 0;
   for i=1:length(P)
      Distance = Distance + P(i);
end
%% END TO DO
end
function d = sd(m1,m2)
d = sqrt((m1(1)-m2(1))^2 + (m1(2)-m2(2))^2);
end
function d = dd(m1,m2)
d = min(abs(m1(3)-m2(3)),2*pi-abs(m1(3)-m2(3)));
end
function d = D(m1,m2,~)
d = (0.5 * sd(m1,m2) + 0.5 * dd(m1,m2));
end
function d = mm(m1,m2)
r0 = 20;
q0 = 1;
if m1(4) == m2(4) && sd(m1,m2) < r0 && dd(m1,m2) < q0
d = 1;
else
d = 0;
end

end
