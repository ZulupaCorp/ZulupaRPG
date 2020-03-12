INSERT INTO CountryStatuses(Name)
VALUES
('Empire'),
('Republic'),
('Kingdom')

INSERT INTO Countries(Name, StatusId)
VALUES
('Northandcostishta', 3),
('Striaslandsmo', 2),
('Ausia', 1),
('Southern Panthio', 1),
('Panau Kinited', 2),
('Bialand', 3),
('Slandsza Bawait Island', 3),
('Boue Ramakraine', 2),
('Grenga Libo', 2),
('Vageordorngo', 3)

INSERT INTO SettlementStatuses(Name)
VALUES ('Village'),
('City'),
('Large city'),
('Colony')

INSERT INTO Settlements(Name, Population, StatusId, CountrieId)
VALUES 
('San Coortemonto', 1500, 3, 1),
('New Cofleet', 113, 4, 2),
('Meadulhill', 634, 2, 3),
('Brampcreek', 342, 2, 4),
('Moose Yslesed', 45, 1, 5),
('Race', 1358, 3, 6),
('Sleyau', 295, 2, 7),
('Mount Rdeauhautecoeur', 420, 4, 8),
('Letrange Heath', 89, 1, 9 ),
('Moose Welkeynes', 837, 2, 10),
('Bridpertsou With Rilmoe',2571, 3, 4),
('Great Alspri', 732, 2, 8),
('Ghworthros Du Fhamtor', 24, 1, 1),
('West Ldentier', 835, 2, 10),
('Port Snod', 1934, 3, 6)

INSERT INTO Wars(Name, StartDate, EndDate, FirstSideId, SecondSideId, WinnerId)
VALUES 
('Great War', '0756-11-10', '0759-12-19', 3, 5, 3),
('Greater War', '0762-05-23', '0767-11-17', 3, 5, 5),
('Last War', '0788-01-02', '0811-02-27', 3, 8, 3)

INSERT INTO Races(Name)
VALUES
('Human'),
('Elf'),
('Orc'),
('Dwarf'),
('Gnome'),
('Werewolf')

INSERT INTO Classes(Name)
VALUES
('Warrior'), 
('Priest'), 
('Hunter'), 
('Paladin'), 
('Rogue'), 
('Warlock'), 
('Druid'), 
('Shaman')

INSERT INTO Heroes(Name, homelandId, ClassId, RaceId)
VALUES 
('Bradlee Ventura', 1, 2, 3),
('Euan Barlow', 2, 1, 2),
('Zhane Kenny', 3, 3, 1),
('Mckenzie Wade', 4,5, 6),
('Ruben Hernandez', 5, 4, 1),
('Zayyan Carey', 6, 6, 2),
('Amayah Brennan', 7, 8, 4),
('Anderson Wilkins', 8, 4, 1),
('Lisa-Marie Johns', 9, 5, 3),
('Libbi Horner', 10, 8, 6),
('Nichole Prentice', 11, 4, 1),
('Wojciech Ashton', 12, 3, 5),
('Jethro Emery', 13, 2, 4),
('Saqib Bolton', 14, 7, 6),
('Zavier Shepard', 15, 1, 1)

EXEC AddGuild 'Ugly Division', 1
EXEC AddGuild 'Sailing Twins', 4
EXEC AddGuild 'Les Bananas', 6
EXEC AddGuild 'Venus Panic', 10

INSERT INTO GuildMemberships(HeroId, GuildId)
VALUES 
(1,1),
(2, 2), 
(3, 2), 
(4,3), 
(5, 1),
(6, 3), 
(7, 1), 
(8, 4), 
(9, 3), 
(10,4), 
(11, 1), 
(12, 3), 
(13, 4), 
(14, 4), 
(15, 2)

INSERT INTO Castles(GuildId, CountryId, Garrison)
VALUES 
(1, 2, 50), 
(2, 6, 124), 
(3, 3, 156), 
(4, 8, 431)

