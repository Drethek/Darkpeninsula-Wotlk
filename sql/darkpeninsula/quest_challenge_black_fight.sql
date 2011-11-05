-- Fix quest NPC flags in order to make it attackable (but he have to aggro once at least to make it attackable)
UPDATE creature_template SET unit_flags=256 WHERE entry=23789;