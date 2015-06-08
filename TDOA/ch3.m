function [ h ] = ch3( x,y )
Ny = length(y);
Nx = length(x);
L = Ny-Nx + 1;
Y = fft(y);
X = fft([x; zeros(Ny - Nx,1)]);
H = Y./X.';
h = ifft(H);
%h = abs(h);
end
