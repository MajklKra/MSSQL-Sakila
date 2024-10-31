
/* Napi�te jednoduchou funkci/proceduru pro p�id�n� nov�ho filmu na�eho z�p�j�kov�ho syst�mu. */

CREATE PROCEDURE film_insert
    @title VARCHAR(255),
    @description NVARCHAR(MAX),
    @release_year VARCHAR(255),
    @language_id INT,
    @original_language_id INT,
    @rental_duration INT,
    @rental_rate DECIMAL(4, 2),
    @length INT,
    @replacement_cost DECIMAL(5, 2),
    @rating VARCHAR(10),
    @special_features VARCHAR(100)
AS
BEGIN
    BEGIN TRY
        -- Pokus o vlo�en� z�znamu do tabulky
        INSERT INTO film 
        (title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, 
        replacement_cost, rating, special_features, last_update)
        VALUES 
        (@title, @description, @release_year, @language_id, @original_language_id, 
        @rental_duration, @rental_rate, @length, @replacement_cost, @rating, @special_features, GETDATE());

        -- V p��pad� �sp�chu m��ete vr�tit zpr�vu
        SELECT 'Film successfully inserted.' AS Message;
        
    END TRY
    BEGIN CATCH
        -- Zachycen� chyby a zobrazen� detail� chyby
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;

        -- Z�sk�n� informac� o chyb�
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        -- N�vrat chybov� zpr�vy
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

EXECUTE film_insert @title='Kniha na test!',
    @description =' Vytipovan� kniha pro testovac� ��ely.' , -- ekvivalent CLOB
    @release_year='2024',
    @language_id = 1,            -- ekvivalent NUMBER(22)
    @original_language_id = Null,   -- ekvivalent NUMBER(22)
    @rental_duration='6',        -- ekvivalent NUMBER(22)
    @rental_rate = '0.99',  -- ekvivalent number(4,2)
    @length = '120',                 -- ekvivalent NUMBER(22)
    @replacement_cost  = '20.99', -- ekvivalent NUMBER(5,2)
    @rating = 'PG',
    @special_features  = 'Deleted Scenes,Behind the Scenes';

