--1. ������ �� ��������� ���� ����������:
SELECT * FROM Restaurants;

--2. ������ �� ��������� ���� ����������� ��������� �� ��� ID:
SELECT * FROM Menu WHERE RestaurantID = 2;

--3. ������ �� ��������� ���������� � ������� ����������� ������� �� ��� ID:
SELECT * FROM OrderHistory WHERE CustomerID = 1;

--4. ������ �� ��������� ��������� ��������� ���� ������� � ��������� �� ��� ID:
SELECT SUM(Price) FROM Menu
INNER JOIN OrderHistory ON Menu.MenuID = OrderHistory.MenuID
WHERE OrderHistory.RestaurantID = 3;

--5. ������ �� ���������� ���������� � ������� �� ��� ID:
UPDATE Customers SET Phone = '87772281488' WHERE CustomerID = 3;