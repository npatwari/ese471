function h = SRRC(alpha, N, Lp)

% Add epsilon to the n values to avoid numerical problems
n = [(-N * Lp) : (N * Lp)] + 10^-9;

% Plug into time domain formula for the SRRC pulse shape
h = (1 / sqrt(N)) * (sin(pi * (1 - alpha) * n / N) + ...
    (4 * alpha * n / N) .* cos(pi * (1 + alpha) * n / N)) ... 
    ./ (pi * n / N .* (1 - (4 * alpha * n / N).^2));
