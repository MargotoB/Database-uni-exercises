-- LAB 1
DROP DATABASE IF EXISTS  `2024_TU`;
CREATE DATABASE `2024_TU`;
USE `2024_TU`;
 
CREATE TABLE publisher (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  country VARCHAR(20) NOT NULL
);
 
CREATE TABLE book (
  id INT AUTO_INCREMENT PRIMARY KEY,
  ISBN CHAR(13) NOT NULL UNIQUE,
  title VARCHAR(100) NOT NULL,
  price DECIMAL(10,0) NOT NULL DEFAULT '0',
  category VARCHAR(20) NOT NULL,
  publisher_id INT NOT NULL
);
 
CREATE TABLE reader (
  id INT AUTO_INCREMENT  PRIMARY KEY,
  email VARCHAR(320) NOT NULL UNIQUE,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  address VARCHAR(100) NOT NULL,
  sex ENUM('male','female','other') NOT NULL,
  phone_no VARCHAR(100)
);
 
CREATE TABLE staff (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);
 
CREATE TABLE account (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(320) UNIQUE,
  password VARCHAR(100) NOT NULL
);
 
 
CREATE TABLE book_reader (
  book_id INT NOT NULL,
  reader_id INT NOT NULL,
  date_taken DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  date_returned DATETIME,
  PRIMARY KEY (book_id,reader_id),
  CONSTRAINT FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT FOREIGN KEY (reader_id) REFERENCES reader(id)
);
 
ALTER TABLE book
ADD CONSTRAINT FOREIGN KEY(publisher_id) REFERENCES publisher(id);
 
ALTER TABLE reader
ADD account_id INT UNIQUE;
ALTER TABLE reader
ADD CONSTRAINT FOREIGN KEY(account_id) REFERENCES account(id);
 
ALTER TABLE staff
ADD account_id INT UNIQUE;
ALTER TABLE staff
ADD CONSTRAINT FOREIGN KEY(account_id) REFERENCES account(id);
 
ALTER TABLE reader
ADD staff_id INT;
ALTER TABLE reader
ADD CONSTRAINT FOREIGN KEY(staff_id) REFERENCES staff(id);
 
ALTER TABLE book
ADD maintained_by INT;
ALTER TABLE book
ADD CONSTRAINT FOREIGN KEY(maintained_by) REFERENCES staff(id);
 
CREATE TABLE author (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) UNIQUE
);
ALTER TABLE book
ADD author_id INT;
ALTER TABLE book
ADD CONSTRAINT FOREIGN KEY(author_id) REFERENCES author(id);
 
INSERT INTO publisher (name, country)
VALUES
    ('Penguin Random House', 'USA'),
    ('HarperCollins', 'USA'),
    ('Hachette Livre', 'France'),
    ('Springer Nature', 'Germany'),
    ('Macmillan Publishers', 'UK'),
    ('Simon & Schuster', 'USA'),
    ('Pearson', 'UK'),
    ('Wiley', 'USA'),
    ('Oxford University Press', 'UK'),
    ('Random House', 'USA'),
    ('Scholastic', 'USA'),
    ('Cambridge University Press', 'UK'),
    ('Elsevier', 'Netherlands'),
    ('Bloomsbury Publishing', 'UK'),
    ('McGraw-Hill Education', 'USA'),
    ('Cengage Learning', 'USA'),
    ('Penguin Books', 'UK'),
    ('Houghton Mifflin Harcourt', 'USA'),
    ('Taylor & Francis', 'UK'),
    ('John Wiley & Sons', 'USA');
 
INSERT INTO account (username, password)
VALUES
    ('john_doe', 'JD@2024'),
    ('jane_smith', 'JS@1234'),
    ('mike_jones', 'MJpass987'),
    ('sara_williams', 'SW@password'),
    ('chris_brown', 'CBpass@123'),
    ('emily_jackson', 'EJ!pass'),
    ('david_clark', 'DCpass#789'),
    ('amy_taylor', 'AT@2024'),
    ('kevin_white', 'KWpass123!'),
    ('lisa_johnson', 'LJpass5678'),
    ('steve_miller', 'SM@pass2024'),
    ('rachel_green', 'RG!pass123'),
    ('alex_thompson', 'AT123@pass'),
    ('olivia_harris', 'OH@9876pass'),
    ('brandon_lee', 'BLpass#2024'),
    ('natalie_baker', 'NBpass!4321'),
    ('adam_robinson', 'ARpass@2024'),
    ('jennifer_davis', 'JDpass#2024'),
    ('ryan_moore', 'RM@pass123'),
    ('sophia_martin', 'SMpass@987');
 
