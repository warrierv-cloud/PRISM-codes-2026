clear

% select the data file
inpath = '/Applications/cfsmcombinationassay/cfsmcombinationgrowthcheck/';
infile = '1828n1850invaryingbaadconcentrations.072324.txt'; 
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
trng = dt*(1:N);
for q = 1:8
    for v = 1:12
        %uv = higher threshold for OD
        %lv = lower threshold for OD
        lv(q,v) = 5;
        uv(q,v) = 28;
        %Growth Rate
        estpoly = polyfit(dt*(lv(q,v):uv(q,v)),log(shiftdim(OD6(q,v,lv(q,v):uv(q,v)),2)-0.084),1);%analyzes data
        r(q,v) = estpoly(1);
        Q = shiftdim(OD6(q,v,1:Nr),1)-0.084; % replace with growth curve from data
        
        [FitQ, p, sm, varcov] = fit_logistic(trng,Q);
        THf(q,v) = p(1); % tHalf values
        CCf(q,v) = p(2); % carrying capacity values
        GRf(q,v) = p(3); % growth rate values
    end
end 
r1828in001fm = GRf(2:4,2);
trng = dt*(1:N);
OD1828in001fm = shiftdim(OD6(2:4,2,:),2)-0.083;
OD1828in001fmm = mean(OD1828in001fm,2);
figure
plot(trng,OD1828in001fm)
hold on
plot(trng,OD1828in001fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1828in001fm')

CC_1828in001fm = max(OD1828in001fm,[],1);


disp('1828in001fm')
disp(r1828in001fm')
disp(CC_1828in001fm)


r1828in002fm = GRf(2:4,3);
trng = dt*(1:N);
OD1828in002fm = shiftdim(OD6(2:4,3,:),2)-0.083;
OD1828in002fmm = mean(OD1828in002fm,2);
figure
plot(trng,OD1828in002fm)
hold on
plot(trng,OD1828in002fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1828in002fm')

CC_1828in002fm = max(OD1828in002fm,[],1);

disp('1828in002fm')
disp(r1828in002fm')
disp(CC_1828in002fm)

r1828in005fm = GRf(2:4,4);
trng = dt*(1:N);
OD1828in005fm = shiftdim(OD6(2:4,4,:),2)-0.083;
OD1828in005fmm = mean(OD1828in005fm,2);
figure
plot(trng,OD1828in005fm)
hold on
plot(trng,OD1828in005fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1828in005fm')

CC_1828in005fm = max(OD1828in005fm,[],1);

disp('1828in005fm')
disp(r1828in005fm')
disp(CC_1828in005fm)

r1828in01fm = GRf(2:4,5);
trng = dt*(1:N);
OD1828in01fm = shiftdim(OD6(2:4,5,:),2)-0.083;
OD1828in01fmm = mean(OD1828in01fm,2);
figure
plot(trng,OD1828in01fm)
hold on
plot(trng,OD1828in01fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1828in01fm')

CC_1828in01fm = max(OD1828in01fm,[],1);

disp('1828in01fm')
disp(r1828in01fm')
disp(CC_1828in01fm)

r1828in02fm = GRf(2:4,6);
trng = dt*(1:N);
OD1828in02fm = shiftdim(OD6(2:4,6,:),2)-0.083;
OD1828in02fmm = mean(OD1828in02fm,2);
figure
plot(trng,OD1828in02fm)
hold on
plot(trng,OD1828in02fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1828in02fm')

CC_1828in02fm = max(OD1828in02fm,[],1);

disp('1828in02fm')
disp(r1828in02fm')
disp(CC_1828in02fm)

r1828in05fm = GRf(2:4,7);
trng = dt*(1:N);
OD1828in05fm = shiftdim(OD6(2:4,7,:),2)-0.083;
OD1828in05fmm = mean(OD1828in05fm,2);
figure
plot(trng,OD1828in05fm)
hold on
plot(trng,OD1828in05fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1828in05fm')

CC_1828in05fm = max(OD1828in05fm,[],1);

disp('1828in05fm')
disp(r1828in05fm')
disp(CC_1828in05fm)

r1828in1fm = GRf(2:4,8);
trng = dt*(1:N);
OD1828in1fm = shiftdim(OD6(2:4,8,:),2)-0.083;
OD1828in1fmm = mean(OD1828in1fm,2);
figure
plot(trng,OD1828in1fm)
hold on
plot(trng,OD1828in1fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1828in1fm')

CC_1828in1fm = max(OD1828in1fm,[],1);

disp('1828in1fm')
disp(r1828in1fm')
disp(CC_1828in1fm)

CC_1828infm = [CC_1828in001fm',CC_1828in002fm',CC_1828in005fm', CC_1828in01fm', CC_1828in02fm',CC_1828in05fm', CC_1828in1fm'];
r1828infm = [r1828in001fm,r1828in002fm,r1828in005fm, r1828in01fm, r1828in02fm,r1828in05fm, r1828in1fm];


figure
plot(r1828infm,CC_1828infm,'o')
axis([0, 1.5, 0, 1.5])
xlabel('growth rate')
ylabel('carrying capacity')
legend('0.01x','0.02x','0.05x','0.1x','0.2x','0.5x','1x')

% r1828inglu002fm = r(2:4,9);
% trng = dt*(1:N);
% OD1828inglu002fm = shiftdim(OD6(2:4,9,:),2)-0.083;
% OD1828inglu002fmm = mean(OD1828inglu002fm,2);
% figure
% plot(trng,OD1828inglu002fm)
% hold on
% plot(trng,OD1828inglu002fmm,'k:')
% set(gca,'YScale','log')
% xlabel('Time (hours)')
% ylabel('OD')
% title('1828inglu002fm')
% 
% CC_1828inglu002fm = max(OD1828inglu002fm,[],1);
% 
% disp('1828inglu002fm')
% disp(r1828inglu002fm')
% disp(CC_1828inglu002fm)
% 
% r1828inglu01fm = r(2:4,10);
% trng = dt*(1:N);
% OD1828inglu01fm = shiftdim(OD6(2:4,10,:),2)-0.083;
% OD1828inglu01fmm = mean(OD1828inglu01fm,2);
% figure
% plot(trng,OD1828inglu01fm)
% hold on
% plot(trng,OD1828inglu01fmm,'k:')
% set(gca,'YScale','log')
% xlabel('Time (hours)')
% ylabel('OD')
% title('1828inglu01fm')
% 
% CC_1828inglu01fm = max(OD1828inglu01fm,[],1);
% 
% disp('1828inglu01fm')
% disp(r1828inglu01fm')
% disp(CC_1828inglu01fm)
% 
% r1828inglu02fm = r(2:4,11);
% trng = dt*(1:N);
% OD1828inglu02fm = shiftdim(OD6(2:4,11,:),2)-0.083;
% OD1828inglu02fmm = mean(OD1828inglu02fm,2);
% figure
% plot(trng,OD1828inglu02fm)
% hold on
% plot(trng,OD1828inglu02fmm,'k:')
% set(gca,'YScale','log')
% xlabel('Time (hours)')
% ylabel('OD')
% title('1828inglu02fm')
% 
% CC_1828inglu02fm = max(OD1828inglu02fm,[],1);
% 
% disp('1828inglu02fm')
% disp(r1828inglu02fm')
% disp(CC_1828inglu02fm)



r1850in001fm = GRf(5:7,2);
trng = dt*(1:N);
OD1850in001fm = shiftdim(OD6(5:7,2,:),2)-0.083;
OD1850in001fmm = mean(OD1850in001fm,2);
figure
plot(trng,OD1850in001fm)
hold on
plot(trng,OD1850in001fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1850in001fm')

CC_1850in001fm = max(OD1850in001fm,[],1);

disp('1850in001fm')
disp(r1850in001fm')
disp(CC_1850in001fm)

r1850in002fm = GRf(5:7,3);
trng = dt*(1:N);
OD1850in002fm = shiftdim(OD6(5:7,3,:),2)-0.083;
OD1850in002fmm = mean(OD1850in002fm,2);
figure
plot(trng,OD1850in002fm)
hold on
plot(trng,OD1850in002fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1850in002fm')

CC_1850in002fm = max(OD1850in002fm,[],1);

disp('1850in002fm')
disp(r1850in002fm')
disp(CC_1850in002fm)

r1850in005fm = GRf(5:7,4);
trng = dt*(1:N);
OD1850in005fm = shiftdim(OD6(5:7,4,:),2)-0.083;
OD1850in005fmm = mean(OD1850in005fm,2);
figure
plot(trng,OD1850in005fm)
hold on
plot(trng,OD1850in005fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1850in005fm')

CC_1850in005fm = max(OD1850in005fm,[],1);

disp('1850in005fm')
disp(r1850in005fm')
disp(CC_1850in005fm)

r1850in01fm = GRf(5:7,5);
trng = dt*(1:N);
OD1850in01fm = shiftdim(OD6(5:7,5,:),2)-0.083;
OD1850in01fmm = mean(OD1850in01fm,2);
figure
plot(trng,OD1850in01fm)
hold on
plot(trng,OD1850in01fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1850in01fm')

CC_1850in01fm = max(OD1850in01fm,[],1);

disp('1850in01fm')
disp(r1850in01fm')
disp(CC_1850in01fm)

r1850in02fm = GRf(5:7,6);
trng = dt*(1:N);
OD1850in02fm = shiftdim(OD6(5:7,6,:),2)-0.083;
OD1850in02fmm = mean(OD1850in02fm,2);
figure
plot(trng,OD1850in02fm)
hold on
plot(trng,OD1850in02fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1850in02fm')

CC_1850in02fm = max(OD1850in02fm,[],1);

disp('1850in02fm')
disp(r1850in02fm')
disp(CC_1850in02fm)

r1850in05fm = GRf(5:7,7);
trng = dt*(1:N);
OD1850in05fm = shiftdim(OD6(5:7,7,:),2)-0.083;
OD1850in05fmm = mean(OD1850in05fm,2);
figure
plot(trng,OD1850in05fm)
hold on
plot(trng,OD1850in05fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1850in05fm')

CC_1850in05fm = max(OD1850in05fm,[],1);

disp('1850in05fm')
disp(r1850in05fm')
disp(CC_1850in05fm)

r1850in1fm = GRf(5:7,8);
trng = dt*(1:N);
OD1850in1fm = shiftdim(OD6(5:7,8,:),2)-0.083;
OD1850in1fmm = mean(OD1850in1fm,2);
figure
plot(trng,OD1850in1fm)
hold on
plot(trng,OD1850in1fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('1850in1fm')

CC_1850in1fm = max(OD1850in1fm,[],1);

disp('1850in1fm')
disp(r1850in1fm')
disp(CC_1850in1fm)

CC_1850infm = [CC_1850in001fm',CC_1850in002fm',CC_1850in005fm', CC_1850in01fm', CC_1850in02fm',CC_1850in05fm', CC_1850in1fm'];
r1850infm = [r1850in001fm,r1850in002fm,r1850in005fm, r1850in01fm, r1850in02fm,r1850in05fm, r1850in1fm];


figure
plot(r1850infm,CC_1850infm,'o')
axis([0, 0.5, 0, 1.3])
xlabel('growth rate')
ylabel('carrying capacity')
legend('0.01x','0.02x','0.05x','0.1x','0.2x','0.5x','1x')


% r1850inglu002fm = r(5:7,9)
% trng = dt*(1:N);
% OD1850inglu002fm = shiftdim(OD6(5:7,9,:),2)-0.083;
% OD1850inglu002fmm = mean(OD1850inglu002fm,2);
% figure
% plot(trng,OD1850inglu002fm)
% hold on
% plot(trng,OD1850inglu002fmm,'k:')
% set(gca,'YScale','log')
% xlabel('Time (hours)')
% ylabel('OD')
% title('1850inglu002fm')
% 
% CC_1850inglu002fm = max(OD1850inglu002fm,[],1);
% 
% disp('1850inglu002fm')
% disp(r1850inglu002fm')
% disp(CC_1850inglu002fm)
% 
% r1850inglu01fm = r(5:7,10);
% trng = dt*(1:N);
% OD1850inglu01fm = shiftdim(OD6(5:7,10,:),2)-0.083;
% OD1850inglu01fmm = mean(OD1850inglu01fm,2);
% figure
% plot(trng,OD1850inglu01fm)
% hold on
% plot(trng,OD1850inglu01fmm,'k:')
% set(gca,'YScale','log')
% xlabel('Time (hours)')
% ylabel('OD')
% title('1850inglu01fm')
% 
% CC_1850inglu01fm = max(OD1850inglu01fm,[],1);
% 
% disp('1850inglu01fm')
% disp(r1850inglu01fm')
% disp(CC_1850inglu01fm)
% 
% r1850inglu02fm = r(5:7,11);
% trng = dt*(1:N);
% OD1850inglu02fm = shiftdim(OD6(5:7,11,:),2)-0.083;
% OD1850inglu02fmm = mean(OD1850inglu02fm,2);
% figure
% plot(trng,OD1850inglu02fm)
% hold on
% plot(trng,OD1850inglu02fmm,'k:')
% set(gca,'YScale','log')
% xlabel('Time (hours)')
% ylabel('OD')
% title('1850inglu02fm')
% 
% CC_1850inglu02fm = max(OD1850inglu02fm,[],1);
% 
% disp('1850inglu02fm')
% disp(r1850inglu02fm')
% disp(CC_1850inglu02fm)
% 
% CC_1850inglufm = [CC_1850inglu002fm', CC_1850inglu01fm', CC_1850inglu02fm'];
% r1850inglufm = [r1850inglu002fm, r1850inglu01fm, r1850inglu02fm];
% 
% figure
% plot(r1850inglufm,CC_1850inglufm,'o')
% axis([0, 0.8, 0, 1])


% save('strainsinreducingglucose')