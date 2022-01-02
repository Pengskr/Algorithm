% метод дихотомии 二分法
clear
clc

[x_min,f_min,k_iter] = dichotomy_ld(@(x) x^2+3*x,-5,5,100,1e-4)             % f(x)=x^2+3x

function [x_min,f_min,k_iter] =dichotomy_ld(f,a,b,k_iter_max,eps)
    k_iter=0;
    alpha=4;
    
    while abs(b-a)>=eps && k_iter<k_iter_max
        
        x_min=(a+b)/2;
        delta=(b-a)/alpha;
        
        if f(x_min-delta)>=f(x_min+delta)
            a=x_min-delta;
        else
            b=x_min+delta;
        end
        
        k_iter=k_iter+1;
        x_min=(a+b)/2;
        f_min=f(x_min);
    end

end