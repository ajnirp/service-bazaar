--create table categories(
--	categoryID integer primary key auto_increment,
--	Name varchar(40),
--	Description varchar(500)
--);

--create table services(
--	serviceID integer primary key auto_increment,
--	title varchar(100),
--	description varchar(500),
--	visibility integer
--);

--create table feedbacks(
--	feedbackID integer primary key auto_increment,
--	rating double check (rating >= 0 and rating <= 5),
--	review varchar(4000)
--);

--create table messages(
--	messageID integer primary key auto_increment,
--	messageDate date,
--	subject varchar(100),
--	messageText varchar(2000)
--);

--create table listings(
--	serviceID integer,
--	listingID integer,
--	minPrice float,
--	maxPrice float,
--	startingTime time,
--	endingTime time,
--	startDate date,
--	endDate date,
--	latitudeLocation float,
--	longitudeLocation float,
--	listingDescription varchar(100),
--	availability varchar(20) check(availability='Everywhere' or availability='Restricted' or availability='WalkIn'),
--	availabilityDistance double,
--	primary key(serviceID, listingID)
--);

--create table appointments(
--	buyerName varchar(30) references Buyer(username),
--	listingID integer references Listing(ListingID),
--	serviceID integer references Service(serviceID),
--	price float,
--	isConfirmed boolean,
--	primary key(buyerName, listingID, serviceID)
--);

