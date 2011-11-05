###############
# Battleground: Wintergrasp
###########################
/* Teleport WG SPELLs */
DELETE FROM `spell_target_position` WHERE `id` IN (59096, 60035);
INSERT INTO `spell_target_position` VALUES ('59096', '571', '4561.58', '2835.33', '389.79', '0.34');
INSERT INTO `spell_target_position` VALUES ('60035', '571', '5325.06', '2843.36', '409.285', '3.20278');
DELETE FROM `command` WHERE name IN ('wg','wg enable','wg start','wg status','wg stop','wg switch','wg timer');
INSERT INTO `command` VALUES ('wg', '3', 'Syntax: .wg $subcommand.');
INSERT INTO `command` VALUES ('wg enable', '3', 'Syntax: .wg enable [on/off] Enable/Disable Wintergrasp outdoorPvP.');
INSERT INTO `command` VALUES ('wg start', '3', 'Syntax: .wg start\r\nForce Wintergrasp battle start.');
INSERT INTO `command` VALUES ('wg status', '3', 'Syntax: .wg status\r\nWintergrasp info, defender, timer, wartime.');
INSERT INTO `command` VALUES ('wg stop', '3', 'Syntax: .wg stop\r\nForce Wintergrasp battle stop (No rewards).');
INSERT INTO `command` VALUES ('wg switch', '3', 'Syntax: .wg switch\r\nSwitchs Wintergrasp defender team.');
INSERT INTO `command` VALUES ('wg timer', '3', 'Syntax: .wg timer $minutes\r\nChange the current timer. Min value = 1, Max value 60 (Wartime), 1440 (Not Wartime)');

