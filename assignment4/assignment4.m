%Load data from csv file
data=readtable('isok_data_6803.csv');

%call genderIsoCalc to calculate means of isometric strength for males and
%females individually and a group mean of the individual group
[maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean]=genderIsoCalc(data);

%Display the results for the function genderIsoCalc using fprintf function
fprintf('Male Individual Mean: /n')
disp(maleIsoIndMeans);%male invididual means isometric strength across 3
    % days
fprintf('Female Individual Mean: /n')
disp(femaleIsoIndMeans); %female invididual means isometric strength across 3
    % days
fprintf('Male group Mean: %.2f/n', maleGroupIsoMean) % mean of individual male isometric strength means
fprintf('Male group Mean: %.2f/n', femaleGroupIsoMean)% mean of individual male isometric strength means

%Defining subject ID and strength across three days for each subject
subjectID=data.SubjectID; %defining the subject
strengthData= data{:,{'Day1', 'Day2', 'Day3'}}; %strength across days for each subject

%Run dayComparer function to check for strength increase from day1 and
%day2
day1toDay2=dayComparer(subjectID, strengthData, 1, 2);

%Run dayComparer function to check for strength increase from day2 and
%day3
day2toDay3=dayComparer(subjectID, strengthData, 2, 3);

%defining the weight and isokinetic data for each day
weights=data.Weight;
day1s=data.Day1;
day2s=data.Day2;
day3s=data.Day3;

%Normalizing weight isokinetic data
normDay1=day1s ./ weights; %normalizing weight for day 1
normDay2=day2s ./ weights;%normalizing weight for day 2
normDay3=day3s ./ weights;%normalizing weight for day 3

%calculate the group means for each day and store values
normDay1mean=mean(normDay1, 'omitnan'); % normalized mean value for day 1 and omit any NaN if found
normDay2mean=mean(normDay2, 'omitnan'); % normalized mean value for day 1 and omit any NaN if found
normDay3mean=mean(normDay3, 'omitnan'); % normalized mean value for day 1 and omit any NaN if found

%display the results of subjects with increased isometric strength from
%days 1 and 2, (daycomparer)
fprintf('Subjects increased from day 1 to day 2: /n')
disp(day1toDay2)%display subjects who increades weight from day 1 to day 2
fprintf('Subjects increased from day 2 to day 3: /n')
disp(day2toDay3)%display subjects who increades weight from day 2 to day 3

%export results to a csv file using function
csvwrite('iso_results.csv',data)
