function f = find_lcfs(shot,plotit,num_lines,rmax)
if length(shot) == 5
    helicon_current = shot{1};
    current_A = shot{2};
    current_B = shot{3};
    config = shot{4};
    skimmer = shot{5};
    notashot = 1;
else
    notashot = 0;
end
if nargin < 2
    plotit = 0;
end
if nargin < 3
    num_lines = 6;
end
if nargin < 4
    rmax = 0.022;
end
if nargin < 5
    nresolve = 3;
end
    
ZMIN = 1;  % Below this Z lines are not checked for cutoff

if notashot == 0
% check if saved file exists
data_path = 'C:\Work\MPEX\LCFS\';
files = dir(data_path);
icount = 0;
for i = 3:length(files)
    itmp = strfind(files(i).name,num2str(shot));
    if ~isempty(itmp)
        ishot = i;
        icount = icount + 1;
    end
end
if icount > 1
    error(['Found multiple files matching shot: ',num2str(shot)])
end
if icount == 0
    fprintf('Could not find saved LCFS data for shot %d\n',shot)
    fprintf('This may be slow\n')
else
    fname = [data_path,files(ishot).name];
    fprintf('Using LCFS file %s \n',fname)
    load(fname)
    return;
end

[helicon_current,current_A,current_B,config,skimmer] = get_Proto_current(shot);
end
tic;
[coil,current] = build_Proto_coils(helicon_current,current_A,current_B,config);
% [rr_cm_IR,dd_cm_IR,plasma_radius_cm] = plot_IR_data_raw(shot,1,0,-2.5);
geo = get_Proto_geometry(0,0,skimmer);

bfield.coil = coil;
bfield.current = current;
bfield.type = 'just_coils';

% nresolve = 3;
% num_lines = 10;
cf = colorflipper(nresolve+1,'jet');
for iresolve = 1:nresolve
    
    % Forward and reverse lines from target
    if iresolve == 1
        rr = linspace(1e-3,rmax,num_lines);
    else
        rr = linspace(rr(ilcfs-1),rr(ilcfs+1),num_lines*iresolve);
    end
    zz = geo.target.z*ones(size(rr));
    L = geo.target.z - ZMIN;
    dl = -0.01; nsteps = round(abs(L/dl)); dl = sign(dl)*L/nsteps;
    phistart = zeros(size(rr));
    f2a = follow_fieldlines_rzphi_dz(bfield,rr,zz(1),phistart,dl,nsteps);
    f2a = clip_fl_at_vessel(f2a,geo);
    ilcfs = find(~isnan(f2a.z(end,:)),1,'last');
    
    if isempty(ilcfs)
        warning('Could not identify lcfs: all lines passed through')
        plotit = 1;
    end
    
    if plotit
        if iresolve == 1
            figure; hold on; box on;
            plot(f2a.z,f2a.r,'linewidth',2,'color',cf(iresolve,:));
            set(gca,'fontsize',14)
            xlabel('Z [m]','fontsize',14)
            ylabel('R [m]','fontsize',14)
            title(['Shot ',num2str(shot)])
            get_Proto_geometry(1,0,skimmer);
            axis([0.5,3.5,0,0.2])
        else
            plot(f2a.z,f2a.r,'linewidth',2,'color',cf(iresolve,:));
            plot(f2a.z(:,ilcfs),f2a.r(:,ilcfs),'r')            
        end
        
    end
end
f.r = f2a.r(:,ilcfs);
f.z = f2a.z(:,ilcfs);

if notashot ==0
fname = [data_path,'shot_',num2str(shot),'.mat'];
fprintf('saving LCFS data as %s\n',fname)
save(fname,'f')
end
time=toc;

fprintf('Finding LCFS took %f seconds.\n',time)

