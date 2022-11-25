% sl=Sen's Slope value
A=xlsread('C:\Users\WIKII\Desktop\inwsdi.xlsx')% read data from excel in Desktop
[a,b]=size(A); % data include a rows and b columns
Senslope=zeros(a,1)% the output form，a rows，1 column
for c=1:a % c run from 1 row to a row
    x=A(c,:);% the index row
    n=length(x);% the length of data
    ndash=n*(n-1)/2;
    s=zeros(ndash,1);
    i=1;
    for k=1:n-1,
        for j=k+1:n,
            s(i)=(x(j)-x(k))/(j-k);
            i=i+1;
        end;
    end;
% the slope results
sl=median(s);
Senslope(c,1)=sl;
end
xlswrite('C:\Users\WIKII\Desktop\outwsdi.xlsx',Senslope,'Sheet1','A1');
disp('Sen Slope')
disp(Senslope);