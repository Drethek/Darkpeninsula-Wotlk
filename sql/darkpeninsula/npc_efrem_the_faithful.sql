-- Fix "Efrem the Faithful" flags to make it attackable
UPDATE creature_template SET unit_flags=32768 WHERE entry=30081;