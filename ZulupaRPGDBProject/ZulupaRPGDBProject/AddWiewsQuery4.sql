USE ZulupaRPGDB;

GO

CREATE VIEW CountryCities
AS SELECT Countries.Name AS Name,
        CountryStatuses.Name AS Status,
        Settlements.Name AS Cities
FROM Countries 
INNER JOIN CountryStatuses ON Countries.StatusId = CountryStatuses.Id
LEFT JOIN Settlements ON Settlements.CountrieId = Countries.Id

--Select * from CountryCities;
--DROP VIEW CountryCities

GO

CREATE VIEW HeroItemsAbilities
AS SELECT Heroes.Name AS Name,
          Races.Name AS Race,
          Settlements.Name AS Homeland,
		  Items.Name AS Item,
		  Abilities.Name AS Ability
FROM Heroes 
INNER JOIN Races ON Heroes.RaceId = Races.Id
INNER JOIN Classes ON Heroes.ClassId = Classes.Id
INNER JOIN Settlements ON Heroes.homelandId = Settlements.Id
INNER JOIN HeroItems ON HeroItems.HeroId = Heroes.Id
LEFT JOIN Items ON HeroItems.ItemId = Items.Id
INNER JOIN HeroAbilities ON HeroAbilities.HeroId = Heroes.Id
LEFT JOIN Abilities ON HeroAbilities.AbilityId = Abilities.Id

--Select * from HeroItemsAbilities;
--DROP VIEW HeroItemsAbilities
