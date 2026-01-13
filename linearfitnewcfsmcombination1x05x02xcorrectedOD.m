% RM model
% Data from C:\Users\momen\Google Drive\Analysis\RM model\cfsmcombination.xslx

clear
vT = 150; % total volume in each well
vS = [14 25 50 75 100 125 136]; % uL of CSFM in each well
cFM = [1 0.5 0.2]; 

NCS = ones(3,1)*(1/vT*vS); % normalized concentration of supernatant in the wells
NCF = diag(cFM)*(1-NCS); % normalized concentration of fresh medium in the wells



CC1828inceftazidime = [0.827	0.767	0.52	0.067	0.045	0.043	0.038
0.563	0.586	0.628	0.288	0.046	0.05	0.063
0.401	0.517	0.59	0.175	0.069	0.062	0.066];

CC1996inceftazidime = [0.294	0.316	0.653	0.564	0.302	0.193	0.179
0.252	0.263	0.611	0.465	0.247	0.187	0.162
0.236	0.247	0.548	0.552	0.282	0.175	0.164 ];


X(:,1) = reshape(NCS,21,1);
X(:,2) = reshape(NCF,21,1);
Y = reshape(CC1828inceftazidime,21,1);
[RM1828,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1828inceftazidime:')
disp(RM1828)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)

Y = reshape(CC1996inceftazidime,21,1);
[RM1996,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1996inceftazidime:')
disp(RM1996)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)


CC1828in4412 = [0.9510    0.9410    0.9670    0.9820    1.0110    1.0250    1.0330   				
0.7450    0.7940    0.8860    0.9500    1.0170    1.0810    1.0990   				
0.3390    0.2690    0.7360    0.9310    1.0230    1.1090    1.1600  				];

CC1850in4412 = [0.2920    1.0570    1.2760    1.2700    1.3310    1.3590    1.3500    				
0.7760    0.8430    1.2680    1.2750    1.2690    1.3300    1.3240   				
0.2990    0.2790    0.6460    1.2600    1.2590    1.3160    1.3560   				];


X(:,1) = reshape(NCS,21,1);
X(:,2) = reshape(NCF,21,1);
Y = reshape(CC1828in4412,21,1);
[RM1828,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1828in4412:')
disp(RM1828)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)

Y = reshape(CC1850in4412,21,1);
[RM1850,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1850in4412:')
disp(RM1850)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)



CC1828in1828 = [0.9920    0.9350    0.8900    0.7940    0.6630    0.4990    0.3210    				
0.7240    0.7190    0.7000    0.6640    0.5400    0.3010    0.1320   				
0.2360    0.3630    0.5070    0.4850    0.3090    0.1160    0.1100   				];

CC1850in1828 = [1.2690    1.2530    1.1910    1.1110    0.9700    0.7150    0.5840    				
0.9650    1.1510    0.9700    0.8690    0.7220    0.5380    0.4870    				
0.5480    0.7200    0.7640    0.6760    0.5220    0.3210    0.2790    				];


X(:,1) = reshape(NCS,21,1);
X(:,2) = reshape(NCF,21,1);
Y = reshape(CC1828in1828,21,1);
[RM1828,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1828in1828:')
disp(RM1828)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)

Y = reshape(CC1850in1828,21,1);
[RM1850,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1850in1828:')
disp(RM1850)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)

CC1828in1850 = [0.9710    0.9380    0.8680    0.8070    0.6810    0.5640    0.3800    				
0.7200    0.7340    0.7100    0.6530    0.5890    0.4740    0.3180    				
0.3500    0.4540    0.5320    0.5220    0.4460    0.2550    0.1880    				];

CC1850in1850 = [1.1690    1.1800    1.1610    1.0140    0.8970    0.6660    0.5190    				
0.9030    0.8640    0.9980    0.7740    0.6290    0.4600    0.3610   				
0.2990    0.5920    0.7730    0.5110    0.4280    0.2780    0.2320    				];

X(:,1) = reshape(NCS,21,1);
X(:,2) = reshape(NCF,21,1);
Y = reshape(CC1828in1850,21,1);
[RM1828,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1828in1850:')
disp(RM1828)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)

Y = reshape(CC1850in1850,21,1);
[RM1850,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1850in1850:')
disp(RM1850)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)


CC1828in1996 = [0.9740    0.9640    0.9310    0.8640    0.7750    0.6500    0.5700   				
0.7850    0.7940    0.7920    0.7430    0.6730    0.6090    0.5580   				
0.3940    0.5760    0.5840    0.5850    0.5850    0.5800    0.5410  				];

CC1850in1996 = [1.1900    1.1460    1.1240    1.0780    0.9860    0.8180    0.7820  				
0.9850    0.9610    0.9250    0.8470    0.7800    0.7970    0.7430   				
0.5700    0.7190    0.6770    0.6270    0.6960    0.6300    0.6540    				];

X(:,1) = reshape(NCS,21,1);
X(:,2) = reshape(NCF,21,1);
Y = reshape(CC1828in1996,21,1);
[RM1828,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1828in1996:')
disp(RM1828)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)

Y = reshape(CC1850in1996,21,1);
[RM1850,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1850in1996:')
disp(RM1850)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)



CC1828indp = [0.9370    0.9310    0.8630    0.7700    0.6280    0.4010    0.2320    				
0.6830    0.6910    0.6690    0.6050    0.4910    0.3190    0.1710    				
0.1450    0.1860    0.2720    0.3060    0.2030    0.1660    0.1480  				];

CC1850indp = [1.2110    1.2510    1.1390    1.0310    0.9290    0.6880    0.5800    				
0.9040    0.8550    0.9120    0.8500    0.6950    0.5190    0.3660   				
0.0950    0.2070    0.4540    0.5420    0.4530    0.2660    0.2240   				];


X(:,1) = reshape(NCS,21,1);
X(:,2) = reshape(NCF,21,1);
Y = reshape(CC1828in1996,21,1);
[RM1828,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1828indp:')
disp(RM1828)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)

Y = reshape(CC1850indp,21,1);
[RM1850,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1850indp:')
disp(RM1850)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)

