# If you want to give owner access to the whole server to a particular user account this is how
exec sp_addrolemember 'db_owner', 'NT AUTHORITY\NETWORK SERVICE';
GO

# If you want to idempotently ensure a particular database with name DatabaseName exists this is how
IF NOT db_id('DatabaseName') IS NOT NULL BEGIN

    PRINT 'Creating database...'
    CREATE DATABASE [Test]
    PRINT 'Created database.'

END

GO