-- Wintergrasp Tower Cannon Spawn
DELETE FROM `creature` WHERE `id` IN (28366, 283666);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4559.94, 3598.4, 426.54, 4.79109, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4536.13, 3598.08, 402.887, 4.04173, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4531.58, 3644.76, 402.887, 2.38999, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4577.94, 3649.63, 402.887, 0.894685, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4582.89, 3603.13, 402.888, 5.5822, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4582.57, 3626.71, 426.54, 0.0174372, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4554.46, 3648.99, 426.539, 1.64823, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4531.73, 3621.17, 426.539, 3.23386, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4397.68, 2848.14, 436.283, 1.58339, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4372.26, 2821.97, 436.283, 3.20415, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4398.65, 2796.72, 436.284, 4.71953, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4424.05, 2822.93, 436.283, 0.0411743, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4421.3, 2846.31, 412.631, 0.803883, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4374.28, 2845.31, 412.631, 2.34435, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4375.14, 2798.65, 412.631, 3.90381, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4421.98, 2799.45, 412.632, 5.50951, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4447.62, 1975.43, 441.994, 1.89698, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4428.03, 1932.93, 441.996, 3.46293, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4470.28, 1914.07, 441.995, 5.05358, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4489.81, 1955.69, 441.995, 0.371083, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4469.81, 1967.82, 465.648, 1.1087, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4435.77, 1955.03, 465.647, 2.64917, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4448.24, 1920.86, 465.647, 4.35021, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (28366, 571, 1, 1, 0, 0, 4482.36, 1933.62, 465.647, 5.82044, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5164.14, 2966.57, 413.494, 1.52755, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5163.41, 2960.98, 439.845, 1.53256, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5234.97, 2948.61, 420.881, 1.54915, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5265.98, 2976.58, 421.067, 3.14569, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5248.82, 3047.38, 412.147, 3.1398, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5255.19, 3047.83, 438.499, 3.14984, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5280.95, 3073.17, 438.499, 1.44465, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5281.7, 3078.89, 412.147, 1.49483, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5352.25, 3061.59, 421.102, 1.59933, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5391.16, 3061.19, 419.616, 1.57424, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5136.64, 2935.22, 439.846, 3.10816, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5131.43, 2934.85, 413.495, 3.12234, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5147.67, 2862, 421.63, 3.27288, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5149.03, 2820.28, 421.621, 3.14792, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5131.87, 2747.86, 413.492, 3.1128, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5138.15, 2747.45, 439.844, 3.11826, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5164.19, 2715.88, 413.492, 4.80926, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5163.91, 2721.69, 439.844, 4.63866, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5236.3, 2732.78, 421.649, 4.66375, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5265.4, 2704.76, 421.7, 3.16342, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5247.01, 2632.83, 413.404, 3.16342, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5252.89, 2631.99, 439.755, 3.08226, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5278.19, 2600.25, 413.403, 4.75821, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5278.22, 2605.54, 439.756, 4.67291, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5351.01, 2616.23, 421.241, 4.62273, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5391.08, 2615.82, 421.126, 4.63778, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5264.95, 2819.79, 421.655, 3.14465, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5263.85, 2861.32, 421.585, 3.1296, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5323.09, 2923.39, 421.646, 1.51888, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5364.01, 2923.26, 421.708, 1.57407, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5363.87, 2757.5, 421.629, 4.67094, 300, 0, 0, 50000, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES (283666, 571, 1, 1, 0, 0, 5322.1, 2756.87, 421.646, 4.75123, 300, 0, 0, 50000, 0, 0);

-- Vehicle
DELETE FROM `creature_template` WHERE `entry` IN (28319, 32629, 28366, 283666);
INSERT INTO `creature_template` VALUES (28319, 0, 0, 0, 0, 0, 25301, 0, 0, 0, 'Wintergrasp Siege Turret', '', 'Gunner', 0, 80, 80, 0, 1802, 1801, 0, 0, 0, 1, 0, 422, 586, 0, 642, 1, 2000, 0, 1, 0, 8, 0, 0, 0, 0, 0, 345, 509, 103, 9, 262184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 51362, 0, 0, 0, 0, 0, 0, 0, 0, 116, 0, 0, '', 0, 3, 15.9116, 1, 1, 0, 0, 0, 0, 0, 0, 0, 121, 0, 0, 67110928, 0, '', 11723);
INSERT INTO `creature_template` VALUES (28366, 0, 0, 0, 0, 0, 27101, 0, 0, 0, 'Wintergrasp Tower Cannon', '', 'Gunner', 0, 80, 80, 0, 1802, 1801, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 2000, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 9, 262184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 51421, 0, 0, 0, 0, 0, 0, 0, 0, 79, 0, 0, '', 0, 0, 9.35979, 1, 1, 0, 0, 0, 0, 0, 0, 0, 121, 1, 0, 67110928, 0, '', 11723);
INSERT INTO `creature_template` VALUES (32629, 0, 0, 0, 0, 0, 28106, 0, 0, 0, 'Wintergrasp Siege Turret', '', 'Gunner', 0, 80, 80, 0, 1801, 1801, 0, 0, 0, 1, 0, 422, 586, 0, 642, 1, 2000, 0, 1, 4, 8, 0, 0, 0, 0, 0, 345, 509, 103, 9, 262184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 51362, 0, 0, 0, 0, 0, 0, 0, 0, 116, 0, 0, '', 0, 3, 15.9116, 1, 1, 0, 0, 0, 0, 0, 0, 0, 121, 0, 0, 67110928, 0, '', 11723);
INSERT INTO `creature_template` VALUES (283666, 0, 0, 0, 0, 0, 27101, 0, 0, 0, 'Wintergrasp Tower Cannon', '', 'Gunner', 0, 80, 80, 0, 1802, 1801, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 2000, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 9, 262184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 51421, 0, 0, 0, 0, 0, 0, 0, 0, 79, 0, 0, '', 0, 3, 9.35979, 1, 1, 0, 0, 0, 0, 0, 0, 0, 121, 1, 0, 67110928, 0, '', 11723);
UPDATE creature_template SET unit_class=1, InhabitType=1 WHERE entry = 28366;
UPDATE creature_template SET unit_class=1 WHERE entry = 283666;

/* Temp removed gameobject stopping you getting to the relic
*  [Wintergrasp Keep Collision Wall X:5396.209961 Y:2840.010010 Z:432.268005 MapId:571
*  [Doodad_WG_Keep_Door01_collision01 X:5397.109863 Y:2841.540039 Z:425.901001 MapId:571]
*/
DELETE FROM gameobject WHERE id IN ('194323', '194162');

/* Delete Portal to Wintergrasp */
DELETE FROM `gameobject` WHERE  `id` = '193772';

/* Change incorrect spells used by Defender's Portal's */
UPDATE `gameobject_template` SET `data0`=54643 WHERE `entry` in(190763,192819);

/* Set Portal To Wintergrasp */
UPDATE `gameobject_template` SET `data0`=60035 WHERE `entry` = 193772;
DELETE FROM `outdoorpvp_template` WHERE `TypeId` = '7';
INSERT INTO `outdoorpvp_template` (`TypeId`, `ScriptName`, `Comment`) VALUES (7, 'outdoorpvp_wg', 'Wintergrasp');

-- Essence of Wintergrasp
DELETE FROM `spell_area` WHERE `spell` IN (57940,58045);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES
(57940,3537,0,0,0,0,0,2,1),
(57940,2817,0,0,0,0,0,2,1),
(57940,4395,0,0,0,0,0,2,1),
(57940,65,0,0,0,0,0,2,1),
(57940,394,0,0,0,0,0,2,1),
(57940,395,0,0,0,0,0,2,1),
(57940,210,0,0,0,0,0,2,1),
(57940,3711,0,0,0,0,0,2,1),
(57940,67,0,0,0,0,0,2,1),
(57940,66,0,0,0,0,0,2,1),
(57940,4494,0,0,0,0,0,2,1),
(57940,3477,0,0,0,0,0,2,1),
(57940,4100,0,0,0,0,0,2,1),
(57940,4196,0,0,0,0,0,2,1),
(57940,4416,0,0,0,0,0,2,1),
(57940,4265,0,0,0,0,0,2,1),
(57940,4228,0,0,0,0,0,2,1),
(57940,4415,0,0,0,0,0,2,1),
(57940,4272,0,0,0,0,0,2,1),
(57940,4264,0,0,0,0,0,2,1),
(57940,206,0,0,0,0,0,2,1),
(57940,1196,0,0,0,0,0,2,1),
(57940,3456,0,0,0,0,0,2,1),
(57940,4493,0,0,0,0,0,2,1),
(57940,4273,0,0,0,0,0,2,1),
(57940,4603,0,0,0,0,0,2,1),
(58045,4197,0,0,0,0,0,2,1);

-- Strings,commands,buffs
DELETE FROM `trinity_string` WHERE `entry` BETWEEN 756 AND 772;
DELETE FROM `trinity_string` WHERE `entry` IN (780, 781);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('756','Battle begins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('757','%s has successfully defended the fortress!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('758','%s has taken over the fortress!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('759','The %s siege workshop has been damaged by the %s!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('760','The %s siege workshop has been destroyed by the %s!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('761','The %s tower has been damaged!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('762','The %s tower has been destroyed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('763','Wintergrasp fortress is under attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('764','Wintergrasp is now under the control of the %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('765','Wintergrasp timer set to %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('766','Wintergrasp battle started.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('767','Wintergrasp battle finished.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('768','Wintergrasp info: %s controlled. Timer: %s. Wartime: %s. Number of Players: (Horde: %u, Alliance: %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('769','Wintergrasp outdoorPvP is disabled.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('770','Wintergrasp outdoorPvP is enabled.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('771','You have reached Rank 1: Corporal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('772','You have reached Rank 2: First Lieutenant',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('780', 'Before the Battle of Wintergrasp left 30 minutes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('781', 'Before the Battle of Wintergrasp left 10 minutes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

-- Wintergrasp Scripts
UPDATE creature_template SET ScriptName = 'npc_demolisher_engineerer' WHERE entry IN (30400, 30499);
UPDATE `creature_template` SET `ScriptName`='npc_wg_misc' WHERE `entry` IN ('32308','32307','30740','30739','32296','32294','39172','39173','31051','31101','31052','31102','31109','31107','31151','31153','31108','31106','31054','31053','31036','31091');
UPDATE `creature_template` SET `ScriptName` = 'npc_magister_surdiel_horde_battle_mage' WHERE `entry` = '32170';
UPDATE `creature_template` SET `ScriptName` = 'npc_horde_battle_mage', `npcflag` = '1', `faction_A` = '2123', `faction_H` = '2123' WHERE `entry` IN (35612,35602,35611,35597,35603);
UPDATE `creature_template` SET `ScriptName` = 'npc_arcanist_braedin_alliance_battle_mage' WHERE `entry` = '32169';
UPDATE `creature_template` SET `ScriptName` = 'npc_alliance_battle_mage' WHERE `entry` IN (35598, 35601, 35600, 35596, 35599);

-- Fix WGR Turrets Inhabit Type
UPDATE creature_template SET inhabittype=1 WHERE entry IN (28366, 283666);

-- Fix No fly zone - Parachute
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN('-58600','-58730');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-58600, 44795, 0, 'No fly zone - Parachute');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-58730, 44795, 0, 'No fly zone - Parachute');

-- Wintergrasp Quartermaster
DELETE FROM `creature_template_addon` WHERE `entry` IN (39172,39173);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (39172, 0, 28912, 0, 1, 0, '');
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (39173, 0, 29261, 0, 1, 0, '');

DELETE FROM `creature_template` WHERE `entry` IN (391720,391730);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (391720, 0, 0, 0, 0, 0, 18783, 0, 0, 0, 'Marshal Magruder Trigger', 'Wintergrasp Quartermaster', '', 0, 80, 80, 2, 1892, 1892, 128, 1, 1.14286, 1, 0, 422, 586, 0, 642, 1, 2000, 0, 1, 0, 8, 0, 0, 0, 0, 0, 345, 509, 103, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 130, 'npc_marshal_magruder', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (391730, 0, 0, 0, 0, 0, 18783, 0, 0, 0, 'Champion Ros slai Trigger', 'Wintergrasp Quartermaster', '', 0, 80, 80, 2, 1981, 1981, 128, 1, 1.14286, 1, 0, 422, 586, 0, 642, 1, 2000, 0, 1, 768, 8, 0, 0, 0, 0, 0, 345, 509, 103, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 130, 'npc_champion_ros_slai', 12340);

DELETE FROM `creature` WHERE `id` IN (391720,391730);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (391720, 571, 1, 256, 0, 0, 5373.42, 2785.53, 409.381, 3.16295, 300, 0, 0, 12600, 0, 0, 0, 33554432, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (391730, 571, 1, 256, 0, 0, 5373.42, 2785.53, 409.381, 3.16295, 300, 0, 0, 12600, 0, 0, 0, 33555200, 0);

/* Creature template */
UPDATE creature_template SET faction_A = '1802', faction_H = '1802' WHERE entry IN (30499,28312,28319);
UPDATE creature_template SET faction_A = '1801', faction_H = '1801' WHERE entry IN (30400,32629,32627);

-- Missed NPC Spirit Guide
DELETE FROM `creature` WHERE `id` = '31841';
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (31841, 571, 1, 1, 27760, 0, 5031.84, 3710.75, 372.483, 3.9968, 180, 0, 0, 126000, 7988, 0, 0, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (31841, 571, 1, 1, 27759, 0, 5104.75, 2300.95, 368.568, 0.733038, 180, 0, 0, 126000, 7988, 0, 0, 0, 0);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (31841, 571, 1, 1, 0, 413, 5537.88, 2896.31, 517.055, 4.8584, 300, 0, 0, 126000, 7988, 0, 0, 0, 0);

/* Tower Fix */
-- UPDATE `gameobject_template` SET `data0` = 30000, `data5` = 0 WHERE `entry` IN (190356,190357,190358);
-- UPDATE `gameobject_template` SET `data0` = 80000, `data5` = 0 WHERE `entry` IN (190377,190378,190221,190373);

/* Restore Tower Fix */
UPDATE `gameobject_template` SET `data0` = 5000, `data5` = 25000 WHERE `entry` IN (190356,190357,190358);
UPDATE `gameobject_template` SET `data0` = 40000, `data5` = 40000 WHERE `entry` IN (190377,190378,190221,190373);

-- Goblin Immunity
UPDATE creature_template SET mechanic_immune_mask = '2147483647' WHERE entry IN (30400, 30499);

-- npc_spellclick_spells for Wintergrasp Tower Cannon
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN(283666);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(283666,60962,0,0,0,1,0,0,0);