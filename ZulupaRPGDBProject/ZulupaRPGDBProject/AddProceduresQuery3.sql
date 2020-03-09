USE ZulupaRPGDB;

GO
CREATE PROCEDURE AddGuild
    @name NVARCHAR(50),
    @guildMasterId INT
AS BEGIN

INSERT INTO Guildies(Name, GuildMasterId) 
VALUES(@name, @guildMasterId);

DECLARE @newGuildId INT, @duildId INT;
SET @newGuildId = @@IDENTITY;

select @duildId = min( Id ) from Guildies where Id <> @newGuildId
while @duildId is not null
begin
    INSERT INTO GuildRelations(FirstGuildId, SecondGuildId) 
	VALUES(@newGuildId, @duildId);
    select @duildId = min( Id ) from Guildies where Id > @duildId And Id <> @newGuildId
end

END;

--DROP PROCEDURE AddGuild

--EXEC AddGuild 'g1', 1;