% RM model
% Data from C:\Users\momen\Google Drive\Analysis\RM model\cfsmcombination.xslx

clear
vT = 150; % total volume in each well
vS = [14 25 50 75 100 125 136]; % uL of CSFM in each well
cFM = [1 0.5 0.2]; 

NCS = ones(3,1)*(1/vT*vS); % normalized concentration of supernatant in the wells
NCF = diag(cFM)*(1-NCS); % normalized concentration of fresh medium in the wells




CC1821in1828 = [  0.415	0.36	0.333	0.326	0.345	0.163	0.131
0.32	0.268	0.24	0.235	0.181	0.114	0.09
0.155	0.167	0.168	0.093	0.062	0.018	0.072	];

CC4412in1828 = [0.234	0.218	0.141	0.131	0.136	0.102	0.056
0.188	0.175	0.184	0.108	0.088	0.043	0.025
0.078	0.083	0.062	0.054	0.027	0.011	0.011	];


CC1828in1828 = [0.703	0.656	0.653	0.631	0.585	0.427	0.285
0.436	0.434	0.491	0.528	0.471	0.324	0.202
0.301	0.284	0.245	0.244	0.208	0.122	0.118		];

CC1850in1828 = [0.597	0.593	0.764	0.661	0.614	0.569	0.476
0.382	0.423	0.364	0.422	0.432	0.359	0.304
0.103	0.266	0.345	0.351	0.277	0.218	0.263];

CC1996in1828 = [0.231	0.23	0.188	0.219	0.183	0.139	0.126
0.189	0.141	0.131	0.144	0.095	0.096	0.092
0.107	0.1	0.079	0.097	0.079	0.066	0.056		];

CCdpin1828 = [0.352	0.274	0.267	0.263	0.245	0.2	0.105
0.263	0.267	0.247	0.217	0.157	0.124	0.1
0.094	0.108	0.113	0.127	0.129	0.038	0.054			];


X(:,1) = reshape(NCS,21,1);
X(:,2) = reshape(NCF,21,1);
Y = reshape(CC1821in1828,21,1);
[RM1821,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1821in1850:')
disp(RM1821)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)

Y = reshape(CC4412in1828,21,1);
[RM4412,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 4412in1850:')
disp(RM4412)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)


Y = reshape(CC1828in1828,21,1);
[RM1828,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1828in1850:')
disp(RM1828)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)

Y = reshape(CC1850in1828,21,1);
[RM1850,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1850in1850:')
disp(RM1850)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)

Y = reshape(CC1996in1828,21,1);
[RM1996,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, 1996in1850:')
disp(RM1996)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)


Y = reshape(CCdpin1828,21,1);
[RMdp,DEV,STATS] = glmfit(X,Y,'normal');
disp('Estimated parameters, dpin1850:')
disp(RMdp)
disp('Deviation:')
disp(DEV)
disp('Standard error of estimated parameters:')
disp(STATS.se)







