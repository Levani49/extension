use Doggo	
go


CREATE TABLE Doggo
(
DoggoID TINYINT IDENTITY(1,1) PRIMARY KEY,
DoggoType VARBINARY(MAX)
)

CREATE TABLE Clans
(
ClanID INT IDENTITY(1,1) PRIMARY KEY,
ClanName NVARCHAR(40),
ClanTotalExp TINYINT,
ClanTotalLevel TINYINT
)

CREATE TABLE ExpMapping
(
ExpID TINYINT IDENTITY(1,1) PRIMARY KEY,
ExpAmount TINYINT
)

CREATE TABLE Items
(
ItemID INT IDENTITY(1,1) PRIMARY KEY,
ItemPhoto VARBINARY(MAX)
)

CREATE TABLE Colors
(
ColorID TINYINT IDENTITY(1,1) PRIMARY KEY,
Color CHAR(7)
)

CREATE TABLE Contents
(
ContentID INT IDENTITY(1,1) PRIMARY KEY,
ContentUrl NVARCHAR(MAX),
ContentDiv NVARCHAR(MAX)
)


CREATE TABLE Users
(
UserID INT identity(1,1) PRIMARY KEY,
Age TINYINT NOT NULL,
UserName NVARCHAR(30) NOT NULL,
LevelExp INT DEFAULT 0,
WeeklyExp INT DEFAULT 0,
CurrentLevel TINYINT DEFAULT 0,
ClanID INT DEFAULT NULL,
TotalCoins INT DEFAULT NULL,
ColorID TINYINT DEFAULT NULL,
ItemID INT DEFAULT NULL,
FOREIGN KEY (CurrentLevel) REFERENCES Doggo(DoggoID),
FOREIGN KEY (ClanID) REFERENCES Clans(ClanID),
FOREIGN KEY (ColorID) REFERENCES Colors(ColorID),
FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
)

CREATE TABLE Actions
(
ActionTypeID TINYINT PRIMARY KEY,
ActionTypeName VARCHAR(20)
)

CREATE TABLE UserActions
(
UserID INT,
ActionType TINYINT,
ActionDate DATETIME DEFAULT GETDATE(),
ExpType TINYINT,
ContentID INT
FOREIGN KEY (UserID) REFERENCES Users(UserID),
FOREIGN KEY (ExpType) REFERENCES ExpMapping(ExpID),
FOREIGN KEY (ContentID) REFERENCES Contents(COntentID),
FOREIGN KEY (ActionType) REFERENCES Actions(ActionTypeID),
PRIMARY KEY(UserID, ActionDate)
)





--CREATE DATABASE Doggo
--DROP DATABASE Doggo