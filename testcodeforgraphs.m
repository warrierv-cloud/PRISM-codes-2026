% Sample names
samples = {'C. tuberculostearicum (KPL1821)', 'C. accolens (KPL1996)', 'D. pigrum (KPL2500)', 'S. aureus (KPL1828)', 'S. epidermidis (KPL1850)'};

% Data values
corrected_slope_supernatant = [-0.0645696, 0.057915, 0.037236, 0.1363743, 0.668472];
corrected_slope_fresh_media = [0.7766696, 1.131985, 0.418964, 1.0813257, 1.776028];

% Combine all into a matrix (rows = categories, columns = samples)
data = [
    corrected_slope_supernatant;
    corrected_slope_fresh_media
];

% Std deviation values (same shape as 'data')
std_devs = [
    0.0464	0.0337	0.0214	0.0862	0.1348;   % supernatant
    0.2728	0.1978	0.1258	0.1	 0.1564    % fresh media
];


% Labels for each metric
metrics = {
    'Mediator dependency (b_M)', 
    'Resource dependency (b_R)'
};

% Create grouped bar chart
figure('Position', [100, 100, 1000, 800]);
bar(data', 'grouped');hold on;

% Number of groups and bars per group
[num_groups, num_bars] = size(data');

% Calculate the x coordinates for each bar
group_width = min(0.8, num_bars/(num_bars + 1.5));
for i = 1:num_bars
    % X locations for bars of this group
    x = (1:num_groups) - group_width/2 + (2*i-1) * group_width / (2*num_bars);
    % Plot error bars
    errorbar(x, data(i, :), std_devs(i, :), 'k', 'linestyle', 'none', 'linewidth', 1);
end

% Customize chart
set(gca, 'XTickLabel', samples);
set(gca,'fontsize', 24);
% xlabel('Sample ID');
ylabel('Resource/Mediator Dependency');
title('Effect of C. tuberculostearicum supernatant versus resource competition BAAD');
legend(metrics, 'Location', 'northwest');
grid on;

% Sample names
samples = {'C. tuberculostearicum (KPL1821)', 'C. accolens (KPL1996)', 'D. pigrum (KPL2500)', 'S. aureus (KPL1828)', 'S. epidermidis (KPL1850)'};

% Data values
corrected_slope_supernatant = [0.3968576 0.1397979 	0.205552 0.8597013	1.2291384];
corrected_slope_fresh_media = [1.2760424	0.7668021	0.939548 0.6754987	0.5457616];

% Combine all into a matrix (rows = categories, columns = samples)
data = [
    corrected_slope_supernatant;
    corrected_slope_fresh_media
];

% Labels for each metric
metrics = {
    'Mediator dependency (b_M)', 
    'Resource dependency (b_R)'
};

% Create grouped bar chart
figure('Position', [100, 100, 1000, 800]);
bar(data', 'grouped');hold on;

% Customize chart
set(gca, 'XTickLabel', samples);
% xlabel('Sample ID');
ylabel('Resource/Mediator Dependency');
title('Effect of C. pseudodiptheriticum supernatant versus resource competition ');
legend(metrics, 'Location', 'northwest');
grid on;

% Sample names
samples = {'C. tuberculostearicum (KPL1821)', 'C. accolens (KPL1996)', 'D. pigrum (KPL2500)', 'S. aureus (KPL1828)', 'S. epidermidis (KPL1850)'};

% Data values
corrected_slope_supernatant = [-0.0909072	-0.0903474	-0.051968	-0.0485077	-0.128478];
corrected_slope_fresh_media = [0.3730072 0.2649474	0.429368	0.9027077	0.937778];

% Combine all into a matrix (rows = categories, columns = samples)
data = [
    corrected_slope_supernatant;
    corrected_slope_fresh_media
];

% Std deviation values (same shape as 'data')
std_devs = [
    0.0346	0.0587	0.0979	0.1206	0.1228;   % supernatant
    0.2032	0.0430	0.0717	0.1399	0.1425    % fresh media
];


% Labels for each metric
metrics = {
    'Mediator dependency (b_M)', 
    'Resource dependency (b_R)'
};

% Create grouped bar chart
figure('Position', [100, 100, 1000, 800]);
bar(data', 'grouped');hold on;

% Number of groups and bars per group
[num_groups, num_bars] = size(data');

% Calculate the x coordinates for each bar
group_width = min(0.8, num_bars/(num_bars + 1.5));
for i = 1:num_bars
    % X locations for bars of this group
    x = (1:num_groups) - group_width/2 + (2*i-1) * group_width / (2*num_bars);
    % Plot error bars
    errorbar(x, data(i, :), std_devs(i, :), 'k', 'linestyle', 'none', 'linewidth', 1);
end

% Customize chart
set(gca, 'XTickLabel', samples);
set(gca,'fontsize', 24);
% xlabel('Sample ID');
ylabel('Resource/Mediator Dependency');
title('Effect of S. aureus supernatant versus resource competition BAAD');
legend(metrics, 'Location', 'northwest');
grid on;

% Sample names
samples = {'C. tuberculostearicum (KPL1821)', 'C. accolens (KPL1996)', 'D. pigrum (KPL2500)', 'S. aureus (KPL1828)', 'S. epidermidis (KPL1850)'};

% Data values
corrected_slope_supernatant = [-0.0993088	0.0290466	 -0.019198	-0.0143903	-0.0026082];
corrected_slope_fresh_media = [0.7821088	1.1197534	0.995098	0.7585903	1.0446082];

% Combine all into a matrix (rows = categories, columns = samples)
data = [
    corrected_slope_supernatant;
    corrected_slope_fresh_media
];

% Labels for each metric
metrics = {
    'Mediator dependency (b_M)', 
    'Resource dependency (b_R)'
};

% Create grouped bar chart
figure('Position', [100, 100, 1000, 800]);
bar(data', 'grouped');hold on;

% Customize chart
set(gca, 'XTickLabel', samples);
% xlabel('Sample ID');
ylabel('Resource/Mediator Dependency');
title('Effect of S. epidermidis supernatant versus resource competition ');
legend(metrics, 'Location', 'northwest');
grid on;

% Sample names
samples = {'C. tuberculostearicum (KPL1821)', 'C. accolens (KPL1996)', 'D. pigrum (KPL2500)', 'S. aureus (KPL1828)', 'S. epidermidis (KPL1850)'};

% Data values
corrected_slope_supernatant = [-0.0900576	-0.0274428	-0.070528	0.1445701	0.1959048];
corrected_slope_fresh_media = [0.7713576	0.3215428	 0.244928	0.6687299	0.8169952];

% Combine all into a matrix (rows = categories, columns = samples)
data = [
    corrected_slope_supernatant;
    corrected_slope_fresh_media
];

% Labels for each metric
metrics = {
    'Mediator dependency (b_M)', 
    'Resource dependency (b_R)'
};

% Std deviation values (same shape as 'data')
std_devs = [
    0.0521	0.06	0.0549	0.0588	0.061;   % supernatant
    0.3063	0.3526	0.3225	0.0683	0.0707    % fresh media
];


% Labels for each metric
metrics = {
    'Mediator dependency (b_M)', 
    'Resource dependency (b_R)'
};

% Create grouped bar chart
figure('Position', [100, 100, 1000, 800]);
bar(data', 'grouped');hold on;

% Number of groups and bars per group
[num_groups, num_bars] = size(data');

% Calculate the x coordinates for each bar
group_width = min(0.8, num_bars/(num_bars + 1.5));
for i = 1:num_bars
    % X locations for bars of this group
    x = (1:num_groups) - group_width/2 + (2*i-1) * group_width / (2*num_bars);
    % Plot error bars
    errorbar(x, data(i, :), std_devs(i, :), 'k', 'linestyle', 'none', 'linewidth', 1);
end

% Customize chart
set(gca, 'XTickLabel', samples);
set(gca,'fontsize', 24);
% xlabel('Sample ID');
ylabel('Resource/Mediator Dependency');
title('Effect of C. accolens supernatant versus resource competition BAAD');
legend(metrics, 'Location', 'northwest');
grid on;


% Sample names
samples = {'C. tuberculostearicum (KPL1821)', 'C. accolens (KPL1996)', 'D. pigrum (KPL2500)', 'S. aureus (KPL1828)', 'S. epidermidis (KPL1850)'};

% Data values
corrected_slope_supernatant = [-0.030208 0.0494505	 0.020474	0.1445701	0.3778026];
corrected_slope_fresh_media = [0.297008	0.7047495	0.316826	0.6687299	1.4518974];

% Combine all into a matrix (rows = categories, columns = samples)
data = [
    corrected_slope_supernatant;
    corrected_slope_fresh_media
];

% Labels for each metric
metrics = {
    'Mediator dependency (b_M)', 
    'Resource dependency (b_R)'
};

% Create grouped bar chart
figure('Position', [100, 100, 1000, 800]);
bar(data', 'grouped');hold on;

% Customize chart
set(gca, 'XTickLabel', samples);
set(gca,'fontsize', 24);
% xlabel('Sample ID');
ylabel('Resource/Mediator Dependency');
title('Effect of D. pigrum supernatant versus resource competition ');
legend(metrics, 'Location', 'northwest');
grid on;



% Sample names
samples = {'C. tuberculostearicum (KPL1821)', 'C. accolens (KPL1996)', 'D. pigrum (KPL2500)', 'S. aureus (KPL1828)', 'S. epidermidis (KPL1850)'};

% Data values
corrected_slope_supernatant = [-0.0186151	0.02751	  0.0110957 	 0.0937174  0.3269105];
corrected_slope_fresh_media = [0.3830151	0.21629	 0.3072043  0.6985826	 0.7420895];

% Combine all into a matrix (rows = categories, columns = samples)
data = [
    corrected_slope_supernatant;
    corrected_slope_fresh_media
];

% Labels for each metric
metrics = {
    'Mediator dependency (b_M)', 
    'Resource dependency (b_R)'
};

% Create grouped bar chart
figure('Position', [100, 100, 1000, 800]);
bar(data', 'grouped');hold on;

% Customize chart
set(gca, 'XTickLabel', samples);
set(gca,'fontsize', 24);
% xlabel('Sample ID');
ylabel('Resource/Mediator Dependency');
title('Effect of S.aureus supernatant versus resource competition in 10%THY ');
legend(metrics, 'Location', 'northwest');
grid on;


% Sample names
samples = {'C. tuberculostearicum (KPL1821)', 'C. accolens (KPL1996)', 'D. pigrum (KPL2500)', 'S. aureus (KPL1828)', 'S. epidermidis (KPL1850)'};

% Data values
corrected_slope_supernatant = [-0.0186151 0.02751 0.0110957 0.0937174 0.3269105];
corrected_slope_fresh_media = [0.3830151 0.21629 0.3072043 0.6985826 0.7420895];

% Combine all into a matrix (rows = categories, columns = samples)
data = [
    corrected_slope_supernatant;
    corrected_slope_fresh_media
];

% Std deviation values (same shape as 'data')
std_devs = [
    0.0466	0.0217	0.0415	0.0884	0.089;   % supernatant
    0.0541	0.0252  0.0482  0.1026	0.1032				   % fresh media
];

% Labels for each metric
metrics = {
    'Mediator dependency (b_M)', 
    'Resource dependency (b_R)'
};

% Create grouped bar chart
figure('Position', [100, 100, 1000, 800]);
bar(data', 'grouped');hold on;

% Number of groups and bars per group
[num_groups, num_bars] = size(data');

% Calculate the x coordinates for each bar
group_width = min(0.8, num_bars/(num_bars + 1.5));
for i = 1:num_bars
    % X locations for bars of this group
    x = (1:num_groups) - group_width/2 + (2*i-1) * group_width / (2*num_bars);
    % Plot error bars
    errorbar(x, data(i, :), std_devs(i, :), 'k', 'linestyle', 'none', 'linewidth', 1);
end

% Customize chart
set(gca, 'XTickLabel', samples);
set(gca,'fontsize', 24);
ylabel('Resource/Mediator Dependency');
title('Effect of S.aureus supernatant versus resource competition in 10%THY');
legend(metrics, 'Location', 'northwest');
grid on;
hold off;

% Sample names
samples = {'C. tuberculostearicum (KPL1821)', 'C. accolens (KPL1996)', 'D. pigrum (KPL2500)', 'S. aureus (KPL1828)', 'S. epidermidis (KPL1850)'};

% Data values
corrected_slope_supernatant = [-0.0645696, 0.057915, 0.037236, 0.1363743, 0.668472];
corrected_slope_fresh_media = [0.7766696, 1.131985, 0.418964, 1.0813257, 1.776028];

% Combine all into a matrix (rows = categories, columns = samples)
data = [
    corrected_slope_supernatant;
    corrected_slope_fresh_media
];

% Std deviation values (same shape as 'data')
std_devs = [
    0.0464	0.0337	0.0214	0.0862	0.1348;   % supernatant
    0.2728	0.1978	0.1258	0.1	 0.1564    % fresh media
];


% Labels for each metric
metrics = {
    'Mediator dependency (b_M)', 
    'Resource dependency (b_R)'
};

% Create grouped bar chart
figure('Position', [100, 100, 1000, 800]);
bar(data', 'grouped');hold on;

% Number of groups and bars per group
[num_groups, num_bars] = size(data');

% Calculate the x coordinates for each bar
group_width = min(0.8, num_bars/(num_bars + 1.5));
for i = 1:num_bars
    % X locations for bars of this group
    x = (1:num_groups) - group_width/2 + (2*i-1) * group_width / (2*num_bars);
    % Plot error bars
    errorbar(x, data(i, :), std_devs(i, :), 'k', 'linestyle', 'none', 'linewidth', 1);
end

% Customize chart
set(gca, 'XTickLabel', samples);
set(gca,'fontsize', 24);
% xlabel('Sample ID');
ylabel('Resource/Mediator Dependency');
title('Effect of C. tuberculostearicum supernatant versus resource competition BAAD');
legend(metrics, 'Location', 'northwest');
grid on;

% Sample names
samples = {'C. tuberculostearicum (KPL1821)', 'C. accolens (KPL1996)', 'D. pigrum (KPL2500)', 'S. aureus (KPL1828)', 'S. epidermidis (KPL1850)'};

% Data values
corrected_slope_supernatant = [0.3968576 0.1397979 	0.205552 0.8597013	1.2291384];
corrected_slope_fresh_media = [1.2760424	0.7668021	0.939548 0.6754987	0.5457616];

% Combine all into a matrix (rows = categories, columns = samples)
data = [
    corrected_slope_supernatant;
    corrected_slope_fresh_media
];

% Labels for each metric
metrics = {
    'Mediator dependency (b_M)', 
    'Resource dependency (b_R)'
};

% Create grouped bar chart
figure('Position', [100, 100, 1000, 800]);
bar(data', 'grouped');hold on;

% Customize chart
set(gca, 'XTickLabel', samples);
set(gca,'fontsize', 24);
% xlabel('Sample ID');
ylabel('Resource/Mediator Dependency');
title('Effect of C. pseudodiptheriticum supernatant versus resource competition ');
legend(metrics, 'Location', 'northwest');
grid on;

% Sample names
samples = {'C. tuberculostearicum (KPL1821)','C. pseudodiptheriticum (KPL4412)', 'S. aureus (KPL1828)','S. epidermidis (KPL1850)', 'C. accolens (KPL1996)', 'D. pigrum (KPL2500)'};

% Data values
corrected_slope_supernatant = [0.692	1.2724	-0.133	-0.0027	0.2028	0.3911];
corrected_slope_fresh_media = [1.7525	0.5025	0.9423	1.0447	0.8101	1.4386];

% Combine all into a matrix (rows = categories, columns = samples)
data = [
    corrected_slope_supernatant;
    corrected_slope_fresh_media
];

% Std deviation values (same shape as 'data')
std_devs = [
    0.1348	0.2253	0.1228	0.1412	0.061	0.1546;   % supernatant
    0.1564	0.2614	0.1425	0.1638	0.0707	0.1793    % fresh media
];


% Labels for each metric
metrics = {
    'Mediator dependency (b_M)', 
    'Resource dependency (b_R)'
};

% Create grouped bar chart
figure('Position', [100, 100, 1000, 800]);
bar(data', 'grouped');hold on;


% Number of groups and bars per group
[num_groups, num_bars] = size(data');

% Calculate the x coordinates for each bar
group_width = min(0.8, num_bars/(num_bars + 1.5));
for i = 1:num_bars
    % X locations for bars of this group
    x = (1:num_groups) - group_width/2 + (2*i-1) * group_width / (2*num_bars);
    % Plot error bars
    errorbar(x, data(i, :), std_devs(i, :), 'k', 'linestyle', 'none', 'linewidth', 1);
end

% Customize chart
set(gca, 'XTickLabel', samples);
set(gca,'fontsize', 24);
% xlabel('Sample ID');
ylabel('Mediator Dependency');
title('Effect of different supernatants on S. epidermidis');
legend(metrics, 'Location', 'northwest');
grid on;


% Sample names
samples = {'S. aureus (KPL1828)', 'C. accolens (KPL1996)'};

% Data values
corrected_slope_supernatant = [-0.6795	-0.0754	];
corrected_slope_fresh_media = [0.2461	0.16718	];

% Combine all into a matrix (rows = categories, columns = samples)
data = [
    corrected_slope_supernatant;
    corrected_slope_fresh_media
];

% Std deviation values (same shape as 'data')
std_devs = [
    0.1247	0.248	;   % supernatant
    0.1447	0.2573    % fresh media
];


% Labels for each metric
metrics = {
    'Mediator dependency (b_M)', 
    'Resource dependency (b_R)'
};

% Create grouped bar chart
figure('Position', [100, 100, 1000, 800]);
bar(data', 'grouped');hold on;


% Number of groups and bars per group
[num_groups, num_bars] = size(data');

% Calculate the x coordinates for each bar
group_width = min(0.8, num_bars/(num_bars + 1.5));
for i = 1:num_bars
    % X locations for bars of this group
    x = (1:num_groups) - group_width/2 + (2*i-1) * group_width / (2*num_bars);
    % Plot error bars
    errorbar(x, data(i, :), std_devs(i, :), 'k', 'linestyle', 'none', 'linewidth', 1);
end

% Customize chart
set(gca, 'XTickLabel', samples);
set(gca,'fontsize', 24);
% xlabel('Sample ID');
ylabel('Effect of ');
title('Effect of 20 µg/mL Ceftazidime');
legend(metrics, 'Location', 'northwest');
grid on;