INSERT INTO author (name)
VALUES
    ('John Smith'),
    ('Jane Doe'),
    ('Michael Johnson'),
    ('Sarah Williams'),
    ('Chris Brown'),
    ('Emily Wilson'),
    ('David Clark'),
    ('Amy Taylor'),
    ('Kevin White'),
    ('Lisa Johnson'),
    ('Steven Miller'),
    ('Rachel Green'),
    ('Alex Thompson'),
    ('Olivia Harris'),
    ('Brandon Lee'),
    ('Natalie Baker'),
    ('Adam Robinson'),
    ('Jennifer Davis'),
    ('Ryan Moore'),
    ('Sophia Martin');
 
INSERT INTO staff (name, account_id)
VALUES
    ('John Admin', 1),
    ('Jane Admin', 2),
    ('Michael Manager', 3),
    ('Samantha Smith', 4),
    ('David Johnson', 5),
    ('Emily Brown', 6),
    ('Robert Davis', 7),
    ('Jessica Wilson', 8),
    ('Christopher Taylor', 9),
    ('Ashley Martinez', 10),
    ('Daniel Anderson', 11),
    ('Jennifer Thomas', 12),
    ('Matthew Lee', 13),
    ('Amanda Harris', 14),
    ('Kevin White', 15),
    ('Laura Garcia', 16),
    ('James Martinez', 17),
    ('Michelle Robinson', 18),
    ('Brian Clark', 19),
    ('Stephanie Lewis', 20);
 
INSERT INTO book (ISBN, title, price, category, publisher_id, maintained_by, author_id)
VALUES
    ('9780547928227', 'Harry Potter and the Sorcerer''s Stone', 20, 'Fiction', 1, 1, 1),
    ('9780439064866', 'Harry Potter and the Chamber of Secrets', 22, 'Fiction', 2, 2, 1),
    ('9780439136365', 'Harry Potter and the Prisoner of Azkaban', 25, 'Fiction', 3, 3, 1),
    ('9780439139601', 'Harry Potter and the Goblet of Fire', 30, 'Fiction', 4, 4, 1),
    ('9780439358071', 'Harry Potter and the Order of the Phoenix', 28, 'Fiction', 5, 5, 1),
    ('9780439784542', 'Harry Potter and the Half-Blood Prince', 27, 'Fiction', 6, 6, 1),
    ('9780545010221', 'Harry Potter and the Deathly Hallows', 32, 'Fiction', 7, 7, 1),
    ('9780312676849', 'The Hunger Games', 18, 'Young Adult', 8, 8, 2),
    ('9780439023481', 'Twilight', 15, 'Young Adult', 9, 9, 2),
    ('9780375831003', 'Eragon', 20, 'Fantasy', 10, 10, 2),
    ('9780141439600', 'Pride and Prejudice', 12, 'Classic', 1, 1, 3),
    ('9780140620590', 'To Kill a Mockingbird', 13, 'Classic', 2, 2, 3),
    ('9780743273565', 'The Da Vinci Code', 16, 'Mystery', 3, 3, 4),
    ('9780385514231', 'The Girl with the Dragon Tattoo', 18, 'Mystery', 4, 4, NULL),
    ('9780385537858', 'Inferno', 19, 'Mystery', 5, 5, NULL),
    ('9780547577319', 'The Hobbit', 22, 'Fantasy', 6, 6, NULL),
    ('9780553283686', 'A Game of Thrones', 25, 'Fantasy', 7, 7, NULL),
    ('9780345337664', 'The Fellowship of the Ring', 21, 'Fantasy', 8, 8, NULL),
    ('9780345339705', 'The Two Towers', 20, 'Fantasy', 9, 9, NULL),
    ('9780345342965', 'The Return of the King', 23, 'Fantasy', 10, 10, NULL);
 
