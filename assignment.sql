/* creating database called "Online_Groceryshop" */
CREATE DATABASE Online_Groceryshop;
 
/* creating tables with no foreign keys before ones with foreign keys to avoid errors during execution*/
CREATE TABLE User (
  User_ID INT NOT NULL,
  Name VARCHAR(20) NOT NULL,
  Address VARCHAR(50) NOT NULL,
  Contact_Number INT NOT NULL,
  Username VARCHAR(20) NOT NULL,
  Password VARCHAR(20) NOT NULL,
  PRIMARY KEY (User_ID)
);

CREATE TABLE Manufacture (
  Manufacture_ID INT NOT NULL,
  Manufacture_Name VARCHAR(30) NOT NULL,
  PRIMARY KEY (Manufacture_ID)
);

CREATE TABLE Category (
  Category_ID INT NOT NULL,
  Category_Name VARCHAR(30) NOT NULL,
  PRIMARY KEY (Category_ID)
);

CREATE TABLE Product (
  Product_ID INT NOT NULL,
  Name VARCHAR(20) NOT NULL,
  Price FLOAT(6, 2) NOT NULL,
  Available_Item BOOLEAN NOT NULL,
  Weight FLOAT(4, 2) NOT NULL,
  Manufacture_ID INT NOT NULL,
  Category_ID INT NOT NULL,
  PRIMARY KEY (Product_ID),
  FOREIGN KEY (Manufacture_ID) REFERENCES Manufacture(Manufacture_ID),
  FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

CREATE TABLE Order1(
  Order_ID INT NOT NULL,
  Date DATE NOT NULL,
  User_ID INT NOT NULL,
  PRIMARY KEY (Order_ID),
  FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

CREATE TABLE Cart_Item (
  Cart_Item_ID INT NOT NULL,
  Item_Cost FLOAT(6, 2) NOT NULL,
  Order_ID INT NOT NULL,
  Product_ID INT NOT NULL,
  PRIMARY KEY (Cart_Item_ID),
  FOREIGN KEY (Order_ID) REFERENCES Order1(Order_ID),
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

CREATE TABLE Cart (
  Cart_ID INT NOT NULL,
  Total_Cost FLOAT(6, 2) NOT NULL,
  Quantity INT NOT NULL,
  Cart_Item_ID INT NOT NULL,
  PRIMARY KEY (Cart_ID),
  FOREIGN KEY (Cart_Item_ID) REFERENCES Cart_Item(Cart_Item_ID)
);

CREATE TABLE Payment (
  Payment_ID INT NOT NULL,
  Date DATE NOT NULL,
  Amount FLOAT(8, 2) NOT NULL,
  Payment_Type VARCHAR(17) NOT NULL,
  Cart_ID INT NOT NULL,
  User_ID INT NOT NULL,
  PRIMARY KEY (Payment_ID),
  FOREIGN KEY (Cart_ID) REFERENCES Cart(Cart_ID),
  FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

CREATE TABLE Delivery (
  Delivery_ID INT NOT NULL,
  Date DATE NOT NULL,
  Delivery_Address VARCHAR(50) NOT NULL,
  Payment_ID INT NOT NULL,
  Cart_ID INT NOT NULL,
  PRIMARY KEY (Delivery_ID),
  FOREIGN KEY (Payment_ID) REFERENCES Payment(Payment_ID),
  FOREIGN KEY (Cart_ID) REFERENCES Cart(Cart_ID)
);



INSERT INTO User(User_ID, Name, Address, Contact_Number, Username, Password) VALUES
(1, 'John Doe', '123 Main Street, Cityville', '5551234567', 'johndoe123', 'password123'),
(2, 'Jane Smith', '456 Elm Street, Townsville', '5559876543', 'janesmith', 'pass123'),
(3, 'Mike Johnson', '789 Oak Avenue, Villageton', '5557890123', 'mikej', 'mypass'),
(4, 'Emily Davis', '321 Pine Road, Citytown', '5554567890', 'emilyd', 'securepass'),
(5, 'Alex Thompson', '987 Cedar Lane, Villageville', '5553216789', 'alex123', 'thompsonpass'),
(6, 'Sarah Wilson', '654 Birch Court, Towndale', '5552345678', 'sarahw', 'mypassword'),
(7, 'Michael Brown', '258 Maple Avenue, Townville', '5557654321', 'michaelb', 'pass456'),
(8, 'Jessica Lee', '741 Oak Street, Citydale', '5558765432', 'jessical', 'mypassword123'),
(9, 'Andrew Miller', '369 Pine Lane, Villagetown', '5555432109', 'andrewm', 'password456'),
(10, 'Olivia Davis', '852 Elm Court, Towneton', '5552109876', 'oliviad', 'securepassword');

INSERT INTO Manufacture(Manufacture_ID, Manufacture_Name) VALUES
(11, 'Nestle'),
(22, 'Kelloggs'),
(33, 'Unilever'),
(44, 'P&G'),
(55, 'Coca-Cola'),
(66, 'General Mills'),
(77, 'Hersheys'),
(88, 'Johnson & Johnson'),
(99, 'PepsiCo'),
(111, 'Kraft Heinz');

INSERT INTO Category(Category_ID, Category_Name) VALUES
(1001, 'Beverages'),
(2001, 'Dairy Products'),
(3001, 'Bakery'),
(4001, 'Snacks'),
(5001, 'Canned Goods'),
(6001, 'Condiments'),
(7001, 'Frozen Foods'),
(8001, 'Personal Care'),
(9001, 'Household Supplies'),
(10011, 'Meat and Poultry');

INSERT INTO Product(Product_ID, Name, Price, Available_Item, Weight, Manufacture_ID, Category_ID) VALUES 
(100, 'Coca-Cola', 1.99, 'YES', 2.0, 55, 1001),
(200, 'Kelloggs Corn Flakes', 3.49, 'YES', 0.5, 22, 3001),
(300, 'Nestle Water', 0.99, 'YES', 1.5, 11, 1001),
(400, 'Unilever Dove Soap', 2.99, 'YES', 0.2, 33, 8001),
(500, 'P&G Tide Laundry Detergent', 8.99, 'YES', 2.5, 44, 9001),
(600, 'Hersheys Milk Chocolate Bar', 1.49, 'YES', 0.1, 77, 4001),
(700, 'Johnson & Johnson Baby Shampoo', 4.99, 'YES', 0.3, 88, 8001),
(800, 'PepsiCo Lays Potato Chips', 2.49, 'YES', 0.2, 99, 4001),
(900, 'Kraft Heinz Ketchup', 2.99, 'YES', 0.5, 111, 6001),
(1000, 'General Mills CheerIos', 3.99, 'YES', 0.8, 66, 3001);


INSERT INTO Order1(Order_ID, Date, User_ID) VALUES
(100110, '2023-06-09', 1),
(100120, '2023-06-09', 2),
(100130, '2023-06-08', 3),
(100140, '2023-06-08', 4),
(100150, '2023-06-07', 5),
(100160, '2023-06-07', 6),
(100170, '2023-06-06', 7),
(100180, '2023-06-06', 8),
(100190, '2023-06-05', 9),
(100200, '2023-06-05', 10);

INSERT INTO Cart_Item(Cart_Item_ID, Item_Cost, Order_ID, Product_ID) VALUES
(110101, 1.99, 100110, 100),
(110201, 3.49, 100120, 200),
(110301, 0.99, 100130, 300),
(110401, 2.99, 100140, 400),
(110501, 8.99, 100150, 500),
(110601, 1.49, 100160, 600),
(110701, 4.99, 100170, 700),
(110801, 2.49, 100180, 800),
(110901, 2.99, 100190, 900),
(110111, 3.99, 100200, 1000);

INSERT INTO Cart(Cart_ID, Total_Cost, Quantity, Cart_Item_ID) VALUES
(200100, 1.99, 1, 110101),
(200200, 3.49, 1, 110201),
(200300, 0.99, 1, 110301),
(200400, 2.99, 1, 110401),
(200500, 8.99, 1, 110501),
(200600, 1.49, 1, 110601),
(200700, 4.99, 1, 110701),
(200800, 2.49, 1, 110801),
(200900, 2.99, 1, 110901),
(2001000, 3.99, 1,110111);

INSERT INTO Payment(Payment_ID, Date, Amount, Payment_Type, Cart_ID, User_ID)
VALUES
(119100, '2023-06-09', 1.99, 'Credit Card', 200100, 1),
(119200, '2023-06-09', 3.49, 'Debit Card', 200200, 2),
(119300, '2023-06-08', 0.99, 'Cash', 200300, 3),
(119400, '2023-06-08', 2.99, 'Credit Card', 200400, 4),
(119500, '2023-06-07', 8.99, 'Credit Card', 200500, 5),
(119600, '2023-06-07', 1.49, 'Cash', 200600, 6),
(119700, '2023-06-06', 4.99, 'Credit Card', 200700, 7),
(119800, '2023-06-06', 2.49, 'Debit Card', 200800, 8),
(119900, '2023-06-05', 2.99, 'Credit Card', 200900, 9),
(120000, '2023-06-05', 3.99, 'Cash', 2001000, 10);

INSERT INTO Delivery(Delivery_ID, Date, Delivery_Address, Payment_ID, Cart_ID) VALUES
(11111, '2023-06-09', '123 Main Street, Cityville', 119100, 200100 ),
(22222, '2023-06-09', '456 Elm Street, Townsville', 119200, 200200),
(33333, '2023-06-08', '789 Oak Avenue, Villageton', 119300, 200300),
(44444, '2023-06-08', '321 Pine Road, Citytown', 119400, 200400),
(55555, '2023-06-07', '987 Cedar Lane, Villageville', 119500, 200500),
(66666, '2023-06-07', '654 Birch Court, Towndale', 119600, 200600),
(77777, '2023-06-06', '258 Maple Avenue, Townville', 119700, 200700),
(88888, '2023-06-06', '741 Oak Street, Citydale', 119800, 200800),
(99999, '2023-06-05', '369 Pine Lane, Villagetown', 119900, 200900),
(111110, '2023-06-05', '852 Elm Court, Towneton', 120000, 2001000);



