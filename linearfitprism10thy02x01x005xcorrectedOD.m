% RM model
% Data from C:\Users\momen\Google Drive\Analysis\RM model\cfsmcombination.xslx

clear
vT = 150; % total volume in each well
vS = [14 25 50 75 100 125 136]; % uL of CSFM in each well
cFM = [0.2 0.1 0.05]; 

NCS = ones(3,1)*(1/vT*vS); % normalized concentration of supernatant in the wells
NCF = diag(cFM)*(1-NCS); % normalized concentration of fresh medium in the wells




CC1821in1821 = [  0.237	0.14	0.173	0.159	0.147	0.184	0.245
0.106	0.151	0.149	0.155	0.145	0.153	0.153
0.082	0.138	0.14	0.144	0.141	0.15	0.157		];

CC4412in1821 = [0.162	0.133	0.136	0.144	0.159	0.159	0.159
0.126	0.14	0.129	0.143	0.137	0.147	0.148
0.058	0.086	0.172	0.134	0.132	0.138	0.149		];


CC1828in1821 = [0.392	0.454	0.493	0.492	0.496	0.48	0.473
0.265	0.378	0.448	0.471	0.47	0.493	0.487
0.221	0.289	0.362	0.456	0.487	0.504	0.501				];

CC1850in1821 = [0.368	0.519	0.506	0.454	0.349	0.423	0.386
0.094	0.213	0.367	0.347	0.429	0.461	0.25
0.055	0.118	0.167	0.193	0.243	0.253	0.242		];

CC1996in1821 = [0.167	0.154	0.158	0.166	0.177	0.177	0.173
0.195	0.138	0.149	0.149	0.15	0.157	0.163
0.037	0.123	0.147	0.144	0.16	0.158	0.165			];

CCdpin1821 = [0.195	0.163	0.181	0.151	0.134	0.119	0.116
0.076	0.146	0.128	0.135	0.126	0.146	0.102
0.048	0.067	0.077	0.092	0.102	0.069	0.068		];


X(:,1) = reshape(NCS,21,1);
X(:,2) = reshape(NCF,21,1);
Y = reshape(CC1821in1821,21,1);
[RM1821,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1821in1821:')
disp(RM1821)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)

Y = reshape(CC4412in1821,21,1);
[RM4412,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 4412in1821:')
disp(RM4412)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)


Y = reshape(CC1828in1821,21,1);
[RM1828,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1828in1821:')
disp(RM1828)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)

Y = reshape(CC1850in1821,21,1);
[RM1850,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1850in1821:')
disp(RM1850)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)

Y = reshape(CC1996in1821,21,1);
[RM1996,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1996in1821:')
disp(RM1996)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)


Y = reshape(CCdpin1821,21,1);
[RMdp,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, dpin1821:')
disp(RMdp)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)







