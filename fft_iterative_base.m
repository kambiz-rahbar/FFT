function [X] = fft_iterative_base(x)
% Cooley–Tukey iterative FFT algorithm
% (c) kambiz.rahbar@gmail.com, 2018
% length of x must be power 2
% Ex.
% x = [1 2 3 4];
% X = fft_iterative_base(x);

if length(x) == 1
    X = x;
else
    n = length(x);
    k = ceil(log(n)/log(2));
    N = 2^k;
    if N~=n
        disp('Error:  Number of data samples is not a positive integer power of 2.');
    else
        xodd = x(2:2:end);
        xeven = x(1:2:end);
        
        Xodd = fft_iterative_base(xodd);
        Xeven = fft_iterative_base(xeven);
        
        W = exp(-2i*pi/N) .^[0:N/2-1];
        X = [Xeven + W.*Xodd Xeven-W.*Xodd];
    end
end