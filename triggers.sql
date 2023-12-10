--1. Триггер для таблицы "Restaurants", который проверяет, чтобы значение поля "Name" было уникальным:


CREATE TRIGGER UniqueName
ON Restaurants
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT Name FROM inserted GROUP BY Name HAVING COUNT(*) > 1)
    BEGIN
        RAISERROR ('Name must be unique', 16, 1)
        ROLLBACK TRANSACTION
    END
END


--2. Триггер для таблицы "Menu", который проверяет, чтобы цена "Price" была положительной:


CREATE TRIGGER PositivePrice
ON Menu
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT Price FROM inserted WHERE Price <= 0)
    BEGIN
        RAISERROR ('Price must be positive', 16, 1)
        ROLLBACK TRANSACTION
    END
END


--3. Триггер для таблицы "OrderHistory", который автоматически устанавливает текущую дату в поле "OrderDate" при вставке новой записи:

CREATE TRIGGER SetOrderDate
ON OrderHistory
AFTER INSERT
AS
BEGIN
    UPDATE OrderHistory
    SET OrderDate = GETDATE()
    WHERE OrderID IN (SELECT OrderID FROM inserted)
END


--4. Триггер для таблицы "Customers", который проверяет, чтобы значение поля "Email" было уникальным:


CREATE TRIGGER UniqueEmail
ON Customers
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT Email FROM inserted GROUP BY Email HAVING COUNT(*) > 1)
    BEGIN
        RAISERROR ('Email must be unique', 16, 1)
        ROLLBACK TRANSACTION
    END
END