-- Fix turret movements
UPDATE creature_template SET speed_walk=0, speed_run=0 WHERE entry IN (36356, 34778);