function plot_gfile(g,psi_min,psi_max,npsi,newfig,con_linesty,quiet,plot_psi)
% plot_gfile(g,psi_min,psi_max,npsi,newfig,con_linesty,quiet,plot_psi)
%
% plot_psi is 'psi' or 'psiN' (default)
%
% g can be g struction from readg_g3d, or gfile_name

nRefine = 1;

%% Handle inputs
if ischar(g)
    g = readg_g3d(g);
end
if nargin < 2
    npsi = 50;
end
if nargin < 3 
    psi_min = [];
end
if nargin < 4
    psi_max = [];
end
if nargin < 5
    newfig = 1;
end
if nargin < 6
    con_linesty = '-';
end
if nargin < 7
    quiet = 1;
end
if nargin < 8
    plot_psi = 'psiN';
end

%% Handle plot_psi switch
switch lower(plot_psi)
    case lower('psiN')
        psiPlot = (g.psirz-g.ssimag)/(g.ssibry-g.ssimag); % Don't need ip_sign here
        sepVal = 1;
        if isempty(psi_min)
            psi_min = 0.6;
        end
        if isempty(psi_max)
            psi_max = 1.1;
        end
        
        cLabel = '\psi_N';
    case lower('psi')
        psiPlot = g.psirz; % Don't need ip_sign here
        sepVal = g.ssibry;
        if isempty(psi_min)
            psi_min = 0.6*(g.ssibry-g.ssimag) + g.ssimag;
        end
        if isempty(psi_max)
            psi_max = 1.1*(g.ssibry-g.ssimag) + g.ssimag;        
        end
        cLabel = '\psi';
    otherwise
        error('Bad value for plot_psi')
end

%% Refine for better contours
rPlot = g.r; zPlot = g.z;
[rPlot,zPlot,psiPlot] = refine_psi(rPlot,zPlot,2^nRefine,g,plot_psi);

%%
if newfig == 1
    figure; hold on; box on;
end
set(gcf,'color','w');
if isfield(g,'lim')
    if ~isempty(g.lim)
        plot(g.lim(1,g.lim(1,:)>0),g.lim(2,g.lim(1,:)>0),con_linesty,'linewidth',2)
    end
end
contour(rPlot,zPlot,psiPlot.',linspace(psi_min,psi_max,npsi),'-','linewidth',1);
contour(rPlot,zPlot,psiPlot.',sepVal*[1,1],'k-','linewidth',2);
hc = colorbar; set(hc,'fontsize',14); colormap(turbo); hc.Label.String = cLabel;
xlabel('R (m)','fontsize',14); ylabel('Z (m)','fontsize',14)
axis equal; axis tight;
ax = axis;
if isfield(g,'gfilename')
    h=text(ax(1)+(ax(2)-ax(1))*0.48,ax(3)+(ax(4)-ax(3))*0.97,g.gfilename,'fontsize',8);
    set(h,'interpreter','none');
end

plot(g.rmaxis,g.zmaxis,'bo')
% Find the xpt(s)
if isfield(g,'bdry')
    xpt_info = find_xpt_jl(g,1,1,1e-8,1);
    xr1 = xpt_info.rx;
    xz1 = xpt_info.zx;
    xr2 = xpt_info.rx2;
    xz2 = xpt_info.zx2;
    switch plot_psi
        case lower('psiN')
            contour(rPlot,zPlot,psiPlot.',[1,1]*calc_psiN(g,xr2,xz2),'k-','linewidth',2)
        case lower('psi')
            contour(rPlot,zPlot,psiPlot.',[1,1]*calc_psi(g,xr2,xz2),'k-','linewidth',2)
    end
    plot(xr1,xz1,'bx'); text(xr1+0.01,xz1,'x1','fontsize',8)
    plot(xr2,xz2,'b*'); text(xr2+0.02,xz2,'x2','fontsize',8)
end


end

%%
function [r2,z2,p2] = refine_psi(r,z,fac,g,plot_psi)
r2 = linspace(r(2),r(end-1),length(r)*fac);
z2 = linspace(z(2),z(end-1),length(z)*fac);
for i = 1:length(z2)
    switch lower(plot_psi)
        case lower('psiN')
            p2(:,i) = calc_psiN(g,r2,z2(i)*ones(size(r2)));
        case lower('psi')
            p2(:,i) = calc_psi(g,r2,z2(i)*ones(size(r2)));
        otherwise
            error('Bad value for plot_psi')
    end
end
end

