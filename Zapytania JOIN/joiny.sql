select u.Name as UserName, u.Email as UserEmail, o.OrderDate, oi.ProductName, oi.Quantity, oi.Price from Users as u
left join Orders as o on u.UserID = o.UserID
left join OrderItems as oi on o.OrderID = oi.OrderID
where oi.Quantity > 0;

select u.Name as UserName, u.Email as UserEmail, sum(oi.Quantity * oi.Price) as TotalOrderValue from Users as u
inner join Orders as o on u.UserID = o.UserID
inner join OrderItems as oi on o.OrderID = oi.OrderID
group by u.Name, u.Email;

select o.OrderID, u.Name as UserName, oi.Quantity as ProductCount from Orders as o
left join Users as u on o.UserID = u.UserID
left join OrderItems as oi on o.OrderID = oi.OrderID
where oi.Quantity > 1;

select ProductName, Quantity as TotalQuantity from OrderItems order by Quantity desc;

select oi.OrderID, u.Name as UserName, o.OrderDate, oi.ProductName, oi.Quantity, oi.Price from OrderItems as oi
left join Orders as o on oi.OrderID = o.OrderID
left join Users as u on o.UserID = u.UserID;

select u.Name as 'Nazwa użytkownika', u.Email as AdresEmail from Users as u
left join Orders as o on u.UserID = o.UserID
where o.UserID is null;

select oi.ProductName as Nazwa_Produktu, oi.Quantity as Ilość, oi.Quantity * oi.Price as Cena_Całkowita from OrderItems as oi
left join Orders as o on oi.OrderID = o.OrderID
left join Users as u on o.UserID = u.UserID
where u.Name = 'Jan Kowalski';