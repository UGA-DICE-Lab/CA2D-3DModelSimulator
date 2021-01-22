function label(varargin)
% Give in this order : type,name,namex,namey

%% For all
if(strcmp(varargin{1},'all'))
    name=varargin{2};
    namex=varargin{3};
    namey=varargin{4};
title(name,'FontName','Calibri','FontSize',12,...
    'FontWeight','Bold');
ylabel(namey,'FontName','Calibri','FontSize',12,...
    'FontWeight','Bold');
xlabel(namex,'FontName','Calibri','FontSize',12,...
    'FontWeight','Bold')
set(gca,'FontName','Calibri','FontSize',10,'FontWeight','Bold');
end

%% For xy
if(strcmp('xy',varargin{1}))
    namex=varargin{2};
    namey=varargin{3};
ylabel(namey,'FontName','Calibri','FontSize',12,...
    'FontWeight','Bold');
xlabel(namex,'FontName','Calibri','FontSize',12,...
    'FontWeight','Bold')
set(gca,'FontName','Calibri','FontSize',10,'FontWeight','Bold');
end

%% For x
if(strcmp('x',varargin{1}))
    namex=varargin{2};
xlabel(namex,'FontName','Calibri','FontSize',12,...
    'FontWeight','Bold');
set(gca,'FontName','Calibri','FontSize',10,'FontWeight','Bold');
end

%% For y
if(strcmp('y',varargin{1}))
    namey=varargin{2};
ylabel(namey,'FontName','Calibri','FontSize',12,...
    'FontWeight','Bold');
set(gca,'FontName','Calibri','FontSize',10,'FontWeight','Bold');
end

%% For title
if(strcmp('t',varargin{1}))
    name=varargin{2};
title(name,'FontName','Calibri','FontSize',12,...
    'FontWeight','Bold');
end
set(gca,'FontName','Calibri','FontSize',10,'FontWeight','Bold');
end