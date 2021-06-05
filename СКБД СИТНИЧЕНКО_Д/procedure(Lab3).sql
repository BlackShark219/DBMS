CREATE OR REPLACE PACKAGE Add_Data IS--ініціалізація процедур і масиву в пакеті
    TYPE array_t IS VARRAY(10) OF VARCHAR2(20);
    PROCEDURE CreateCitizen;
    PROCEDURE CreateTypeofPassport;
    PROCEDURE CreatePassport;
    PROCEDURE CreatePhoneNumber;
    PROCEDURE CreateState;
    PROCEDURE DeleteAllData;
    PROCEDURE AddINFO;
    
END Add_Data;
/
CREATE OR REPLACE PACKAGE BODY Add_Data IS
--створюємо поле в таблиці і заповнюємо відповідні атрибути
PROCEDURE CreateCitizen AS 
    REGISTRATIONList array_t := array_t('Kyiv','Kharkiv','Odesa','Dnipro','Donetsk','Lviv','Zaporizhzhia','Kryvyi Rih','Mykolaiv','Mariupol');--масив пунктів реєстрації
    FULLNAMEList array_t := array_t('Matt Damon','Ben Affleck','Linda Fiorentino','Salma Hayek','Jason Lee','Jason Mewes','Alan Rickman','Chris Rock','Kevin Smith','Bud Cort');--масив імен і прізвищ
    RandREGISTRATION VARCHAR(20);
    RandFULLNAME VARCHAR2(20);
    RandSex VARCHAR2(20);
    RandDateOfBirth DATE;
BEGIN
    FOR i IN 1..15 LOOP
    RandFULLNAME := FULLNAMEList(floor(dbms_random.value(1,11)));
    RandREGISTRATION := REGISTRATIONList(floor(dbms_random.value(1,11)));
    SELECT (CASE WHEN floor(dbms_random.value(1,3)) = 1 THEN 'female' else 'male' end) INTO RandSex FROM dual; -- випадкова стать
    SELECT TO_DATE('2000-01-01', 'yyyy-mm-dd') + TRUNC(floor(dbms_random.value(1,1000))) INTO RandDateOfBirth FROM dual; -- випадкова дата народження
    INSERT INTO CITIZEN (FULL_NAME, SEX, DATE_OFBIRTH,REGISTRATION,ID_CITIZEN) -- заповнення атрибутів значеннями
    VALUES (RandFULLNAME, RandSex, RandDateOfBirth,RandRegistration,i);
    END LOOP;
END;

PROCEDURE CreateTypeofPassport AS
    TypeofPList array_t := array_t('National','Foreign'); --масив типів паспорту
BEGIN
    FOR i IN 1..2 LOOP
    INSERT INTO type_of_passport (typeofp,id_type)--заповнення номеру та відповідного типу паспорту
    VALUES (TypeofPList(i),i);
    END LOOP;
END;

PROCEDURE CreatePassport AS
    RandSN VARCHAR2(20);
    RandPT Number(38,0);
BEGIN
    FOR i IN 1..15 LOOP
    RandPT:=floor(dbms_random.value(1,3));--випадковий тип паспорту
    RandSN:=floor(dbms_random.value(1000,9999));--випадковий серійний номер паспорту
    INSERT INTO Passport(SERIAL_NUMBER,ID_CITIZEN,ID_TYPE,ID_PASSPORT,STATE_ID)--заповнення даними атрибутів
    VALUES(RandSN,i,RandPT,1,i);
    END LOOP;

END;

PROCEDURE CreatePhoneNumber AS
    RandPhoneN Number(38,0);
BEGIN
     FOR i IN 1..15 LOOP
    SELECT dbms_random.value(1000000, 99999999) INTO RandPhoneN FROM dual;--випадковий номер телефону
    INSERT INTO phonenumber(ID_CITIZEN,PHONEN)
    VALUES(i,RandPhoneN);--заповнення номерів тел. 
    END LOOP;
END;

PROCEDURE CreateState AS
 RDoI DATE;
 RDoE Date;
  StateofPList array_t := array_t('Valid','Expired');--масив стану паспорту
 BEGIN
  
     FOR i IN 1..15 LOOP
     SELECT TO_DATE('2000-01-01', 'yyyy-mm-dd') + TRUNC(floor(dbms_random.value(-4713,100))) INTO RDoI FROM dual; --випадкова дата видачі
  SELECT TO_DATE('2000-01-01', 'yyyy-mm-dd') + TRUNC(floor(dbms_random.value(1000,9999))) INTO RDoE FROM dual;-- випадкова дата завершення дії
    INSERT INTO stateofp(state_id,state,date_of_issue,expiration_date)
    VALUES(i,stateofplist(1),Rdoi,Rdoe);
    END LOOP;
 END;
 
PROCEDURE DeleteAllData AS--видалення всіх записів з наведених таблиць
    BEGIN
        DELETE FROM passport;          
        DELETE FROM phonenumber;
        DELETE FROM stateofp;
        DELETE FROM type_of_passport;
        DELETE FROM Citizen;
    END DeleteAllData;
PROCEDURE AddINFO AS--порядок додавання інформації
BEGIN
createtypeofpassport;
createcitizen;
createstate;
createphonenumber;
createpassport;
END;
END Add_Data;
/
BEGIN
    add_data.deletealldata;
    add_data.addinfo;
END;
/