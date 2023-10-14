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
(1, '������', '��. ����������, 2�'),
(2, '�������� � ����', '��������� �����., 2�'),
(3, '���� ����', '�����. ������, 100�'),
(4, '����������', '��. ����������, 6'),
(5, '��������', '��. ����������, 12');

INSERT INTO Menu (MenuID, RestaurantID, ItemName, Price) VALUES
(1, 1, '����', 5.99),
(2, 1, '��������', 7.99),
(3, 2, '�������� ��-��������', 9.99),
(4, 2, '��� �����', 6.99),
(5, 3, '����� �� ��������', 15.99),
(6, 3, '����� ���������', 12.99),
(7, 4, '������', 8.99),
(8, 4, '����� ������', 7.99),
(9, 5, '�������', 19.99),
(10, 5, '��� �� �������������', 14.99);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone) VALUES
(1, '����', '������', 'ivan@example.com', '1234567890'),
(2, '����', '������', 'petr@example.com', '9876543210'),
(3, '����', '��������', 'anna@example.com', '5555555555');
