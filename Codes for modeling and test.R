ggplot(data=CollegeInfo3,aes(x=CUM_GPA,y=SUP2020))+geom_point(aes(color=College))+geom_smooth(method=lm)
# Generate scatter plot and trendline to show relationship between cumulative GPA and S/U Requests for 2020
#Assign colors to each dot

lm(SUP2020~CUM_GPA,data=CollegeInfo3)
#Linear regression and formula

ggplot(data=Course_Data_2020_Scatter,aes(x=SU,y=Drop))+geom_point(size=2)+geom_smooth(method=lm)
#Generate scatter plot and trendline to show relationship between S/U Requests and Drop Requests for Courses

lm(Drop~SU,data=Course_Data_2020_Scatter)
#Linear regression and formula

ggplot(data=College_Data_2020_Scatter,aes(x=SU,y=Drop))+geom_point(aes(color=College))+geom_smooth(method=lm)
#Generate scatter plot and trendline to show relationship between S/U Requests and Drop Requests for Colleges

lm(Drop~SU,data=College_Data_2020_Scatter)
#Linear regression and formula

ggplot(data=Major_Data_2020_Scatter,aes(x=SU,y=Drop))+geom_point(aes(color=College))+geom_smooth(method=lm)
#Generate scatter plot and trendline to show relationship between S/U Requests and Drop Requests for Majors

lm(Drop~SU,data=Major_Data_2020_Scatter)
#Linear regression and formula

ggplot(data=GradeLevel_Data_2020_Scatter,aes(x=SU,y=Drop))+geom_point(aes(color=College))+geom_smooth(method=lm)
#Generate scatter plot and trendline to show relationship between S/U Requests and Drop Requests for Graduate levels

lm(Drop~SU,data=GradeLevel_Data_2020_Scatter)
#Linear regression and formula

cor(datasetname,use="all.obs",method="pearson")
cor(datasetname$SU,datasetname$Drop)
#To find correlatiom coefficients

wilcox.test(CollegeInfo2$DropP~CollegeInfo2$Year)
#To test if the drop proportion among colleges in 2019/2020 are significant different

wilcox.test(CollegeInfo2$SUP~CollegeInfo2$Year)
#To test if the SU proportion among colleges in 2019/2020 are significant different

boxplot(DropP2020~Year,data=CollegeInfo2)
#To see the difference between two population median
