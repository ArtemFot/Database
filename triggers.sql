--1. ������� ��� ������� "Restaurants", ������� ���������, ����� �������� ���� "Name" ���� ����������:


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


--2. ������� ��� ������� "Menu", ������� ���������, ����� ���� "Price" ���� �������������:


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


--3. ������� ��� ������� "OrderHistory", ������� ������������� ������������� ������� ���� � ���� "OrderDate" ��� ������� ����� ������:

CREATE TRIGGER SetOrderDate
ON OrderHistory
AFTER INSERT
AS
BEGIN
    UPDATE OrderHistory
    SET OrderDate = GETDATE()
    WHERE OrderID IN (SELECT OrderID FROM inserted)
END


--4. ������� ��� ������� "Customers", ������� ���������, ����� �������� ���� "Email" ���� ����������:


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