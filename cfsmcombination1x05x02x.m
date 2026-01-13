clear

% select the data file
inpath = '/Applications/cfsmcombinationassay/cfsmcombination091224/';
infile = '4412.dp.dpsup.txt';
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
r4412indpin1XFM = r(2,2:12);
trng = dt*(1:N);
OD4412indpin1XFM = shiftdim(OD6(2,2:12,:),1)-0.083;
figure
plot(trng,OD4412indpin1XFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('4412indpin1XFM')

CC_4412indpin1XFM = max(OD4412indpin1XFM,[],2)';

disp(r4412indpin1XFM)
disp(CC_4412indpin1XFM)

r4412indpin05XFM = r(3,2:12);
trng = dt*(1:N);
OD4412indpin05XFM = shiftdim(OD6(3,2:12,:),1)-0.083;
figure
plot(trng,OD4412indpin05XFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('4412indpin05XFM')

CC_4412indpin05XFM = max(OD4412indpin05XFM,[],2)';

disp(r4412indpin05XFM)
disp(CC_4412indpin05XFM)

r4412indpin02XFM = r(4,2:12);
trng = dt*(1:N);
OD4412indpin02XFM = shiftdim(OD6(4,2:12,:),1)-0.083;
figure
plot(trng,OD4412indpin02XFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('4412indpin02XFM')

CC_4412indpin02XFM = max(OD4412indpin02XFM,[],2)';

disp(r4412indpin02XFM)
disp(CC_4412indpin02XFM)

rdpindpin1XFM = r(5,2:12);
trng = dt*(1:N);
ODdpindpin1XFM = shiftdim(OD6(5,2:12,:),1)-0.083;
figure
plot(trng,ODdpindpin1XFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('dpindpin1XFM')

CC_dpindpin1XFM = max(ODdpindpin1XFM,[],2)';

disp(rdpindpin1XFM)
disp(CC_dpindpin1XFM)

rdpindpin05XFM = r(6,2:12);
trng = dt*(1:N);
ODdpindpin05XFM = shiftdim(OD6(6,2:12,:),1)-0.083;
figure
plot(trng,ODdpindpin05XFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('dpindpin05XFM')

CC_dpindpin05XFM = max(ODdpindpin05XFM,[],2)';

disp(rdpindpin05XFM)
disp(CC_dpindpin05XFM)

rdpindpin02XFM = r(7,2:12);
trng = dt*(1:N);
ODdpindpin02XFM = shiftdim(OD6(7,2:12,:),1)-0.083;
figure
plot(trng,ODdpindpin02XFM)
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('dpindpin02XFM')

CC_dpindpin02XFM = max(ODdpindpin02XFM,[],2)';

disp(rdpindpin02XFM)
disp(CC_dpindpin02XFM)

a = [CC_4412indpin1XFM;CC_4412indpin05XFM;CC_4412indpin02XFM]
b = [CC_dpindpin1XFM;CC_dpindpin05XFM;CC_dpindpin02XFM]


save('4412ndpindpsupbaad')