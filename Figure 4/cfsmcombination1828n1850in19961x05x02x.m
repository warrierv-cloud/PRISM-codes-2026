clear

% select the data file
inpath = '/Applications/cfsmcombinationassay/cfsmcombination091224/';
infile = '1996sup.1828.1850.1x05x02x.08.30.24.txt';
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
r1828in1996in1xFM = r(2,2:12);
trng = dt*(1:N);
OD1828in1996in1xFM = shiftdim(OD6(2,2:12,:),1)-0.083;
figure
plot(trng,OD1828in1996in1xFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1828in1996in1xFM')

CC_1828in1996in1xFM = max(OD1828in1996in1xFM,[],2)';

disp(r1828in1996in1xFM)
disp(CC_1828in1996in1xFM)

r1828in1996in05xFM = r(3,2:12);
trng = dt*(1:N);
OD1828in1996in05xFM = shiftdim(OD6(3,2:12,:),1)-0.083;
figure
plot(trng,OD1828in1996in05xFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1828in1996in05xFM')

CC_1828in1996in05xFM = max(OD1828in1996in05xFM,[],2)';

disp(r1828in1996in05xFM)
disp(CC_1828in1996in05xFM)

r1828in1996in02XFM = r(4,2:12);
trng = dt*(1:N);
OD1828in1996in02XFM = shiftdim(OD6(4,2:12,:),1)-0.083;
figure
plot(trng,OD1828in1996in02XFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1828in1996in02XFM')

CC_1828in1996in02XFM = max(OD1828in1996in02XFM,[],2)';

disp(r1828in1996in02XFM)
disp(CC_1828in1996in02XFM)

r1850in1996in1xFM = r(5,2:12);
trng = dt*(1:N);
OD1850in1996in1xFM = shiftdim(OD6(5,2:12,:),1)-0.083;
figure
plot(trng,OD1850in1996in1xFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1850in1996in1xFM')

CC_1850in1996in1xFM = max(OD1850in1996in1xFM,[],2)';

disp(r1850in1996in1xFM)
disp(CC_1850in1996in1xFM)

r1850in1996in05xFM = r(6,2:12);
trng = dt*(1:N);
OD1850in1996in05xFM = shiftdim(OD6(6,2:12,:),1)-0.083;
figure
plot(trng,OD1850in1996in05xFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1850in1996in05xFM')

CC_1850in1996in05xFM = max(OD1850in1996in05xFM,[],2)';

disp(r1850in1996in05xFM)
disp(CC_1850in1996in05xFM)

r1850in1996in02xFM = r(7,2:12);
trng = dt*(1:N);
OD1850in1996in02xFM = shiftdim(OD6(7,2:12,:),1)-0.083;
figure
plot(trng,OD1850in1996in02xFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1850in1996in02xFM')

CC_1850in1996in02xFM = max(OD1850in1996in02xFM,[],2)';

disp(r1850in1996in02xFM)
disp(CC_1850in1996in02xFM)

a = [CC_1828in1996in1xFM;CC_1828in1996in05xFM;CC_1828in1996in02xFM]
b = [CC_1850in1996in1xFM;CC_1850in1996in05xFM;CC_1850in1996in02xFM]


save('1828n1850in1996supbaad')