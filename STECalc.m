function ste = STECalc(frames)

% calculate frames energy
[r,c] = size(frames);
ste = zeros(1, r);
for i = 1 : r
    ste(i) = sum(frames(i,:).^2);    
end

ste = ste/max(ste); %normalize the data

