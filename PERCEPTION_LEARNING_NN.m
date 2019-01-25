clc
clear all
close all
X=[-1 -1 -1;-1 1 -1;-1 -1 1;-1 1 1;1 -1 -1;1 1 -1;1 -1 1;1 1 1]'; %input matrix
X=[ones(1,size(X,2));X];
Y=[-1 1 -1 -1 -1 -1 -1 -1];   %targets
W=ones(size(X,1),1);
stop=0;
count=0;
ep=0;
while ~stop
 for n=1:size(X,2) 
     q=sign(W'*X(:,n));
     if(q==0)
         q=-1;
     end
   if(q~=Y(n))
        W=W+Y(n)*X(:,n);
   else
       count=count+1;
   end
   
 end
 if(count==size(X,2))
     stop=1;
 else
     count=0;
     ep=ep+1;
     
 end
 
     
end
disp("final weight matrix after training is:")
disp(W)
fprintf('Number of epochs taken=');fprintf('%d',ep);fprintf('\n');
O=zeros(size(Y,1),1);
for v=1:size(X,2)
      b=(sign(W'*X(:,v)));
      if(b==0)
          b=-1;
      end
      O(v)=b;
end
fprintf(' output  target\n');
ot=[O',Y'];
disp(ot);
        
       
    
