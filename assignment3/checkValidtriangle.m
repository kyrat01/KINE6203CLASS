function [validTriangle] = checkValidtriangle(sides)
%checkValidtriangle accepts a single 3-element array that represents the
%sides of a valid triangle
%
%input= sides
%output= validTriangle
% remove the three sides from the input
a = sides(1);
b = sides(2);
c = sides(3);
%Check the sides of the triangle
if (a + b > c) && (a + c > b) && (b + c > a)
    validTriangle=1; %if it is a valid triangle, it is true
else
    validTriangle=0; %if it is not a valid triangle, it is false
end
end