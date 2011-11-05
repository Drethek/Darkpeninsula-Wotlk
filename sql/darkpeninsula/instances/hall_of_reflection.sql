-- Halls of Reflection
-- Updates for (mostly) HoR creatures/GOs
-- Gameobject updates
UPDATE `gameobject_template` SET `flags`=`flags`|32 WHERE `entry`=202443; -- Dedication of Honor
UPDATE `gameobject_template` SET `flags`=`flags`|32 WHERE `entry`=201761; -- The Pit of Saron Portcullis
UPDATE `gameobject_template` SET `flags`=`flags`|32 WHERE `entry`=201759; -- The Forge of Souls Portcullis
UPDATE `gameobject_template` SET `flags`=`flags`|32 WHERE `entry`=201760; -- The Halls of Reflection Gate
UPDATE `gameobject_template` SET `flags`=`flags`|32,`faction`=114 WHERE `entry`=201976; -- Doodad_IceCrown_Door_04
UPDATE `gameobject_template` SET `flags`=`flags`|32,`faction`=114 WHERE `entry`=202236; -- Frostmourne Altar
UPDATE `gameobject_template` SET `flags`=`flags`|32,`faction`=114 WHERE `entry`=202302; -- Frostmourne
UPDATE `gameobject_template` SET `flags`=`flags`|32,`faction`=1375 WHERE `entry`=197341; -- Impenetrable Door
UPDATE `gameobject_template` SET `flags`=`flags`|32,`faction`=1375 WHERE `entry`=197343; -- Doodad_IceCrown_Door_03
UPDATE `gameobject_template` SET `flags`=`flags`|32,`faction`=1375 WHERE `entry`=197342; -- Doodad_IceCrown_Door_02
UPDATE `gameobject_template` SET `faction`=16 WHERE `entry`=164639; -- Frost Trap

SET @Equip=10137; -- equipment_id
-- Template updates
UPDATE `creature_template` SET `equipment_id`=@Equip+0 WHERE `entry`=17252; -- Felguard
UPDATE `creature_template` SET `baseattacktime`=1800 WHERE `entry`=38112; -- Falric
UPDATE `creature_template` SET `baseattacktime`=2000 WHERE `entry`=14881; -- Spider
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`|4 WHERE `entry`=1412; -- Squirrel
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`|4 WHERE `entry`=32428; -- Underbelly Rat
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`|4,`unit_class`=4 WHERE `entry`=36774; -- Silver Covenant Agent
UPDATE `creature_template` SET `equipment_id`=1221 WHERE `entry`=37221; -- Lady Jaina Proudmoore
UPDATE `creature_template` SET `equipment_id`=637 WHERE `entry`=37582; -- Archmage Koreln
UPDATE `creature_template` SET `exp`=0 WHERE `entry`=32206; -- Armored Brown Bear
UPDATE `creature_template` SET `exp`=0 WHERE `entry`=32322; -- Gold Warrior
UPDATE `creature_template` SET `exp`=0 WHERE `entry`=32328; -- [DND] Dalaran Sewer Arena - Controller - Death
UPDATE `creature_template` SET `exp`=0 WHERE `entry`=32339; -- [DND] Dalaran Sewer Arena - Controller
UPDATE `creature_template` SET `exp`=0 WHERE `entry`=32425; -- Galkara the Assassin
UPDATE `creature_template` SET `exp`=0 WHERE `entry`=32435; -- Vern
UPDATE `creature_template` SET `exp`=0 WHERE `entry`=32441; -- Underbelly Croc
UPDATE `creature_template` SET `exp`=0 WHERE `entry`=32664; -- Segacedi
UPDATE `creature_template` SET `exp`=0,`npcflag`=`npcflag`|130 WHERE `entry`=31032; -- Derek Odds
UPDATE `creature_template` SET `exp`=0,`npcflag`=`npcflag`|3 WHERE `entry`=31081; -- Officer Van Rossem
UPDATE `creature_template` SET `exp`=0,`npcflag`=`npcflag`|640 WHERE `entry`=32416; -- Stefen Cotter
UPDATE `creature_template` SET `exp`=0,`unit_flags`=`unit_flags`|526592 WHERE `entry`=32321; -- Green Warrior
UPDATE `creature_template` SET `exp`=0,`unit_flags`=`unit_flags`|526592 WHERE `entry`=32340; -- Gold Shaman
UPDATE `creature_template` SET `exp`=0,`unit_flags`=`unit_flags`|526592 WHERE `entry`=32342; -- Green Paladin
UPDATE `creature_template` SET `exp`=2 WHERE `entry`=37704; -- Frostmourne Altar Bunny (Quel'Delar)
UPDATE `creature_template` SET `exp`=2,`minlevel`=82,`maxlevel`=82,`unit_flags`=`unit_flags`|33555200 WHERE `entry`=37849; -- Sartharion Image
UPDATE `creature_template` SET `exp`=0,`unit_flags`=`unit_flags`|32768 WHERE `entry`=30755; -- Kor'kron Reaver
UPDATE `creature_template` SET `minlevel`=60,`maxlevel`=60,`unit_flags`=`unit_flags`|33555200 WHERE `entry`=34984; -- World Trigger (Not Floating)
UPDATE `creature_template` SET `minlevel`=75,`maxlevel`=75,`npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|512 WHERE `entry`=33936; -- Nargle Lashcord
UPDATE `creature_template` SET `minlevel`=75,`maxlevel`=75,`npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|768 WHERE `entry`=33937; -- Xazi Smolderpipe
UPDATE `creature_template` SET `minlevel`=75,`maxlevel`=75,`npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|768 WHERE `entry`=33938; -- Zom Bocom
UPDATE `creature_template` SET `unit_class`=4 WHERE `entry`=26125; -- Risen Ghoul
UPDATE `creature_template` SET `unit_class`=8 WHERE `entry`=416; -- Imp
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=28690; -- Tassia Whisperglen
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=28708; -- Kizi Copperclip
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=28956; -- Warcaster Fanoraithe
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=28958; -- Jessa Weaver
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=29660; -- Grand Marauder Sai
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=29665; -- Pazik "The Pick" Prylock
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=30104; -- Adamman the Trader
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=30726; -- Archivist Betha
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=31136; -- High Warlord Uro
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32169; -- Arcanist Braedin
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32170; -- Magister Surdiel
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32676; -- Grindle Firespark
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32677; -- Whirt the All-Knowing
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32678; -- Emeline Fizzlefry
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32679; -- Darthalia Ebonscorch
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32680; -- Fabioso the Fabulous
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32681; -- The Magnificent Merleaux
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32683; -- Grezla the Hag
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32684; -- Mona Everspring
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32685; -- Kitz Proudbreeze
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32686; -- Crafticus Mindbender
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32687; -- Linda Ann Kastinglow
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32688; -- Archmage Tenaj
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32689; -- Adorean Lew
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32690; -- Bitty Frostflinger
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32691; -- Magus Fansy Goodbringer
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32692; -- Arcanist Alec
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32693; -- Sabriana Sorrowgaze
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32726; -- The Chooch
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32727; -- Natalie Tootiblare
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32728; -- Illusionist Karina
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32729; -- Lofwyr Le'Fleur
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32730; -- Goldlilly Gleamingfell
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32731; -- Metopious Loreseeker
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32732; -- Dorfus Alphamage
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=32733; -- Joboba Mezbreaker
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=33031; -- Sebastian Bower
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry`=36856; -- Shandy Glossgleam
UPDATE `creature_template` SET `npcflag`=`npcflag`|1,`unit_flags`=`unit_flags`|768 WHERE `entry`=35594; -- Brassbolt Mechawrench
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=14990; -- Defilers Emissary
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=14991; -- League of Arathor Emissary
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=29533; -- Schembari "Uncle Sal" Shearbolt
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=29568; -- "Techs" Rickard Rustbolt
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=29667; -- Warsong Gulch Portal
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=29668; -- Arathi Basin Portal
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=29669; -- Alterac Valley Portal
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=29670; -- Eye of the Storm Portal
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=29671; -- Strand of the Ancients Portal
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=29673; -- Arathi Basin Portal
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=29675; -- Eye of the Storm Portal
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=32330; -- Minzi the Minx
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=32332; -- Ramik Slamwrench
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=32333; -- "Dapper" Danik Blackshaft
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=34952; -- Isle of Conquest Portal
UPDATE `creature_template` SET `npcflag`=`npcflag`|1048577 WHERE `entry`=34953; -- Isle of Conquest Portal
UPDATE `creature_template` SET `npcflag`=`npcflag`|1154 WHERE `entry`=29535; -- Alchemist Cinesra
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=28692; -- "Red" Jack Findle
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=28707; -- Angelo Pescatore
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=28715; -- Endora Moorehead
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=28721; -- Tiffany Cartier
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=28723; -- Larana Drome
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=28725; -- Patricia Egan
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=28726; -- Dominique Stefano
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=28727; -- Edward Egan
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=28728; -- Dorian Fines
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=28951; -- Breanni
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=28993; -- Aerith Primrose
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=28994; -- Abra Cadabra
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=29491; -- Karandonna
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=29495; -- Norvin Alderman
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=29510; -- Linna Bruder
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=29511; -- Lalla Brightweave
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=29512; -- Ainderu Summerleaf
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=29528; -- Debbi Moore
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=29529; -- Ninsianna
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=29548; -- Aimee
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=29628; -- Angelique Butler
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=29702; -- Chameli Banaphash
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=29703; -- Sheddle Glossgleam
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=29716; -- Clockwork Assistant
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=30885; -- Blazik Fireclaw
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=31579; -- Arcanist Adurin
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=31580; -- Arcanist Ivrenne
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=32172; -- Harold Winston
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=32216; -- Mei Francis
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=32334; -- Nixi Fireclaw
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=32509; -- Brammold Deepmine
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=32514; -- Vanessa Sellers
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=33027; -- Jessica Sellers
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=33964; -- Arcanist Firael
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=37942; -- Arcanist Uovril
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE `entry`=40160; -- Frozo the Renowned
UPDATE `creature_template` SET `npcflag`=`npcflag`|128,`unit_flags`=`unit_flags`|32768 WHERE `entry`=35790; -- Usuri Brightcoin
UPDATE `creature_template` SET `npcflag`=`npcflag`|128,`unit_flags`=`unit_flags`|768 WHERE `entry`=35494; -- Arcanist Miluria
UPDATE `creature_template` SET `npcflag`=`npcflag`|128,`unit_flags`=`unit_flags`|768 WHERE `entry`=35507; -- Enchanter Isian
UPDATE `creature_template` SET `npcflag`=`npcflag`|129 WHERE `entry`=28776; -- Elizabeth Ross
UPDATE `creature_template` SET `npcflag`=`npcflag`|129 WHERE `entry`=29478; -- Jepetto Joybuzz
UPDATE `creature_template` SET `npcflag`=`npcflag`|130 WHERE `entry`=28718; -- Ranid Glowergold
UPDATE `creature_template` SET `npcflag`=`npcflag`|130 WHERE `entry`=29527; -- Orton Bennet
UPDATE `creature_template` SET `npcflag`=`npcflag`|130 WHERE `entry`=32337; -- Christi Stockton
UPDATE `creature_template` SET `npcflag`=`npcflag`|130 WHERE `entry`=32515; -- Braeg Stoutbeard
UPDATE `creature_template` SET `npcflag`=`npcflag`|131,`unit_flags`=`unit_flags`|320 WHERE `entry`=15351; -- Alliance Brigadier General
UPDATE `creature_template` SET `npcflag`=`npcflag`|131072 WHERE `entry`=29530; -- Binzik Goldbook
UPDATE `creature_template` SET `npcflag`=`npcflag`|131072 WHERE `entry`=30604; -- Teller Almeida
UPDATE `creature_template` SET `npcflag`=`npcflag`|131072 WHERE `entry`=30605; -- Teller Gee
UPDATE `creature_template` SET `npcflag`=`npcflag`|131072 WHERE `entry`=30607; -- Teller Plushner
UPDATE `creature_template` SET `npcflag`=`npcflag`|147 WHERE `entry`=28701; -- Timothy Jones
UPDATE `creature_template` SET `npcflag`=`npcflag`|16 WHERE `entry`=28693; -- Enchanter Nalthanis
UPDATE `creature_template` SET `npcflag`=`npcflag`|16 WHERE `entry`=28697; -- Timofey Oshenko
UPDATE `creature_template` SET `npcflag`=`npcflag`|16 WHERE `entry`=28702; -- Professor Pallin
UPDATE `creature_template` SET `npcflag`=`npcflag`|16 WHERE `entry`=28704; -- Dorothy Egan
UPDATE `creature_template` SET `npcflag`=`npcflag`|16 WHERE `entry`=29509; -- Namha Moonwater
UPDATE `creature_template` SET `npcflag`=`npcflag`|16 WHERE `entry`=29513; -- Didi the Wrench
UPDATE `creature_template` SET `npcflag`=`npcflag`|16 WHERE `entry`=29514; -- Findle Whistlesteam
UPDATE `creature_template` SET `npcflag`=`npcflag`|19 WHERE `entry`=28699; -- Charles Worth
UPDATE `creature_template` SET `npcflag`=`npcflag`|19 WHERE `entry`=28703; -- Linzy Blackbolt
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=30115; -- Vereesa Windrunner
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=30116; -- Archmage Aethas Sunreaver
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=30137; -- Shifty Vickers
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=30490; -- Rin Duoctane
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=31080; -- Warden Alturas
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=32516; -- Washed-Up Mage
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=36506; -- Daros Moonlance
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=37776; -- Apprentice Nelphi
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=37780; -- Dark Ranger Vorel
UPDATE `creature_template` SET `npcflag`=`npcflag`|2,`unit_flags`=`unit_flags`|768 WHERE `entry`=35471; -- Sorn Proudmane
UPDATE `creature_template` SET `npcflag`=`npcflag`|2176 WHERE `entry`=28714; -- Ildine Sorrowspear
UPDATE `creature_template` SET `npcflag`=`npcflag`|2176 WHERE `entry`=29537; -- Darahir
UPDATE `creature_template` SET `npcflag`=`npcflag`|2176 WHERE `entry`=29636; -- Hagatha Moorehead
UPDATE `creature_template` SET `npcflag`=`npcflag`|262145 WHERE `entry`=29534; -- "Baroness" Llana
UPDATE `creature_template` SET `npcflag`=`npcflag`|262145 WHERE `entry`=32329; -- Kanika Goldwell
UPDATE `creature_template` SET `npcflag`=`npcflag`|3 WHERE `entry`=16128; -- Rhonin
UPDATE `creature_template` SET `npcflag`=`npcflag`|3 WHERE `entry`=20735; -- Archmage Lan'dalock
UPDATE `creature_template` SET `npcflag`=`npcflag`|3 WHERE `entry`=28160; -- Archmage Pentarus
UPDATE `creature_template` SET `npcflag`=`npcflag`|3 WHERE `entry`=29156; -- Archmage Celindra
UPDATE `creature_template` SET `npcflag`=`npcflag`|3 WHERE `entry`=31439; -- Archmage Timear
UPDATE `creature_template` SET `npcflag`=`npcflag`|3 WHERE `entry`=36669; -- Arcanist Tybalin
UPDATE `creature_template` SET `npcflag`=`npcflag`|384 WHERE `entry`=28691; -- Susana Averoy
UPDATE `creature_template` SET `npcflag`=`npcflag`|384 WHERE `entry`=29493; -- Jarold Puller
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=28716; -- Palja Amboss
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=28722; -- Bryan Landers
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=28989; -- Aemara
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=28990; -- Anthony Durain
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=28991; -- Valaden Silverblade
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=28992; -- Valerie Langrom
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=28995; -- Paldesse
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=28997; -- Griselda Hunderland
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=29476; -- Dagna Flintlock
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=29494; -- Shen Kang Cheng
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=29496; -- Kerta the Bold
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=29497; -- Walther Whiteford
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=29499; -- Bartram Haller
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=29523; -- Bragund Brightlink
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=29538; -- Hexil Garrot
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=34252; -- Dubin Clay
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=35497; -- Rafael Langrom
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224 WHERE `entry`=35500; -- Matilda Brightlink
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|512 WHERE `entry`=34095; -- Trapjaw Rix
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|512 WHERE `entry`=35496; -- Rueben Lauren
UPDATE `creature_template` SET `npcflag`=`npcflag`|4224,`unit_flags`=`unit_flags`|512 WHERE `entry`=35498; -- Horace Hunderland
UPDATE `creature_template` SET `npcflag`=`npcflag`|640 WHERE `entry`=28682; -- Inzi Charmlight
UPDATE `creature_template` SET `npcflag`=`npcflag`|640 WHERE `entry`=28685; -- Narisa Redgold
UPDATE `creature_template` SET `npcflag`=`npcflag`|640 WHERE `entry`=29547; -- Applebough
UPDATE `creature_template` SET `npcflag`=`npcflag`|640 WHERE `entry`=29714; -- Lucian Trias
UPDATE `creature_template` SET `npcflag`=`npcflag`|640 WHERE `entry`=29715; -- Fialla Sweetberry
UPDATE `creature_template` SET `npcflag`=`npcflag`|640 WHERE `entry`=32403; -- Sandra Bartan
UPDATE `creature_template` SET `npcflag`=`npcflag`|640 WHERE `entry`=32421; -- Marcella Bloom
UPDATE `creature_template` SET `npcflag`=`npcflag`|640 WHERE `entry`=32424; -- Laire Brewgold
UPDATE `creature_template` SET `npcflag`=`npcflag`|640 WHERE `entry`=32426; -- Coira Longrifle
UPDATE `creature_template` SET `npcflag`=`npcflag`|640 WHERE `entry`=33026; -- Sarah Brady
UPDATE `creature_template` SET `npcflag`=`npcflag`|642 WHERE `entry`=29049; -- Arille Azuregaze
UPDATE `creature_template` SET `npcflag`=`npcflag`|65536 WHERE `entry`=28686; -- Caliel Brightwillow
UPDATE `creature_template` SET `npcflag`=`npcflag`|65536 WHERE `entry`=32411; -- Afsaneh Asrar
UPDATE `creature_template` SET `npcflag`=`npcflag`|66177 WHERE `entry`=28687; -- Amisi Azuregaze
UPDATE `creature_template` SET `npcflag`=`npcflag`|66177 WHERE `entry`=31557; -- Uda the Beast
UPDATE `creature_template` SET `npcflag`=`npcflag`|66177 WHERE `entry`=32413; -- Isirami Fairwind
UPDATE `creature_template` SET `npcflag`=`npcflag`|66179 WHERE `entry`=29532; -- Ajay Green
UPDATE `creature_template` SET `npcflag`=`npcflag`|723 WHERE `entry`=28742; -- Marcia Chase
UPDATE `creature_template` SET `npcflag`=`npcflag`|7296 WHERE `entry`=32641; -- Drix Blackwrench
UPDATE `creature_template` SET `npcflag`=`npcflag`|786433 WHERE `entry`=28774; -- Andrew Matthews
UPDATE `creature_template` SET `npcflag`=`npcflag`|80 WHERE `entry`=28694; -- Alard Schmied
UPDATE `creature_template` SET `npcflag`=`npcflag`|80 WHERE `entry`=28698; -- Jedidiah Handers
UPDATE `creature_template` SET `npcflag`=`npcflag`|80 WHERE `entry`=29505; -- Imindril Spearsong
UPDATE `creature_template` SET `npcflag`=`npcflag`|80 WHERE `entry`=29506; -- Orland Schaeffer
UPDATE `creature_template` SET `npcflag`=`npcflag`|82 WHERE `entry`=28706; -- Olisarra the Kind
UPDATE `creature_template` SET `npcflag`=`npcflag`|83 WHERE `entry`=28705; -- Katherine Lee
UPDATE `creature_template` SET `npcflag`=`npcflag`|896 WHERE `entry`=32642; -- Mojodishu
UPDATE `creature_template` SET `unit_class`=4 WHERE `entry`=36774; -- Silver Covenant Agent
UPDATE `creature_template` SET `unit_class`=4 WHERE `entry`=36776; -- Sunreaver Agent
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|32832,`equipment_id`=1819 WHERE `entry`=37225; -- Uther the Lightbringer
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33555200 WHERE `entry`=35608; -- [DND] Dalaran Argent Tournament Herald Bunny
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33555200 WHERE `entry`=37906; -- Imprisoned Soul
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|768 WHERE `entry`=34330; -- Jones
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|768 WHERE `entry`=35826; -- Kaye Toogie

-- Equipments
DELETE FROM `creature_equip_template` WHERE `entry` IN (@Equip,@Equip+1);
INSERT INTO `creature_equip_template` (`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(@Equip+0,22199,0,0),
(@Equip+1,50771,50781,0);

