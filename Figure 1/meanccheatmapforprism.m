clear
% select the data file
% inpath = '/Applications/interaction assays/';
% infile = 'meancc.xlsx'; 
% filename = 'meancc.xlsx';
% A = xlsread(filename)
% [num,txt,raw] = xlsread('meancc.xlsx')
% imagesc(infile)
% colorbar
%strains order = 1828	1850	1821	4412	1996	


%heatmapforprismin10%thy
matrixmeancc2baad = [-1.0	-0.5	-1.5	-1.3	0.1	
0.1	-1.0	-0.8	-0.1	-0.6	
-0.6	-1.0	-1.0	-0.3	-0.2	
-1.2	-1.2	-1.1	-1.0	-0.5	
-0.1	-1.0	-0.3	-1.1	-1.0];



figure
imagesc (matrixmeancc2baad);
axis ij
colormap pink
set(gca,'XTick',1:5,'YTick',1:5)
xticklabels({'S. aureus 1828','S. epidermidis 1850','C. tuberculostearicum 1821','C. pseudodiptheriticum 4412','C. accolens 1996'})
yticklabels({'S. aureus 1828','S. epidermidis 1850','C. tuberculostearicum 1821','C. pseudodiptheriticum 4412','C. accolens 1996'})
set(gca,'fontsize', 24);

% set(gca,'fontweight', 'bold');
% set(gcf,'XAxisLocation','top')
set(gca,'XAxisLocation','top','YAxisLocation','left','ydir','reverse');
colorbar
for ii = 1:5
    for jj = 1:5
        text(ii-0.2,jj,num2str(matrixmeancc2baad(jj,ii)))
    end
end


%heatmapforprisminbaad
%strains order = 1828	1850	1821	4412	1996	2500
matrixmeancc2baad = [
-1.0	-1.0	-1.1	0.6	 -2.4
-0.9	-1.0	-1.0	0.7	 -1.138
-0.7	-0.5	-1.0	-0.8	-2.1
-0.6	-0.7	-0.8	-1.0	-1.8
-0.3	-0.3	-0.3	-0.1	-1.0];



figure
imagesc (matrixmeancc2baad);
axis ij
colormap pink
set(gca,'XTick',1:5,'YTick',1:5)
xticklabels({'S. aureus 1828','S. epidermidis 1850','C. tuberculostearicum 1821','C. pseudodiptheriticum 4412','C. accolens 1996'})
yticklabels({'S. aureus 1828','S. epidermidis 1850','C. tuberculostearicum 1821','C. pseudodiptheriticum 4412','C. accolens 1996'})
set(gca,'fontsize', 24);

% set(gca,'fontweight', 'bold');
% set(gcf,'XAxisLocation','top')
set(gca,'XAxisLocation','top','YAxisLocation','left','ydir','reverse');
colorbar
for ii = 1:5
    for jj = 1:5
        text(ii-0.2,jj,num2str(matrixmeancc2baad(jj,ii)))
    end
end


