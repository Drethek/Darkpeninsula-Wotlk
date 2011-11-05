#### QUEST -- ZULUHED THE WHACKED ####

-- Fixing quest template at first
UPDATE quest_template SET ReqCreatureOrGOId1=-185156, ReqCreatureOrGOCount1=1, ReqCreatureOrGOId2=11980, ReqCreatureOrGOCount2=1, ReqSpellCast1=38790, CompleteEmote=30, OfferRewardEmote1=5, StartScript=10866 WHERE entry IN (10866, 10872);

-- Set proper spawn for Zuluhed the Whacked
DELETE FROM creature WHERE id=11980;
INSERT INTO creature (id, map, position_x, position_y, position_z, orientation, spawntimesecs, curhealth) VALUES
(11980, 530, -4207, 312.461, 123.079, 1.39047, 300, 85560);

-- Making a smarter Zuluhed AI
UPDATE creature_template SET AIname="EventAI" WHERE entry=11980;
DELETE FROM creature_ai_scripts WHERE creature_id=11980;
INSERT INTO creature_ai_scripts ( creature_id, event_type, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, comment ) VALUES
(11980, 4, 0, 0, 0, 0, 0, 1, -50001, 0, 0, "Zuluhed - Aggro yell"),
(11980, 0, 1, 10000, 12000, 15000, 20000, 11, 19717, 4, 0, "Zuluhed - Cast Rain of Fire"),
(11980, 2, 0, 50, 0, 0, 0, 1, -50002, 0, 0, "Zuluhed - Summon yell"),
(11980, 2, 0, 50, 0, 0, 0, 11, 38876, 0, 0, "Zuluhed - Summon portal"),
(11980, 2, 0, 20, 0, 0, 0, 1, -50002, 0, 0, "Zuluhed - Transformation yell"),
(11980, 2, 0, 20, 0, 0, 0, 11, 38853, 0, 0, "Zuluhed - Cast Nether Infusion");

-- Add Zuluhed AI texts
DELETE FROM creature_ai_texts WHERE entry IN (-50001, -50002);
INSERT INTO creature_ai_texts (entry, content_default, type, comment) VALUES
(-50001, "Indeed, the time has come to end this charade. Destroy them! Destroy them all!", 1, "11980"),
(-50002, "Lord Illidan, bless me with the power of the flight!", 1, "11980");

-- Fix Zuluhed Portal's AI
UPDATE creature_template SET flags_extra=2 WHERE entry = 22336; -- makes it able to cast, hackfixed but it works...
UPDATE creature_template SET AIname="EventAI" WHERE entry=22336;
DELETE FROM creature_ai_scripts WHERE creature_id=22336;
INSERT INTO creature_ai_scripts ( creature_id, event_type, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, comment ) VALUES
(22336, 11, 0, 0, 0, 0, 0, 12, 22338, 4, 120000, "Zuluhed portal - Summon Arcubus");

-- Last but not least, fix Ally of Netherwing rep (from Hated to Neutral)
UPDATE quest_template SET RewRepValueId1=0, RewRepValue1=525000 WHERE entry IN (10870, 10871);