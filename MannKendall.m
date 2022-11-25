% Mann-Kendall test for 793 sites over 60 years.
% Time Series Trend Detection Tests
% where z = Mann-Kendall Statistic
% a represents row sites，b represents column years
% dt = Time Interval of Data
A=xlsread('C:\Users\WIKII\Desktop\inrxday.xlsx');% read data from excel in Desktop
[a,b]=size(A); % data include a rows and b columns
Zvalue=zeros(a,1)% the output form，a rows，1 column
for c=1:a % c run from 1 row to a row
    x=A(c,:);% the index row
    n=length(x);% the length of the index
    dt=1;
    s = 0;% calculate statistic
    for k = 1:n-1,
        for j = k+1:n,
            s = s + sign(x(j) - x(k) );
        end;
    end;
    % variance ( assuming no tied groups )
    v = ( n * ( n - 1 ) * ( 2 * n + 5 ) ) / 18;
    % test statistic
    if s == 0,
    z = 0;
    elseif s > 0,
    z = ( s - 1 ) / sqrt( v );
    else
    z = ( s + 1 ) / sqrt( v );
    end;
% the Mann-Kendall Z value results for each site
Zvalue(c,1)=z;
end

xlswrite('C:\Users\WIKII\Desktop\outrxday.xlsx',Zvalue,'Sheet1','A1');
disp('MK results')
disp(Zvalue);