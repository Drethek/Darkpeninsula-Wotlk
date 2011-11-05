-- make undead creatures immune to Fear and Horror and Charm
UPDATE creature_template SET mechanic_immune_mask=mechanic_immune_mask|1|16|8388608 WHERE type=6;