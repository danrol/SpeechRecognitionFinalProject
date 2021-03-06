function frames = framing(data, fs, f_d)

% do framing
f_size = round(f_d * fs);
n = length(data);
n_f = floor(n/f_size);  %no. of frames
temp = 0;
frames = zeros(1, f_size);
for i = 1 : n_f
    
    frames(i,:) = data(temp + 1 : temp + f_size);
    temp = temp + f_size;
end