-- Implement summoner script for quest "Flown the Coop!"
-- Fix quest creatures 
UPDATE creature_template SET speed_run=1.80 WHERE entry=28161;
DELETE FROM creature_template_addon WHERE entry=28161;
INSERT INTO creature_template_addon (entry, path_id) VALUES (28161, 281610);
DELETE FROM waypoint_data WHERE id= 281610;
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z) VALUES
(281610, 1, 5239.55, 4550.88, -89.5679),
(281610, 2, 5232.9, 4541.25, -90.0226),
(281610, 3, 5236.58, 4531.8, -86.8404),
(281610, 4, 5246.25, 4525.76, -84.8744),
(281610, 5, 5265.52, 4517.43, -84.7319),
(281610, 6, 5283.62, 4510.29, -88.2843),
(281610, 7, 5308.04, 4505.74, -91.845),
(281610, 8, 5325.12, 4509.51, -97.917),
(281610, 9, 5317.23, 4519.05, -97.3974),
(281610, 10, 5304.89, 4515.61, -97.7272);

-- Summoner Script
UPDATE quest_template SET StartScript=12532 WHERE entry=12532;
DELETE FROM quest_start_scripts WHERE id=12532;
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, x, y, z) VALUES
(12532, 0, 10, 28161, 1800000, 5245.5, 4559.78, -93.0425),
(12532, 0, 10, 28161, 1800000, 5242.89, 4557.07, -92.7162),
(12532, 0, 10, 28161, 1800000, 5244.4, 4557.85, -92.8785),
(12532, 0, 10, 28161, 1800000, 5246.09, 4558.7, -93.0431),
(12532, 0, 10, 28161, 1800000, 5246.13, 4560, -93.0431),
(12532, 0, 10, 28161, 1800000, 5248.61, 4558.47, -93.0431),
(12532, 0, 10, 28161, 1800000, 5245.53, 4563.36, -93.0443),
(12532, 0, 10, 28161, 1800000, 5253.98, 4560.69, -93.044),
(12532, 0, 10, 28161, 1800000, 5251.1, 4561.92, -93.044),
(12532, 0, 10, 28161, 1800000, 5247.21, 4558.26, -93.044),
(12532, 0, 10, 28161, 1800000, 5252.09, 4563.34, -93.044),
(12532, 0, 10, 28161, 1800000, 5247.06, 4560.12, -93.044),
(12532, 0, 10, 28161, 1800000, 5249.81, 4560.65, -93.044),
(12532, 0, 10, 28161, 1800000, 5248.12, 4562.12, -93.044),
(12532, 0, 10, 28161, 1800000, 5252.24, 4560.93, -93.044),
(12532, 0, 10, 28161, 1800000, 5250.69, 4564.43, -93.044),
(12532, 0, 10, 28161, 1800000, 5250.24, 4563.01, -93.044),
(12532, 0, 10, 28161, 1800000, 5245.48, 4556.73, -93.0329),
(12532, 0, 10, 28161, 1800000, 5244.54, 4558.48, -92.8554),
(12532, 0, 10, 28161, 1800000, 5248.01, 4556.62, -93.0442),
(12532, 0, 10, 28161, 1800000, 5244.39, 4561.51, -93.0393),
(12532, 0, 10, 28161, 1800000, 5243.38, 4558.47, -92.6669),
(12532, 0, 10, 28161, 1800000, 5241.82, 4558.23, -92.4028),
(12532, 0, 10, 28161, 1800000, 5243.42, 4555.36, -92.383),
(12532, 0, 10, 28161, 1800000, 5241.8, 4556.26, -91.7089),
(12532, 0, 10, 28161, 1800000, 5242.62, 4553.25, -90.6371),
(12532, 0, 10, 28161, 1800000, 5238.6, 4557.55, -89.5031),
(12532, 0, 10, 28161, 1800000, 5241.67, 4560.48, -92.7143),
(12532, 0, 10, 28161, 1800000, 5246.61, 4561.43, -93.0442),
(12532, 0, 10, 28161, 1800000, 5244.55, 4560.26, -93.0377),
(12532, 0, 10, 28161, 1800000, 5241.98, 4560.02, -92.6894),
(12532, 0, 10, 28161, 1800000, 5244.4, 4556.23, -93.0089),
(12532, 0, 10, 28161, 1800000, 5242.91, 4554.3, -91.5837),
(12532, 0, 10, 28161, 1800000, 5240.43, 4558.84, -91.2083),
(12532, 0, 10, 28161, 1800000, 5245.7, 4554.74, -93.0323);