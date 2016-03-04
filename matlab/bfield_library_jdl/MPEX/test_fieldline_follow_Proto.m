% function test_fieldline_follow_Proto
clearvars;
tic;
% helicon_current = -70;
% current_A = 3300;
% current_B = 0;
% config = 'flat';

shot = 7503;

[helicon_current,current_A,current_B,config,skimmer] = get_Proto_current(shot);

if 1
    [coil,current] = build_Proto_coils(helicon_current,current_A,current_B,'flat');
    bfield.coil = coil;
    bfield.current = current;
    bfield.type = 'just_coils';
else
    [coil,current] = build_Proto_coils_jackson(helicon_current,current_A,current_B,'flat');
    bfield.coil = coil;
    bfield.current = current;
    bfield.type = 'MPEX';    
end

% FOLLOW A SINGLE FIELD LINE

if 0
    % Rstart = 0.241089;
    
    % Helicon center
    Rstart = 0.06477;
    Zstart = 1.74;
    
%     %Skimmer
%     Rstart = 0.058/2;
%     Zstart = 2.2603;
    phistart = 0;
    
    dz = 0.01;
    L = 2.5;
    nsteps = abs(L/dz);
    
%     f = follow_fieldlines_rzphi_dl(bfield,Rstart,Zstart,phistart,dl,nsteps);
    f = follow_fieldlines_rzphi_dz(bfield,Rstart,Zstart,phistart,dz,nsteps);
    
    figure; hold on; box on;
    plot(f.z,f.r,'b','linewidth',2)
    xlabel('Z [m]','fontsize',14)
    ylabel('R [m]','fontsize',14)
    set(gca,'fontsize',14)
    [rcoil,zcoil] = get_coil_cross_sections;
    for i = 1:size(rcoil,1)
        plot(zcoil(i,:),rcoil(i,:),'r')
    end
    geo = get_Proto_geometry(1,0,skimmer);
end
toc


% FOLLOW FROM HELICON WINDOW
tic;
if 1
    geo = get_Proto_geometry(1,1,skimmer);
    plot(geo.target.z*[1,1],geo.target.r*[0,1],'k','linewidth',3)
    plot([geo.helicon.z1,geo.helicon.z2],geo.helicon.r*[1,1],'k','linewidth',3)
    
    phistart = 0;
    zz = linspace(geo.helicon.z1,geo.helicon.z2,3);
    rr = geo.helicon.r*ones(size(zz));
    L = 2;
    dz = 0.01;
    nsteps = abs(L/dz);
    for i = 1:length(zz)
%         f = follow_fieldlines_rzphi_dl(bfield,rr(i),zz(i),phistart,dl,nsteps);
        f = follow_fieldlines_rzphi_dz(bfield,rr(i),zz(i),phistart,dz,nsteps);
        plot(f.z,f.r,'b','linewidth',2)
    end
    axis([0,5,0,0.2])
end
toc