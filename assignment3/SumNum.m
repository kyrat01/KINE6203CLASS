function [Result] = SumNum(num1,num2)
%SumNum takes two numbers as input and return Woo if their sum is even and Hah if
%the sum is odd
%
%  inputs=2 numbers (num1,Num2)
% output= Woo if sum is even and Hah if sum is odd
% 
% calcule sum of the two numbers
SumNum = (num1+num2);

%check if sum is even or odd using mod function
if mod(SumNum,2)==0
    %if sum is divisible by 2, it is even and display 'Woo'
    Result="Woo";
else
    %if sum is not divisible by 2, it is odd and display 'Hah'
    Result= "Hah";
end
