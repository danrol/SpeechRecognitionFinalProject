function ste = STECalc(frames)


% calculate frames energy
[r,c] = size(frames);
ste = 0;
%ste=zeros();
for i = 1 : c
    ste(i) = sum(frames(:,i).^2);    
end

ste = ste/max(ste); %normalize the data

