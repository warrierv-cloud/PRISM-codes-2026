clear

% select the data file
inpath = '/Applications/cfsmcombinationassay/cfsmcombinationgrowthcheck/';
infile = '1821n4412invaryingBAADconcentrations.txt'; 
fid = fopen(strcat(inpath,infile),'r');

ch = '';

n = 0;
N = 133; %initially planned number of time points
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
        lv(q,v) = 13;
        uv(q,v) = 25;
        %Growth Rate
        estpoly = polyfit(dt*(lv(q,v):uv(q,v)),log(shiftdim(OD6(q,v,lv(q,v):uv(q,v)),2)-0.084),1);%analyzes data
        r(q,v) = estpoly(1);
    end
end 
r1821in001fm = r(2:4,2);
trng = dt*(1:N);
OD1821in001fm = shiftdim(OD6(2:4,2,:),2)-0.083;
OD1821in001fmm = mean(OD1821in001fm,2);
figure
plot(trng,OD1821in001fm)
hold on
plot(trng,OD1821in001fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1821in001fm')

CC_1821in001fm = max(OD1821in001fm,[],1);

disp('1821in001fm')
disp(r1821in001fm')
disp(CC_1821in001fm)

r1821in002fm = r(2:4,3);
trng = dt*(1:N);
OD1821in002fm = shiftdim(OD6(2:4,3,:),2)-0.083;
OD1821in002fmm = mean(OD1821in002fm,2);
figure
plot(trng,OD1821in002fm)
hold on
plot(trng,OD1821in002fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1821in002fm')

CC_1821in002fm = max(OD1821in002fm,[],1);

disp('1821in002fm')
disp(r1821in002fm')
disp(CC_1821in002fm)

r1821in005fm = r(2:4,4);
trng = dt*(1:N);
OD1821in005fm = shiftdim(OD6(2:4,4,:),2)-0.083;
OD1821in005fmm = mean(OD1821in005fm,2);
figure
plot(trng,OD1821in005fm)
hold on
plot(trng,OD1821in005fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1821in005fm')

CC_1821in005fm = max(OD1821in005fm,[],1);

disp('1821in005fm')
disp(r1821in005fm')
disp(CC_1821in005fm)

r1821in01fm = r(2:4,5);
trng = dt*(1:N);
OD1821in01fm = shiftdim(OD6(2:4,5,:),2)-0.083;
OD1821in01fmm = mean(OD1821in01fm,2);
figure
plot(trng,OD1821in01fm)
hold on
plot(trng,OD1821in01fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1821in01fm')

CC_1821in01fm = max(OD1821in01fm,[],1);

disp('1821in01fm')
disp(r1821in01fm')
disp(CC_1821in01fm)

r1821in02fm = r(2:4,6);
trng = dt*(1:N);
OD1821in02fm = shiftdim(OD6(2:4,6,:),2)-0.083;
OD1821in02fmm = mean(OD1821in02fm,2);
figure
plot(trng,OD1821in02fm)
hold on
plot(trng,OD1821in02fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1821in02fm')

CC_1821in02fm = max(OD1821in02fm,[],1);

disp('1821in02fm')
disp(r1821in02fm')
disp(CC_1821in02fm)

r1821in05fm = r(2:4,7);
trng = dt*(1:N);
OD1821in05fm = shiftdim(OD6(2:4,7,:),2)-0.083;
OD1821in05fmm = mean(OD1821in05fm,2);
figure
plot(trng,OD1821in05fm)
hold on
plot(trng,OD1821in05fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1821in05fm')

CC_1821in05fm = max(OD1821in05fm,[],1);

disp('1821in05fm')
disp(r1821in05fm')
disp(CC_1821in05fm)

r1821in1fm = r(2:4,8);
trng = dt*(1:N);
OD1821in1fm = shiftdim(OD6(2:4,8,:),2)-0.083;
OD1821in1fmm = mean(OD1821in1fm,2);
figure
plot(trng,OD1821in1fm)
hold on
plot(trng,OD1821in1fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1821in1fm')

CC_1821in1fm = max(OD1821in1fm,[],1);

disp('1821in1fm')
disp(r1821in1fm')
disp(CC_1821in1fm)

r1821inglu002fm = r(2:4,9);
trng = dt*(1:N);
OD1821inglu002fm = shiftdim(OD6(2:4,9,:),2)-0.083;
OD1821inglu002fmm = mean(OD1821inglu002fm,2);
figure
plot(trng,OD1821inglu002fm)
hold on
plot(trng,OD1821inglu002fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1821inglu002fm')

CC_1821inglu002fm = max(OD1821inglu002fm,[],1);

disp('1821inglu002fm')
disp(r1821inglu002fm')
disp(CC_1821inglu002fm)

r1821inglu01fm = r(2:4,10);
trng = dt*(1:N);
OD1821inglu01fm = shiftdim(OD6(2:4,10,:),2)-0.083;
OD1821inglu01fmm = mean(OD1821inglu01fm,2);
figure
plot(trng,OD1821inglu01fm)
hold on
plot(trng,OD1821inglu01fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1821inglu01fm')

CC_1821inglu01fm = max(OD1821inglu01fm,[],1);

disp('1821inglu01fm')
disp(r1821inglu01fm')
disp(CC_1821inglu01fm)

r1821inglu02fm = r(2:4,11);
trng = dt*(1:N);
OD1821inglu02fm = shiftdim(OD6(2:4,11,:),2)-0.083;
OD1821inglu02fmm = mean(OD1821inglu02fm,2);
figure
plot(trng,OD1821inglu02fm)
hold on
plot(trng,OD1821inglu02fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1821inglu02fm')

CC_1821inglu02fm = max(OD1821inglu02fm,[],1);

disp('1821inglu02fm')
disp(r1821inglu02fm')
disp(CC_1821inglu02fm)



r4412in001fm = r(5:7,2);
trng = dt*(1:N);
OD4412in001fm = shiftdim(OD6(5:7,2,:),2)-0.083;
OD4412in001fmm = mean(OD4412in001fm,2);
figure
plot(trng,OD4412in001fm)
hold on
plot(trng,OD4412in001fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('4412in001fm')

CC_4412in001fm = max(OD4412in001fm,[],1);

disp('4412in001fm')
disp(r4412in001fm')
disp(CC_4412in001fm)

r4412in002fm = r(5:7,3);
trng = dt*(1:N);
OD4412in002fm = shiftdim(OD6(5:7,3,:),2)-0.083;
OD4412in002fmm = mean(OD4412in002fm,2);
figure
plot(trng,OD4412in002fm)
hold on
plot(trng,OD4412in002fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('4412in002fm')

CC_4412in002fm = max(OD4412in002fm,[],1);

disp('4412in002fm')
disp(r4412in002fm')
disp(CC_4412in002fm)

r4412in005fm = r(5:7,4);
trng = dt*(1:N);
OD4412in005fm = shiftdim(OD6(5:7,4,:),2)-0.083;
OD4412in005fmm = mean(OD4412in005fm,2);
figure
plot(trng,OD4412in005fm)
hold on
plot(trng,OD4412in005fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('4412in005fm')

CC_4412in005fm = max(OD4412in005fm,[],1);

disp('4412in005fm')
disp(r4412in005fm')
disp(CC_4412in005fm)

r4412in01fm = r(5:7,5);
trng = dt*(1:N);
OD4412in01fm = shiftdim(OD6(5:7,5,:),2)-0.083;
OD4412in01fmm = mean(OD4412in01fm,2);
figure
plot(trng,OD4412in01fm)
hold on
plot(trng,OD4412in01fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('4412in01fm')

CC_4412in01fm = max(OD4412in01fm,[],1);

disp('4412in01fm')
disp(r4412in01fm')
disp(CC_4412in01fm)

r4412in02fm = r(5:7,6);
trng = dt*(1:N);
OD4412in02fm = shiftdim(OD6(5:7,6,:),2)-0.083;
OD4412in02fmm = mean(OD4412in02fm,2);
figure
plot(trng,OD4412in02fm)
hold on
plot(trng,OD4412in02fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('4412in02fm')

CC_4412in02fm = max(OD4412in02fm,[],1);

disp('4412in02fm')
disp(r4412in02fm')
disp(CC_4412in02fm)

r4412in05fm = r(5:7,7);
trng = dt*(1:N);
OD4412in05fm = shiftdim(OD6(5:7,7,:),2)-0.083;
OD4412in05fmm = mean(OD4412in05fm,2);
figure
plot(trng,OD4412in05fm)
hold on
plot(trng,OD4412in05fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('4412in05fm')

CC_4412in05fm = max(OD4412in05fm,[],1);

disp('4412in05fm')
disp(r4412in05fm')
disp(CC_4412in05fm)

r4412in1fm = r(5:7,8);
trng = dt*(1:N);
OD4412in1fm = shiftdim(OD6(5:7,8,:),2)-0.083;
OD4412in1fmm = mean(OD4412in1fm,2);
figure
plot(trng,OD4412in1fm)
hold on
plot(trng,OD4412in1fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('4412in1fm')

CC_4412in1fm = max(OD4412in1fm,[],1);

disp('4412in1fm')
disp(r4412in1fm')
disp(CC_4412in1fm)

r4412inglu002fm = r(5:7,9);
trng = dt*(1:N);
OD4412inglu002fm = shiftdim(OD6(5:7,9,:),2)-0.083;
OD4412inglu002fmm = mean(OD4412inglu002fm,2);
figure
plot(trng,OD4412inglu002fm)
hold on
plot(trng,OD4412inglu002fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('4412inglu002fm')

CC_4412inglu002fm = max(OD4412inglu002fm,[],1);

disp('4412inglu002fm')
disp(r4412inglu002fm')
disp(CC_4412inglu002fm)

r4412inglu01fm = r(5:7,10);
trng = dt*(1:N);
OD4412inglu01fm = shiftdim(OD6(5:7,10,:),2)-0.083;
OD4412inglu01fmm = mean(OD4412inglu01fm,2);
figure
plot(trng,OD4412inglu01fm)
hold on
plot(trng,OD4412inglu01fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('4412inglu01fm')

CC_4412inglu01fm = max(OD4412inglu01fm,[],1);

disp('4412inglu01fm')
disp(r4412inglu01fm')
disp(CC_4412inglu01fm)

r4412inglu02fm = r(5:7,11);
trng = dt*(1:N);
OD4412inglu02fm = shiftdim(OD6(5:7,11,:),2)-0.083;
OD4412inglu02fmm = mean(OD4412inglu02fm,2);
figure
plot(trng,OD4412inglu02fm)
hold on
plot(trng,OD4412inglu02fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('4412inglu02fm')

CC_4412inglu02fm = max(OD4412inglu02fm,[],1);

disp('4412inglu02fm')
disp(r4412inglu02fm')
disp(CC_4412inglu02fm)



% save('strainsinreducingglucose')