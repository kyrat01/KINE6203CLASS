function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME:Kyra Taylor
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 9 - 12 bugs,
%              depending on how you correct them. 
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): '); 

while level ~= beginner && level ~= moderate && level ~= advanced % this condition allows any one 
    %of the levels to always be true because level cannot equal the three
    %values. When testing, program ask for level input when valid inputs
    %were entered. Corrected with replacing "or" with "and" so that loop
    %can be exited once it has valid input.
fprintf('Sorry, that is not a valid level selection.\n')
level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected

if level == beginner %Bug found: I found this by trying to run the code and getting a incorrect use of '=' error message.                      

highest = beginnerHighest;

elseif level == moderate

highest = moderateHighest;

else
highest = advancedHighest; %The bug found here was a case sensitive related 
% situation that was defined earlier in script .This bug was found by reviewing code before starting. 
% It was corrected by changing it from "advancehighest" to "advanceHighest"         
end

% randomly select secret number between 1 and highest for level of play

secretNumber = randi([1, highest]); %This bug comes from adding 1 to the expression. The outpu
%are numbers between 1 and the highest number + 1. found from testing.
%Corrected by replacing expression with randi function to select random
%numbers between 1 and highest. 

% initialize number of guesses and User_guess

numOfTries = 1;
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly

while userGuess ~= secretNumber

% get a valid guess (an integer from 1-Highest) from the user

fprintf('\nEnter a guess (1-%d): ', highest);
userGuess = input('');
while userGuess < 1 || userGuess > highest %bug found when entering the highest number that can be guessed, 
% saying not valid guess. Corrected by changing >= to > so that the highest
% number could be included

fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

userGuess = input('');

end % of guess validation loop

% add 1 to the number of guesses the user has made

numOfTries = numOfTries + 1;

% report whether the user's guess was high, low, or correct

if userGuess < secretNumber
fprintf('Sorry, %d is too low.\n', userGuess); %bug found that if and elseif conditions were the same, with the
%if statement being wrong, with greater than sign instead of less than.
%Found by reviewing code. Corrected by changing greater than sign to less
%than. 
elseif userGuess > secretNumber 
fprintf('Sorry, %d is too high.\n', userGuess);
else
    if numOfTries == 1
fprintf('\nLucky You!  You got it on your first try!\n\n'); %Bug found that if secret number is guess
%loop exits without displaying output. Found by testing secret number
%through guessing on first try and had no display. Corrected by making if
%statement for numOfTries, and "END" to exit loop and display output.
    else
fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
secretNumber, numOfTries); %The bug found is the second placeholder, %d, does not have a variable
%This was found by reveiwing code. It was corrected by adding "numOfTries"
%for the second placeholder. 
    end 
end %bug found with error message about "END" missing from the while loop
end
%bug found when testing. After guessing number, display game over but still
%ask to enter another guess. Corrected by ending while loop to to display
%game over after the correct number ha been guessed
fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');

end  % of guessing while loop

% end of game