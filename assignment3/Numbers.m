function [sumval,diffval,prodval,maxval] = Numbers(num1,num2)
%Numbers takes 2 numbers as inputs and calculate the sum, difference,
%product, and max of the two numbers
%
%input= num1,num 2
%output= sumval, diffval, prodval, maxval

%sum of two numbers
sumval=(num1+num2);

%difference of two numbers
diffval=(num2-num1);

%product of the two numbers
prodval=(num1*num2);

%max value of the two numbers
maxval=max(num1,num2);
end