-- Creature addon updates
DELETE FROM `creature_template_addon` WHERE `entry` IN (15351,16128,20735,23472,25171,26043,26119,27047,27870,28160,28332,28682,28685,28686,28687,28691,28692,28693,28694,28697,28698,28699,28701,28702,28703,28704,28705,28706,28707,28708,28714,28715,28716,28718,28721,28722,28723,28725,28726,28727,28728,28742,28774,28776,28956,28958,28989,28990,28991,28992,28993,28994,28995,28997,29049,29156,29238,29254,29255,29261,29325,29476,29478,29491,29493,29494,29495,29496,29497,29499,29505,29506,29509,29510,29511,29512,29513,29514,29523,29527,29528,29529,29530,29532,29533,29534,29535,29537,29538,29547,29548,29568,29628,29636,29640,29641,29660,29665,29667,29668,29669,29670,29671,29673,29675,29702,29703,29714,29715,29716,29763,29764,29765,29766,29777,29780,29781,29782,29783,29784,29785,29802,29807,29812,30094,30095,30104,30115,30116,30117,30137,30164,30352,30490,30604,30605,30607,30659,30726,30755,30885,31032,31080,31081,31228,31236,31439,31517,31557,31580,31643,31730,32169,32170,32172,32216,32249,32265,32321,32322,32328,32329,32330,32332,32333,32334,32337,32339,32340,32342,32403,32411,32413,32416,32421,32424,32425,32426,32428,32435,32441,32450,32451,32466,32470,32509,32514,32515,32516,32606,32641,32650,32651,32652,32653,32664,32668,32669,32675,32676,32677,32678,32679,32680,32681,32683,32684,32685,32686,32687,32688,32689,32690,32691,32692,32693,32709,32711,32721,32722,32723,32724,32725,32726,32727,32728,32729,32730,32731,32732,32733,32743,32744,32745,32746,32747,32749,32751,32843,32844,33026,33027,33422,33778,33936,33937,33938,33964,34095,34252,34330,34952,34953,34984,35471,35494,35496,35497,35498,35500,35507,35608,35790,35826,36506,36669,36774,36776,36851,36856,37221,37225,37226,37582,37704,37776,37780,37849,37906,37942,38112,38113,38172,38173,38175,38176,38177,38567,40160,7549);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(15351,0,0,1,0, NULL), -- Alliance Brigadier General
(16128,0,0,1,0, NULL), -- Rhonin
(20735,0,0,1,0, NULL), -- Archmage Lan'dalock
(23472,0,0,1,0, NULL), -- World Trigger (Large AOI, Not Immune PC/NPC)
(25171,0,0,1,0, NULL), -- Invisible Stalker (Scale x0.5)
(26043,0,0,1,0, NULL), -- Steam Burst
(26119,0,0,1,0, NULL), -- Phoenix Hatchling
(27047,0,0,1,0, NULL), -- Invisible Stalker (Floating Only)
(27870,0,0,1,0, NULL), -- Wild Flower
(28160,0,0,257,0, NULL), -- Archmage Pentarus
(28332,0,0,1,0, NULL), -- Generic Trigger LAB (Large AOI)
(28682,0,0,1,0, NULL), -- Inzi Charmlight
(28685,0,0,1,0, NULL), -- Narisa Redgold
(28686,0,0,1,0, NULL), -- Caliel Brightwillow
(28687,0,0,257,0, NULL), -- Amisi Azuregaze
(28691,0,0,257,0, NULL), -- Susana Averoy
(28692,0,0,257,0, NULL), -- "Red" Jack Findle
(28693,0,0,257,0, NULL), -- Enchanter Nalthanis
(28694,0,0,257,0, NULL), -- Alard Schmied
(28697,0,0,257,0, NULL), -- Timofey Oshenko
(28698,0,0,257,0, NULL), -- Jedidiah Handers
(28699,0,0,257,0, NULL), -- Charles Worth
(28701,0,0,257,0, NULL), -- Timothy Jones
(28702,0,0,257,0, NULL), -- Professor Pallin
(28703,0,0,257,0, NULL), -- Linzy Blackbolt
(28704,0,0,257,0, NULL), -- Dorothy Egan
(28705,0,0,1,0, NULL), -- Katherine Lee
(28706,0,0,257,0, NULL), -- Olisarra the Kind
(28707,0,0,257,0, NULL), -- Angelo Pescatore
(28708,0,0,257,0, NULL), -- Kizi Copperclip
(28714,0,0,257,0, NULL), -- Ildine Sorrowspear
(28715,0,0,257,0, NULL), -- Endora Moorehead
(28716,0,0,257,0, NULL), -- Palja Amboss
(28718,0,0,257,0, NULL), -- Ranid Glowergold
(28721,0,0,257,0, NULL), -- Tiffany Cartier
(28722,0,0,257,0, NULL), -- Bryan Landers
(28723,0,0,257,0, NULL), -- Larana Drome
(28725,0,0,257,0, NULL), -- Patricia Egan
(28726,0,0,257,0, NULL), -- Dominique Stefano
(28727,0,0,257,0, NULL), -- Edward Egan
(28728,0,0,257,0, NULL), -- Dorian Fines
(28742,0,0,257,0, NULL), -- Marcia Chase
(28774,0,0,257,0, NULL), -- Andrew Matthews
(28776,0,0,257,0, NULL), -- Elizabeth Ross
(28956,0,0,257,0, NULL), -- Warcaster Fanoraithe
(28958,0,0,257,0, NULL), -- Jessa Weaver
(28989,0,0,258,0, NULL), -- Aemara
(28990,0,0,257,0, NULL), -- Anthony Durain
(28991,0,0,257,0, NULL), -- Valaden Silverblade
(28992,0,0,257,0, NULL), -- Valerie Langrom
(28993,0,0,1,0, NULL), -- Aerith Primrose
(28994,0,0,257,0, NULL), -- Abra Cadabra
(28995,0,0,257,0, NULL), -- Paldesse
(28997,0,0,257,0, NULL), -- Griselda Hunderland
(29049,0,0,1,0, NULL), -- Arille Azuregaze
(29156,0,0,257,0, NULL), -- Archmage Celindra
(29238,0,0,1,0, NULL), -- Scourge Haunt
(29254,0,0,1,0, NULL), -- Silver Covenant Guardian Mage
(29255,0,0,1,0, NULL), -- Sunreaver Guardian Mage
(29261,0,0,2,0, NULL), -- Windle Sparkshine
(29325,0,0,1,379, NULL), -- Torgo the Younger
(29476,0,0,258,0, NULL), -- Dagna Flintlock
(29478,0,0,257,0, NULL), -- Jepetto Joybuzz
(29491,0,0,257,0, NULL), -- Karandonna
(29493,0,0,257,0, NULL), -- Jarold Puller
(29494,0,0,257,0, NULL), -- Shen Kang Cheng
(29495,0,0,257,0, NULL), -- Norvin Alderman
(29496,0,0,257,0, NULL), -- Kerta the Bold
(29497,0,0,257,69, NULL), -- Walther Whiteford
(29499,0,0,257,0, NULL), -- Bartram Haller
(29505,0,0,257,233, NULL), -- Imindril Spearsong
(29506,0,0,257,0, NULL), -- Orland Schaeffer
(29509,0,0,257,0, NULL), -- Namha Moonwater
(29510,0,0,257,0, NULL), -- Linna Bruder
(29511,0,0,257,0, NULL), -- Lalla Brightweave
(29512,0,0,257,69, NULL), -- Ainderu Summerleaf
(29513,0,0,257,0, NULL), -- Didi the Wrench
(29514,0,0,257,0, NULL), -- Findle Whistlesteam
(29523,0,0,257,0, NULL), -- Bragund Brightlink
(29527,0,0,257,0, NULL), -- Orton Bennet
(29528,0,0,257,0, NULL), -- Debbi Moore
(29529,0,0,257,0, NULL), -- Ninsianna
(29530,0,0,257,0, NULL), -- Binzik Goldbook
(29532,0,0,257,0, NULL), -- Ajay Green
(29533,0,0,1,0, NULL), -- Schembari "Uncle Sal" Shearbolt
(29534,0,0,1,0, NULL), -- "Baroness" Llana
(29535,0,0,257,0, NULL), -- Alchemist Cinesra
(29537,0,0,257,0, NULL), -- Darahir
(29538,0,0,257,0, NULL), -- Hexil Garrot
(29547,0,0,257,0, NULL), -- Applebough
(29548,0,0,257,0, NULL), -- Aimee
(29568,0,0,1,0, NULL), -- "Techs" Rickard Rustbolt
(29628,0,0,257,0, NULL), -- Angelique Butler
(29636,0,0,257,0, NULL), -- Hagatha Moorehead
(29640,0,0,257,0, NULL), -- Josie Birch
(29641,0,0,257,0, NULL), -- Theresa Wolf
(29660,0,0,1,0, NULL), -- Grand Marauder Sai
(29665,0,0,1,0, NULL), -- Pazik "The Pick" Prylock
(29667,0,0,1,0, NULL), -- Warsong Gulch Portal
(29668,0,0,1,0, NULL), -- Arathi Basin Portal
(29669,0,0,1,0, NULL), -- Alterac Valley Portal
(29670,0,0,1,0, NULL), -- Eye of the Storm Portal
(29671,0,0,1,0, NULL), -- Strand of the Ancients Portal
(29673,0,0,1,0, NULL), -- Arathi Basin Portal
(29675,0,0,1,0, NULL), -- Eye of the Storm Portal
(29702,0,0,257,0, NULL), -- Chameli Banaphash
(29703,0,0,257,0, NULL), -- Sheddle Glossgleam
(29714,0,0,1,0, NULL), -- Lucian Trias
(29715,0,0,257,0, NULL), -- Fialla Sweetberry
(29716,0,0,257,0, NULL), -- Clockwork Assistant
(29763,0,0,1,0, NULL), -- Cosmetic Totem Alliance Air
(29764,0,0,1,0, NULL), -- Cosmetic Totem Alliance Earth
(29765,0,0,1,0, NULL), -- Cosmetic Totem Alliance Fire
(29766,0,0,1,0, NULL), -- Cosmetic Totem Alliance Water
(29777,0,0,1,0, NULL), -- Cosmetic Mechanical Gorilla
(29780,0,0,1,0, NULL), -- Cosmetic Mechanical Chicken
(29781,0,0,1,0, NULL), -- Cosmetic Mechanical Squirrel
(29782,0,0,1,0, NULL), -- Cosmetic Mechanical Sheep
(29783,0,0,1,0, NULL), -- Cosmetic Clockwork Robot
(29784,0,0,1,0, NULL), -- Cosmetic Clockwork Robot (Blue)
(29785,0,0,1,0, NULL), -- Cosmetic Clockwork Robot (Red)
(29802,0,0,1,0, NULL), -- Cosmetic Toy Plane
(29807,0,0,1,0, NULL), -- [DND] Dalaran Toy Store Plane String Hook
(29812,0,0,1,0, NULL), -- [DND] Dalaran Toy Store Plane String Bunny
(30094,0,0,1,0, NULL), -- Dalaran Sewer Rat
(30095,0,0,1,0, NULL), -- Dalaran Sewer Turtle
(30104,0,1,257,0, NULL), -- Adamman the Trader
(30115,0,0,2,0, NULL), -- Vereesa Windrunner
(30116,0,0,1,0, NULL), -- Archmage Aethas Sunreaver
(30117,0,0,1,0, NULL), -- Archmage Modera
(30137,0,0,1,0, NULL), -- Shifty Vickers
(30164,0,0,133121,0, NULL), -- Cavedweller Worg
(30352,0,0,256,0, NULL), -- Skybreaker Marine
(30490,0,0,1,0, NULL), -- Rin Duoctane
(30604,0,0,257,0, NULL), -- Teller Almeida
(30605,0,0,257,0, NULL), -- Teller Gee
(30607,0,0,257,0, NULL), -- Teller Plushner
(30659,0,0,1,0, NULL), -- Violet Hold Guard
(30726,0,0,257,0, NULL), -- Archivist Betha
(30755,0,0,256,0, NULL), -- Kor'kron Reaver
(30885,0,0,1,0, NULL), -- Blazik Fireclaw
(31032,0,0,1,0, NULL), -- Derek Odds
(31080,0,0,1,0, NULL), -- Warden Alturas
(31081,0,0,1,0, NULL), -- Officer Van Rossem
(31228,0,0,1,0, NULL), -- Grove Walker
(31236,0,0,1,0, NULL), -- Dappled Stag
(31439,0,0,1,0, NULL), -- Archmage Timear
(31517,0,0,1,0, NULL), -- Dalaran Fountain Invis Stalker
(31557,0,0,1,0, NULL), -- Uda the Beast
(31580,0,0,1,0, NULL), -- Arcanist Ivrenne
(31643,0,0,1,0, NULL), -- Dalaran Well Teleport Bunny
(31730,0,0,1,0, NULL), -- Cosmetic Frog
(32169,0,0,1,0, NULL), -- Arcanist Braedin
(32170,0,0,1,0, NULL), -- Magister Surdiel
(32172,0,0,257,0, NULL), -- Harold Winston
(32216,0,0,257,0, NULL), -- Mei Francis
(32249,0,0,1,0, NULL), -- Worg Pup
(32265,0,50331648,1,0, NULL), -- Northrend Daily Dungeon Image Bunny
(32321,0,0,1,0, NULL), -- Green Warrior
(32322,0,0,1,0, NULL), -- Gold Warrior
(32328,0,0,1,0, NULL), -- [DND] Dalaran Sewer Arena - Controller - Death
(32329,0,0,1,0, NULL), -- Kanika Goldwell
(32330,0,0,1,0, NULL), -- Minzi the Minx
(32332,0,0,1,0, NULL), -- Ramik Slamwrench
(32333,0,0,1,0, NULL), -- "Dapper" Danik Blackshaft
(32334,0,0,1,0, NULL), -- Nixi Fireclaw
(32337,0,0,257,0, NULL), -- Christi Stockton
(32339,0,0,1,0, NULL), -- [DND] Dalaran Sewer Arena - Controller
(32340,0,0,1,0, NULL), -- Gold Shaman
(32342,0,0,1,0, NULL), -- Green Paladin
(32403,0,0,1,0, NULL), -- Sandra Bartan
(32411,0,0,257,0, NULL), -- Afsaneh Asrar
(32413,0,0,1,0, NULL), -- Isirami Fairwind
(32416,0,0,1,0, NULL), -- Stefen Cotter
(32421,0,0,1,0, NULL), -- Marcella Bloom
(32424,0,0,1,0, NULL), -- Laire Brewgold
(32425,0,0,1,0, NULL), -- Galkara the Assassin
(32426,0,0,1,0, NULL), -- Coira Longrifle
(32428,0,0,1,0, NULL), -- Underbelly Rat
(32435,0,0,1,0, NULL), -- Vern
(32441,0,0,1,0, NULL), -- Underbelly Croc
(32450,0,3,1,0, NULL), -- Badluck
(32451,0,0,257,0, NULL), -- Dalaran Citizen
(32466,0,0,1,0, NULL), -- Monstrous Underbelly Rat
(32470,0,0,1,0, NULL), -- Sewer Frog
(32509,0,0,257,0, NULL), -- Brammold Deepmine
(32514,0,0,257,0, NULL), -- Vanessa Sellers
(32515,0,0,257,0, NULL), -- Braeg Stoutbeard
(32516,0,3,257,0, NULL), -- Washed-Up Mage
(32606,0,0,1,0, NULL), -- [DND] Cosmetic Book
(32641,0,0,1,0, NULL), -- Drix Blackwrench
(32650,0,3,1,0, NULL), -- Wounded Dalaran Protector
(32651,0,7,1,0, NULL), -- Wounded Dalaran Shield Guard
(32652,0,3,1,0, NULL), -- Wounded Dalaran Watcher
(32653,0,7,1,0, NULL), -- Wounded Dalaran Serpent
(32664,0,0,1,0, NULL), -- Segacedi
(32668,0,0,257,0, NULL), -- Emi
(32669,0,0,257,0, NULL), -- Colin
(32675,0,0,257,0, NULL), -- Babagahnoosh the Grumpy
(32676,0,0,257,0, NULL), -- Grindle Firespark
(32677,0,0,257,0, NULL), -- Whirt the All-Knowing
(32678,0,0,257,0, NULL), -- Emeline Fizzlefry
(32679,0,0,257,0, NULL), -- Darthalia Ebonscorch
(32680,0,0,257,0, NULL), -- Fabioso the Fabulous
(32681,0,0,257,0, NULL), -- The Magnificent Merleaux
(32683,0,0,257,0, NULL), -- Grezla the Hag
(32684,0,0,257,0, NULL), -- Mona Everspring
(32685,0,0,257,0, NULL), -- Kitz Proudbreeze
(32686,0,0,257,0, NULL), -- Crafticus Mindbender
(32687,0,0,257,0, NULL), -- Linda Ann Kastinglow
(32688,0,0,257,0, NULL), -- Archmage Tenaj
(32689,0,0,257,0, NULL), -- Adorean Lew
(32690,0,0,257,0, NULL), -- Bitty Frostflinger
(32691,0,0,257,0, NULL), -- Magus Fansy Goodbringer
(32692,0,0,257,0, NULL), -- Arcanist Alec
(32693,0,0,257,0, NULL), -- Sabriana Sorrowgaze
(32709,0,0,1,0, NULL), -- Hunaka Greenhoof
(32711,0,0,1,0, NULL), -- Warp-Huntress Kula
(32721,0,0,1,0, NULL), -- Felcaster Virim
(32722,0,0,1,0, NULL), -- Warmage Lukems
(32723,0,0,257,0, NULL), -- Warmage Kath'leen
(32724,0,0,1,0, NULL), -- Warmage Mumplina
(32725,0,0,1,0, NULL), -- Warmage Silva
(32726,0,0,257,0, NULL), -- The Chooch
(32727,0,0,257,0, NULL), -- Natalie Tootiblare
(32728,0,0,257,0, NULL), -- Illusionist Karina
(32729,0,0,257,0, NULL), -- Lofwyr Le'Fleur
(32730,0,0,257,0, NULL), -- Goldlilly Gleamingfell
(32731,0,0,257,0, NULL), -- Metopious Loreseeker
(32732,0,0,257,0, NULL), -- Dorfus Alphamage
(32733,0,0,257,0, NULL), -- Joboba Mezbreaker
(32743,0,1,1,0, NULL), -- Willard Blauvelt
(32744,0,0,1,0, NULL), -- Bakor the Gangly
(32745,0,0,1,0, NULL), -- Amera Sky
(32746,0,0,1,0, NULL), -- Geffon the Unruly
(32747,0,0,1,0, NULL), -- Mendez Nightshadow
(32749,0,1,1,0, NULL), -- Tuff Gorehoof
(32751,0,0,1,0, NULL), -- Backbiter
(32843,0,0,1,0, NULL), -- Tabea
(32844,0,0,1,0, NULL), -- Apollo
(33026,0,0,1,0, NULL), -- Sarah Brady
(33027,0,0,257,0, NULL), -- Jessica Sellers
(33422,0,0,1,0, NULL), -- Unbound Seer
(33778,0,1,1,0, NULL), -- Tournament Hippogryph
(33936,0,0,1,0, NULL), -- Nargle Lashcord
(33937,0,0,1,0, NULL), -- Xazi Smolderpipe
(33938,0,0,1,0, NULL), -- Zom Bocom
(33964,0,0,1,0, NULL), -- Arcanist Firael
(34095,0,0,1,0, NULL), -- Trapjaw Rix
(34252,0,0,257,0, NULL), -- Dubin Clay
(34330,0,3,1,0, NULL), -- Jones
(34952,0,0,1,0, NULL), -- Isle of Conquest Portal
(34953,0,0,1,0, NULL), -- Isle of Conquest Portal
(34984,0,0,1,0, NULL), -- World Trigger (Not Floating)
(35471,0,0,1,0, NULL), -- Sorn Proudmane
(35494,0,0,1,0, NULL), -- Arcanist Miluria
(35496,0,0,257,0, NULL), -- Rueben Lauren
(35497,0,0,257,0, NULL), -- Rafael Langrom
(35498,0,0,257,0, NULL), -- Horace Hunderland
(35500,0,0,257,0, NULL), -- Matilda Brightlink
(35507,0,0,1,0, NULL), -- Enchanter Isian
(35608,0,0,1,0, NULL), -- [DND] Dalaran Argent Tournament Herald Bunny
(35790,0,0,257,0, NULL), -- Usuri Brightcoin
(35826,0,1,1,0, NULL), -- Kaye Toogie
(36506,0,0,1,0, NULL), -- Daros Moonlance
(36669,0,0,1,0, NULL), -- Arcanist Tybalin
(36774,0,0,1,0, NULL), -- Silver Covenant Agent
(36776,0,0,1,0, NULL), -- Sunreaver Agent
(36851,0,0,1,0, NULL), -- Aquanos
(36856,0,0,1,0, NULL), -- Shandy Glossgleam
(37221,0,0,1,0, NULL), -- Lady Jaina Proudmoore
(37225,0,0,0,0, NULL), -- Uther the Lightbringer
(37226,0,0,1,0, NULL), -- The Lich King
(37582,0,0,1,0, NULL), -- Archmage Koreln
(37704,0,0,1,0, NULL), -- Frostmourne Altar Bunny (Quel'Delar)
(37776,0,0,1,0, NULL), -- Apprentice Nelphi
(37780,0,0,2,0, NULL), -- Dark Ranger Vorel
(37849,0,50331648,0,0, NULL), -- Sartharion Image
(37906,0,50331648,1,0, NULL), -- Imprisoned Soul
(37942,0,0,1,0, NULL), -- Arcanist Uovril
(38112,0,0,1,0, NULL), -- Falric
(38113,0,0,1,0, NULL), -- Marwyn
(38172,0,0,1,0, NULL), -- Phantom Mage
(38173,0,0,1,0, NULL), -- Spectral Footman
(38175,0,0,1,0, NULL), -- Ghostly Priest
(38176,0,0,1,0, NULL), -- Tortured Rifleman
(38177,0,0,1,0, NULL), -- Shadowy Mercenary
(38567,0,0,1,0, NULL), -- Phantom Hallucination
(40160,31837,0,257,0, NULL), -- Frozo the Renowned
(7549,0,0,1,0, NULL); -- Tree Frog

-- Model updates
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=0,`gender`=2 WHERE `modelid`=22471; -- Tournament Hippogryph
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=0,`gender`=2 WHERE `modelid`=26484; -- Alterac Valley Portal
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=0,`gender`=2 WHERE `modelid`=26495; -- Arathi Basin Portal
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=0,`gender`=2 WHERE `modelid`=26496; -- Arathi Basin Portal
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=0,`gender`=2 WHERE `modelid`=26499; -- Eye of the Storm Portal
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=0,`gender`=2 WHERE `modelid`=26501; -- Eye of the Storm Portal
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=0,`gender`=2 WHERE `modelid`=26502; -- Warsong Gulch Portal
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=0,`gender`=2 WHERE `modelid`=26504; -- Strand of the Ancients Portal
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=0,`gender`=2 WHERE `modelid`=29743; -- Isle of Conquest Portal
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=0,`gender`=2 WHERE `modelid`=29744; -- Isle of Conquest Portal
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=1,`gender`=0 WHERE `modelid`=251; -- Colin
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=1,`gender`=1 WHERE `modelid`=21270; -- Dalaran Visitor
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=1,`gender`=1 WHERE `modelid`=80; -- Emi
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=1,`gender`=2 WHERE `modelid`=2176; -- Cosmetic Rat
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=1,`gender`=2 WHERE `modelid`=25870; -- Mekgineer's Chopper
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=2,`gender`=2 WHERE `modelid`=26759; -- Dalaran Sewer Rat
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=4,`gender`=2 WHERE `modelid`=27243; -- Wooly Mammoth
UPDATE `creature_model_info` SET `bounding_radius`=0,`combat_reach`=4,`gender`=2 WHERE `modelid`=27972; -- Monstrous Underbelly Rat
UPDATE `creature_model_info` SET `bounding_radius`=0.00235,`combat_reach`=0,`gender`=2 WHERE `modelid`=7804; -- [DND] Dalaran Argent Tournament Herald Bunny
UPDATE `creature_model_info` SET `bounding_radius`=0.03,`combat_reach`=0,`gender`=2 WHERE `modelid`=26557; -- Cosmetic Toy Plane
UPDATE `creature_model_info` SET `bounding_radius`=0.0937,`combat_reach`=0,`gender`=2 WHERE `modelid`=26530; -- Cosmetic Clockwork Robot (Blue)
UPDATE `creature_model_info` SET `bounding_radius`=0.0937,`combat_reach`=0,`gender`=2 WHERE `modelid`=26531; -- Cosmetic Clockwork Robot (Red)
UPDATE `creature_model_info` SET `bounding_radius`=0.0937,`combat_reach`=0,`gender`=2 WHERE `modelid`=26547; -- Cosmetic Clockwork Robot
UPDATE `creature_model_info` SET `bounding_radius`=0.1,`combat_reach`=0,`gender`=2 WHERE `modelid`=24897; -- Wild Flower
UPDATE `creature_model_info` SET `bounding_radius`=0.1,`combat_reach`=0,`gender`=2 WHERE `modelid`=24898; -- Wild Flower
UPDATE `creature_model_info` SET `bounding_radius`=0.12,`combat_reach`=0,`gender`=2 WHERE `modelid`=24895; -- Wild Flower
UPDATE `creature_model_info` SET `bounding_radius`=0.125,`combat_reach`=0,`gender`=2 WHERE `modelid`=17188; -- Invisible Stalker (Scale x0.5)
UPDATE `creature_model_info` SET `bounding_radius`=0.125,`combat_reach`=0,`gender`=2 WHERE `modelid`=17200; -- Northrend Daily Dungeon Image Bunny
UPDATE `creature_model_info` SET `bounding_radius`=0.15,`combat_reach`=0,`gender`=2 WHERE `modelid`=23574; -- Phoenix Hatchling
UPDATE `creature_model_info` SET `bounding_radius`=0.175,`combat_reach`=0,`gender`=2 WHERE `modelid`=23501; -- Steam Burst
UPDATE `creature_model_info` SET `bounding_radius`=0.18,`combat_reach`=1,`gender`=2 WHERE `modelid`=30799; -- Sartharion Image
UPDATE `creature_model_info` SET `bounding_radius`=0.186,`combat_reach`=0,`gender`=2 WHERE `modelid`=28212; -- Backbiter
UPDATE `creature_model_info` SET `bounding_radius`=0.187,`combat_reach`=0,`gender`=2 WHERE `modelid`=1160; -- Spider
UPDATE `creature_model_info` SET `bounding_radius`=0.187,`combat_reach`=0,`gender`=2 WHERE `modelid`=2536; -- Spider
UPDATE `creature_model_info` SET `bounding_radius`=0.2,`combat_reach`=0,`gender`=2 WHERE `modelid`=26517; -- Cosmetic Totem Alliance Air
UPDATE `creature_model_info` SET `bounding_radius`=0.2,`combat_reach`=0,`gender`=2 WHERE `modelid`=26518; -- Cosmetic Totem Alliance Earth
UPDATE `creature_model_info` SET `bounding_radius`=0.2,`combat_reach`=0,`gender`=2 WHERE `modelid`=26519; -- Cosmetic Totem Alliance Fire
UPDATE `creature_model_info` SET `bounding_radius`=0.2,`combat_reach`=0,`gender`=2 WHERE `modelid`=26521; -- Cosmetic Totem Alliance Water
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=15253; -- League of Arathor Emissary
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25605; -- Amisi Azuregaze
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25608; -- Susana Averoy
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25620; -- Dorothy Egan
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25621; -- Katherine Lee
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25636; -- Endora Moorehead
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25637; -- Palja Amboss
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25645; -- Tiffany Cartier
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25647; -- Larana Drome
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25648; -- Patricia Egan
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25649; -- Dominique Stefano
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25655; -- Marcia Chase
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25674; -- Elizabeth Ross
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25807; -- Jessa Weaver
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25878; -- Valerie Langrom
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25880; -- Abra Cadabra
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25881; -- Griselda Hunderland
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=25983; -- Aerith Primrose
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=26311; -- Kerta the Bold
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=26377; -- Linna Bruder
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=26390; -- Angelique Butler
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=26396; -- Debbi Moore
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=26397; -- Hagatha Moorehead
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=26398; -- Josie Birch
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=26414; -- Grand Marauder Sai
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=26438; -- Chameli Banaphash
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=26440; -- Christi Stockton
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=27287; -- Archivist Betha
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=27782; -- Theresa Wolf
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=27822; -- Mei Francis
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=27944; -- Warmage Mumplina
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=27952; -- Sandra Bartan
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=27954; -- Afsaneh Asrar
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=27962; -- Marcella Bloom
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=27999; -- Vanessa Sellers
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=28125; -- Wounded Dalaran Watcher
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=28150; -- Grezla the Hag
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=28155; -- Linda Ann Kastinglow
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=28166; -- Illusionist Karina
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=28202; -- Amera Sky
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=28317; -- Tabea
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=28433; -- Jessica Sellers
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1,`gender`=1 WHERE `modelid`=30764; -- Apprentice Nelphi
UPDATE `creature_model_info` SET `bounding_radius`=0.2288,`combat_reach`=1,`gender`=1 WHERE `modelid`=24916; -- Warmage Kath'leen
UPDATE `creature_model_info` SET `bounding_radius`=0.2288,`combat_reach`=1,`gender`=1 WHERE `modelid`=25947; -- Archmage Celindra
UPDATE `creature_model_info` SET `bounding_radius`=0.236,`combat_reach`=1,`gender`=1 WHERE `modelid`=27333; -- Kor'kron Reaver
UPDATE `creature_model_info` SET `bounding_radius`=0.236,`combat_reach`=1,`gender`=1 WHERE `modelid`=28185; -- Warp-Huntress Kula
UPDATE `creature_model_info` SET `bounding_radius`=0.236,`combat_reach`=1,`gender`=1 WHERE `modelid`=28208; -- Galkara the Assassin
UPDATE `creature_model_info` SET `bounding_radius`=0.2429,`combat_reach`=1,`gender`=2 WHERE `modelid`=850; -- Felhunter
UPDATE `creature_model_info` SET `bounding_radius`=0.25,`combat_reach`=0,`gender`=2 WHERE `modelid`=16259; -- Dalaran Sewer Turtle
UPDATE `creature_model_info` SET `bounding_radius`=0.25,`combat_reach`=0,`gender`=2 WHERE `modelid`=5448; -- Cosmetic Cat Set 2/2
UPDATE `creature_model_info` SET `bounding_radius`=0.25,`combat_reach`=0,`gender`=2 WHERE `modelid`=5554; -- Jones
UPDATE `creature_model_info` SET `bounding_radius`=0.25,`combat_reach`=0,`gender`=2 WHERE `modelid`=5556; -- Badluck
UPDATE `creature_model_info` SET `bounding_radius`=0.25,`combat_reach`=0,`gender`=2 WHERE `modelid`=5966; -- Wounded Dalaran Serpent
UPDATE `creature_model_info` SET `bounding_radius`=0.26,`combat_reach`=1,`gender`=1 WHERE `modelid`=26771; -- Archmage Modera
UPDATE `creature_model_info` SET `bounding_radius`=0.2625,`combat_reach`=0,`gender`=2 WHERE `modelid`=26524; -- Cosmetic Mechanical Gorilla
UPDATE `creature_model_info` SET `bounding_radius`=0.263347,`combat_reach`=0,`gender`=2 WHERE `modelid`=16885; -- Ravager Specimen
UPDATE `creature_model_info` SET `bounding_radius`=0.275,`combat_reach`=0,`gender`=2 WHERE `modelid`=28318; -- Apollo
UPDATE `creature_model_info` SET `bounding_radius`=0.2912,`combat_reach`=2,`gender`=1 WHERE `modelid`=30977; -- Phantom Hallucination
UPDATE `creature_model_info` SET `bounding_radius`=0.2912,`combat_reach`=2,`gender`=1 WHERE `modelid`=30977; -- Phantom Mage
UPDATE `creature_model_info` SET `bounding_radius`=0.3,`combat_reach`=0,`gender`=2 WHERE `modelid`=27720; -- Cosmetic Worg Pup
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=23337; -- Warmage Silva
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=24607; -- Sebastian Bower
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=25166; -- Archmage Pentarus
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=25609; -- "Red" Jack Findle
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=25611; -- Alard Schmied
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=25613; -- Timofey Oshenko
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=25614; -- Jedidiah Handers
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=25615; -- Charles Worth
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=25623; -- Angelo Pescatore
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=25646; -- Bryan Landers
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=25650; -- Edward Egan
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=25651; -- Dorian Fines
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=25673; -- Andrew Matthews
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=25876; -- Anthony Durain
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26075; -- Timothy Jones
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26138; -- Torgo the Younger
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26307; -- Jarold Puller
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26309; -- Shen Kang Cheng
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26310; -- Norvin Alderman
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26312; -- Walther Whiteford
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26313; -- Bartram Haller
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26338; -- Orland Schaeffer
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26362; -- Schembari "Uncle Sal" Shearbolt
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26372; -- Binzik Goldbook
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26373; -- Ajay Green
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26391; -- "Techs" Rickard Rustbolt
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26395; -- Orton Bennet
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26417; -- Pazik "The Pick" Prylock
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26444; -- Hexil Garrot
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26445; -- Alchemist Cinesra
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26463; -- Nargle Lashcord
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26465; -- Zom Bocom
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26766; -- Adamman the Trader
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26779; -- Shifty Vickers
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26997; -- Skybreaker Marine
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=26998; -- Skybreaker Marine
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=27068; -- Rin Duoctane
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=27157; -- Teller Almeida
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=27158; -- Teller Gee
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=27160; -- Teller Plushner
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=27334; -- Kor'kron Reaver
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=27398; -- Blazik Fireclaw
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=27449; -- Derek Odds
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=27799; -- Harold Winston
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=27910; -- Ramik Slamwrench
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=27911; -- "Dapper" Danik Blackshaft
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=27915; -- Lucian Trias
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=27958; -- Stefen Cotter
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=28006; -- Washed-Up Mage
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=28120; -- Drix Blackwrench
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=28123; -- Wounded Dalaran Protector
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=28124; -- Wounded Dalaran Shield Guard
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=28145; -- Whirt the All-Knowing
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=28149; -- The Magnificent Merleaux
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=28154; -- Crafticus Mindbender
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=28159; -- Adorean Lew
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=28161; -- Magus Fansy Goodbringer
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=28164; -- The Chooch
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=28203; -- Geffon the Unruly
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=29833; -- Horace Hunderland
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=29835; -- Rafael Langrom
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=29836; -- Rueben Lauren
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=0 WHERE `modelid`=30685; -- Archmage Koreln
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=1 WHERE `modelid`=25955; -- Kizi Copperclip
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=1 WHERE `modelid`=26335; -- Namha Moonwater
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=1 WHERE `modelid`=26347; -- Ninsianna
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=1 WHERE `modelid`=26375; -- Didi the Wrench
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=1 WHERE `modelid`=26386; -- "Baroness" Llana
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=1 WHERE `modelid`=26464; -- Xazi Smolderpipe
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=1 WHERE `modelid`=27908; -- Kanika Goldwell
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=1 WHERE `modelid`=27909; -- Minzi the Minx
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=1 WHERE `modelid`=27912; -- Nixi Fireclaw
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1,`gender`=1 WHERE `modelid`=29921; -- Usuri Brightcoin
UPDATE `creature_model_info` SET `bounding_radius`=0.3068,`combat_reach`=1,`gender`=1 WHERE `modelid`=27616; -- Uda the Beast
UPDATE `creature_model_info` SET `bounding_radius`=0.3366,`combat_reach`=1,`gender`=0 WHERE `modelid`=27215; -- Violet Hold Guard
UPDATE `creature_model_info` SET `bounding_radius`=0.3366,`combat_reach`=1,`gender`=0 WHERE `modelid`=27216; -- Violet Hold Guard
UPDATE `creature_model_info` SET `bounding_radius`=0.3366,`combat_reach`=1,`gender`=0 WHERE `modelid`=27217; -- Violet Hold Guard
UPDATE `creature_model_info` SET `bounding_radius`=0.3366,`combat_reach`=1,`gender`=0 WHERE `modelid`=29076; -- Trapjaw Rix
UPDATE `creature_model_info` SET `bounding_radius`=0.347,`combat_reach`=1,`gender`=0 WHERE `modelid`=21273; -- Dalaran Visitor
UPDATE `creature_model_info` SET `bounding_radius`=0.347,`combat_reach`=1,`gender`=0 WHERE `modelid`=25644; -- Ranid Glowergold
UPDATE `creature_model_info` SET `bounding_radius`=0.347,`combat_reach`=1,`gender`=0 WHERE `modelid`=26321; -- Bragund Brightlink
UPDATE `creature_model_info` SET `bounding_radius`=0.347,`combat_reach`=1,`gender`=0 WHERE `modelid`=27332; -- Skybreaker Marine
UPDATE `creature_model_info` SET `bounding_radius`=0.347,`combat_reach`=1,`gender`=0 WHERE `modelid`=27998; -- Brammold Deepmine
UPDATE `creature_model_info` SET `bounding_radius`=0.347,`combat_reach`=1,`gender`=0 WHERE `modelid`=28000; -- Braeg Stoutbeard
UPDATE `creature_model_info` SET `bounding_radius`=0.347,`combat_reach`=1,`gender`=0 WHERE `modelid`=28170; -- Dorfus Alphamage
UPDATE `creature_model_info` SET `bounding_radius`=0.347,`combat_reach`=1,`gender`=0 WHERE `modelid`=29145; -- Dubin Clay
UPDATE `creature_model_info` SET `bounding_radius`=0.347,`combat_reach`=1,`gender`=1 WHERE `modelid`=26299; -- Dagna Flintlock
UPDATE `creature_model_info` SET `bounding_radius`=0.347,`combat_reach`=1,`gender`=1 WHERE `modelid`=27963; -- Laire Brewgold
UPDATE `creature_model_info` SET `bounding_radius`=0.347,`combat_reach`=1,`gender`=1 WHERE `modelid`=27965; -- Coira Longrifle
UPDATE `creature_model_info` SET `bounding_radius`=0.347,`combat_reach`=1,`gender`=1 WHERE `modelid`=29834; -- Matilda Brightlink
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=0 WHERE `modelid`=25618; -- Professor Pallin
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=0 WHERE `modelid`=26078; -- Windle Sparkshine
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=0 WHERE `modelid`=26300; -- Jepetto Joybuzz
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=0 WHERE `modelid`=26374; -- Findle Whistlesteam
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=0 WHERE `modelid`=26437; -- Sheddle Glossgleam
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=0 WHERE `modelid`=27465; -- Warden Alturas
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=0 WHERE `modelid`=28143; -- Babagahnoosh the Grumpy
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=0 WHERE `modelid`=28144; -- Grindle Firespark
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=0 WHERE `modelid`=28162; -- Arcanist Alec
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=0 WHERE `modelid`=28167; -- Lofwyr Le'Fleur
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=0 WHERE `modelid`=28199; -- Bakor the Gangly
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=0 WHERE `modelid`=30358; -- Shandy Glossgleam
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=1 WHERE `modelid`=25602; -- Inzi Charmlight
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=1 WHERE `modelid`=25619; -- Linzy Blackbolt
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=1 WHERE `modelid`=26378; -- Lalla Brightweave
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=1 WHERE `modelid`=28146; -- Emeline Fizzlefry
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=1 WHERE `modelid`=28160; -- Bitty Frostflinger
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=1 WHERE `modelid`=28165; -- Natalie Tootiblare
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=1 WHERE `modelid`=28171; -- Joboba Mezbreaker
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1,`gender`=1 WHERE `modelid`=28432; -- Sarah Brady
UPDATE `creature_model_info` SET `bounding_radius`=0.3672,`combat_reach`=1,`gender`=0 WHERE `modelid`=27587; -- Officer Van Rossem
UPDATE `creature_model_info` SET `bounding_radius`=0.3672,`combat_reach`=1,`gender`=0 WHERE `modelid`=27592; -- Archmage Timear
UPDATE `creature_model_info` SET `bounding_radius`=0.3672,`combat_reach`=1,`gender`=1 WHERE `modelid`=28118; -- Mojodishu
UPDATE `creature_model_info` SET `bounding_radius`=0.372,`combat_reach`=1,`gender`=0 WHERE `modelid`=27328; -- Kor'kron Reaver
UPDATE `creature_model_info` SET `bounding_radius`=0.372,`combat_reach`=1,`gender`=0 WHERE `modelid`=28194; -- Willard Blauvelt
UPDATE `creature_model_info` SET `bounding_radius`=0.3817,`combat_reach`=1,`gender`=0 WHERE `modelid`=27154; -- Alliance Brigadier General
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=25604; -- Caliel Brightwillow
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=25610; -- Enchanter Nalthanis
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=25806; -- Warcaster Fanoraithe
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=25877; -- Valaden Silverblade
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=25882; -- Arille Azuregaze
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=26067; -- Silver Covenant Guardian Mage
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=26068; -- Silver Covenant Guardian Mage
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=26072; -- Sunreaver Guardian Mage
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=26443; -- Darahir
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=27509; -- High Warlord Uro
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=27559; -- Arcanist Adurin
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=27800; -- Arcanist Braedin
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=27801; -- Magister Surdiel
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=27949; -- Warmage Lukems
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=28148; -- Fabioso the Fabulous
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=28151; -- Dalaran Citizen
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=28156; -- Archmage Tenaj
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=28169; -- Metopious Loreseeker
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=28198; -- Felcaster Virim
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=28755; -- Arcanist Tybalin
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=28987; -- Arcanist Firael
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=29830; -- Enchanter Isian
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=30310; -- Silver Covenant Agent
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=30439; -- Sunreaver Agent
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=0 WHERE `modelid`=30842; -- Arcanist Uovril
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=15242; -- Defilers Emissary
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=25594; -- Paldesse
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=25603; -- Narisa Redgold
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=25622; -- Olisarra the Kind
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=25635; -- Ildine Sorrowspear
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=25875; -- Aemara
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=25879; -- Karandonna
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=26069; -- Silver Covenant Guardian Mage
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=26070; -- Silver Covenant Guardian Mage
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=26073; -- Sunreaver Guardian Mage
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=26074; -- Sunreaver Guardian Mage
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=26330; -- Aimee
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=26339; -- Imindril Spearsong
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=26441; -- Fialla Sweetberry
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=27556; -- Arcanist Ivrenne
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=27956; -- Isirami Fairwind
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=28147; -- Darthalia Ebonscorch
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=28152; -- Mona Everspring
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=28153; -- Kitz Proudbreeze
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=28163; -- Sabriana Sorrowgaze
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=28168; -- Goldlilly Gleamingfell
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=29832; -- Arcanist Miluria
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=30042; -- Kaye Toogie
UPDATE `creature_model_info` SET `bounding_radius`=0.383,`combat_reach`=1,`gender`=1 WHERE `modelid`=30311; -- Silver Covenant Agent
UPDATE `creature_model_info` SET `bounding_radius`=0.385,`combat_reach`=1,`gender`=1 WHERE `modelid`=25005; -- Dreadsaber
UPDATE `creature_model_info` SET `bounding_radius`=0.3875,`combat_reach`=1,`gender`=0 WHERE `modelid`=28618; -- Unbound Seer
UPDATE `creature_model_info` SET `bounding_radius`=0.389,`combat_reach`=1,`gender`=0 WHERE `modelid`=26376; -- Ainderu Summerleaf
UPDATE `creature_model_info` SET `bounding_radius`=0.389,`combat_reach`=1,`gender`=0 WHERE `modelid`=28204; -- Mendez Nightshadow
UPDATE `creature_model_info` SET `bounding_radius`=0.389,`combat_reach`=1,`gender`=0 WHERE `modelid`=30156; -- Daros Moonlance
UPDATE `creature_model_info` SET `bounding_radius`=0.3978,`combat_reach`=1,`gender`=0 WHERE `modelid`=26847; -- Dalaran Visitor
UPDATE `creature_model_info` SET `bounding_radius`=0.4,`combat_reach`=0,`gender`=2 WHERE `modelid`=26526; -- Cosmetic Mechanical Sheep
UPDATE `creature_model_info` SET `bounding_radius`=0.4,`combat_reach`=0,`gender`=2 WHERE `modelid`=9563; -- Worg Pup
UPDATE `creature_model_info` SET `bounding_radius`=0.4131,`combat_reach`=2,`gender`=0 WHERE `modelid`=16024; -- Rhonin
UPDATE `creature_model_info` SET `bounding_radius`=0.4185,`combat_reach`=1,`gender`=0 WHERE `modelid`=27820; -- Armored Brown Bear
UPDATE `creature_model_info` SET `bounding_radius`=0.4213,`combat_reach`=1,`gender`=0 WHERE `modelid`=19744; -- Archmage Lan'dalock
UPDATE `creature_model_info` SET `bounding_radius`=0.42228,`combat_reach`=2,`gender`=0 WHERE `modelid`=31713; -- Frozo the Renowned
UPDATE `creature_model_info` SET `bounding_radius`=0.4284,`combat_reach`=2,`gender`=0 WHERE `modelid`=30978; -- Spectral Footman
UPDATE `creature_model_info` SET `bounding_radius`=0.4284,`combat_reach`=2,`gender`=0 WHERE `modelid`=30981; -- Shadowy Mercenary
UPDATE `creature_model_info` SET `bounding_radius`=0.44045,`combat_reach`=1,`gender`=1 WHERE `modelid`=30686; -- Dark Ranger Vorel
UPDATE `creature_model_info` SET `bounding_radius`=0.465,`combat_reach`=0,`gender`=1 WHERE `modelid`=30867; -- Lady Jaina Proudmoore
UPDATE `creature_model_info` SET `bounding_radius`=0.465,`combat_reach`=1,`gender`=2 WHERE `modelid`=28282; -- Brassbolt Mechawrench
UPDATE `creature_model_info` SET `bounding_radius`=0.4685,`combat_reach`=0,`gender`=2 WHERE `modelid`=26442; -- Clockwork Assistant
UPDATE `creature_model_info` SET `bounding_radius`=0.47875,`combat_reach`=1,`gender`=0 WHERE `modelid`=26770; -- Archmage Aethas Sunreaver
UPDATE `creature_model_info` SET `bounding_radius`=0.47875,`combat_reach`=1,`gender`=1 WHERE `modelid`=28222; -- Vereesa Windrunner
UPDATE `creature_model_info` SET `bounding_radius`=0.4858,`combat_reach`=2,`gender`=0 WHERE `modelid`=30980; -- Tortured Rifleman
UPDATE `creature_model_info` SET `bounding_radius`=0.5,`combat_reach`=0,`gender`=0 WHERE `modelid`=4449; -- Imp
UPDATE `creature_model_info` SET `bounding_radius`=0.5,`combat_reach`=1,`gender`=2 WHERE `modelid`=11686; -- Dalaran Fountain Invis Stalker
UPDATE `creature_model_info` SET `bounding_radius`=0.5355,`combat_reach`=2,`gender`=0 WHERE `modelid`=30821; -- Uther the Lightbringer
UPDATE `creature_model_info` SET `bounding_radius`=0.5362,`combat_reach`=2,`gender`=0 WHERE `modelid`=30979; -- Ghostly Priest
UPDATE `creature_model_info` SET `bounding_radius`=0.5392,`combat_reach`=1,`gender`=2 WHERE `modelid`=1041; -- Stabled Hunter Pet
UPDATE `creature_model_info` SET `bounding_radius`=0.54,`combat_reach`=0,`gender`=2 WHERE `modelid`=20833; -- Stabled Hunter Pet
UPDATE `creature_model_info` SET `bounding_radius`=0.59823,`combat_reach`=2,`gender`=1 WHERE `modelid`=27917; -- Gold Warrior
UPDATE `creature_model_info` SET `bounding_radius`=0.6,`combat_reach`=0,`gender`=2 WHERE `modelid`=27681; -- Cosmetic Pig
UPDATE `creature_model_info` SET `bounding_radius`=0.6,`combat_reach`=1,`gender`=2 WHERE `modelid`=12200; -- Segacedi
UPDATE `creature_model_info` SET `bounding_radius`=0.60725,`combat_reach`=3,`gender`=2 WHERE `modelid`=1988; -- Grove Walker
UPDATE `creature_model_info` SET `bounding_radius`=0.6324,`combat_reach`=2,`gender`=0 WHERE `modelid`=27919; -- Green Warrior
UPDATE `creature_model_info` SET `bounding_radius`=0.6511,`combat_reach`=2,`gender`=0 WHERE `modelid`=27930; -- Green Paladin
UPDATE `creature_model_info` SET `bounding_radius`=0.6721,`combat_reach`=1,`gender`=2 WHERE `modelid`=31094; -- Arcturis
UPDATE `creature_model_info` SET `bounding_radius`=0.75,`combat_reach`=0,`gender`=2 WHERE `modelid`=26064; -- Scourge Haunt
UPDATE `creature_model_info` SET `bounding_radius`=0.75,`combat_reach`=1,`gender`=0 WHERE `modelid`=27766; -- [DND] Dalaran Sewer Arena - Controller
UPDATE `creature_model_info` SET `bounding_radius`=0.75,`combat_reach`=1,`gender`=2 WHERE `modelid`=17612; -- Frostmourne Altar Bunny (Quel'Delar)
UPDATE `creature_model_info` SET `bounding_radius`=0.765,`combat_reach`=3,`gender`=0 WHERE `modelid`=30972; -- Falric
UPDATE `creature_model_info` SET `bounding_radius`=0.765,`combat_reach`=3,`gender`=0 WHERE `modelid`=30973; -- Marwyn
UPDATE `creature_model_info` SET `bounding_radius`=0.8,`combat_reach`=0,`gender`=2 WHERE `modelid`=27700; -- Stabled Hunter Pet
UPDATE `creature_model_info` SET `bounding_radius`=0.8725,`combat_reach`=3,`gender`=0 WHERE `modelid`=28183; -- Hunaka Greenhoof
UPDATE `creature_model_info` SET `bounding_radius`=0.9,`combat_reach`=1,`gender`=2 WHERE `modelid`=14255; -- Felguard
UPDATE `creature_model_info` SET `bounding_radius`=0.9747,`combat_reach`=4,`gender`=0 WHERE `modelid`=28207; -- Tuff Gorehoof
UPDATE `creature_model_info` SET `bounding_radius`=0.9747,`combat_reach`=4,`gender`=0 WHERE `modelid`=29820; -- Sorn Proudmane
UPDATE `creature_model_info` SET `bounding_radius`=1.05,`combat_reach`=1,`gender`=0 WHERE `modelid`=10957; -- Dappled Stag
UPDATE `creature_model_info` SET `bounding_radius`=1.05,`combat_reach`=1,`gender`=2 WHERE `modelid`=27726; -- Stabled Hunter Pet
UPDATE `creature_model_info` SET `bounding_radius`=1.1,`combat_reach`=1,`gender`=2 WHERE `modelid`=26532; -- Cosmetic Mechanical Squirrel
UPDATE `creature_model_info` SET `bounding_radius`=1.122,`combat_reach`=0,`gender`=2 WHERE `modelid`=368; -- Black Widow Hatchling
UPDATE `creature_model_info` SET `bounding_radius`=1.18065,`combat_reach`=2,`gender`=2 WHERE `modelid`=833; -- Underbelly Croc
UPDATE `creature_model_info` SET `bounding_radius`=1.2,`combat_reach`=0,`gender`=0 WHERE `modelid`=24235; -- Sinewy Wolf
UPDATE `creature_model_info` SET `bounding_radius`=1.3,`combat_reach`=1,`gender`=2 WHERE `modelid`=134; -- Squirrel
UPDATE `creature_model_info` SET `bounding_radius`=1.5,`combat_reach`=0,`gender`=0 WHERE `modelid`=22003; -- Nargut
UPDATE `creature_model_info` SET `bounding_radius`=1.5,`combat_reach`=0,`gender`=0 WHERE `modelid`=27019; -- Rhukah
UPDATE `creature_model_info` SET `bounding_radius`=1.7,`combat_reach`=2,`gender`=1 WHERE `modelid`=27931; -- Gold Shaman
UPDATE `creature_model_info` SET `bounding_radius`=2.75,`combat_reach`=5,`gender`=0 WHERE `modelid`=30721; -- The Lich King

-- Template addon updates
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`=NULL WHERE `entry`=1412; -- Squirrel
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`=NULL WHERE `entry`=14881; -- Spider
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`=NULL WHERE `entry`=14990; -- Defilers Emissary
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`=NULL WHERE `entry`=14991; -- League of Arathor Emissary
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`=NULL WHERE `entry`=17213; -- Broom
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`=NULL WHERE `entry`=32642; -- Mojodishu
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`=NULL WHERE `entry`=4075; -- Rat
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`=NULL WHERE `entry`=721; -- Rabbit
UPDATE `creature_template_addon` SET `bytes1`=3,`bytes2`=1,`mount`=0,`emote`=0,`auras`=NULL WHERE `entry`=31885; -- Rhukah
UPDATE `creature_template_addon` SET `bytes1`=3,`bytes2`=1,`mount`=0,`emote`=0,`auras`=NULL WHERE `entry`=31886; -- Nargut
-- Creature Templates 
UPDATE `creature_template` SET `speed_walk`='1.5', `speed_run`='2.0' WHERE `entry` in (36954, 37226);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRintro' WHERE `entry` in (37221, 37223);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_falric' WHERE `entry`=38112;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_marwyn' WHERE `entry`=38113;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_lich_king_hr' WHERE `entry`=36954;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_lich_king_hor' WHERE `entry`=37226;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRextro' WHERE `entry` IN (36955, 37554);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_raging_gnoul' WHERE `entry`=36940;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_risen_witch_doctor' WHERE `entry`=36941;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_abon' WHERE `entry`=37069;
UPDATE `creature_template` SET `scale`='0.8', `equipment_id`='1221' WHERE `entry` in (37221, 36955);
UPDATE `creature_template` SET `equipment_id`='1290' WHERE `entry` in (37223, 37554);
UPDATE `creature_template` SET `equipment_id`='0' WHERE `entry`=36954;
UPDATE `creature_template` SET `scale`='1' WHERE `entry`=37223;
UPDATE `creature_template` SET `scale`='0.8' WHERE `entry` in (36658, 37225, 37223, 37226, 37554);
UPDATE `creature_template` SET `unit_flags`='768', `type_flags`='268435564' WHERE `entry` in (38177, 38176, 38173, 38172, 38567, 38175);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_frostworn_general' WHERE `entry`=36723;
UPDATE `creature_template` set `scale`='1' where `entry` in (37223);
UPDATE `instance_template` SET `script` = 'instance_hall_of_reflection' WHERE map=668;
UPDATE `gameobject_template` SET `faction`='1375' WHERE `entry` in (197341, 202302, 201385, 201596);
UPDATE `creature` SET `phaseMask` = 128 WHERE `id` = 36993; 
UPDATE `creature` SET `phaseMask` = 64 WHERE `id` = 36990; 
UPDATE `instance_template` SET `script` = 'instance_halls_of_reflection' WHERE map=668;
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1594540 AND -1594430;
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
-- SCENE - Hall Of Reflection (Intro) - PreUther
(-1594433, 'The chill of this place freezes the marrow of my bones!', NULL, 16631,0,0,1, '67234'),
(-1594434, 'I... I don\'t believe it! Frostmourne stands before us, unguarded! Just as the Gnome claimed. Come, heroes!', NULL, 17049,0,0,1, '67234'),
(-1594435, 'What is that? Up ahead! Could it be ... ? Heroes at my side!', NULL, 16632,1,0,1, '67234'),
(-1594436, 'Frostmourne ... The blade that destroyed our kingdom ...', NULL, 16633,1,0,1, '67234'),
(-1594437, 'Standing this close to the blade that ended my life... The pain... It is renewed.', NULL, 17050,0,0,1, '67234'),
(-1594438, 'Stand back! Touch that blade and your soul will be scarred for all eternity! I must attempt to commune with the spirits locked away within Frostmourne. Give me space, back up please!', NULL, 16634,1,0,1, '67234'),
(-1594439, 'I dare not touch it. Stand back! Stand back! As I attempt to commune with the blade. Perhaps our salvation lies within.', NULL, 17051,1,0,1, '67234'),
-- SCENE - Hall Of Reflection (Intro) - UtherDialog
(-1594440, 'Jaina! Could it truly be you?', NULL, 16666,0,0,1, '67234'),
(-1594441, 'Careful, girl. I\'ve heard talk of that cursed blade saving us before. Look around you and see what has been born of Frostmourne.', NULL, 16659,0,0,1, '67234'),
(-1594442, 'Uther! Dear Uther! I... I\'m so sorry.', NULL, 16635,0,0,1, '67234'),
(-1594443, 'Uther...Uther the Lightbringer. How...', NULL, 17052,0,0,1, '67234'),
(-1594444, 'Jaina, you haven\'t much time. The Lich King sees what the sword sees. He will be here shortly.', NULL, 16667,0,0,1, '67234'),
(-1594445, 'You haven\'t much time. The Lich King sees what the sword sees. He will be here shortly.', NULL, 16660,0,0,1, '67234'),
(-1594446, 'Arthas is here? Maybe I...', NULL, 16636,0,0,1, '67234'),
(-1594447, 'The Lich King is here? Then my destiny shall be fulfilled today!', NULL, 17053,1,0,1, '67234'),
(-1594448, 'No, girl. Arthas is not here. Arthas is merely a presence within the Lich King\'s mind. A dwindling presence...', NULL, 16668,0,0,1, '67234'),
(-1594449, 'You cannot defeat the Lich King. Not here. You would be a fool to try. He will kill those who follow you and raise them as powerful servants of the Scourge. But for you, Sylvanas, his reward for you would be worse than the last.', NULL, 16661,0,0,1, '67234'),
(-1594450, 'But Uther, if there\'s any hope of reaching Arthas. I... I must try.', NULL, 16637,0,0,1, '67234'),
(-1594451, 'There must be a way...', NULL, 17054,0,0,1, '67234'),
(-1594452, 'Jaina, listen to me. You must destroy the Lich King. You cannot reason with him. He will kill you and your allies and raise you all as powerful soldiers of the Scourge.', NULL, 16669,0,0,1, '67234'),
(-1594453, 'Perhaps, but know this: there must always be a Lich King. Even if you were to strike down Arthas, another would have to take his place, for without the control of the Lich King, the Scourge would wash over this world like locusts, destroying all that they touched.', NULL, 16662,0,0,1, '67234'),
(-1594454, 'Tell me how, Uther? How do I destroy my prince? My...', NULL, 16638,0,0,1, '67234'),
(-1594455, 'Who could bear such a burden?', NULL, 17055,0,0,1, '67234'),
(-1594456, 'Snap out of it, girl. You must destroy the Lich King at the place where he merged with Ner\'zhul - atop the spire, at the Frozen Throne. It is the only way.', NULL, 16670,0,0,1, '67234'),
(-1594457, 'I do not know, Banshee Queen. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.', NULL, 16663,0,0,1, '67234'),
(-1594458, 'You\'re right, Uther. Forgive me. I... I don\'t know what got a hold of me. We will deliver this information to the King and the knights that battle the Scourge within Icecrown Citadel.', NULL, 16639,0,0,1, '67234'),
(-1594459, 'There is... something else that you should know about the Lich King. Control over the Scourge must never be lost. Even if you were to strike down the Lich King, another would have to take his place. For without the control of its master, the Scourge would run rampant across the world - destroying all living things.', NULL, 16671,0,0,1, '67234'),
(-1594460, 'Alas, the only way to defeat the Lich King is to destroy him at the place he was created.', NULL, 16664,0,0,1, '67234'),
(-1594461, 'Who could bear such a burden?', NULL, 16640,0,0,1, '67234'),
(-1594462, 'The Frozen Throne...', NULL, 17056,0,0,1, '67234'),
(-1594463, 'A grand sacrifice by a noble soul...', NULL, 16672,0,0,1, '67234'),
(-1594464, 'I do not know, Jaina. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.', NULL, 16673,0,0,1, '67234'),
(-1594465, 'Then maybe there is still hope...', NULL, 16641,0,0,1, '67234'),
(-1594466, 'No, Jaina! ARRRRRRGHHHH... He... He is coming. You... You must...', NULL, 16674,1,0,1, '67234'),
(-1594467, 'Aye. ARRRRRRGHHHH... He... He is coming. You... You must...', NULL, 16665,1,0,1, '67234'),
(-1594468, 'SILENCE, PALADIN!', NULL, 17225,1,0,0, '67234'),
(-1594469, 'So you wish to commune with the dead? You shall have your wish.', NULL, 17226,1,0,0, '67234'),
(-1594470, 'Falric. Marwyn. Bring their corpses to my chamber when you are through.', NULL, 17227,0,0,0, '67234'),
(-1594471, 'You won\'t deny me this, Arthas! I must know... I must find out...', NULL, 16642,1,0,1, '67234'),
(-1594472, 'You will not escape me that easily, Arthas! I will have my vengeance!', NULL, 17057,1,0,1, '67234'),
(-1594473, 'Foolish girl. You seek that, which I killed long ago. He is nearly a ghost now. A fate ago in my mind.', NULL, 17229,1,0,0, '67234'),
(-1594474, 'I will not make the same mistake again. This time there will be no escape. You fail to serve me in undead. Now, all that remains for you is oblivion!', NULL, 17228,1,0,0, '67234'),
(-1594475, 'As you wish, my lord.', NULL, 16717,1,0,0, '67234'),
(-1594476, 'As you wish, my lord.', NULL, 16741,1,0,0, '67234'),
-- SCENE - Hall Of Reflection (Extro) - PreEscape
(-1594477, 'Your allies have arrived, Jaina, just as you promised. You will all become powerful agents of the Scourge.', NULL, 17212,1,0,0, '67234'),
(-1594478, 'I will not make the same mistake again, Sylvanas. This time there will be no escape. You will all serve me in death!', NULL, 17213,1,0,0, '67234'),
(-1594479, 'He is too powerful, we must leave this place at once! My magic will hold him in place for only a short time! Come quickly, heroes!', NULL, 16644,0,0,1, '67234'),
(-1594480, 'He\'s too powerful! Heroes, quickly, come to me! We must leave this place immediately! I will do what I can do hold him in place while we flee.', NULL, 17058,0,0,1, '67234'),
-- SCENE - Hall Of Reflection (Extro) - Escape
(-1594481, 'Death\'s cold embrace awaits.', NULL, 17221,1,0,0, '67234'),
(-1594482, 'Rise minions, do not left them us!', NULL, 17216,1,0,0, '67234'),
(-1594483, 'Minions sees them. Bring their corpses back to me!', NULL, 17222,1,0,0, '67234'),
(-1594484, 'No...', NULL, 17214,1,0,0, '67234'),
(-1594485, 'All is lost!', NULL, 17215,1,0,0, '67234'),
(-1594486, 'There is no escape!', NULL, 17217,1,0,0, '67234'),
(-1594487, 'I will destroy this barrier. You must hold the undead back!', NULL, 16607,1,0,0, '67234'),
(-1594488, 'No wall can hold the Banshee Queen! Keep the undead at bay, heroes! I will tear this barrier down!', NULL, 17029,1,0,0, '67234'),
(-1594489, 'Another ice wall! Keep the undead from interrupting my incantation so that I may bring this wall down!', NULL, 16608,1,0,0, '67234'),
(-1594490, 'Another barrier? Stand strong, champions! I will bring the wall down!', NULL, 17030,1,0,0, '67234'),
(-1594491, 'Succumb to the chill of the grave.', NULL, 17218,1,0,0, '67234'),
(-1594492, 'Another dead end.', NULL, 17219,1,0,0, '67234'),
(-1594493, 'How long can you fight it?', NULL, 17220,1,0,0, '67234'),
(-1594494, 'He is toying with us! I will show him what happens to ice when it meets fire!', NULL, 16609,0,0,0, '67234'),
(-1594495, 'Your barriers can\'t hold us back much longer, monster. I will shatter them all!', NULL, 16610,1,0,0, '67234'),
(-1594496, 'I grow tired of these games, Arthas! Your walls can\'t stop me!', NULL, 17031,1,0,0, '67234'),
(-1594497, 'You won\'t impede our escape, fiend. Keep the undead off me while I bring this barrier down!', NULL, 17032,1,0,0, '67234'),
(-1594498, 'There\'s an opening up ahead. GO NOW!', NULL, 16645,1,0,0, '67234'),
(-1594499, 'We\'re almost there... Don\'t give up!', NULL, 16646,1,0,0, '67234'),
(-1594500, 'There\'s an opening up ahead. GO NOW!', NULL, 17059,1,0,0, '67234'),
(-1594501, 'We\'re almost there! Don\'t give up!', NULL, 17060,1,0,0, '67234'),
(-1594502, 'It... It\'s a dead end. We have no choice but to fight. Steel yourself heroes, for this is our last stand!', NULL, 16647,1,0,0, '67234'),
(-1594503, 'BLASTED DEAD END! So this is how it ends. Prepare yourselves, heroes, for today we make our final stand!', NULL, 17061,1,0,0, '67234'),
(-1594504, 'Nowhere to run! You\'re mine now...', NULL, 17223,1,0,0, '67234'),
(-1594505, 'Soldiers of Lordaeron, rise to meet your master\'s call!', NULL, 16714,1,0,0, '67234'),
(-1594506, 'The master surveyed his kingdom and found it... lacking. His judgement was swift and without mercy. Death to all!', NULL, 16738,1,0,0, '67234'),
-- Falric
(-1594507, 'Men, women and children... None were spared the master\'s wrath. Your death will be no different.', NULL, 16710,1,0,0, '67234'),
(-1594508, 'Marwyn, finish them...', NULL, 16713,1,0,0, '67234'),
(-1594509, 'Sniveling maggot!', NULL, 16711,1,0,0, '67234'),
(-1594510, 'The children of Stratholme fought with more ferocity!', NULL, 16712,1,0,0, '67234'),
(-1594511, 'Despair... so delicious...', NULL, 16715,1,0,0, '67234'),
(-1594512, 'Fear... so exhilarating...', NULL, 16716,1,0,0, '67234'),
-- Marwyn
(-1594513, 'Death is all that you will find here!', NULL, 16734,1,0,0, '67234'),
(-1594514, 'Yes... Run... Run to meet your destiny... Its bitter, cold embrace, awaits you.', NULL, 16737,1,0,0, '67234'),
(-1594515, 'I saw the same look in his eyes when he died. Terenas could hardly believe it. Hahahaha!', NULL, 16735,1,0,0, '67234'),
(-1594516, 'Choke on your suffering!', NULL, 16736,1,0,0, '67234'),
(-1594517, 'Your flesh shall decay before your very eyes!', NULL, 16739,1,0,0, '67234'),
(-1594518, 'Waste away into nothingness!', NULL, 16740,1,0,0, '67234'),
-- FrostWorn General
(-1594519, 'You are not worthy to face the Lich King!', NULL, 16921,1,0,0, '67234'),
(-1594520, 'Master, I have failed...', NULL, 16922,1,0,0, '67234');

-- Waipoints to escort event on Halls of reflection
DELETE FROM script_waypoint WHERE entry IN (36955,37226,37554);
INSERT INTO script_waypoint VALUES
-- Jaina

   (36955, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (36955, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (36955, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (36955, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'), 
   (36955, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (36955, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (36955, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (36955, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (36955, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (36955, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (36955, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (36955, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (36955, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (36955, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (36955, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (36955, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (36955, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (36955, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (36955, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (36955, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (36955, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (36955, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Sylvana

   (37554, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (37554, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (37554, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (37554, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'), 
   (37554, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (37554, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (37554, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (37554, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (37554, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (37554, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (37554, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (37554, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (37554, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (37554, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (37554, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (37554, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (37554, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (37554, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (37554, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (37554, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (37554, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (37554, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Lich King

   (37226, 0, 5577.187,2236.003,733.012, 0, 'WP1'),
   (37226, 1, 5587.682,2228.586,733.011, 0, 'WP2'),
   (37226, 2, 5600.715,2209.058,731.618, 0, 'WP3'),
   (37226, 3, 5606.417,2193.029,731.129, 0, 'WP4'),
   (37226, 4, 5598.562,2167.806,730.918, 0, 'WP5'), 
   (37226, 5, 5559.218,2106.802,731.229, 0, 'WP6'),
   (37226, 6, 5543.498,2071.234,731.702, 0, 'WP7'),
   (37226, 7, 5528.969,2036.121,731.407, 0, 'WP8'),
   (37226, 8, 5512.045,1996.702,735.122, 0, 'WP9'),
   (37226, 9, 5504.490,1988.789,735.886, 0, 'WP10'),
   (37226, 10, 5489.645,1966.389,737.653, 0, 'WP10'),
   (37226, 11, 5475.517,1943.176,741.146, 0, 'WP11'),
   (37226, 12, 5466.930,1926.049,743.536, 0, 'WP12'),
   (37226, 13, 5445.157,1894.955,748.757, 0, 'WP13'),
   (37226, 14, 5425.907,1869.708,753.237, 0, 'WP14'),
   (37226, 15, 5405.118,1833.937,757.486, 0, 'WP15'),
   (37226, 16, 5370.324,1799.375,761.007, 0, 'WP16'),
   (37226, 17, 5335.422,1766.951,767.635, 0, 'WP17'),
   (37226, 18, 5311.438,1739.390,774.165, 0, 'WP18'),
   (37226, 19, 5283.589,1703.755,784.176, 0, 'WP19'),
   (37226, 20, 5278.694,1697.912,785.692, 0, 'WP20'),
   (37226, 21, 5283.589,1703.755,784.176, 0, 'WP19');
   
   -- Fixed Halls of Reflection
DELETE FROM `gameobject_template` WHERE `entry` = 500001;
INSERT INTO `gameobject_template` VALUES ('500001', '0', '9214', 'Ice Wall', '', '', '', '1375', '0', '2.5', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '1'); 
DELETE FROM `creature` WHERE `id` IN (38112,37223,37221,36723,36955,37158,38113,37554,37226) AND `map` = 668;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`)
VALUES 
('38112', '668', '3', '1', '0', '0', '5276.81', '2037.45', '709.32', '5.58779', '604800', '0', '0', '377468', '0', '0', '0', '0', '0'),
('37223', '668', '3', '64', '0', '0', '5266.78', '1953.42', '707.697', '0.740877', '7200', '0', '0', '6972500', '85160', '0', '0', '0', '0'),
('37221', '668', '3', '128', '0', '0', '5266.78', '1953.42', '707.697', '0.740877', '7200', '0', '0', '5040000', '881400', '0', '0', '0', '0'),
('36723', '668', '3', '1', '0', '0', '5413.84', '2116.44', '707.695', '3.88117', '7200', '0', '0', '315000', '0', '0', '0', '0', '0'),
('36955', '668', '3', '128', '0', '0', '5547.27', '2256.95', '733.011', '0.835987', '7200', '0', '0', '252000', '881400', '0', '0', '0', '0'),
('37158', '668', '3', '2', '0', '0', '5304.5', '2001.35', '709.341', '4.15073', '7200', '0', '0', '214200', '0', '0', '0', '0', '0'),
('38113', '668', '3', '1', '0', '0', '5341.72', '1975.74', '709.32', '2.40694', '604800', '0', '0', '539240', '0', '0', '0', '0', '0'),
('37554', '668', '3', '64', '0', '0', '5547.27', '2256.95', '733.011', '0.835987', '7200', '0', '0', '252000', '881400', '0', '0', '0', '0'),
('37226', '668', '3', '1', '0', '0', '5551.29', '2261.33', '733.012', '4.0452', '604800', '0', '0', '27890000', '0', '0', '0', '0', '0');
DELETE FROM `gameobject` WHERE `id` IN (202302,202236,201596,500001,196391,196392,202396,201885,197341,201976,197342,197343,201385,202212,201710,202337,202336,202079) AND `map`=668;
INSERT INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`)
VALUES 
('202302', '668', '3', '1', '5309.51', '2006.64', '709.341', '5.50041', '0', '0', '0.381473', '-0.92438', '604800', '100', '1'),
('202236', '668', '3', '1', '5309.51', '2006.64', '709.341', '5.53575', '0', '0', '0.365077', '-0.930977', '604800', '100', '1'),
('201596', '668', '3', '1', '5275.28', '1694.23', '786.147', '0.981225', '0', '0', '0.471166', '0.882044', '25', '0', '1'),
('500001', '668', '3', '1', '5323.61', '1755.85', '770.305', '0.784186', '0', '0', '0.382124', '0.924111', '604800', '100', '1'),
('196391', '668', '3', '1', '5232.31', '1925.57', '707.695', '0.815481', '0', '0', '0.396536', '0.918019', '300', '0', '1'),
('196392', '668', '3', '1', '5232.31', '1925.57', '707.695', '0.815481', '0', '0', '0.396536', '0.918019', '300', '0', '1'),
('202396', '668', '3', '1', '5434.27', '1881.12', '751.303', '0.923328', '0', '0', '0.445439', '0.895312', '604800', '100', '1'),
('201885', '668', '3', '1', '5494.3', '1978.27', '736.689', '1.0885', '0', '0', '0.517777', '0.855516', '604800', '100', '1'),
('197341', '668', '3', '1', '5359.24', '2058.35', '707.695', '3.96022', '0', '0', '0.917394', '-0.397981', '300', '100', '1'),
('201976', '668', '3', '1', '5264.6', '1959.55', '707.695', '0.736951', '0', '0', '0.360194', '0.932877', '300', '100', '0'),
('197342', '668', '3', '1', '5520.72', '2228.89', '733.011', '0.778581', '0', '0', '0.379532', '0.925179', '300', '100', '1'),
('197343', '668', '3', '1', '5582.96', '2230.59', '733.011', '5.49098', '0', '0', '0.385827', '-0.922571', '300', '100', '1'),
('201385', '668', '3', '1', '5540.39', '2086.48', '731.066', '1.00057', '0', '0', '0.479677', '0.877445', '604800', '100', '1'),
('202212', '668', '1', '65535', '5241.05', '1663.44', '784.295', '0.54', '0', '0', '0', '0', '-604800', '100', '1'),
('201710', '668', '1', '65535', '5241.05', '1663.44', '784.295', '0.54', '0', '0', '0', '0', '-604800', '100', '1'),
('202337', '668', '2', '65535', '5241.05', '1663.44', '784.295', '0.54', '0', '0', '0', '0', '-604800', '100', '1'),
('202336', '668', '2', '65535', '5241.05', '1663.44', '784.295', '0.54', '0', '0', '0', '0', '-604800', '100', '1'),
('202079', '668', '3', '1', '5250.96', '1639.36', '784.302', '0', '0', '0', '0', '0', '-604800', '100', '1');

--  Horde Lady Sylvanas Windrunner
UPDATE `creature` SET phaseMask = 3 WHERE `id` IN (37223,37554);

-- Uther the Lightbringer
DELETE FROM `creature` WHERE `id` IN (37225,37221,36955);

-- Altar Faction
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `flags_extra` = 128 WHERE `entry` = 37704;

-- Fix various mobs stats, values, factions in normal and heroic mode
UPDATE creature_template set scale=1.25, baseattacktime=2000, unit_flags=768, type_flags=268435564 where entry IN (38524, 38525, 38563, 38544, 38564, 38568);
-- Related scriptnames
UPDATE creature_template SET scriptname="npc_phantom_mage" where entry = 38172;
UPDATE creature_template SET scriptname="npc_spectral_footman", equipment_id=107 where entry = 38173;
UPDATE creature_template SET scriptname="npc_ghostly_priest", equipment_id=14 where entry = 38175;
UPDATE creature_template SET scriptname="npc_tortured_rifleman", equipment_id=1868 where entry = 38176;
UPDATE creature_template SET scriptname="npc_shadowy_mercenary", equipment_id=1218 where entry = 38177;
UPDATE creature_template SET scriptname="npc_phantom_hallucination" where entry = 38567;
-- Fix another list of mobs
UPDATE creature_template SET faction_A=16, faction_H=16, baseattacktime=2000, unit_flags=64 WHERE entry IN (36723, 37720, 36940, 37550, 36941, 37551, 37069, 37549);
-- Related scriptnames 2
UPDATE creature_template SET scriptname="npc_frostworn_general", equipment_id=1870 where entry = 36723;
UPDATE creature_template SET scriptname="npc_raging_gnoul" where entry = 36940;
UPDATE creature_template SET scriptname="npc_risen_witch_doctor" where entry = 36941;

-- Fix door template flags in HoR
UPDATE gameobject_template SET faction=114, flags=33 WHERE entry=201885;

-- Add new teleport location: HallsOfReflection
DELETE FROM game_tele where name="HallsOfReflection";
INSERT INTO game_tele (position_x, position_y, position_z, orientation, map, name) VALUES
(5630.14, 1993.88, 798.061, 4.64353, 571, "HallsOfReflection");

-- Fix Falric and Marlwyn loot (purge Emblems in HoR normal mode)
DELETE FROM creature_loot_template WHERE item=47241 AND entry IN (38112, 38113);

-- Fix exit portal in HoR (used due to exit boat loss)
UPDATE gameobject_template SET data0=53141 WHERE entry=202079;

-- Fix endloot in HoR (normal)
DELETE FROM gameobject_loot_template WHERE entry=27985;
INSERT INTO gameobject_loot_template (entry, item, ChanceOrQuestChance, lootmode, groupid, mincountOrRef, maxcount) VALUES
(27985, 49845, 20, 1, 1, 1, 1), -- Bone Golem Scapula 
(27985, 49840, 20, 1, 1, 1, 1), -- Hate-Forged Cleaver 
(27985, 49839, 20, 1, 1, 1, 1), -- Mourning Malice 
(27985, 49844, 20, 1, 1, 1, 1), -- Crypt Fiend Slayer 
(27985, 49846, 20, 1, 1, 1, 1), -- Chilled Heart of the Glacier 
(27985, 49848, 15, 1, 2, 1, 1), -- Grim Lasher Shoulderguards 
(27985, 49849, 15, 1, 2, 1, 1), -- Tattered Glacial-Woven Hood 
(27985, 49841, 14, 1, 2, 1, 1), -- Blackened Geist Ribs 
(27985, 49851, 14, 1, 2, 1, 1), -- Greathelm of the Silver Hand 
(27985, 49847, 14, 1, 2, 1, 1), -- Legguards of Untimely Demise 
(27985, 49843, 14, 1, 2, 1, 1), -- Crystalline Citadel Gauntlets 
(27985, 49842, 14, 1, 2, 1, 1); -- Tapestry of the Frozen Throne

-- Fix endloot in HoR (heroic)
DELETE FROM gameobject_loot_template WHERE entry=27993;
INSERT INTO gameobject_loot_template (entry, item, ChanceOrQuestChance, lootmode, groupid, mincountOrRef, maxcount) VALUES
(27993, 47241, 100, 1, 0, 1, 1), -- Emblem of Triumph
(27993, 43102, 80, 1, 0, 1, 1), -- Frozen Orb
(27993, 50303, 30, 1, 1, 1, 1), -- Black Icicle
(27993, 50302, 30, 1, 1, 1, 1), -- Liar's Tongue
(27993, 50311, 19, 1, 2, 1, 1), -- Second Helm of the Executioner
(27993, 50312, 17, 1, 2, 1, 1), -- Chestguard of Broken Branches
(27993, 50313, 16, 1, 2, 1, 1), -- Oath of Empress Zoe
(27993, 50309, 16, 1, 2, 1, 1), -- Shriveled Heart
(27993, 50310, 16, 1, 2, 1, 1), -- Fossilized Ammonite Choker
(27993, 50314, 16, 1, 2, 1, 1), -- Strip of Remorse
(27993, 50308, 10, 1, 1, 1, 1), -- Blighted Leather Footpads
(27993, 50305, 10, 1, 1, 1, 1), -- Grinning Skull Boots
(27993, 50306, 10, 1, 1, 1, 1), -- The Lady's Promise
(27993, 50304, 10, 1, 1, 1, 1); -- Hoarfrost Gauntlets

-- Area Trigger
DELETE FROM `areatrigger_scripts` WHERE `entry` = 5660;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES (5660, 'at_falric_event_starter');

-- NPC Spiritual Reflection
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_spiritual_reflection' WHERE `entry`=37068;