INSERT INTO reader (email, first_name, last_name, address, sex, phone_no, account_id, staff_id)
VALUES
    ('john.doe@example.com', 'John', 'Doe', '123 Main St, Anytown, USA', 'male', '123-456-7890', 1, 1),
    ('jane.smith@example.com', 'Jane', 'Smith', '456 Elm St, Othertown, USA', 'female', '987-654-3210', 2, 2),
    ('mike.jones@example.com', 'Mike', 'Jones', '789 Oak St, Another Town, USA', 'male', '555-123-4567', 3, 3),
    ('sarah.williams@example.com', 'Sarah', 'Williams', '321 Maple St, Somewhere, USA', 'female', '777-888-9999', 4, 4),
    ('chris.brown@example.com', 'Chris', 'Brown', '654 Pine St, Anywhere, USA', 'male', '444-555-6666', 5, 5),
    ('emily.wilson@example.com', 'Emily', 'Wilson', '987 Cedar St, Nowhere, USA', 'female', '222-333-4444', 6, 6),
    ('david.clark@example.com', 'David', 'Clark', '456 Birch St, Elsewhere, USA', 'male', '111-222-3333', 7, 7),
    ('amy.taylor@example.com', 'Amy', 'Taylor', '789 Spruce St, Here, USA', 'female', '999-888-7777', 8, 8),
    ('kevin.white@example.com', 'Kevin', 'White', '147 Oakwood Dr, Anytown, USA', 'male', '777-666-5555', 9, 9),
    ('lisa.johnson@example.com', 'Lisa', 'Johnson', '258 Maplewood Dr, Anywhere, USA', 'female', '333-222-1111', 10, 10),
    ('steven.miller@example.com', 'Steven', 'Miller', '369 Elmwood Dr, Anywhere, USA', 'male', '111-222-3333', 11, 1),
    ('rachel.green@example.com', 'Rachel', 'Green', '987 Birchwood Dr, Anywhere, USA', 'female', '444-555-6666', 12, 2),
    ('alex.thompson@example.com', 'Alex', 'Thompson', '741 Pinebrook Dr, Anywhere, USA', 'male', '777-888-9999', 13, 3),
    ('olivia.harris@example.com', 'Olivia', 'Harris', '852 Maplehurst Dr, Anywhere, USA', 'female', '333-444-5555', 14, 4),
    ('brandon.lee@example.com', 'Brandon', 'Lee', '963 Cedarhurst Dr, Anywhere, USA', 'male', '999-888-7777', 15, 5),
    ('natalie.baker@example.com', 'Natalie', 'Baker', '147 Birchhill Dr, Anywhere, USA', 'female', '666-555-4444', 16, 6),
    ('adam.robinson@example.com', 'Adam', 'Robinson', '258 Elmwood Dr, Anywhere, USA', 'male', '222-333-4444', 17, 7),
    ('jennifer.davis@example.com', 'Jennifer', 'Davis', '369 Maplewood Dr, Anywhere, USA', 'female', '555-666-7777', 18, 8),
    ('ryan.moore@example.com', 'Ryan', 'Moore', '741 Oakwood Dr, Anywhere, USA', 'male', '888-999-0000', 19, 9),
    ('sophia.martin@example.com', 'Sophia', 'Martin', '852 Pinebrook Dr, Anywhere, USA', 'female', '111-222-3333', 20, 10);
 
INSERT INTO book_reader (book_id, reader_id, date_taken, date_returned)
VALUES
    (1, 1, '2023-01-05', '2023-01-15'),
    (2, 2, '2023-02-10', NULL),
    (3, 3, '2023-03-20', '2023-03-30'),
    (4, 4, '2023-04-25', NULL),
    (5, 5, '2023-05-03', '2023-05-13'),
    (6, 6, '2023-06-15', NULL),
    (7, 7, '2023-07-20', '2023-07-30'),
    (8, 8, '2023-08-08', NULL),
    (9, 9, '2023-09-12', '2023-09-22'),
    (10, 10, '2023-10-30', NULL),
    (1, 2, '2023-01-10', '2023-01-20'),
    (2, 3, '2023-02-15', NULL),
    (3, 4, '2023-03-25', '2023-04-05'),
    (4, 5, '2023-04-10', NULL),
    (5, 6, '2023-05-20', '2023-05-30'),
    (6, 7, '2023-06-01', NULL),
    (7, 8, '2023-07-05', '2023-07-15'),
    (8, 9, '2023-08-18', NULL),
    (9, 10, '2023-09-22', '2023-10-02'),
    (10, 1, '2023-10-05', NULL);
    
    -- lab 2
UPDATE account
SET username = "reader11"
WHERE id=1;

DELETE FROM book
WHERE id = 1;

SELECT * FROM book
WHERE price BETWEEN 20 AND 35;

