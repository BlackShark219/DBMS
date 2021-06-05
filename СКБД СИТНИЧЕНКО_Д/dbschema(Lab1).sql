CREATE TABLE Citizen
(
	ID_Citizen           INTEGER NOT NULL ,
	Full_name            VARCHAR2(20) NULL ,
	Date_ofbirth         DATE NULL ,
	Sex                  VARCHAR2(20) NULL ,
	Registration         VARCHAR2(20) NULL 
);



CREATE UNIQUE INDEX XPKCitizen ON Citizen
(ID_Citizen   ASC);



ALTER TABLE Citizen
	ADD CONSTRAINT  XPKCitizen PRIMARY KEY (ID_Citizen);



CREATE TABLE Passport
(
	ID_Passport          INTEGER NOT NULL ,
	Serial_Number        VARCHAR2(20) NULL ,
	ID_Citizen           INTEGER NOT NULL ,
	ID_Type              INTEGER NOT NULL ,
	State_ID             INTEGER NOT NULL 
);



CREATE UNIQUE INDEX XPKPassport ON Passport
(ID_Passport   ASC,ID_Citizen   ASC,ID_Type   ASC,State_ID   ASC);



ALTER TABLE Passport
	ADD CONSTRAINT  XPKPassport PRIMARY KEY (ID_Passport,ID_Citizen,ID_Type,State_ID);



CREATE TABLE PhoneNumber
(
	PhoneN               INTEGER NOT NULL ,
	ID_Citizen           INTEGER NOT NULL 
);



CREATE UNIQUE INDEX XPKPhoneNumber ON PhoneNumber
(PhoneN   ASC,ID_Citizen   ASC);



ALTER TABLE PhoneNumber
	ADD CONSTRAINT  XPKPhoneNumber PRIMARY KEY (PhoneN,ID_Citizen);



CREATE TABLE StateofP
(
	State                VARCHAR2(20) NULL ,
	Date_of_Issue        DATE NULL ,
	Expiration_Date      DATE NULL ,
	State_ID             INTEGER NOT NULL 
);



CREATE UNIQUE INDEX XPKState ON StateofP
(State_ID   ASC);



ALTER TABLE StateofP
	ADD CONSTRAINT  XPKState PRIMARY KEY (State_ID);



CREATE TABLE Type_of_passport
(
	TypeofP              VARCHAR2(20) NULL ,
	ID_Type              INTEGER NOT NULL 
);



CREATE UNIQUE INDEX XPKType_of_passport ON Type_of_passport
(ID_Type   ASC);



ALTER TABLE Type_of_passport
	ADD CONSTRAINT  XPKType_of_passport PRIMARY KEY (ID_Type);



ALTER TABLE Passport
	ADD (CONSTRAINT R_7 FOREIGN KEY (ID_Citizen) REFERENCES Citizen (ID_Citizen));



ALTER TABLE Passport
	ADD (CONSTRAINT R_8 FOREIGN KEY (ID_Type) REFERENCES Type_of_passport (ID_Type));



ALTER TABLE Passport
	ADD (CONSTRAINT R_25 FOREIGN KEY (State_ID) REFERENCES StateofP (State_ID));



ALTER TABLE PhoneNumber
	ADD (CONSTRAINT R_10 FOREIGN KEY (ID_Citizen) REFERENCES Citizen (ID_Citizen));