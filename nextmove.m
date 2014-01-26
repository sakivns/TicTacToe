function [NEXT_MOVE,POS] = nextmove(state,W)

NEXT_MOVES = [];
position = [];
for i = 1:3
    for j=1:3
        if state(i,j) == -1
            state(i,j) = 1;
            NEXT_MOVES = [NEXT_MOVES state];
            position = [position i j];
            state(i,j) = -1;
            
        end
    end
end

NEXT_MOVES
k = size(NEXT_MOVES,2)/3;
m=1;
max = 0;
index = 1;
ind = 1;
while m<=3*k

    Y = [1 get_features(NEXT_MOVES(:,m:m+2))]
    W
    Y
    value = sum(W.*Y)
    if(value > max)
        index = ((m-1)/3)+1;
        ind = m;
        max = value;
    end   
    m = m+3;
end

NEXT_MOVE = NEXT_MOVES(:,ind:ind+2)
[POS] = position((2*index)-1:2*index);
POS = POS-1;

end