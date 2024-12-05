function [maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean] = genderIsoCalc(data)
%genderIsoCalc uses the data to find the mean isometric strength values
%across all three days for male and females, individually and as a gender group

%inputs= maledata, femaledata
%
%outputs
    % maleIsoIndMeans; male invididual means isometric strength across 3
    % days
    % femaleIsoIndMeans;female invididual means isometric strength across 3
    % days
    % maleGroupIsoMeans; mean of individual male isometric strength means
    % femaleGroupMean; mean of individual male isometric strength means

%Seperating data based on gender
%strcmp is used to return logical array to determine male or female from
%each row
maleIn=strcmp(data{:,'Gender'},'M');
femaleIn=strcmp(data{:,'Gender'},'F');

%Calculating individual mean across three days for each male subject
maledata=data{maleIn,{'Day1', 'Day2', 'Day3'}};
maleIsoIndMeans=mean(maledata,2);


%Calculating individual mean across three days for each female subject
femaledata=data{femaleIn,{'Day1', 'Day2', 'Day3'}};
femaleIsoIndMeans=mean(femaledata,2);

%calculate the mean of individual means for male group
maleGroupIsoMean=mean(maleIsoIndMeans);

%calculate the mean of individual means for female group
femaleGroupIsoMean=mean(femaleIsoIndMeans);
end