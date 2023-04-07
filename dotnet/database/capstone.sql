USE master
GO

-- Drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

-- Create Tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)

-- Populate default data for testing: user and admin with password of 'password'
-- These values should not be kept when going to Production
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');
GO

CREATE TABLE coffee_shops (
	shop_id int IDENTITY(1,1) NOT NULL,
	shop_name varchar(50) NOT NULL,
	shop_location nvarchar(150) NOT NULL,
	about_shop nvarchar (500),
	shop_has_food bit, 
	CONSTRAINT PK_shop_id PRIMARY KEY (shop_id)
	)

INSERT INTO coffee_shops (shop_name, shop_location, about_shop, shop_has_food) VALUES 
('Stauf''s Italian Village', '1334 Neil Ave, Columbus, OH 43201', NULL, 1),
('Stauf''s German Village', '627 S. 3rd St. Columbus, OH 43206', NULL, 1),
('Stauf''s Grandview', '1277 Grandview Ave, Columbus, OH 43212', NULL, 1),
('Fox in the Snow', '1031 N 4th St, Columbus, OH 43201', NULL, 1),
('Roaming Goat', '849 N High St, Columbus, OH 43215', NULL, 1),
('Chocolate Cafe', '1855 Northwest Blvd, Columbus, OH 43212', NULL, 1),
('Winans Chocolate + Coffee + Wine', '1125 Yard St, Grandview Heights, OH 43212', NULL, 1),
('The Roosevelt Coffeehouse at Gravity', '462 W Broad St, Columbus, OH 43215', NULL, 1),
('The Roosevelt Coffeehouse', '300 E Long St, Columbus, OH 43215', NULL, 1),
('Global Gallery', '3535 N High St, Columbus, OH 43214', NULL , 1),
('Cafe De Nook','175 S 3rd St, Columbus, OH 43215', NULL, 1),
('One Line', '745 N High St, Columbus, OH 43215', NULL, 1),
('Parable Coffee', '149 S High St, Columbus, OH 43215', NULL, 1),
('Thirdway Cafe', '3058 W Broad St, Columbus, OH 43204', NULL, 1);
GO

SELECT * FROM coffee_shops

