function [strlth,firstcha,lastcha] = stringInput(strval)
%stringInput takes a string value as input and return the length of the
%string, the first character, and last character. 
%
%input= strval
%outputs= strlth, firstcha, lastcha
%
strlth = length(strval); %display length of string input
firstcha = strval(1); %display the first character of the input
lastcha= strval (end); %display the last character of the input
end