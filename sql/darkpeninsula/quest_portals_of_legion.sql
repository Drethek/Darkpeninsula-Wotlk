-- Fix Quest "Portals of the Legion" #5581
UPDATE gameobject_template SET data2=177367 WHERE entry=177367;
DELETE FROM event_scripts WHERE id=177367;
INSERT INTO event_scripts (id, delay, command, datalong, datalong2, x, y, z, o) VALUES
(177367, 0, 10, 11937, 60000, -2002.831, 1866.129, 52.634, 3.441350);