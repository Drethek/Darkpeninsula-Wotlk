  /* -----------------------*/ 
 /* Dungeon Finder Rewards */
/* ---------------------- */

-- The Culling of Stratholme
UPDATE instance_encounters SET creditType=0, creditEntry=26533 WHERE entry IN (296, 300);

-- Utgarde Keep
UPDATE instance_encounters SET creditEntry=23980 WHERE entry IN (575, 576); 

-- Drak'Tharon
UPDATE instance_encounters SET creditType=0, creditEntry=26632 WHERE entry IN (376, 375);