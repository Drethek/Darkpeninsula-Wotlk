-- Fix Onyxia's Lair graveyard zone
DELETE FROM game_graveyard_zone WHERE ghost_zone=2159;
INSERT INTO game_graveyard_zone (id, ghost_zone, faction) VALUES (1681, 2159, 0);

/* Backup
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`) VALUES
(189, 2159, 469),
(631, 2159, 67);
*/