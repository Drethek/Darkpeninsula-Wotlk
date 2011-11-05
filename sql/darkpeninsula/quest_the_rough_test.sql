-- Cleanup
DELETE FROM gossip_menu_option WHERE menu_id=9741;
-- Add Script Name
UPDATE creature_template SET scriptname="npc_elder_harkek" WHERE entry=28138;