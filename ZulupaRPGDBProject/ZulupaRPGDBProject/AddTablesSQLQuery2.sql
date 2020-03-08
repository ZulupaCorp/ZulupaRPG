USE ZulupaRPGDB;

--//-------------Countries-------------//--
CREATE TABLE CountryStatuses
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Countries
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) UNIQUE NOT NULL,
	StatusId INT NOT NULL,
	CONSTRAINT FK_Countries_To_CountryStatuses FOREIGN KEY (StatusId)  REFERENCES CountryStatuses (Id)
);

CREATE TABLE SettlementStatuses
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Settlements
(
    Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(50) NOT NULL UNIQUE,
	Population INT NOT NULL,
	StatusId INT NOT NULL,
	CountrieId INT NOT NULL,
	CONSTRAINT FK_Settlements_To_SettlementStatuses FOREIGN KEY (StatusId)  REFERENCES SettlementStatuses (Id),
	CONSTRAINT FK_Settlements_To_Countries FOREIGN KEY (CountrieId)  REFERENCES Countries (Id)
);

CREATE TABLE Wars
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) NOT NULL UNIQUE,
	StartDate DATETIME2 NOT NULL,
	EndDate DATETIME2 NOT NULL,
	FirstSideId INT NOT NULL,
	SecondSideId INT NOT NULL,
	WinnerId INT NULL,
	CONSTRAINT FK_Wars_To_CountriesFirst FOREIGN KEY (FirstSideId) REFERENCES Countries (Id),
	CONSTRAINT FK_Wars_To_CountriesSecond FOREIGN KEY (SecondSideId) REFERENCES Countries (Id),
	CONSTRAINT FK_Wars_To_CountriesWinner FOREIGN KEY (WinnerId) REFERENCES Countries (Id)
);

--//-------------Heroes-------------//--
CREATE TABLE Races
(
    Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Classes
(
    Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Heroes
(
    Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(50) NOT NULL UNIQUE,
	homelandId INT NOT NULL,
	ClassId INT NOT NULL,
	RaceId INT NOT NULL,
	CONSTRAINT FK_Heroes_To_Settlements FOREIGN KEY (homelandId)  REFERENCES Settlements (Id),
	CONSTRAINT FK_Heroes_To_Classes FOREIGN KEY (ClassId)  REFERENCES Classes (Id),
	CONSTRAINT FK_Heroes_To_Races FOREIGN KEY (RaceId)  REFERENCES Races (Id)
);

CREATE TABLE ItemTypes
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Items
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) NOT NULL UNIQUE,
	TypeId INT NOT NULL,
	CONSTRAINT FK_Items_To_ItemTypes FOREIGN KEY (TypeId)  REFERENCES ItemTypes (Id)
);
CREATE TABLE HeroItems
(
	HeroId INT NOT NULL,
	ItemId INT NOT NULL,
	PRIMARY KEY(HeroId, ItemId),
	CONSTRAINT FK_HeroItems_To_Heroes FOREIGN KEY (HeroId) REFERENCES Heroes (Id),
	CONSTRAINT FK_HeroItems_To_Items FOREIGN KEY (ItemId) REFERENCES Items (Id)
);

CREATE TABLE AbilityTypes
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Abilities
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) NOT NULL,
	TypeId INT NOT NULL,
	CONSTRAINT FK_Abilities_To_AbilityTypes FOREIGN KEY (TypeId)  REFERENCES AbilityTypes (Id)
);
CREATE TABLE HeroAbilities
(
	HeroId INT NOT NULL,
	AbilityId INT NOT NULL,
	PRIMARY KEY(HeroId, AbilityId),
	CONSTRAINT FK_HeroAbilities_To_Heroes FOREIGN KEY (HeroId) REFERENCES Heroes (Id),
	CONSTRAINT FK_HeroAbilities_To_Abilities FOREIGN KEY (AbilityId) REFERENCES Abilities (Id)
);

--//-------------Guildies-------------//--
CREATE TABLE Guildies
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) NOT NULL UNIQUE,
	GuildMasterId INT NOT NULL,
	CONSTRAINT FK_Guildies_To_Heroes FOREIGN KEY (GuildMasterId)  REFERENCES Heroes (Id)
);

CREATE TABLE GuildMemberships
(
	HeroId INT NOT NULL,
	GuildId INT NOT NULL,
	PRIMARY KEY(HeroId, GuildId),
	CONSTRAINT FK_GuildMemberships_To_Heroes FOREIGN KEY (HeroId) REFERENCES Heroes (Id),
	CONSTRAINT FK_GuildMemberships_To_Guildies FOREIGN KEY (GuildId) REFERENCES Guildies (Id)
);

CREATE TABLE GuildRelations
(
    Id INT PRIMARY KEY IDENTITY,
    FirstGuildId INT NOT NULL,
    SecondGuildId INT NOT NULL,
	Relation INT NOT NULL DEFAULT 50,
	CONSTRAINT FK_GuildRelations_To_FirstGuild FOREIGN KEY (FirstGuildId)  REFERENCES Guildies (Id),
	CONSTRAINT FK_GuildRelations_To_SecondGuild FOREIGN KEY (SecondGuildId)  REFERENCES Guildies (Id),
	CONSTRAINT CK_GuildRelations_Relation CHECK(Relation >= 0 AND Relation <= 100)
);

CREATE TABLE Castles
(
    Id INT PRIMARY KEY IDENTITY,
    GuildId INT NULL,
    CountryId INT NULL,
	Garrison INT NOT NULL DEFAULT 0,
	CONSTRAINT FK_Castles_To_Guildies FOREIGN KEY (GuildId)  REFERENCES Guildies (Id),
	CONSTRAINT FK_Castles_To_Countries FOREIGN KEY (CountryId)  REFERENCES Countries (Id),
	CONSTRAINT CK_Castles_Garrison CHECK(Garrison >= 0)
);