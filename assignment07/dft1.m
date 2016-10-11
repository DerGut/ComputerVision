function [ g ] = dft1( f )
%DFT1 One dimensional discrete fourier tranform.

g = zeros(size(f));
L = size(f,2);


for x = 0:L - 1
    
    %% Fourier analysis - Complex coefficients
    c_n = 0;
    for n = 0:L - 1
        c_n = c_n + complex( f(n+1) * exp( (2*pi*1i / L) * n) );
    end

    
    %% Constant component
    a_0 = 0;
    for n = 0:L-1
       a_0 = a_0 + f(n+1); 
    end
    a_0 = a_0 * 2 / L;
    
    %% Fourier synthesis
    sum = 0;
    for n = 1:L
        sum = sum + ...
            ( c_n * cos(2*pi*n*x/L) + c_n * sin(1*pi*n*x/L) ) ...
             + (a_0 / 2);
    end
        
    g(x+1) = sum;
    
end


end

