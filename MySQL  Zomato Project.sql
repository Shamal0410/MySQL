create database zomato1;
use zomato1;

Create table Users (
user_id int primary key Auto_increment,
user_name varchar(100) not null,
email varchar(100) not null unique,
phone varchar(15),
address text);

Create table Restaurants (
restaurant_id int primary key Auto_increment,
name varchar(100) not null,
location varchar(100),
rating float check (rating >=0 AND rating <=5),
cuisine varchar(50),
contact varchar(15));

 
Create table Menu_Items (
item_id int primary key Auto_increment,
restaurant_id int,
item_name varchar(100) not null,
price decimal(8,2) not null,
desciption text,
foreign key(restaurant_id) references Restaurants(restaurant_id) on delete cascade);


Create table Orders (
order_id int primary key Auto_increment,
user_id int,
restaurant_id int,
order_date datetime default current_timestamp,
status enum('Pending','Completed','Cancelled') default 'Pending', total_price decimal(8,2),
foreign key(user_id) references Users(user_id) on delete cascade,
foreign key(restaurant_id) references Restaurants(restaurant_id) on delete cascade);

Create table Order_Items (
order_ed int primary key Auto_increment,
order_id int,
item_id int,
quantity int default 1,
price decimal(8,2));
foreign key(order_id) references Orders(order_id) on delete cascade,
foreign key(item_id) references Menu_Items(item_id) on delete cascade);

Create table Reviews (
review_id int primary key Auto_increment,
user_id int,
restaurant_id int,
rating int check (rating >= 0 AND rating <=5),
comments text,
review_date datetime default current_timestamp);
foreign key(user_id) references Users(uers_id) on delete cascade);
foreign key(restaurant_id) references Restaurants(restaurant_id) on delete cascade);

 insert into Users (user_name,email,phone,address) values
 ('John Doe', 'john@example.com', '1234567890', '123 Main St'),
 ('Jane Simth',' jane@example.com', '0987654321', '456 Elm St');
 
 insert into Restaurants (name,location, rating, cuisine,contact) values
 ('Pizza Palace', 'Downtown', 4.5, 'Italian', '1112223333'),
 ('Sushi World', 'Uptown', 4.8, 'Japanese', '2223334444');
 
 insert into Menu_Items (restaurant_id,item_name,price,desciption) values 
 (1, 'Margherita', 9.99, 'Classic cheese and tomato pizza'),
 (1, 'Pepperoni', 12.99, 'Pepperonu pizza with mozzarella'),
 (2, 'Salmon Sushi', 15.99,'Fresh Salmon nigiri sushi'),
 (2, 'Tuna Sushi', 14.99, 'Fresh tuna nigiri sushi');
 
 insert into Order_Items (order_id,item_id,quantity,price) values
 (1, 1, 1, 9.99),
 (1, 2, 1, 12.99),
 (2, 3, 2, 15.99);
 
 insert into Reviews (user_id,restaurant_id,rating,comments) values
 (1, 1, 5, 'Amazing pizza Highly recomment'),
 (2, 2, 4, 'Great sushi, but a bit pricey');

SELECT name, location, AVG(rating) AS average_rating
FROM Restaurants
JOIN Reviews ON Restaurants.restaurant_id = Reviews.restaurant_id
GROUP BY Restaurants.restaurant_id;


SELECT item_name, price, desciption 
FROM Menu_Items
WHERE restaurant_id = 1;


SELECT Orders.order_id, Restaurants.name AS restaurant_name, Orders.total_price, Orders.status
FROM Orders
JOIN Restaurants ON Orders.restaurant_id = Restaurants.restaurant_id
WHERE Orders.user_id = 1;


SELECT Users.user_name, Reviews.rating, Reviews.comments
FROM Reviews
JOIN Users ON Reviews.user_id = Users.user_id
WHERE restaurant_id = 2;


SELECT Restaurants.name, SUM(Orders.total_price) AS total_earnings
FROM Orders
JOIN Restaurants ON Orders.restaurant_id = Restaurants.restaurant_id
WHERE Orders.status = 'Completed'
GROUP BY Restaurants.restaurant_id;







