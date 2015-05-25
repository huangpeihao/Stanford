filename='C:\Users\Eric\Dropbox\Perovskites\Absorption\CH3NH3PbI3_forEQE.txt';
data= dlmread(filename, '\t', 1, 0);
wavelength=data(:,1);
R=data(:,2);
alpha=data(:,3);
thickness=[100 200 300 500 1000]; %in nm
location=[[655 .15]; [655 .35]; [655 .50]; [655 .67]; [655 .8]];
area(wavelength,0*wavelength+1,'FaceColor',[0,0,0])
hold on
area(wavelength,1-R,'FaceColor',[1,1,1])
text(550,.9,'Reflectance','FontSize', 12,'FontWeight','bold','Color',[1 1 1])
for i=length(thickness):-1:1
    area(wavelength,(1-R).*(1-exp(-alpha*thickness(i)*1e-7)),'FaceColor',1-i/length(thickness)*[1,0.75,0.75])
    text(location(i,1),location(i,2),strcat(num2str(thickness(i)),'nm'),'FontSize', 12,'FontWeight','bold')
end
%title('Fraction of Light absorbed by Perovskite');
xlabel('Wavelength (nm)','FontSize', 12,'FontWeight','bold');
ylabel('Fraction absorbed or reflected by perovskite','FontSize', 12,'FontWeight','bold');
xlim([min(wavelength) max(wavelength)])
ylim([0 1])