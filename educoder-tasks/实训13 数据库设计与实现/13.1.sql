
DROP DATABASE if EXISTS flight_booking;
CREATE DATABASE flight_booking;
use flight_booking;

CREATE TABLE user(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    dob date NOT NULL,
    sex CHAR(1) NOT NULL,
    email VARCHAR(50),
    phone VARCHAR(30),
    username VARCHAR(20) NOT NULL UNIQUE,
    password CHAR(32) NOT NULL,
    admin_tag tinyint DEFAULT 0 NOT NULL
);

CREATE TABLE passenger(
     passenger_id INT AUTO_INCREMENT PRIMARY KEY,
     id CHAR(18)NOT NULL UNIQUE,
     firstname VARCHAR(50) NOT NULL,
     lastname VARCHAR(50) NOT NULL,
     mail VARCHAR(50),
     phone VARCHAR(20) NOT NULL,
     sex CHAR(1) NOT NULL,
     dob DATE     
);

CREATE TABLE airport (
     airport_id int AUTO_INCREMENT PRIMARY KEY,
     iata CHAR(3) NOT NULL UNIQUE,
     icao CHAR(4) NOT NULL UNIQUE,
     name VARCHAR(50) NOT NULL,
     city VARCHAR(50),
     country VARCHAR(50), 
     latitude NUMERIC(11, 8),
     longitude NUMERIC(11, 8),
     INDEX(name)
);

CREATE TABLE airline (
     airline_id int AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(30) NOT NULL,
     iata CHAR(2) NOT NULL UNIQUE,

     airport_id INTEGER NOT NULL,

     FOREIGN KEY(airport_id) REFERENCES airport(airport_id)
);

CREATE TABLE airplane (
     airplane_id INTEGER PRIMARY KEY AUTO_INCREMENT,
     type VARCHAR(50) NOT NULL,
     capacity SMALLINT NOT NULL,
     identifier VARCHAR(50) NOT NULL,

     airline_id INTEGER NOT NULL,

     FOREIGN KEY(airline_id) REFERENCES airline(airline_id)
);

create table flightschedule (
     flight_no char(8) primary key,
     departure time not null,
     arrival time not null,
     duration smallint not null,
     monday tinyint default 0,
     tuesday tinyint default 0,
     wednesday tinyint default 0,
     thursday tinyint default 0,
     friday tinyint default 0,
     saturday tinyint default 0,
     sunday tinyint default 0,

     airline_id INTEGER not null,
     `from` INTEGER not null,
     `to` INTEGER not null,

     foreign key(airline_id) references airline(airline_id),
     foreign key(`from`) references airport(airport_id),
     foreign key(`to`) references airport(airport_id)     
);
CREATE TABLE flight (
     flight_id INTEGER AUTO_INCREMENT PRIMARY KEY,
     departure DATETIME NOT NULL,
     arrival DATETIME NOT NULL,
     duration SMALLINT NOT NULL,

    airline_id INTEGER NOT NULL,
    airplane_id INTEGER NOT NULL,
    flight_no CHAR(8) NOT NULL,
    `from` int NOT NULL,
     `to` INTEGER NOT NULL,

     FOREIGN KEY(airline_id) REFERENCES airline(airline_id),
     FOREIGN KEY(airplane_id) REFERENCES airplane(airplane_id),
     FOREIGN KEY(flight_no) REFERENCES flightschedule(flight_no),
     FOREIGN KEY(`from`) REFERENCES airport(airport_id),
     FOREIGN KEY(`to`) REFERENCES airport(airport_id)
);

CREATE TABLE ticket (
     ticket_id int AUTO_INCREMENT PRIMARY KEY,
     seat CHAR(4),
     price NUMERIC(10, 2) NOT NULL,

     flight_id INTEGER NOT NULL,
     passenger_id INTEGER NOT NULL,
     user_id INTEGER NOT NULL,
     
     FOREIGN KEY(passenger_id) REFERENCES passenger(passenger_id),
     FOREIGN KEY(user_id) REFERENCES user(user_id),
     FOREIGN KEY(flight_id) REFERENCES flight(flight_id)
);

