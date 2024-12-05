function [increasedSubjects] = dayComparer(subjectID,data,day1,day2)
%This function takes the subject IDs and two days as inputs and returns a
%matrix with the subjects ID who increased from day one to day two
%
%inputs= subjectID, data, day1, day2
%output
% increasedSubjects; subject IDs with strength increase between two days

%logical indexing is used to return logical array to identify the subjects
%strength increase between days 1 and 2
increasedIdx=(data(:,day2)>data(:,day1));

%placing the subjects ID with subjects with increased strength
increasedSubjects=subjectID(increasedIdx);
end