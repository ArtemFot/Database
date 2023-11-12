--1. «апрос на получение всех ресторанов:
SELECT * FROM Restaurants;

--2. «апрос на получение меню конкретного ресторана по его ID:
SELECT * FROM Menu WHERE RestaurantID = 2;

--3. «апрос на получение информации о заказах конкретного клиента по его ID:
SELECT * FROM OrderHistory WHERE CustomerID = 1;

--4. «апрос на получение суммарной стоимости всех заказов в ресторане по его ID:
SELECT SUM(Price) FROM Menu
INNER JOIN OrderHistory ON Menu.MenuID = OrderHistory.MenuID
WHERE OrderHistory.RestaurantID = 3;

--5. «апрос на обновление информации о клиенте по его ID:
UPDATE Customers SET Phone = '87772281488' WHERE CustomerID = 3;