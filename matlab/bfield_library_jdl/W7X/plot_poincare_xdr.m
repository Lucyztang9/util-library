clearvars;

colors = ['r','b','k','g','c','m'];
% colors = ['r','r','r','r'];
% colors = ['k','k','k','k'];
colors = [colors,colors,colors];
colors = [colors,colors,colors];
colors = [colors,colors,colors];
colors = [colors,colors,colors];


% load line_data_23.mat;
% load fieldn_altern181x181x96_w7x.0989_1010_1114_1124_+0742_-0239.09.20_000_s.out_poincare.mat;
load("C:\Work\Stellarator\W7X EMC3 modeling\Poincare_data\poincare_xdr_altern_OP2_43kA_90x82x65_100s.mat")


figure; hold on;

for i = 1:3:size(r,1)
    plot(r(i,:),z(i,:),[colors(i),'.'])
end
