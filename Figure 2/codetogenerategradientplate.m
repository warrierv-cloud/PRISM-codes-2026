% Define plate dimensions
rows = 8;
cols = 12;

% Set up figure
figure;
axis equal;
axis off;
hold on;

% Define color gradient (green to blue)
for row = 1:rows
    colors(row,:,1) = (12+row)/24*linspace(0,0,cols);
    colors(row,:,2) = (12+row)/24*linspace(1,0.5,cols);
    colors(row,:,3) = (12+row)/24*linspace(0,1,cols);
end

% Define labels
rowLabels = 'A':'H';
colLabels = 1:12;

% Circle parameters
radius = 0.4;
xSpacing = 1;
ySpacing = 1;

% Plot wells
for row = 1:rows
    for col = 1:cols
        % Position
        x = col * xSpacing;
        y = (rows - row + 1) * ySpacing;

        % Draw circle
        rectangle('Position',[x-radius, y-radius, 2*radius, 2*radius], ...
                  'Curvature',[1,1], ...
                  'FaceColor', [colors(row,col,1); colors(row,col,2); colors(row,col,3)], ...
                  'EdgeColor', 'k');
    end
end

% Add labels
for row = 1:rows
    text(0.5, (rows - row + 1) * ySpacing, rowLabels(row), ...
         'HorizontalAlignment','center','FontSize',10,'FontWeight','bold');
end
for col = 1:cols
    text(col * xSpacing, (rows + 1) * ySpacing, num2str(col), ...
         'HorizontalAlignment','center','FontSize',10,'FontWeight','bold');
end

title('PRISM ASSAY 96-Well Plate layout ', 'FontSize', 14);
