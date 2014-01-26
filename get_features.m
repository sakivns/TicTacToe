function [X] = get_features(A)
x1 = 0;x2 = 0;x3 = 0;x4 = 0;x5 = 0;x6 = 0;
%%extracting features from board
%x1 = # of instances where there are 2 x's in a row with an open subsequent square.
%x2 = # of instances where there are 2 o's in a row with an open subsequent square.
%x3 = # of instances where there is an x in a completely open row.
%x4 = # of instances where there is an o in a completely open row.
%x5 = # of instances of 3 x's in a row (value of 1 signifies end game)
%x6 = # of instances of 3 o's in a row (value of 1 signifies end game)



for i= 1:3
    
 if (sum(A(i,:)==1)==2 && sum(A(i,:)==-1)==1)
    x1 = x1+1;
end
if (sum(A(:,i)==1)==2 && sum(A(:,i)==-1)==1)
    x1 = x1+1;
end
if (sum(A(i,:)==0)==2 && sum(A(i,:)==-1)==1)
    x2 = x2+1;
end
if (sum(A(:,i)==0)==2 && sum(A(:,i)==-1)==1)
    x2 = x2+1;
end


if (sum(A(i,:)==-1)==2 && sum(A(i,:)==1)==1)
    x3 = x3+1;
end
if (sum(A(:,i)==-1)==2 && sum(A(:,i)==1)==1)
    x3 = x3+1;
end

if (sum(A(i,:)==-1)==2 && sum(A(i,:)==0)==1)
    x4 = x4+1;
end
if (sum(A(:,i)==-1)==2 && sum(A(:,i)==0)==1)
    x4 = x4+1;
end
if sum(A(:,i)==1)==3 
    x5 = x5+1;
end
if sum(A(i,:)==1)==3 
    x5 = x5+1;
end
if sum(A(:,i)==0)==3 
    x6 = x6+1;
end
if sum(A(i,:)==0)==3 
    x6 = x6+1;
end
end



if  (sum(diag(A)==1)==2) &&(sum(diag(A)==-1)==1)
    x1 = x1+1;
end
if  (sum(diag(fliplr(A))==1)==2) && (sum(diag(fliplr(A))==-1)==1)
    x1 = x1+1;
end
if  (sum(diag(A)==0)==2) &&(sum(diag(A)==-1)==1)
    x2 = x2+1;
end
if  (sum(diag(fliplr(A))==0)==2) && (sum(diag(fliplr(A))==-1)==1)
    x2 = x2+1;
end


if  (sum(diag(A)==-1)==2) && (sum(diag(A)==1)==1)
    x3 = x3+1;
end
if  (sum(diag(fliplr(A))==-1)==2) && (sum(diag(fliplr(A))==1)==1)
    x3 = x3+1;
end
if  (sum(diag(A)==-1)==2) && (sum(diag(A)==0)==1)
    x4 = x4+1;
end
if  (sum(diag(fliplr(A))==-1)==2) && (sum(diag(fliplr(A))==0)==1)
    x4 = x4+1;
end
if  (sum(diag(A)==1)==3) 
    x5 = x5+1;
end
if  (sum(diag(fliplr(A))==1)==3) 
    x5 = x5+1;
end
if  (sum(diag(A)==0)==3) 
    x6 = x6+1;
end
if  (sum(diag(fliplr(A))==0)==3) 
    x6 = x6+1;
end
%%
X=[x1 x2 x3 x4 x5 x6];
end