function [totalAmount] = money(quarters,dimes,nickles,pennies)
%money takes the number of quarters, nickles, dimes, and pennies and finds
%the total dollar amount
%
% input= quarters, nickles, dimes, and pennies
% output= total amount 

%define the value of inputs
quartersval=0.25*quarters; %value of quarter multiplied by number of quarter
dimesval=0.10*dimes; %value of dime multipled by number of dimes 
nicklesval=0.05*nickles; %value of nickle multiplied by number of nickles
penniesval=0.01*pennies; %value of penny multipled by number of pennies

%sum of the total dollar amount 
totalAmount=(quartersval+dimesval+nicklesval+penniesval);
end