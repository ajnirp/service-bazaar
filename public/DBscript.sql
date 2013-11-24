

use service_bazaar;

create table buyers(
	id int primary key,
	username varchar(30) unique references User(username),
	password varchar(20) check (len(password)>=6),
	latitude float,
	longitude float,
	realName varchar(60),
	dateOfBirth date,
	emailID varchar(40)
);

create table vendors(
	id int primary key,
	username varchar(30) unique references User(username),
	password varchar(20) check (len(password)>=6),
	latitude float,
	longitude float,
	realName varchar(60),
	dateOfBirth date,
	emailID varchar(40),
	rating double check(rating >= 0 and rating <=5)
);

create table buyervendors(
	id int primary key,
	username varchar(30) unique references User(username),
	password varchar(20) check (len(password)>=6),
	latitude float,
	longitude float,
	realName varchar(60),
	dateOfBirth date,
	emailID varchar(40),
	rating double check(rating >= 0 and rating <=5)
);

create trigger buyer_insert after insert on users
	for each row insert into buyers(id,username,latitude,longitude,realName,dateOfBirth,emailID,password) values(NEW.id, NEW.username, NEW.latitude, NEW.longitude, NEW.realName, NEW.dateOfBirth, NEW.emailID, NEW.password);
create trigger vendor_insert after insert on users
	for each row insert into vendors(id,username,latitude,longitude,realName,dateOfBirth,emailID,password,rating) values(n.id, n.username, n.latitude, n.longitude, n.realName, n.dateOfBirth, n.emailID, n.password,0);
        
create trigger buyervendor_insert after insert on users
	insert into buyervendors(id,username,latitude,longitude,realName,dateOfBirth,emailID,password,rating) values(n.id, n.username, n.latitude, n.longitude, n.realName, n.dateOfBirth, n.emailID, n.password,0);
    


delimiter //
create trigger vendor_insert after insert on users
    for each row
    begin
        insert into buyers(id,username,latitude,longitude,realName,dateOfBirth,emailID,password) values(NEW.id, NEW.username, NEW.latitude, NEW.longitude, NEW.realName, NEW.dateOfBirth, NEW.emailID, NEW.password);
        insert into vendors(id,username,latitude,longitude,realName,dateOfBirth,emailID,password,rating) values(NEW.id, NEW.username, NEW.latitude, NEW.longitude, NEW.realName, NEW.dateOfBirth, NEW.emailID, NEW.password,0);
        insert into buyervendors(id,username,latitude,longitude,realName,dateOfBirth,emailID,password,rating) values(NEW.id, NEW.username, NEW.latitude, NEW.longitude, NEW.realName, NEW.dateOfBirth, NEW.emailID, NEW.password,0);
    end;//
    delimiter ;

delimiter //
create trigger vendor_update after update on users
    for each row
    begin
        update buyers set latitude=NEW.latitude, longitude= NEW.longitude, realName=NEW.realName, dateOfBirth= NEW.dateOfBirth, emailID= NEW.emailID, password= NEW.password where id=OLD.id;
        update vendors set latitude=NEW.latitude, longitude= NEW.longitude, realName=NEW.realName,dateOfBirth= NEW.dateOfBirth,emailID= NEW.emailID,password= NEW.password where id=OLD.id;
        update buyervendors set latitude=NEW.latitude, longitude= NEW.longitude, realName=NEW.realName,dateOfBirth= NEW.dateOfBirth,emailID= NEW.emailID,password= NEW.password where id=OLD.id;
    end;//
    delimiter ;



################remaining!!!!!!!


create table liesins(
	categoryID integer references Category(categoryID),
	serviceID integer references Service(ServiceID),
	primary key(serviceID, categoryID)
);


create table feedbackfors(
	feedbackID integer references Feedback(feedbackID),
	buyerName varchar(30) references Buyer(username),
	serviceID integer references Service(serviceID),
	primary key(buyerName, serviceID)
);


create table exchanges(
	senderName varchar(30) references User(username),
	receiverName varchar(30) references User(username),
	messageID integer references Message(messageID),
	primary key(senderName, receiverName, messageID)
);


create table offers(
	vendorName varchar(30) references Vendor(username),
	serviceID integer references OfferedService(serviceID),
	primary key(serviceID, vendorName)
);

-- triggers

create trigger vendor_insert
	after insert on users
	referencing new row as n
	for each row
	begin
		insert into buyers(id,username,latitude,longitude,realName,dateOfBirth,emailID,password) values(n.id, n.username, n.latitude, n.longitude, n.realName, n.dateOfBirth, n.emailID, n.password)
		insert into vendors(id,username,latitude,longitude,realName,dateOfBirth,emailID,password,rating) values(n.id, n.username, n.latitude, n.longitude, n.realName, n.dateOfBirth, n.emailID, n.password,0)
		insert into buyervendors(id,username,latitude,longitude,realName,dateOfBirth,emailID,password,rating) values(n.id, n.username, n.latitude, n.longitude, n.realName, n.dateOfBirth, n.emailID, n.password,0)
	end;