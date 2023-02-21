USE ShopDB;

-- Таблица без первичного ключа --
CREATE TABLE newCustomersTable
	(
	CustomerNo int NOT NULL,
	FName nvarchar(15) NOT NULL,
	LName nvarchar(15) NOT NULL,
	MName nvarchar(15) NULL,
	Address1 nvarchar(50) NOT NULL,
	Address2 nvarchar(50) NULL,
	City nchar(10) NOT NULL,
	Phone char(12) NOT NULL,
	DateInSystem date NULL
	);
    
INSERT newCustomersTable
(CustomerNo, LName, FName, MName, Address1, Address2, City, Phone,DateInSystem)
VALUES
(1,'Круковский','Анатолий','Петрович','Лужная 15',NULL,'Харьков','(092)3212211','2009-11-20'),
(2,'Дурнев','Виктор','Викторович','Зелинская 10',NULL,'Киев','(067)4242132','2009-11-20'),
(3,'Унакий','Зигмунд','федорович','Дихтяревская 5',NULL,'Киев','(092)7612343','2009-11-20'),
(4,'Левченко','Виталий','Викторович','Глущенка 5','Драйзера 12','Киев','(053)3456788','2009-11-20'),
(5,'Выжлецов','Олег','Евстафьевич','Киевская 3','Одесская 8','Чернигов','(044)2134212','2009-11-20');

SELECT Fname FROM newCustomersTable WHERE LName = 'Унакий';

-- Таблице без первичного ключа пришлось пройти все данные таблицы, что значительно ухудшает скорость работы --
EXPLAIN SELECT Fname FROM newCustomersTable WHERE LName = 'Унакий';

DROP TABLE newCustomersTable;


-- Таблица с первичным ключом --
CREATE TABLE newCustomersTable
	(
	CustomerNo int NOT NULL auto_increment,
	FName nvarchar(15) NOT NULL,
	LName nvarchar(15) NOT NULL,
	MName nvarchar(15) NULL,
	Address1 nvarchar(50) NOT NULL,
	Address2 nvarchar(50) NULL,
	City nchar(10) NOT NULL,
	Phone char(12) NOT NULL,
	DateInSystem date NULL,
    primary key(CustomerNo)
	);  

INSERT newCustomersTable
(LName, FName, MName, Address1, Address2, City, Phone,DateInSystem)
VALUES
('Круковский','Анатолий','Петрович','Лужная 15',NULL,'Харьков','(092)3212211','2009-11-20'),
('Дурнев','Виктор','Викторович','Зелинская 10',NULL,'Киев','(067)4242132','2009-11-20'),
('Унакий','Зигмунд','федорович','Дихтяревская 5',NULL,'Киев','(092)7612343','2009-11-20'),
('Левченко','Виталий','Викторович','Глущенка 5','Драйзера 12','Киев','(053)3456788','2009-11-20'),
('Выжлецов','Олег','Евстафьевич','Киевская 3','Одесская 8','Чернигов','(044)2134212','2009-11-20');

SELECT Fname FROM newCustomersTable WHERE LName = 'Унакий';

-- Таблица с первым ключом справилась немного быстрее таблицы без первичного ключа, однако это так же ухудшает скорость работы --
EXPLAIN SELECT Fname FROM newCustomersTable WHERE LName = 'Унакий';

DROP TABLE newCustomersTable;


-- Таблица с индексом LName --
CREATE TABLE newCustomersTable
	(
	CustomerNo int NOT NULL auto_increment,
	FName nvarchar(15) NOT NULL,
	LName nvarchar(15) NOT NULL,
	MName nvarchar(15) NULL,
	Address1 nvarchar(50) NOT NULL,
	Address2 nvarchar(50) NULL,
	City nchar(10) NOT NULL,
	Phone char(12) NOT NULL,
	DateInSystem date NULL,
    primary key(CustomerNo)
	);  

CREATE INDEX LName ON newCustomersTable(Lname);

INSERT newCustomersTable
(LName, FName, MName, Address1, Address2, City, Phone,DateInSystem)
VALUES
('Круковский','Анатолий','Петрович','Лужная 15',NULL,'Харьков','(092)3212211','2009-11-20'),
('Дурнев','Виктор','Викторович','Зелинская 10',NULL,'Киев','(067)4242132','2009-11-20'),
('Унакий','Зигмунд','федорович','Дихтяревская 5',NULL,'Киев','(092)7612343','2009-11-20'),
('Левченко','Виталий','Викторович','Глущенка 5','Драйзера 12','Киев','(053)3456788','2009-11-20'),
('Выжлецов','Олег','Евстафьевич','Киевская 3','Одесская 8','Чернигов','(044)2134212','2009-11-20');

SELECT Fname FROM newCustomersTable WHERE LName = 'Унакий';
-- Таблица с индексом FName работает быстрее всего, с конкретным индексом таблице не нужно проходиться по всем значения --
EXPLAIN SELECT Fname FROM newCustomersTable WHERE LName = 'Унакий';

DROP TABLE newCustomersTable;
