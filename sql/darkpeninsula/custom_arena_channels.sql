-- Create custom channels, NO OWNERS (DB support to Core's custom script)

DELETE FROM channels WHERE name="Arena";
INSERT INTO channels (name, team, announce, ownership, password, lastused) VALUES 
("Arena", 67, 0, 0, "", UNIX_TIMESTAMP(now())),  -- get current POSIX time to avoid instant channel deletion by Core scripts
("Arena", 469, 0, 0, "", UNIX_TIMESTAMP(now())); -- (...as above...)