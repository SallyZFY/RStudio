FacCareer1<-factor(SU_2020$Career) #Creat a factor which contains career variables and values
str(FacCareer1) #See structure of FacCareer1
attr(FacCareer1,"levels") #Using attr()function list each career levels
table(FacCareer1) #Using table() function count numbers of SU requests of each level

FacCareer2<-factor(Drop_2020$Career)
attr(FacCareer2,"levels") #Using attr()function list each career levels
table(FacCareer2) #Using table() function count numbers of drop requests of each level

tapply(FacCareer1,FacCareer2,sum) #Total numbers of each level

FacMajor1<-factor(SU_2020$Major) #Creat a factor which contains Major variables and values
str(FacMajor1)
attr(FacMajor1,"levels") #Using attr()function list each Major levels
table(FacCareer1) #Using table() function count numbers of SU requests of each level

FacMajor2<-factor(Drop_2020$Major)
attr(FacMajor1,"levels") #Using attr()function list each Major levels
table(FacCareer1) #Using table() function count numbers of Drop requests of each level

tapply(FacMajor1,FacMajorr2,sum)

FacCollege1<-factor(SU_2020$College)
str(FacCollege1)
attr(FacCollege1,"levels")
table(FacCollege1)

FacCollege2<-factor(Drop_2020$College)
attr(FacCollege2,"levels")
table(FacCollege2)

tapply(FacCollege1,FacCollege2,sum)

