clear

% select the data file
inpath = '/Applications/cfsmcombinationassay/cfsmcombination021225in10thy/cfsmcombinatingrowthcheckin10thy/';
infile = '1821ndpinvarying10thyconcentrations.txt'; 
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
r1821in001fm = GRf(2:4,2);
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


r1821in002fm = GRf(2:4,3);
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

r1821in005fm = GRf(2:4,4);
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

r1821in01fm = GRf(2:4,5);
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

r1821in02fm = GRf(2:4,6);
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

r1821in05fm = GRf(2:4,7);
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

r1821in1fm = GRf(2:4,8);
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

CC_1821infm = [CC_1821in001fm',CC_1821in002fm',CC_1821in005fm', CC_1821in01fm', CC_1821in02fm',CC_1821in05fm', CC_1821in1fm'];
r1821infm = [r1821in001fm,r1821in002fm,r1821in005fm, r1821in01fm, r1821in02fm,r1821in05fm, r1821in1fm];


figure
plot(r1821infm,CC_1821infm,'o')
axis([0, 0.4, 0, 0.2])
xlabel('growth rate')
ylabel('carrying capacity')
legend('0.01x','0.02x','0.05x','0.1x','0.2x','0.5x','1x')

% r1821inglu002fm = r(2:4,9);
% trng = dt*(1:N);
% OD1821inglu002fm = shiftdim(OD6(2:4,9,:),2)-0.083;
% OD1821inglu002fmm = mean(OD1821inglu002fm,2);
% figure
% plot(trng,OD1821inglu002fm)
% hold on
% plot(trng,OD1821inglu002fmm,'k:')
% set(gca,'YScale','log')
% xlabel('Time (hours)')
% ylabel('OD')
% title('1821inglu002fm')
% 
% CC_1821inglu002fm = max(OD1821inglu002fm,[],1);
% 
% disp('1821inglu002fm')
% disp(r1821inglu002fm')
% disp(CC_1821inglu002fm)
% 
% r1821inglu01fm = r(2:4,10);
% trng = dt*(1:N);
% OD1821inglu01fm = shiftdim(OD6(2:4,10,:),2)-0.083;
% OD1821inglu01fmm = mean(OD1821inglu01fm,2);
% figure
% plot(trng,OD1821inglu01fm)
% hold on
% plot(trng,OD1821inglu01fmm,'k:')
% set(gca,'YScale','log')
% xlabel('Time (hours)')
% ylabel('OD')
% title('1821inglu01fm')
% 
% CC_1821inglu01fm = max(OD1821inglu01fm,[],1);
% 
% disp('1821inglu01fm')
% disp(r1821inglu01fm')
% disp(CC_1821inglu01fm)
% 
% r1821inglu02fm = r(2:4,11);
% trng = dt*(1:N);
% OD1821inglu02fm = shiftdim(OD6(2:4,11,:),2)-0.083;
% OD1821inglu02fmm = mean(OD1821inglu02fm,2);
% figure
% plot(trng,OD1821inglu02fm)
% hold on
% plot(trng,OD1821inglu02fmm,'k:')
% set(gca,'YScale','log')
% xlabel('Time (hours)')
% ylabel('OD')
% title('1821inglu02fm')
% 
% CC_1821inglu02fm = max(OD1821inglu02fm,[],1);
% 
% disp('1821inglu02fm')
% disp(r1821inglu02fm')
% disp(CC_1821inglu02fm)



rdpin001fm = GRf(5:7,2);
trng = dt*(1:N);
ODdpin001fm = shiftdim(OD6(5:7,2,:),2)-0.083;
ODdpin001fmm = mean(ODdpin001fm,2);
figure
plot(trng,ODdpin001fm)
hold on
plot(trng,ODdpin001fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('dpin001fm')

CC_dpin001fm = max(ODdpin001fm,[],1);

disp('dpin001fm')
disp(rdpin001fm')
disp(CC_dpin001fm)

rdpin002fm = GRf(5:7,3);
trng = dt*(1:N);
ODdpin002fm = shiftdim(OD6(5:7,3,:),2)-0.083;
ODdpin002fmm = mean(ODdpin002fm,2);
figure
plot(trng,ODdpin002fm)
hold on
plot(trng,ODdpin002fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('dpin002fm')

CC_dpin002fm = max(ODdpin002fm,[],1);

disp('dpin002fm')
disp(rdpin002fm')
disp(CC_dpin002fm)

rdpin005fm = GRf(5:7,4);
trng = dt*(1:N);
ODdpin005fm = shiftdim(OD6(5:7,4,:),2)-0.083;
ODdpin005fmm = mean(ODdpin005fm,2);
figure
plot(trng,ODdpin005fm)
hold on
plot(trng,ODdpin005fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('dpin005fm')

CC_dpin005fm = max(ODdpin005fm,[],1);

disp('dpin005fm')
disp(rdpin005fm')
disp(CC_dpin005fm)

rdpin01fm = GRf(5:7,5);
trng = dt*(1:N);
ODdpin01fm = shiftdim(OD6(5:7,5,:),2)-0.083;
ODdpin01fmm = mean(ODdpin01fm,2);
figure
plot(trng,ODdpin01fm)
hold on
plot(trng,ODdpin01fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('dpin01fm')

CC_dpin01fm = max(ODdpin01fm,[],1);

disp('dpin01fm')
disp(rdpin01fm')
disp(CC_dpin01fm)

rdpin02fm = GRf(5:7,6);
trng = dt*(1:N);
ODdpin02fm = shiftdim(OD6(5:7,6,:),2)-0.083;
ODdpin02fmm = mean(ODdpin02fm,2);
figure
plot(trng,ODdpin02fm)
hold on
plot(trng,ODdpin02fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('dpin02fm')

CC_dpin02fm = max(ODdpin02fm,[],1);

disp('dpin02fm')
disp(rdpin02fm')
disp(CC_dpin02fm)

rdpin05fm = GRf(5:7,7);
trng = dt*(1:N);
ODdpin05fm = shiftdim(OD6(5:7,7,:),2)-0.083;
ODdpin05fmm = mean(ODdpin05fm,2);
figure
plot(trng,ODdpin05fm)
hold on
plot(trng,ODdpin05fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('dpin05fm')

CC_dpin05fm = max(ODdpin05fm,[],1);

disp('dpin05fm')
disp(rdpin05fm')
disp(CC_dpin05fm)

rdpin1fm = GRf(5:7,8);
trng = dt*(1:N);
ODdpin1fm = shiftdim(OD6(5:7,8,:),2)-0.083;
ODdpin1fmm = mean(ODdpin1fm,2);
figure
plot(trng,ODdpin1fm)
hold on
plot(trng,ODdpin1fmm,'k:')
set(gca,'YScale','log')
xlabel('Time (hours)')
ylabel('OD')
title('dpin1fm')

CC_dpin1fm = max(ODdpin1fm,[],1);

disp('dpin1fm')
disp(rdpin1fm')
disp(CC_dpin1fm)

CC_dpinfm = [CC_dpin001fm',CC_dpin002fm',CC_dpin005fm', CC_dpin01fm', CC_dpin02fm',CC_dpin05fm', CC_dpin1fm'];
rdpinfm = [rdpin001fm,rdpin002fm,rdpin005fm, rdpin01fm, rdpin02fm,rdpin05fm, rdpin1fm];


figure
plot(rdpinfm,CC_dpinfm,'o')
axis([0, 0.6, 0, 0.16])
xlabel('growth rate')
ylabel('carrying capacity')
legend('0.01x','0.02x','0.05x','0.1x','0.2x','0.5x','1x')


% rdpinglu002fm = r(5:7,9)
% trng = dt*(1:N);
% ODdpinglu002fm = shiftdim(OD6(5:7,9,:),2)-0.083;
% ODdpinglu002fmm = mean(ODdpinglu002fm,2);
% figure
% plot(trng,ODdpinglu002fm)
% hold on
% plot(trng,ODdpinglu002fmm,'k:')
% set(gca,'YScale','log')
% xlabel('Time (hours)')
% ylabel('OD')
% title('dpinglu002fm')
% 
% CC_dpinglu002fm = max(ODdpinglu002fm,[],1);
% 
% disp('dpinglu002fm')
% disp(rdpinglu002fm')
% disp(CC_dpinglu002fm)
% 
% rdpinglu01fm = r(5:7,10);
% trng = dt*(1:N);
% ODdpinglu01fm = shiftdim(OD6(5:7,10,:),2)-0.083;
% ODdpinglu01fmm = mean(ODdpinglu01fm,2);
% figure
% plot(trng,ODdpinglu01fm)
% hold on
% plot(trng,ODdpinglu01fmm,'k:')
% set(gca,'YScale','log')
% xlabel('Time (hours)')
% ylabel('OD')
% title('dpinglu01fm')
% 
% CC_dpinglu01fm = max(ODdpinglu01fm,[],1);
% 
% disp('dpinglu01fm')
% disp(rdpinglu01fm')
% disp(CC_dpinglu01fm)
% 
% rdpinglu02fm = r(5:7,11);
% trng = dt*(1:N);
% ODdpinglu02fm = shiftdim(OD6(5:7,11,:),2)-0.083;
% ODdpinglu02fmm = mean(ODdpinglu02fm,2);
% figure
% plot(trng,ODdpinglu02fm)
% hold on
% plot(trng,ODdpinglu02fmm,'k:')
% set(gca,'YScale','log')
% xlabel('Time (hours)')
% ylabel('OD')
% title('dpinglu02fm')
% 
% CC_dpinglu02fm = max(ODdpinglu02fm,[],1);
% 
% disp('dpinglu02fm')
% disp(rdpinglu02fm')
% disp(CC_dpinglu02fm)
% 
% CC_dpinglufm = [CC_dpinglu002fm', CC_dpinglu01fm', CC_dpinglu02fm'];
% rdpinglufm = [rdpinglu002fm, rdpinglu01fm, rdpinglu02fm];
% 
% figure
% plot(rdpinglufm,CC_dpinglufm,'o')
% axis([0, 0.8, 0, 1])


% save('strainsinreducingglucose')