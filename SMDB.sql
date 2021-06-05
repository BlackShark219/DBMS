CREATE  VIEW Passport_Information ( Full_name,Date_ofbirth,Sex,Registration,Date_of_Issue,Serial_Number,TypeofP ) 
	 AS  SELECT Citizen.Full_name,Citizen.Date_ofbirth,Citizen.Sex,Citizen.Registration,State.Date_of_Issue,Passport.Serial_Number,Type_of_passport.TypeofP
		FROM Citizen,Passport,State,Type_of_passport
		WHERE Citizen.ID_Citizen=Passport.ID_Citizen AND
Passport.ID_Type=Type_of_passport.ID_Type;