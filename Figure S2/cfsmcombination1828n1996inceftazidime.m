clear

% select the data file
inpath = '/Applications/cfsmcombinationassay/cfsmcombination091224inBAADd/';
infile = '1828n1996inceftazidine.10.22.24.txt';
fid = fopen(strcat(inpath,infile),'r');

ch = '';

n = 0;
N = 145; %initially planned number of time points
Nr = N; %max time actual reads from text file
dt = 10/60; % measurement time-step (hours)

r = 8; % number of rows
c = 12; % number of columns
Rd = zeros(1,Nr);
OD6 = zeros(r,c,Nr); % all OD values
ch = fscanf(fid,'%s',1);
while strcmp(ch,'Temperature')==0
    ch = fscanf(fid,'%s',1);
end
while strcmp(ch,'Time')==0
    ch = fscanf(fid,'%s',1);
end 
while n < Nr
    %This next line increments n each time it goes through the loop
    n = n+1;
    %This adds information to the nth entry into the Rd matrix (read
    %matrix)
    Rd(n) = fscanf(fid,'%i',1);
    
    %This step records the time stamp and stores it in "Time"
    Ts = fscanf(fid,'%s',1);
    Time(n,1:length(Ts)-2) = Ts(2:length(Ts)-1);
    
    %The number at the end indicates how many words/number to skip to
    %get back to the data. In this case: 3
    %If this is confusing, read it along side the text file to understand
    %how to get back to the next line of data. 
    ch = fscanf(fid,'%s',3);
    %This says skip 13 words/numbers while reading through the file
    ch = fscanf(fid,'%s',13);
    
    %This reads the OD of the plate i = rows j = collumns n = time
    for i = 1:8
        for j = 1:12
            OD6(i,j,n) = str2double(fscanf(fid,'%s',1));
        end
        
        %This says skip 3 words/numbers while reading through the file
        ch = fscanf(fid,'%s',3); 
    end
    % skips to the next set of data
    ch = fscanf(fid,'%s',2); 
end

%% For Plate Reader Data that ends prematurely and has another type of Read
%This says - skip the empty matrices and get to the next set of data such
%as fluorescence data
% for ndump = Nr+1:N,
%     %The number at the end indicates how many words/number to skip to
%         %get back to the data In this case: 44
%     ch = fscanf(fid,'%s',44);
% end
% 
% while strcmp(ch,'Time')==0,
%     ch = fscanf(fid,'%s',1);
% end

ch=fclose(fid);

%Makes a matrix of zeros the size of a 96 well plate. That will store
%growth rates
r = zeros(8,12);
lv = zeros(8,12);
uv = zeros(8,12);
for q = 1:8
    for v = 1:12
        %uv = higher threshold for OD
        %lv = lower threshold for OD
        lv(q,v) = 20;
        uv(q,v) = 32;
        %Growth Rate
        estpoly = polyfit(dt*(lv(q,v):uv(q,v)),log(shiftdim(OD6(q,v,lv(q,v):uv(q,v)),1)-0.0830),1);%analyzes data
        r(q,v) = estpoly(1);
    end
end 
r1828inceftazidimein1xFM = r(2,2:12);
trng = dt*(1:N);
OD1828inceftazidimein1xFM = shiftdim(OD6(2,2:12,:),1)-0.083;
figure
plot(trng,OD1828inceftazidimein1xFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1828inceftazidimein1xFM')

CC_1828inceftazidimein1xFM = max(OD1828inceftazidimein1xFM,[],2)';

disp(r1828inceftazidimein1xFM)
disp(CC_1828inceftazidimein1xFM)

r1828inceftazidimein05xFM = r(3,2:12);
trng = dt*(1:N);
OD1828inceftazidimein05xFM = shiftdim(OD6(3,2:12,:),1)-0.083;
figure
plot(trng,OD1828inceftazidimein05xFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1828inceftazidimein05xFM')

CC_1828inceftazidimein05xFM = max(OD1828inceftazidimein05xFM,[],2)';

disp(r1828inceftazidimein05xFM)
disp(CC_1828inceftazidimein05xFM)

r1828inceftazidimein02XFM = r(4,9:11);
trng = dt*(1:N);
OD1828inceftazidimein02XFM = shiftdim(OD6(4,9:11,:),1)-0.083;
figure
plot(trng,OD1828inceftazidimein02XFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1828inceftazidimein02XFM')

CC_1828inceftazidimein02XFM = max(OD1828inceftazidimein02XFM,[],2)';

disp(r1828inceftazidimein02XFM)
disp(CC_1828inceftazidimein02XFM)

r1996inceftazidimein02xFM = r(5,9:11);
trng = dt*(1:N);
OD1996inceftazidimein02xFM = shiftdim(OD6(5,9:11,:),1)-0.083;
figure
plot(trng,OD1996inceftazidimein02xFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1996inceftazidimein1xFM')

CC_1996inceftazidimein02xFM = max(OD1996inceftazidimein02xFM,[],2)';

disp(r1996inceftazidimein02xFM)
disp(CC_1996inceftazidimein02xFM)

r1996inceftazidimein015xFM = r(6,2:12);
trng = dt*(1:N);
OD1996inceftazidimein015xFM = shiftdim(OD6(6,2:12,:),1)-0.083;
figure
plot(trng,OD1996inceftazidimein015xFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1996inceftazidimein015xFM')

CC_1996inceftazidimein015xFM = max(OD1996inceftazidimein015xFM,[],2)';

disp(r1996inceftazidimein015xFM)
disp(CC_1996inceftazidimein015xFM)

r1996inceftazidimein01xFM = r(7,2:12);
trng = dt*(1:N);
OD1996inceftazidimein01xFM = shiftdim(OD6(7,2:12,:),1)-0.083;
figure
plot(trng,OD1996inceftazidimein01xFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1996inceftazidimein01xFM')

CC_1996inceftazidimein01xFM = max(OD1996inceftazidimein01xFM,[],2)';

disp(r1996inceftazidimein01xFM)
disp(CC_1996inceftazidimein01xFM)

a = [CC_1828inceftazidimein1xFM;CC_1828inceftazidimein05xFM;CC_1828inceftazidimein02xFM]
b = [CC_1996inceftazidimein02xFM;CC_1996inceftazidimein015xFM;CC_1996inceftazidimein01xFM]


save('1828n1996inceftazidimesupbaad')