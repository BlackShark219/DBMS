-- тригери для бд, які генерують первинні ключі за схемою MAX + 1, коли значення ключа не задане
-- слабі сутності(PhoneNumber) не можуть генерувати унікальні ключі, так як вони зовнішні ключі, тому тригери для них не були створені
CREATE OR REPLACE TRIGGER t_Citizen
BEFORE INSERT OR UPDATE ON Citizen
FOR EACH ROW
BEGIN
    IF :NEW.ID_CITIZEN IS NULL THEN
        SELECT MAX(ID_CITIZEN)+1 INTO :NEW.ID_CITIZEN FROM Citizen;
    END IF;
END;
/
CREATE OR REPLACE TRIGGER t_Passport
BEFORE INSERT OR UPDATE ON passport
FOR EACH ROW
BEGIN
    IF :NEW.ID_PASSPORT IS NULL THEN
        SELECT MAX(ID_PASSPORT)+1 INTO :NEW.ID_PASSPORT FROM passport;
    END IF;
END;
/
CREATE OR REPLACE TRIGGER t_Type_of_P
BEFORE INSERT OR UPDATE ON type_of_passport
FOR EACH ROW
BEGIN
    IF :NEW.ID_Type IS NULL THEN
        SELECT MAX(ID_Type)+1 INTO :NEW.ID_Type FROM type_of_passport;
    END IF;
END;
/
CREATE OR REPLACE TRIGGER t_StateofP
BEFORE INSERT OR UPDATE ON stateofp
FOR EACH ROW
BEGIN
    IF :NEW.state_id IS NULL THEN
        SELECT MAX(state_id)+1 INTO :NEW.state_id FROM stateofp;
    END IF;
END;
/