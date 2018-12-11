function [x] = ifft_iterative_base(X)
% inverse FFT algorithm based on Cooley–Tukey iterative FFT
% (c) kambiz.rahbar@gmail.com, 2018
% length of x must be power 2
% Ex.
% X = [10.0000 + 0.0000i  -2.0000 + 2.0000i  -2.0000 + 0.0000i  -2.0000 - 2.0000i];
% x = ifft_iterative_base(X);

Ximg = imag(X);
Xreal = real(X);

d = Ximg + Xreal*1i;

d_fft = fft_iterative_base(d)/length(X);

dimg = imag(d_fft);
dreal = real(d_fft);

x = dimg + dreal*1i;