SELECT * FROM reader
WHERE sex = "female";

SELECT * FROM reader
WHERE first_name = "Георги" AND last_name = "Георгиев";

-- lab 3
SELECT  reader.first_name, reader.last_name 
FROM reader 
LEFT JOIN book_reader ON book_reader.reader_id = reader.id
WHERE book_reader.reader_id IS NULL;


SELECT book.title AS book, author.name AS author
FROM book
LEFT JOIN author ON book.author_id = author.id; 


SELECT book.title AS book, publisher.country AS country
FROM book
LEFT JOIN publisher ON book.publisher_id = publisher.id;


SELECT b.title
FROM book as b
WHERE b.id IN( 
	SELECT br.book_id
    FROM book_reader AS br
    WHERE br.reader_id IN(
    SELECT r.id 
    FROM reader AS r
		WHERE r.email LIKE "%@example.com")
);


SELECT r.first_name, r.last_name
FROM reader as r
WHERE id IN(
	SELECT br.reader_id 
    FROM book_reader AS br
    WHERE YEAR(br.date_taken) = 2023
);

-- lab 4
SELECT title AS 'Заглавие' FROM book
WHERE book.price IN (10,15,50);

SELECT b.id, b.title AS 'Заглавие', p.name AS 'Издателство', p.country AS 'Държава'
FROM book AS b
JOIN publisher AS p ON b.publisher_id = p.id;

(SELECT reader.first_name AS 'Име на читател'
FROM reader)
UNION ALL
(SELECT staff.name AS 'Име на служител'
FROM staff);

ALTER TABLE publisher
ADD parent_publisher_id INT;
ALTER TABLE publisher ADD FOREIGN KEY (parent_publisher_id) REFERENCES publisher(id); 

SELECT * FROM publisher AS p
LEFT JOIN publisher ON p.parent_publisher_id = publisher.id;

SELECT reader.first_name AS 'Име', reader.last_name AS 'Фамилия', reader.email AS 'Имейл', reader.address AS 'Адрес'
FROM reader
WHERE reader.email IN(SElECT email FROM reader WHERE email LIKE '%@gmail.com');

-- lab5
SELECT COUNT(*)
FROM publisher
WHERE country = 'USA';

SELECT country, COUNT(*) as pub_num
FROM publisher
GROUP BY country;

SELECT reader_id, COUNT(*)
FROM book_reader
GROUP BY reader_id
HAVING COUNT(*) > 2;

INSERT INTO book_reader(book_id, reader_id, date_taken, date_returned)
VALUES 
(7, 4, "2025-06-21", "2025-07-17"),
(8, 2, "2025-06-30", "2025-08-01"),
(9, 2, "2025-08-10", "2025-09-11");

CREATE VIEW book_views_emily AS 
SELECT b.id, b.ISBN, b.publisher_id, b.title, b.category, b.price
FROM book AS b
JOIN reader AS r ON b.id = r.id
JOIN book_reader AS br ON br.book_id = r.id
WHERE CONCAT(r.first_name, ' ', r.last_name) LIKE 'Emily Wilson';

SELECT SUM(price) FROM book_views_emily;

SELECT p.name AS publisher_name, 
       b.price AS highest_price, 
       COUNT(br.reader_id) AS num_readers
FROM book AS b
JOIN publisher AS p ON b.publisher_id = p.id
LEFT JOIN book_reader AS braccount ON b.id = br.book_id
WHERE b.price = (
    SELECT MAX(price) 
    FROM book 
    WHERE publisher_id = p.id
)
GROUP BY p.name, b.price;


-- lab6

ALTER TABLE book 
ADD CONSTRAINT publisher_id 
FOREIGN KEY(publisher_id) REFERENCES publisher(id) ON DELETE RESTRICT;


CREATE TABLE bookRent(
	id INT AUTO_INCREMENT PRIMARY KEY,
    cost DECIMAL(10,2),
    datepaid DATETIME,
    paid BOOLEAN,
    readerID INT NOT NULL,
    FOREIGN KEY(readerID) REFERENCES reader(id) ON UPDATE CASCADE ON DELETE CASCADE
);


INSERT INTO bookRent (cost, datepaid, paid, readerID)
VALUES 
(12.50, '2024-03-01 10:30:00', TRUE, 1),
(15.00, '2024-03-03 14:45:00', FALSE, 2),
(18.75, '2024-03-05 09:15:00', TRUE, 3),
(10.00, '2024-03-07 16:00:00', FALSE, 1), 
(20.30, '2024-03-09 11:20:00', TRUE, 2), 
(22.90, '2024-03-11 13:10:00', FALSE, 3);


