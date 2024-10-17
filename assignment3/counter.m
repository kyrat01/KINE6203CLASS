function counter(lownum,highnum)
%takes 2 numbers as inputs and display a counter from the lower number to
%the higher number
% 
%input= lownum, highnum 
%
%find the lower and higher number

if lownum < highnum
    for i = lownum:highnum %if lownum is less then highnum, it will count from lownum to highnum
        dis(i);
    end
else
    for i = highnum:lownum %if highnum is less than lownum, it will count from highnum to lownum upwards
        dis(i)
    end
end
end