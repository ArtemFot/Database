CREATE DATABASE KABAN
USE KABAN

CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255)
);

CREATE TABLE Menu (
    MenuID INT PRIMARY KEY,
    RestaurantID INT,
    ItemName VARCHAR(255),
    Price DECIMAL(10, 2),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20)
);

CREATE TABLE OrderHistory (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    MenuID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID),
    FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
);

INSERT INTO Restaurants (RestaurantID, Name, Address) VALUES
(1, 'Вкусно', 'ул. Веденяпина, 2А'),
(2, 'Хачапури и вино', 'Молодёжный просп., 2А'),
(3, 'Дарк Сайд', 'просп. Ленина, 100Д'),
(4, 'КуулКлевер', 'ул. Веденяпина, 6'),
(5, 'Бристоль', 'ул. Веденяпина, 12');

INSERT INTO Menu (MenuID, RestaurantID, ItemName, Price) VALUES
(1, 1, 'Борщ', 5.99),
(2, 1, 'Пельмени', 7.99),
(3, 2, 'Хачапури по-аджарски', 9.99),
(4, 2, 'Суп харчо', 6.99),
(5, 3, 'Стейк из говядины', 15.99),
(6, 3, 'Пицца Пепперони', 12.99),
(7, 4, 'Бургер', 8.99),
(8, 4, 'Салат Цезарь', 7.99),
(9, 5, 'Лобстер', 19.99),
(10, 5, 'Суп из морепродуктов', 14.99);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone) VALUES
(1, 'Иван', 'Иванов', 'ivan@example.com', '1234567890'),
(2, 'Петр', 'Петров', 'petr@example.com', '9876543210'),
(3, 'Анна', 'Сидорова', 'anna@example.com', '5555555555');
