function [intervalo, N] = intervalo_de_confianza(autocorr)
    alpha=0.05;
    N=length(autocorr);
    u=-tinv(alpha/2,N-1);
    x_bar=mean(autocorr);
    sigma=(std(autocorr));
    intervalo=[-(x_bar+u*sigma/sqrt(N)),x_bar+u*sigma/sqrt(N)];
    %disp(intervalo);
endfunction