BEGIN;
UPDATE bookRent
SET cost = cost - 10 WHERE id = 2;
UPDATE bookRent
SET cost = cost + 10 WHERE id = 1;
COMMIT;


ALTER TABLE bookRent
ADD CONSTRAINT id 
FOREIGN KEY (id) REFERENCES book(id) ON UPDATE CASCADE;


BEGIN;
SET FOREIGN_KEY_CHECKS = 0;
    DELETE FROM account;
    DELETE FROM author;
    DELETE FROM book;
    DELETE FROM book_reader;
    DELETE FROM bookrent;
    DELETE FROM reader;
    DELETE FROM publisher;
    DELETE FROM staff;
SET FOREIGN_KEY_CHECKS = 1;
ROLLBACK;


-- lab 7

DELIMITER |

CREATE PROCEDURE getPublisherWithBooks(IN min_books INT)
BEGIN
    DECLARE cnt INT;
    
    SELECT COUNT(*) INTO cnt FROM (
        SELECT publisher_id FROM book GROUP BY publisher_id HAVING COUNT(id) > min_books
    ) AS subquery;
    
    IF cnt = 0 THEN
        INSERT INTO book (ISBN, title, price, category, publisher_id, maintained_by, author_id) 
        VALUES ('9789999999991', 'New Book A', 20, 'Fiction', 1, 1, 1),
               ('9789999999992', 'New Book B', 25, 'Fiction', 2, 2, 2),
               ('9789999999993', 'New Book C', 30, 'Fantasy', 1, 3, 3);
    END IF;
    
    SELECT p.id, p.name, COUNT(b.id) AS book_count
    FROM book AS b
    JOIN publisher p ON b.publisher_id = p.id
    GROUP BY p.id, p.name
    HAVING COUNT(b.id) > min_books;
END |


CREATE PROCEDURE readerBookSum(IN reader_id INT, OUT total_price DECIMAL(10,2))
BEGIN
    SELECT COALESCE(SUM(b.price), 0) INTO total_price
    FROM book AS b
    JOIN book_reader br ON b.id = br.book_id
    WHERE br.reader_id = reader_id;
END |


CREATE PROCEDURE increaseBookPrices(IN reader_id INT)
BEGIN
    UPDATE book 
    SET price = price * 1.10
    WHERE id IN (SELECT book_id FROM book_reader WHERE reader_id = reader_id);
END |


CREATE PROCEDURE increaseAndGetTotal(IN reader_id INT, OUT updated_total DECIMAL(10,2))
BEGIN
    UPDATE book 
    SET price = price * 1.10
    WHERE id IN (SELECT book_id FROM book_reader WHERE reader_id = reader_id);
    
    SELECT SUM(price) * 1.05  INTO updated_total
    FROM book
    WHERE id IN (SELECT book_id FROM book_reader WHERE reader_id = reader_id);
END |

DELIMITER ;


CALL getPublisherWithBooks(2);

CALL readerBookSum(1, @total);
SELECT @total;

CALL increaseBookPrices(1);

CALL increaseAndGetTotal(1, @new_total);
SELECT @new_total;


-- lab 8
DELIMITER |

CREATE PROCEDURE addNewBook(IN ISBN CHAR(13), IN title VARCHAR(100), IN price DECIMAL(10,0), IN category VARCHAR(20),
IN publisher_id INT, IN maintained_by INT, IN author_id INT)
BEGIN
    DECLARE pubCount INT DEFAULT 0;
    DECLARE authCount INT DEFAULT 0;
    DECLARE bookExists INT DEFAULT 0;

    SELECT COUNT(*) INTO pubCount FROM publisher WHERE id = publisher_id;
    IF pubCount = 0 THEN
        INSERT INTO publisher (id, name)
        VALUES (publisher_id, CONCAT('Publisher ', publisher_id));
    END IF;

    SELECT COUNT(*) INTO authCount FROM author WHERE id = author_id;
    IF authCount = 0 THEN
        INSERT INTO author (id, name)
        VALUES (author_id, CONCAT('Author ', author_id));
    END IF;

  INSERT INTO book (isbn, title, price, category, publisher_id, maintained_by, author_id)
        VALUES (ISBN, title, price, category, publisher_id, maintained_by, author_id);

    SELECT COUNT(*) INTO bookExists FROM book WHERE isbn LIKE ISBN;

    IF bookExists = 0 THEN
        SELECT 'Add successfull' AS Message;
    ELSEIF bookExists = 1 THEN 
        SELECT 'Not added successfull' AS Message;
	ELSE
		SELECT 'Error' AS Message;
    END IF;
