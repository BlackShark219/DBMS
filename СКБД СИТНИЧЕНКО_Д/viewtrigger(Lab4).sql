-- створення тригерів для оновлення таблиць, які в представлені

CREATE OR REPLACE TRIGGER Passport_Info_UPD
INSTEAD OF UPDATE ON PASSPORT_INFORMATION
FOR EACH ROW
BEGIN
    IF UPDATING('Full_Name') THEN
        UPDATE Citizen
        SET Full_Name = :NEW.Full_Name
        WHERE ID_CITIZEN = :OLD.ID_CITIZEN;
    END IF;
    IF UPDATING('Date_ofBirth') THEN
        UPDATE Citizen
        SET Date_ofBirth = :NEW.Date_ofBirth
        WHERE ID_CITIZEN = :OLD.ID_CITIZEN;
    END IF;
    IF UPDATING('Sex') THEN
        UPDATE Citizen
        SET Sex = :NEW.Sex
        WHERE ID_CITIZEN = :OLD.ID_CITIZEN;
    END IF;
    IF UPDATING('Registration') THEN
        UPDATE Citizen
        SET Registration = :NEW.Registration
        WHERE ID_CITIZEN = :OLD.ID_CITIZEN;
    END IF;
    IF UPDATING('Date_of_Issue') THEN
        UPDATE stateofp
        SET Date_of_Issue = :NEW.Date_of_Issue
        WHERE State_ID = :OLD.State_ID;
    END IF;
    IF UPDATING('Serial_Number') THEN
        UPDATE passport
        SET Serial_Number = :NEW.Serial_Number
        WHERE ID_Citizen = :OLD.ID_Citizen;
    END IF;
    IF UPDATING('ID_TYPE') THEN
        UPDATE passport
        SET ID_TYPE = :NEW.ID_TYPE
        WHERE ID_Citizen = :OLD.ID_Citizen;
    END IF; 
    IF UPDATING('ID_CITIZEN') OR UPDATING('STATE_ID') THEN
        dbms_output.put_line('Changing FKs is forbidden');
    END IF;
END;