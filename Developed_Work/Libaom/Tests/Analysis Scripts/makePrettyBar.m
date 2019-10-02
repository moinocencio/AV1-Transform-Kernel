function bar_g = makePrettyBar(xvals, yvals, leg, xlab, ylab) 
    % makePrettyBar does what it's supposed to do
    %	
    %   xvals       - String Vector of x labels
    %   yvals       - Matrix of values to plot
    %   leg         - String Vector of legend labels
    %   xlab        - X axis label
    %   ylab        - Y axis label
    %
    % Outputs handle to graph

    x = categorical(xvals);
    x = reordercats(x,xvals);

    bar_g = bar(x,yvals,'FaceColor','flat')
    setGraphs();

    xPos = (1:size(yvals,1)) - bar_g(1).BarWidth/size(yvals,2) * linspace(1/bar_g(1).BarWidth, -1/bar_g(1).BarWidth, size(yvals,2))';
    l = cell(1,size(yvals,2));

    for i = 1:size(yvals,2)
        text(   xPos(i,:),yvals(:,i)+0.1, ...
                compose("%.2f %%",yvals(:,i)), ...
                'HorizontalAlignment','center',...
                'VerticalAlignment','middle', ...
                'HorizontalAlignment','left', ...
                'FontSize',16, ...
                'Rotation',90)

        bar_g(i).CData = i;
        l{i} = leg(i);
    end

    legend(bar_g,l);
    xlabel(xlab),ylabel(ylab)
end