END |
DELIMITER ;

CALL addNewBook("3456789308753", "New book", 13, "comedy", 6,6,1);


DELIMITER |
CREATE PROCEDURE reportReadersBySex()
BEGIN
    SELECT sex, COUNT(*) AS readerCount, GROUP_CONCAT(CONCAT(first_name, ', ', last_name)) AS reader_names
    FROM reader
    GROUP BY sex;
END |
DELIMITER ;

CALL reportReadersBySex();



DELIMITER |
CREATE PROCEDURE generateBooksReport()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE book_id INT;
    DECLARE book_title VARCHAR(100);
    DECLARE book_ISBN CHAR(13);
    DECLARE book_category VARCHAR(20);
    DECLARE book_price DECIMAL(10,2);
    DECLARE taken_copies INT;

    DECLARE book_cursor CURSOR FOR
        SELECT b.id, b.title, b.ISBN, b.category, b.price, IFNULL(COUNT(br.book_id), 0) AS taken_copies
        FROM book b
        LEFT JOIN book_reader br ON b.id = br.book_id
        GROUP BY b.id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    CREATE TEMPORARY TABLE temp_report (
        title VARCHAR(100),
        ISBN CHAR(13),
        category VARCHAR(20),
        price DECIMAL(10,2),
        taken_copies INT
    );

    OPEN book_cursor;
    
    read_loop: LOOP
        FETCH book_cursor INTO book_id, book_title, book_ISBN, book_category, book_price, taken_copies;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        SET book_price = CASE
            WHEN taken_copies = 0 THEN book_price * 0.50   
            WHEN taken_copies = 1 THEN book_price * 0.75   
            WHEN taken_copies >= 2 THEN book_price * 1.05  
            ELSE book_price
        END;
        
        INSERT INTO temp_report (title, ISBN, category, price, taken_copies)
        VALUES (book_title, book_ISBN, book_category, book_price, taken_copies);
    END LOOP;
    
    CLOSE book_cursor;

    SELECT * FROM temp_report;

    DROP TEMPORARY TABLE IF EXISTS temp_report;
END |
DELIMITER ;

CALL generateBooksReport;


-- lab 9
CREATE TEMPORARY TABLE holder(
	first_name VARCHAR(50),
    last_name VARCHAR(50),
    address VARCHAR(50),
    phone_no INT
);
DELIMITER /
CREATE TRIGGER booktracker BEFORE DELETE ON book
FOR EACH ROW
BEGIN
INSERT INTO holder
SELECT first_name, last_name, address, phone_no FROM reader
WHERE id = OLD.id;

END;
/ 
DELIMITER ;


DELIMITER /
CREATE TRIGGER new_price BEFORE UPDATE ON book
FOR EACH ROW
BEGIN 
DECLARE reader_count INT;

IF(OLD.price > NEW.price) THEN
SET NEW.price = NEW.price*1.05;

ELSEIF(OLD.price<NEW.price) THEN 
SELECT COUNT(*) INTO reader_count FROM book_reader 
WHERE book.id = OLD.book.id;

	IF(reader_count>3) THEN
    SET reader_count = 3;
    END IF;
SET NEW.price = NEW.price*(1-(0.3*reader_count));
END IF;
END;
/
DELIMITER ;
    
    
DELIMITER /
CREATE EVENT price_up ON SCHEDULE EVERY 1 DAY STARTS current_timestamp
DO BEGIN
IF(book_reader.date_taken < (current_date()- INTERVAL 1 MONTH))
THEN
UPDATE book
SET price = price+2
WHERE id IN(SELECT book_id FROM book_reader WHERE date_taken < (current_date() - INTERVAL 1 MONTH));

ELSEIF (book_reader.date_taken < (current_date() - INTERVAL 2 MONTH))
THEN UPDATE book
SET price = price+10
WHERE id IN(SELECT book_id FROM book_reader WHERE date_taken < (current_date() - INTERVAL 2 MONTH));
END IF;
END;
/
DELIMITER ;

 
 

