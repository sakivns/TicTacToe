

function [] = tictactoe()
    % Setup the figure/windows for the game
    clear all;
    close all;
    clc;
    [W] = train();
    save 'w.mat' W ;
    figure('Name','Tic Tac Toe');
    plot(-1, -1)
    axis([0 3 0 3])
    set(gca,'xTick',0:3)
    set(gca,'yTick',0:3)
    set(gca,'xTickLabel','')
    set(gca,'yTickLabel','')
    xlabel('Player: X')
    grid on
    shg
    
    is_x = 0; % keeps track of the current player
    state = [[-1 -1 -1]
             [-1 -1 -1]
             [-1 -1 -1]]; % the state of the game (-1 none, 0 = O, 1 = X)
    winner = -1; % is there a winner? is it a tie?
    
    % The main game loop. Continue until the game ends with winner ~= -1
    while winner == -1
        
        next = play(is_x, state,W); % play a single round
        if next == -1 % if the player clicks on a filled in slot, ask them to try again
           title('Invalid move, please try again');
        else
           state = next; % advance the current state
           title('');
           is_x = mod(is_x + 1,2); % pick the next player and update the player label
           if is_x == 1
               xlabel('Player: X');
           else
               xlabel('Player: O');
           end
           winner = won(state); % check to see if the game is in a winning state
        end
    end
    
    if winner == 0 % O won
        warndlg('O wins');
        title('O wins');
        xlabel('');
    elseif winner == 1 % X won
        warndlg('X wins');
        title('X wins');
        xlabel('');
    else % else it's a tie
        warndlg('Tie');
        title('Tie');
        xlabel('');
    end
end
 
% The state function takes in the current player and the previous state the
% game is in and simulates a single round.
function state = play(is_x, state,W)
if is_x == 0
    [x y] = ginput(1); % get the mouse position with respect to the plot
    
    [row,col] = position(x, y); % get the corresponding row/col (note row starts off with 0 at the bottom)
    
    if state(row+1, col+1) ~= -1 % if the player tries to click on a filled spot
       state = -1; % invalid, ask the player to try again
    else
        state( row+1,col+1) = is_x; % set the state and draw the X and the O
        drawO(col,2 - row);
        
    end

else if is_x == 1
   
  [state,pos] = nextmove(state,W);
   
  pos
  state
   drawX(pos(2),2-pos(1)); 
    
    end
end
end
% The won function calculates if the current game state is in a winning
% state.
function won = won(state)
    % Horizontal
    if (state(1,1) == state(1,2) && state(1,1) == state(1,3) && state(1,1) ~= -1)
        won = state(1,1);
    elseif (state(2,1) == state(2,2) && state(2,1) == state(2,3) && state(2,1) ~= -1)
        won = state(2,1);
    elseif (state(3,1) == state(3,2) && state(3,1) == state(3,3) && state(3,1) ~= -1)
        won = state(3,1);
    % Vertical
    elseif (state(1,1) == state(2,1) && state(1,1) == state(3,1) && state(3,1) ~= -1) 
        won = state(1,1);
    elseif (state(1,2) == state(2,2) && state(1,2) == state(3,2) && state(1,2) ~= -1) 
        won = state(1,2);
    elseif (state(1,3) == state(2,3) && state(1,3) == state(3,3) && state(1,3) ~= -1) 
        won = state(1,3);
    % Diagonal
    elseif (state(1,1) == state(2,2) && state(1,1) == state(3,3) && state(1,1) ~= -1)
        won = state(1,1);
    elseif (state(1,3) == state(2,2) && state(1,3) == state(3,1) && state(2,2) ~= -1)
        won = state(1,3);
    % If no more slots are open, it's a tie
    elseif ~ismember(state, -1)
        won = 2;
    else
        won = -1;
    end
end
 
% Returns the rounded off position of the mouse
function [row col] = position(x, y)
    col = floor(x);
    row = floor(y);
    if col > 2 % if we're right on the 3 line, we count it as 2
        col = 2;
    end
    
    if row > 2
        row = 2;
    end
    row = 2-row;
end
 
function drawX(col, row)
    hold on
    x = 0:1;
    pos = 0:1;
    neg = 1-x;
    plot(x+col, pos+row,'r','LineWidth',3)
    plot(x+col, neg+row,'r','LineWidth',3)
   
    hold off
    
end
 
function drawO(col, row)
    hold on
    t = 0:0.1:2*pi;
    x = cos(t)/2+0.5;
    y = sin(t)/2+0.5;
    plot(x+col, y+row,'g','LineWidth',3)
   
    hold off
   
end