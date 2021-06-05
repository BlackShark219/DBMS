CREATE  VIEW Passport_Information ( Full_name,Date_ofbirth,Sex,Registration,Date_of_Issue,Serial_Number,TypeofP,ID_Citizen,ID_Type,State_ID ) 
	 AS  SELECT Citizen.Full_name,Citizen.Date_ofbirth,Citizen.Sex,Citizen.Registration,StateofP.Date_of_Issue,Passport.Serial_Number,Type_of_passport.TypeofP,Citizen.ID_Citizen,Passport.ID_Type,Passport.State_ID
		FROM Citizen,Passport,StateofP,Type_of_passport
		WHERE Citizen.ID_Citizen=Passport.ID_Citizen AND
Type_of_passport.ID_Type=Passport.ID_Type AND
StateofP.State_ID=Passport.State_ID;