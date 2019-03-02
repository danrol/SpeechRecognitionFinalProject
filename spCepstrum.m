function [c, y] = spCepstrum(x, fs, window, show)
 %% Initialization
 N = length(x);
 x = x(:); % assure column vector
 if ~exist('show', 'var') || isempty(show)
     show = 0;
 end
 if ~exist('window', 'var') || isempty(window)
     window = 'rectwin';
 end
 if ischar(window);
     window = eval(sprintf('%s(N)', window)); % hamming(N)
 end

 %% do fourier transform of a windowed signal
 x = x(:) .* window(:);
 y = fft(x, N);

 %% Cepstrum is IDFT (or DFT) of log spectrum
 c = ifft(log(abs(y)+eps));

 if show
     ms1=fs/1000; % 1ms. maximum speech Fx at 1000Hz
     ms20=fs/50;  % 20ms. minimum speech Fx at 50Hz

     %% plot waveform
     t=(0:N-1)/fs;        % times of sampling instants
     subplot(2,1,1);
     plot(t,x);
     legend('Waveform');
     xlabel('Time (s)');
     ylabel('Amplitude');

     %% plot cepstrum between 1ms (=1000Hz) and 20ms (=50Hz)
     %% DC component c(0) is too large
     q=(ms1:ms20)/fs;
     subplot(2,1,2);
     plot(q,abs(c(ms1:ms20)));
     legend('Cepstrum');
     xlabel('Quefrency (s) 1ms (1000Hz) to 20ms (50Hz)');
     ylabel('Amplitude');
 end
end