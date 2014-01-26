function [W] = train()

clear all;
close all;
clc;
disp('Training Data Please Wait........');
n=0;
draw=0;
X_win=0;
O_win=0;

%W=[20.3903   24.4974  -72.8981   35.9366  -15.6244   95.4768  -76.0926]
Constant = 0.01;
load('w.mat');

while(n<5000)


[stateset,state,winner] = modifiedtictactoe();

i = size(stateset,2);
j = i;
if winner == 0 % O won
       weight = -100;
    elseif winner == 1 % X won
       weight = 100;
    else % else it's a tie
       weight = 0;
end
    

vxTrain = weight;
vyTrain = -weight;
while j-5>=1
   
X =[1 get_features(stateset(:,j-2:j))];

   vxEstimate = sum(W.*X);
   
 W = W + Constant*(vxTrain - vxEstimate)*X; 
 vxTrain = vxEstimate;
 
 
 Y =[1 get_features(stateset(:,j-5:j-3))];

  
   vyEstimate = sum(W.*Y);
   
 W = W + Constant*(vyTrain - vyEstimate)*Y; 
 vyTrain = vyEstimate;
 
 j=j-6;
 
end

n = n+1;

end
Wfinal = W
end



