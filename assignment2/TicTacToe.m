% Kyra Taylor
% September 18, 2024
% A short description of what your code does

%While  loop to continue game
continueplaying=true;
while continueplaying
    %Display welcome message 
    disp("welcome to Tic Tac Toe;")

    % A prompt asking the user if they would like to play a game
    playgame=input('would you like to play a game? (yes/no)', 's' );

    %Respond to users choice
    if strcmpi(playgame, 'yes')
    disp('Lets Play!')
    else
    disp('Hope to see you soon!'); 
    end
    %Show game board
    board= [0 0 0; 0 0 0; 0 0 0];
    disp(board);

    %Count the number of moves made
    moveCount=0;

    %Max number of moves that can be made
    maxMoves=9;

    %Continue game until there is a winner
    while moveCount < maxMoves
        %use for loop to alternate moves between player and computer
        for playersMove = 1:2
            if playersMove == 1
                %prompt user for move
                row=input('enter row (1-3): ');
                column= input('enter column (1-3): ');
                
                %Validate move
                if row>=1 && row<=3 && column>=1 && column<=3 && board(row,column)== 0
                    %mark players spot ('1') on board
                    board(row,column) = 1;
                    disp('Updated board')
                    disp(board)
                    moveCount= moveCount + 1;
                else
                    disp('Invalid move, Please try again');
                    playersMove = playersMove - 1; %player try again
                    continue;
                end
                
                %Check if player won
                if checkWinner(board,1)
                    disp('Congrats, You Won!');
                    break; %Exit the loop if player wins
                end
                
           %Computer move
           else
            disp('computer move.../n')
            
            %select available spots for computer
            availableSpots= find(board==0);
            
            if ~isempty(availableSpots)
                computerMove = availableSpots(randi(length(availableSpots)));
                [rowComp, columnComp]=ind2sub(size(board), computerMove); 
                board(rowComp, columnComp)=2;
                disp('Updated board')
                disp(board)
                moveCount= moveCount + 1;
            end

            %Check if computer won
            if checkWinner(board,2)
                disp('Computer won! Game over')
                break; %exit loop if computer wins 
            end
        end

        %Check for a tied game
        if moveCount >= maxMoves
            disp('Tied Game!');
            break; %exit loop if game is tied
        end
    end

    %Exit loop if there is a winner
    if checkWinner(board,1) || checkWinner(board,2)
        break; %exit loop when player or computer has won
    end
end

%Ask user if they would like to play again
playAgain=input('Would you like to play again?(yes/no)','s');

%respond to users choice
if strcmpi(playAgain, 'no')
    disp('Thanks for playing! Hope to see you again!')
    continueplaying=false; %exit while loop to end game
end
end

% Win function to check for winner
function winner= checkWinner(board, player)
winner=false; 

%check wins in row, columns, and diagnols 
for i= 1:3
    %rows
    if all(board(i,:)==player)
        winner=true;
        return;
    end
    %columns
    if all(board(:,i)==player)
        winner=true;
        return;
    end
    %diagnols
    if all(diag(board)==player) || all(diag(flipud(board))==player)
        winner=true;
    end
end
end