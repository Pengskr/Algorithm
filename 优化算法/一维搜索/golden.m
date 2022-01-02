% метод золотого
clear
clc

[x_min,f_min,k_iter] = golden_ld(@(x) x^2+3*x,-5,5,100,1e-4)             % f(x)=x^2+3x

function [x_min,f_min,k_iter]   =golden_ld(f,a,b,k_iter_max,eps)
   k_iter=0;
   phi=(1+sqrt(5))/2;
   
   x_step=(b-a)/phi;
   x_1=b-x_step;
   x_2=a+x_step;
   
   while abs(b-a)>=eps && k_iter<k_iter_max
       
       f_1=f(x_1);
       f_2=f(x_2);
       
       if f_1>=f_2
           a=x_1;
           x_1=x_2;
           x_2=a+(b-a)/phi;
       else
           b=x_2;
           x_2=x_1;
           x_1=b-(b-a)/phi;
       end
       k_iter=k_iter+1;
   end
   x_min=(a+b)/2;
   f_min=f(x_min);
 
end