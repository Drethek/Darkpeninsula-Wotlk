
-- [System-Implement] FULL Saronite/Titanium Vein spawn *offylike-mode*

-- Cleanup first (oh yes, we absolutely need it...)
DELETE FROM gameobject WHERE id IN (191133, 189980); -- (#Saronite Deposit, #Titanium Vein)
DELETE FROM pool_template WHERE entry>=30000 AND entry<=30165; -- makes this SQL repeatable
DELETE FROM pool_gameobject WHERE pool_entry>=5217 AND pool_entry<=5237; -- old bugged pools 1/2
DELETE FROM pool_gameobject WHERE pool_entry>=5256 AND pool_entry<=5276; -- old bugged pools 1/2
DELETE FROM pool_gameobject WHERE pool_entry>=30000 AND pool_entry <=30164; -- makes this SQL repeatable
UPDATE pool_gameobject SET chance=0 WHERE pool_entry >5291 AND pool_entry <5662 AND chance <>0; -- makes the other pools work properly

DELETE FROM pool_gameobject where guid IN (
 56249, /*5292*/
 120833, /*5292*/
 56250, /*5293*/
 120835, /*5293*/
 56251, /*5294*/
 120837, /*5294*/
 56252, /*5295*/
 120839, /*5295*/
 56253, /*5296*/
 120841, /*5296*/
 56254, /*5297*/
 120843, /*5297*/
 56255, /*5298*/
 120845, /*5298*/
 56256, /*5299*/
 120847, /*5299*/
 56257, /*5300*/
 120849, /*5300*/
 56258, /*5301*/
 120851, /*5301*/
 56259, /*5302*/
 120853, /*5302*/
 56260, /*5303*/
 120855, /*5303*/
 56261, /*5304*/
 120857, /*5304*/
 56262, /*5305*/
 120859, /*5305*/
 56263, /*5306*/
 120861, /*5306*/
 56264, /*5307*/
 120863, /*5307*/
 56265, /*5308*/
 120865, /*5308*/
 56266, /*5309*/
 120867, /*5309*/
 56267, /*5310*/
 120869, /*5310*/
 56326, /*5311*/
 120871, /*5311*/
 56346, /*5312*/
 120873, /*5312*/
 59673, /*5313*/
 120875, /*5313*/
 61270, /*5314*/
 120877, /*5314*/
 61272, /*5315*/
 120879, /*5315*/
 61274, /*5316*/
 120881, /*5316*/
 61276, /*5317*/
 120883, /*5317*/
 61282, /*5318*/
 120885, /*5318*/
 61283, /*5319*/
 120887, /*5319*/
 61285, /*5320*/
 120889, /*5320*/
 61286, /*5321*/
 120891, /*5321*/
 61287, /*5322*/
 120893, /*5322*/
 61288, /*5323*/
 120895, /*5323*/
 61293, /*5324*/
 120897, /*5324*/
 61294, /*5325*/
 120899, /*5325*/
 61295, /*5326*/
 120901, /*5326*/
 61298, /*5327*/
 120903, /*5327*/
 61299, /*5328*/
 120905, /*5328*/
 61300, /*5329*/
 120907, /*5329*/
 61301, /*5330*/
 120909, /*5330*/
 61303, /*5331*/
 120911, /*5331*/
 61314, /*5332*/
 120913, /*5332*/
 61333, /*5333*/
 120915, /*5333*/
 61334, /*5334*/
 120917, /*5334*/
 61336, /*5335*/
 120919, /*5335*/
 61980, /*5336*/
 120921, /*5336*/
 67640, /*5337*/
 120923, /*5337*/
 120012, /*5338*/
 120925, /*5338*/
 120026, /*5339*/
 120927, /*5339*/
 120028, /*5340*/
 120929, /*5340*/
 120029, /*5341*/
 120931, /*5341*/
 120030, /*5342*/
 120933, /*5342*/
 120036, /*5343*/
 120935, /*5343*/
 120037, /*5344*/
 120937, /*5344*/
 120039, /*5345*/
 120939, /*5345*/
 120056, /*5346*/
 120941, /*5346*/
 120057, /*5347*/
 120943, /*5347*/
 120062, /*5348*/
 120945, /*5348*/
 120065, /*5349*/
 120947, /*5349*/
 120067, /*5350*/
 120949, /*5350*/
 120071, /*5351*/
 120951, /*5351*/
 120072, /*5352*/
 120953, /*5352*/
 120102, /*5353*/
 120955, /*5353*/
 120111, /*5354*/
 120957, /*5354*/
 120112, /*5355*/
 120959, /*5355*/
 120152, /*5356*/
 120961, /*5356*/
 120153, /*5357*/
 120963, /*5357*/
 120154, /*5358*/
 120965, /*5358*/
 120155, /*5359*/
 120967, /*5359*/
 120156, /*5360*/
 120969, /*5360*/
 120157, /*5361*/
 120971, /*5361*/
 120158, /*5362*/
 120973, /*5362*/
 120162, /*5363*/
 120975, /*5363*/
 120164, /*5364*/
 120977, /*5364*/
 120177, /*5365*/
 120979, /*5365*/
 120274, /*5366*/
 120981, /*5366*/
 120685, /*5367*/
 120983, /*5367*/
 120686, /*5368*/
 120985, /*5368*/
 120687, /*5369*/
 120987, /*5369*/
 120688, /*5370*/
 120989, /*5370*/
 120689, /*5371*/
 120991, /*5371*/
 120690, /*5372*/
 120993, /*5372*/
 120724, /*5373*/
 120995, /*5373*/
 120729, /*5374*/
 120997, /*5374*/
 120733, /*5375*/
 120999, /*5375*/
 56280, /*5376*/
 121001, /*5376*/
 56281, /*5377*/
 121003, /*5377*/
 56282, /*5378*/
 121005, /*5378*/
 56283, /*5379*/
 121007, /*5379*/
 56284, /*5380*/
 121009, /*5380*/
 56285, /*5381*/
 121011, /*5381*/
 56286, /*5382*/
 121013, /*5382*/
 56287, /*5383*/
 121015, /*5383*/
 56288, /*5384*/
 121017, /*5384*/
 56289, /*5385*/
 121019, /*5385*/
 56290, /*5386*/
 121021, /*5386*/
 56291, /*5387*/
 121023, /*5387*/
 56292, /*5388*/
 121025, /*5388*/
 56293, /*5389*/
 121027, /*5389*/
 56446, /*5390*/
 121029, /*5390*/
 56452, /*5391*/
 121031, /*5391*/
 120014, /*5392*/
 121033, /*5392*/
 120015, /*5393*/
 121035, /*5393*/
 120016, /*5394*/
 121037, /*5394*/
 120017, /*5395*/
 121039, /*5395*/
 120018, /*5396*/
 121041, /*5396*/
 120049, /*5397*/
 121043, /*5397*/
 120050, /*5398*/
 121045, /*5398*/
 120051, /*5399*/
 121047, /*5399*/
 120052, /*5400*/
 121049, /*5400*/
 120055, /*5401*/
 121051, /*5401*/
 120059, /*5402*/
 121053, /*5402*/
 120061, /*5403*/
 121055, /*5403*/
 120063, /*5404*/
 121057, /*5404*/
 120064, /*5405*/
 121059, /*5405*/
 120068, /*5406*/
 121061, /*5406*/
 120073, /*5407*/
 121063, /*5407*/
 120093, /*5408*/
 121065, /*5408*/
 120094, /*5409*/
 121067, /*5409*/
 120095, /*5410*/
 121069, /*5410*/
 120096, /*5411*/
 121071, /*5411*/
 120105, /*5412*/
 121073, /*5412*/
 120106, /*5413*/
 121075, /*5413*/
 120107, /*5414*/
 121077, /*5414*/
 120110, /*5415*/
 121079, /*5415*/
 120113, /*5416*/
 121081, /*5416*/
 120114, /*5417*/
 121083, /*5417*/
 120147, /*5418*/
 121085, /*5418*/
 120148, /*5419*/
 121087, /*5419*/
 120149, /*5420*/
 121089, /*5420*/
 120168, /*5421*/
 121091, /*5421*/
 120174, /*5422*/
 121093, /*5422*/
 120270, /*5423*/
 121095, /*5423*/
 120271, /*5424*/
 121097, /*5424*/
 120275, /*5425*/
 121099, /*5425*/
 120279, /*5426*/
 121101, /*5426*/
 120280, /*5427*/
 121103, /*5427*/
 120281, /*5428*/
 121105, /*5428*/
 120283, /*5429*/
 121107, /*5429*/
 120518, /*5430*/
 121109, /*5430*/
 120519, /*5431*/
 121111, /*5431*/
 120520, /*5432*/
 121113, /*5432*/
 120521, /*5433*/
 121115, /*5433*/
 120522, /*5434*/
 121117, /*5434*/
 120523, /*5435*/
 121119, /*5435*/
 120524, /*5436*/
 121121, /*5436*/
 120525, /*5437*/
 121123, /*5437*/
 120529, /*5438*/
 121125, /*5438*/
 120546, /*5439*/
 121127, /*5439*/
 120548, /*5440*/
 121129, /*5440*/
 120549, /*5441*/
 121131, /*5441*/
 120682, /*5442*/
 121133, /*5442*/
 120691, /*5443*/
 121135, /*5443*/
 120695, /*5444*/
 121137, /*5444*/
 120727, /*5445*/
 121139, /*5445*/
 120734, /*5446*/
 121141, /*5446*/
 120739, /*5447*/
 121143, /*5447*/
 61289, /*5448*/
 121145, /*5448*/
 61297, /*5449*/
 121147, /*5449*/
 61302, /*5450*/
 121149, /*5450*/
 61306, /*5451*/
 121151, /*5451*/
 61307, /*5452*/
 121153, /*5452*/
 61308, /*5453*/
 121155, /*5453*/
 61309, /*5454*/
 121157, /*5454*/
 61310, /*5455*/
 121159, /*5455*/
 61311, /*5456*/
 121161, /*5456*/
 61331, /*5457*/
 121163, /*5457*/
 61335, /*5458*/
 121165, /*5458*/
 61977, /*5459*/
 121167, /*5459*/
 61978, /*5460*/
 121169, /*5460*/
 61981, /*5461*/
 121171, /*5461*/
 61983, /*5462*/
 121173, /*5462*/
 61992, /*5463*/
 121175, /*5463*/
 62179, /*5464*/
 121177, /*5464*/
 62180, /*5465*/
 121179, /*5465*/
 62181, /*5466*/
 121181, /*5466*/
 62182, /*5467*/
 121183, /*5467*/
 62183, /*5468*/
 121185, /*5468*/
 62184, /*5469*/
 121187, /*5469*/
 62185, /*5470*/
 121189, /*5470*/
 62186, /*5471*/
 121191, /*5471*/
 62187, /*5472*/
 121193, /*5472*/
 62188, /*5473*/
 121195, /*5473*/
 62189, /*5474*/
 121197, /*5474*/
 62190, /*5475*/
 121199, /*5475*/
 62191, /*5476*/
 121201, /*5476*/
 62192, /*5477*/
 121203, /*5477*/
 62193, /*5478*/
 121205, /*5478*/
 62194, /*5479*/
 121207, /*5479*/
 62195, /*5480*/
 121209, /*5480*/
 62196, /*5481*/
 121211, /*5481*/
 62197, /*5482*/
 121213, /*5482*/
 62198, /*5483*/
 121215, /*5483*/
 62199, /*5484*/
 121217, /*5484*/
 62200, /*5485*/
 121219, /*5485*/
 62201, /*5486*/
 121221, /*5486*/
 62205, /*5487*/
 121223, /*5487*/
 62206, /*5488*/
 121225, /*5488*/
 62586, /*5489*/
 121227, /*5489*/
 62587, /*5490*/
 121229, /*5490*/
 62588, /*5491*/
 121231, /*5491*/
 63432, /*5492*/
 121233, /*5492*/
 63433, /*5493*/
 121235, /*5493*/
 63434, /*5494*/
 121237, /*5494*/
 63435, /*5495*/
 121239, /*5495*/
 63436, /*5496*/
 121241, /*5496*/
 67902, /*5497*/
 121243, /*5497*/
 120019, /*5498*/
 121245, /*5498*/
 120021, /*5499*/
 121247, /*5499*/
 120022, /*5500*/
 121249, /*5500*/
 120023, /*5501*/
 121251, /*5501*/
 120024, /*5502*/
 121253, /*5502*/
 120031, /*5503*/
 121255, /*5503*/
 120032, /*5504*/
 121257, /*5504*/
 120033, /*5505*/
 121259, /*5505*/
 120034, /*5506*/
 121261, /*5506*/
 120040, /*5507*/
 121263, /*5507*/
 120041, /*5508*/
 121265, /*5508*/
 120042, /*5509*/
 121267, /*5509*/
 120043, /*5510*/
 121269, /*5510*/
 120044, /*5511*/
 121271, /*5511*/
 120045, /*5512*/
 121273, /*5512*/
 120046, /*5513*/
 121275, /*5513*/
 120047, /*5514*/
 121277, /*5514*/
 120048, /*5515*/
 121279, /*5515*/
 120053, /*5516*/
 121281, /*5516*/
 120054, /*5517*/
 121283, /*5517*/
 120060, /*5518*/
 121285, /*5518*/
 120066, /*5519*/
 121287, /*5519*/
 120069, /*5520*/
 121289, /*5520*/
 120070, /*5521*/
 121291, /*5521*/
 120074, /*5522*/
 121293, /*5522*/
 120075, /*5523*/
 121295, /*5523*/
 120076, /*5524*/
 121297, /*5524*/
 120077, /*5525*/
 121299, /*5525*/
 120078, /*5526*/
 121301, /*5526*/
 120079, /*5527*/
 121303, /*5527*/
 120080, /*5528*/
 121305, /*5528*/
 120081, /*5529*/
 121307, /*5529*/
 120082, /*5530*/
 121309, /*5530*/
 120083, /*5531*/
 121311, /*5531*/
 120084, /*5532*/
 121313, /*5532*/
 120085, /*5533*/
 121315, /*5533*/
 120086, /*5534*/
 121317, /*5534*/
 120087, /*5535*/
 121319, /*5535*/
 120089, /*5536*/
 121321, /*5536*/
 120091, /*5537*/
 121323, /*5537*/
 120092, /*5538*/
 121325, /*5538*/
 120097, /*5539*/
 121327, /*5539*/
 120099, /*5540*/
 121329, /*5540*/
 120100, /*5541*/
 121331, /*5541*/
 120101, /*5542*/
 121333, /*5542*/
 120104, /*5543*/
 121335, /*5543*/
 120108, /*5544*/
 121337, /*5544*/
 120109, /*5545*/
 121339, /*5545*/
 120115, /*5546*/
 121341, /*5546*/
 120116, /*5547*/
 121343, /*5547*/
 120117, /*5548*/
 121345, /*5548*/
 120118, /*5549*/
 121347, /*5549*/
 120119, /*5550*/
 121349, /*5550*/
 120120, /*5551*/
 121351, /*5551*/
 120121, /*5552*/
 121353, /*5552*/
 120122, /*5553*/
 121355, /*5553*/
 120123, /*5554*/
 121357, /*5554*/
 120124, /*5555*/
 121359, /*5555*/
 120125, /*5556*/
 121361, /*5556*/
 120126, /*5557*/
 121363, /*5557*/
 120127, /*5558*/
 121365, /*5558*/
 120128, /*5559*/
 121367, /*5559*/
 120129, /*5560*/
 121369, /*5560*/
 120130, /*5561*/
 121371, /*5561*/
 120131, /*5562*/
 121373, /*5562*/
 120132, /*5563*/
 121375, /*5563*/
 120133, /*5564*/
 121377, /*5564*/
 120134, /*5565*/
 121379, /*5565*/
 120135, /*5566*/
 121381, /*5566*/
 120136, /*5567*/
 121383, /*5567*/
 120137, /*5568*/
 121385, /*5568*/
 120138, /*5569*/
 121387, /*5569*/
 120139, /*5570*/
 121389, /*5570*/
 120140, /*5571*/
 121391, /*5571*/
 120141, /*5572*/
 121393, /*5572*/
 120142, /*5573*/
 121395, /*5573*/
 120143, /*5574*/
 121397, /*5574*/
 120144, /*5575*/
 121399, /*5575*/
 120145, /*5576*/
 121401, /*5576*/
 120150, /*5577*/
 121403, /*5577*/
 120151, /*5578*/
 121405, /*5578*/
 120159, /*5579*/
 121407, /*5579*/
 120163, /*5580*/
 121409, /*5580*/
 120165, /*5581*/
 121411, /*5581*/
 120169, /*5582*/
 121413, /*5582*/
 120170, /*5583*/
 121415, /*5583*/
 120171, /*5584*/
 121417, /*5584*/
 120172, /*5585*/
 121419, /*5585*/
 120175, /*5586*/
 121421, /*5586*/
 120176, /*5587*/
 121423, /*5587*/
 120178, /*5588*/
 121425, /*5588*/
 120179, /*5589*/
 121427, /*5589*/
 120276, /*5590*/
 121429, /*5590*/
 120278, /*5591*/
 121431, /*5591*/
 120282, /*5592*/
 121433, /*5592*/
 120526, /*5593*/
 121435, /*5593*/
 120527, /*5594*/
 121437, /*5594*/
 120528, /*5595*/
 121439, /*5595*/
 120547, /*5596*/
 121441, /*5596*/
 120550, /*5597*/
 121443, /*5597*/
 120667, /*5598*/
 121445, /*5598*/
 120668, /*5599*/
 121447, /*5599*/
 120669, /*5600*/
 121449, /*5600*/
 120683, /*5601*/
 121451, /*5601*/
 120692, /*5602*/
 121453, /*5602*/
 120693, /*5603*/
 121455, /*5603*/
 120717, /*5604*/
 121457, /*5604*/
 120718, /*5605*/
 121459, /*5605*/
 120719, /*5606*/
 121461, /*5606*/
 120720, /*5607*/
 121463, /*5607*/
 120721, /*5608*/
 121465, /*5608*/
 120723, /*5609*/
 121467, /*5609*/
 120725, /*5610*/
 121469, /*5610*/
 120726, /*5611*/
 121471, /*5611*/
 120730, /*5612*/
 121473, /*5612*/
 120731, /*5613*/
 121475, /*5613*/
 120732, /*5614*/
 121477, /*5614*/
 120735, /*5615*/
 121479, /*5615*/
 120740, /*5616*/
 121481, /*5616*/
 56248, /*5617*/
 121483, /*5617*/
 56335, /*5618*/
 121485, /*5618*/
 56337, /*5619*/
 121487, /*5619*/
 63437, /*5620*/
 121489, /*5620*/
 66696, /*5621*/
 121491, /*5621*/
 66697, /*5622*/
 121493, /*5622*/
 66698, /*5623*/
 121495, /*5623*/
 66699, /*5624*/
 121497, /*5624*/
 66701, /*5625*/
 121499, /*5625*/
 66702, /*5626*/
 121501, /*5626*/
 66703, /*5627*/
 121503, /*5627*/
 66704, /*5628*/
 121505, /*5628*/
 66705, /*5629*/
 121507, /*5629*/
 66708, /*5630*/
 121509, /*5630*/
 66709, /*5631*/
 121511, /*5631*/
 66710, /*5632*/
 121513, /*5632*/
 67245, /*5633*/
 121515, /*5633*/
 67246, /*5634*/
 121517, /*5634*/
 67247, /*5635*/
 121519, /*5635*/
 67248, /*5636*/
 121521, /*5636*/
 120013, /*5637*/
 121523, /*5637*/
 120020, /*5638*/
 121525, /*5638*/
 120025, /*5639*/
 121527, /*5639*/
 120035, /*5640*/
 121529, /*5640*/
 120038, /*5641*/
 121531, /*5641*/
 120058, /*5642*/
 121533, /*5642*/
 120088, /*5643*/
 121535, /*5643*/
 120103, /*5644*/
 121537, /*5644*/
 120146, /*5645*/
 121539, /*5645*/
 120160, /*5646*/
 121541, /*5646*/
 120161, /*5647*/
 121543, /*5647*/
 120166, /*5648*/
 121545, /*5648*/
 120167, /*5649*/
 121547, /*5649*/
 120173, /*5650*/
 121549, /*5650*/
 120272, /*5651*/
 121551, /*5651*/
 120273, /*5652*/
 121553, /*5652*/
 120277, /*5653*/
 121555, /*5653*/
 120284, /*5654*/
 121557, /*5654*/
 120684, /*5655*/
 121559, /*5655*/
 120694, /*5656*/
 121561, /*5656*/
 120722, /*5657*/
 121563, /*5657*/
 120728, /*5658*/
 121565, /*5658*/
 120736, /*5659*/
 121567, /*5659*/
 120737, /*5660*/
 121569, /*5660*/
 120738, /*5661*/
 121571); /*5661*/


-- Adding pool_templates
INSERT INTO pool_template (entry, max_limit, description) VALUES
(30000, 1, "Spawn Point 1 - Saronite & Titanium"),
(30001, 1, "Spawn Point 2 - Saronite & Titanium"),
(30002, 1, "Spawn Point 3 - Saronite & Titanium"),
(30003, 1, "Spawn Point 4 - Saronite & Titanium"),
(30004, 1, "Spawn Point 5 - Saronite & Titanium"),
(30005, 1, "Spawn Point 6 - Saronite & Titanium"),
(30006, 1, "Spawn Point 7 - Saronite & Titanium"),
(30007, 1, "Spawn Point 8 - Saronite & Titanium"),
(30008, 1, "Spawn Point 9 - Saronite & Titanium"),
(30009, 1, "Spawn Point 10 - Saronite & Titanium"),
(30010, 1, "Spawn Point 11 - Saronite & Titanium"),
(30011, 1, "Spawn Point 12 - Saronite & Titanium"),
(30012, 1, "Spawn Point 13 - Saronite & Titanium"),
(30013, 1, "Spawn Point 14 - Saronite & Titanium"),
(30014, 1, "Spawn Point 15 - Saronite & Titanium"),
(30015, 1, "Spawn Point 16 - Saronite & Titanium"),
(30016, 1, "Spawn Point 17 - Saronite & Titanium"),
(30017, 1, "Spawn Point 18 - Saronite & Titanium"),
(30018, 1, "Spawn Point 19 - Saronite & Titanium"),
(30019, 1, "Spawn Point 20 - Saronite & Titanium"),
(30020, 1, "Spawn Point 21 - Saronite & Titanium"),
(30021, 1, "Spawn Point 22 - Saronite & Titanium"),
(30022, 1, "Spawn Point 23 - Saronite & Titanium"),
(30023, 1, "Spawn Point 24 - Saronite & Titanium"),
(30024, 1, "Spawn Point 25 - Saronite & Titanium"),
(30025, 1, "Spawn Point 26 - Saronite & Titanium"),
(30026, 1, "Spawn Point 27 - Saronite & Titanium"),
(30027, 1, "Spawn Point 28 - Saronite & Titanium"),
(30028, 1, "Spawn Point 29 - Saronite & Titanium"),
(30029, 1, "Spawn Point 30 - Saronite & Titanium"),
(30030, 1, "Spawn Point 31 - Saronite & Titanium"),
(30031, 1, "Spawn Point 32 - Saronite & Titanium"),
(30032, 1, "Spawn Point 33 - Saronite & Titanium"),
(30033, 1, "Spawn Point 34 - Saronite & Titanium"),
(30034, 1, "Spawn Point 35 - Saronite & Titanium"),
(30035, 1, "Spawn Point 36 - Saronite & Titanium"),
(30036, 1, "Spawn Point 37 - Saronite & Titanium"),
(30037, 1, "Spawn Point 38 - Saronite & Titanium"),
(30038, 1, "Spawn Point 39 - Saronite & Titanium"),
(30039, 1, "Spawn Point 40 - Saronite & Titanium"),
(30040, 1, "Spawn Point 41 - Saronite & Titanium"),
(30041, 1, "Spawn Point 42 - Saronite & Titanium"),
(30042, 1, "Spawn Point 43 - Saronite & Titanium"),
(30043, 1, "Spawn Point 44 - Saronite & Titanium"),
(30044, 1, "Spawn Point 45 - Saronite & Titanium"),
(30045, 1, "Spawn Point 46 - Saronite & Titanium"),
(30046, 1, "Spawn Point 47 - Saronite & Titanium"),
(30047, 1, "Spawn Point 48 - Saronite & Titanium"),
(30048, 1, "Spawn Point 49 - Saronite & Titanium"),
(30049, 1, "Spawn Point 50 - Saronite & Titanium"),
(30050, 1, "Spawn Point 51 - Saronite & Titanium"),
(30051, 1, "Spawn Point 52 - Saronite & Titanium"),
(30052, 1, "Spawn Point 53 - Saronite & Titanium"),
(30053, 1, "Spawn Point 54 - Saronite & Titanium"),
(30054, 1, "Spawn Point 55 - Saronite & Titanium"),
(30055, 1, "Spawn Point 56 - Saronite & Titanium"),
(30056, 1, "Spawn Point 57 - Saronite & Titanium"),
(30057, 1, "Spawn Point 58 - Saronite & Titanium"),
(30058, 1, "Spawn Point 59 - Saronite & Titanium"),
(30059, 1, "Spawn Point 60 - Saronite & Titanium"),
(30060, 1, "Spawn Point 61 - Saronite & Titanium"),
(30061, 1, "Spawn Point 62 - Saronite & Titanium"),
(30062, 1, "Spawn Point 63 - Saronite & Titanium"),
(30063, 1, "Spawn Point 64 - Saronite & Titanium"),
(30064, 1, "Spawn Point 65 - Saronite & Titanium"),
(30065, 1, "Spawn Point 66 - Saronite & Titanium"),
(30066, 1, "Spawn Point 67 - Saronite & Titanium"),
(30067, 1, "Spawn Point 68 - Saronite & Titanium"),
(30068, 1, "Spawn Point 69 - Saronite & Titanium"),
(30069, 1, "Spawn Point 70 - Saronite & Titanium"),
(30070, 1, "Spawn Point 71 - Saronite & Titanium"),
(30071, 1, "Spawn Point 72 - Saronite & Titanium"),
(30072, 1, "Spawn Point 73 - Saronite & Titanium"),
(30073, 1, "Spawn Point 74 - Saronite & Titanium"),
(30074, 1, "Spawn Point 75 - Saronite & Titanium"),
(30075, 1, "Spawn Point 76 - Saronite & Titanium"),
(30076, 1, "Spawn Point 77 - Saronite & Titanium"),
(30077, 1, "Spawn Point 78 - Saronite & Titanium"),
(30078, 1, "Spawn Point 79 - Saronite & Titanium"),
(30079, 1, "Spawn Point 80 - Saronite & Titanium"),
(30080, 1, "Spawn Point 81 - Saronite & Titanium"),
(30081, 1, "Spawn Point 82 - Saronite & Titanium"),
(30082, 1, "Spawn Point 83 - Saronite & Titanium"),
(30083, 1, "Spawn Point 84 - Saronite & Titanium"),
(30084, 1, "Spawn Point 85 - Saronite & Titanium"),
(30085, 1, "Spawn Point 86 - Saronite & Titanium"),
(30086, 1, "Spawn Point 87 - Saronite & Titanium"),
(30087, 1, "Spawn Point 88 - Saronite & Titanium"),
(30088, 1, "Spawn Point 89 - Saronite & Titanium"),
(30089, 1, "Spawn Point 90 - Saronite & Titanium"),
(30090, 1, "Spawn Point 91 - Saronite & Titanium"),
(30091, 1, "Spawn Point 92 - Saronite & Titanium"),
(30092, 1, "Spawn Point 93 - Saronite & Titanium"),
(30093, 1, "Spawn Point 94 - Saronite & Titanium"),
(30094, 1, "Spawn Point 95 - Saronite & Titanium"),
(30095, 1, "Spawn Point 96 - Saronite & Titanium"),
(30096, 1, "Spawn Point 97 - Saronite & Titanium"),
(30097, 1, "Spawn Point 98 - Saronite & Titanium"),
(30098, 1, "Spawn Point 99 - Saronite & Titanium"),
(30099, 1, "Spawn Point 100 - Saronite & Titanium"),
(30100, 1, "Spawn Point 101 - Saronite & Titanium"),
(30101, 1, "Spawn Point 102 - Saronite & Titanium"),
(30102, 1, "Spawn Point 103 - Saronite & Titanium"),
(30103, 1, "Spawn Point 104 - Saronite & Titanium"),
(30104, 1, "Spawn Point 105 - Saronite & Titanium"),
(30105, 1, "Spawn Point 106 - Saronite & Titanium"),
(30106, 1, "Spawn Point 107 - Saronite & Titanium"),
(30107, 1, "Spawn Point 108 - Saronite & Titanium"),
(30108, 1, "Spawn Point 109 - Saronite & Titanium"),
(30109, 1, "Spawn Point 110 - Saronite & Titanium"),
(30110, 1, "Spawn Point 111 - Saronite & Titanium"),
(30111, 1, "Spawn Point 112 - Saronite & Titanium"),
(30112, 1, "Spawn Point 113 - Saronite & Titanium"),
(30113, 1, "Spawn Point 114 - Saronite & Titanium"),
(30114, 1, "Spawn Point 115 - Saronite & Titanium"),
(30115, 1, "Spawn Point 116 - Saronite & Titanium"),
(30116, 1, "Spawn Point 117 - Saronite & Titanium"),
(30117, 1, "Spawn Point 118 - Saronite & Titanium"),
(30118, 1, "Spawn Point 119 - Saronite & Titanium"),
(30119, 1, "Spawn Point 120 - Saronite & Titanium"),
(30120, 1, "Spawn Point 121 - Saronite & Titanium"),
(30121, 1, "Spawn Point 122 - Saronite & Titanium"),
(30122, 1, "Spawn Point 123 - Saronite & Titanium"),
(30123, 1, "Spawn Point 124 - Saronite & Titanium"),
(30124, 1, "Spawn Point 125 - Saronite & Titanium"),
(30125, 1, "Spawn Point 126 - Saronite & Titanium"),
(30126, 1, "Spawn Point 127 - Saronite & Titanium"),
(30127, 1, "Spawn Point 128 - Saronite & Titanium"),
(30128, 1, "Spawn Point 129 - Saronite & Titanium"),
(30129, 1, "Spawn Point 130 - Saronite & Titanium"),
(30130, 1, "Spawn Point 131 - Saronite & Titanium"),
(30131, 1, "Spawn Point 132 - Saronite & Titanium"),
(30132, 1, "Spawn Point 133 - Saronite & Titanium"),
(30133, 1, "Spawn Point 134 - Saronite & Titanium"),
(30134, 1, "Spawn Point 135 - Saronite & Titanium"),
(30135, 1, "Spawn Point 136 - Saronite & Titanium"),
(30136, 1, "Spawn Point 137 - Saronite & Titanium"),
(30137, 1, "Spawn Point 138 - Saronite & Titanium"),
(30138, 1, "Spawn Point 139 - Saronite & Titanium"),
(30139, 1, "Spawn Point 140 - Saronite & Titanium"),
(30140, 1, "Spawn Point 141 - Saronite & Titanium"),
(30141, 1, "Spawn Point 142 - Saronite & Titanium"),
(30142, 1, "Spawn Point 143 - Saronite & Titanium"),
(30143, 1, "Spawn Point 144 - Saronite & Titanium"),
(30144, 1, "Spawn Point 145 - Saronite & Titanium"),
(30145, 1, "Spawn Point 146 - Saronite & Titanium"),
(30146, 1, "Spawn Point 147 - Saronite & Titanium"),
(30147, 1, "Spawn Point 148 - Saronite & Titanium"),
(30148, 1, "Spawn Point 149 - Saronite & Titanium"),
(30149, 1, "Spawn Point 150 - Saronite & Titanium"),
(30150, 1, "Spawn Point 151 - Saronite & Titanium"),
(30151, 1, "Spawn Point 152 - Saronite & Titanium"),
(30152, 1, "Spawn Point 153 - Saronite & Titanium"),
(30153, 1, "Spawn Point 154 - Saronite & Titanium"),
(30154, 1, "Spawn Point 155 - Saronite & Titanium"),
(30155, 1, "Spawn Point 156 - Saronite & Titanium"),
(30156, 1, "Spawn Point 157 - Saronite & Titanium"),
(30157, 1, "Spawn Point 158 - Saronite & Titanium"),
(30158, 1, "Spawn Point 159 - Saronite & Titanium"),
(30159, 1, "Spawn Point 160 - Saronite & Titanium"),
(30160, 1, "Spawn Point 161 - Saronite & Titanium"),
(30161, 1, "Spawn Point 162 - Saronite & Titanium"),
(30162, 1, "Spawn Point 163 - Saronite & Titanium"),
(30163, 1, "Spawn Point 164 - Saronite & Titanium"),
(30164, 1, "Spawn Point 165 - Saronite & Titanium");


-- Spawns and pools (Saronite + Titanium)

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4383.54, 1975.39, 390.425, 0.261798, 3600, 100, 1),
(191133, 571, 4383.54, 1975.39, 390.425, 0.261798, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30000, 75, "Saronite & Titanium"),
(@titan, 30000, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5325.52, 6025.47, -16.2582, -0.837757, 3600, 100, 1),
(191133, 571, 5325.52, 6025.47, -16.2582, -0.837757, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30001, 75, "Saronite & Titanium"),
(@titan, 30001, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4794.45, 5895.83, -30.9455, 2.44346, 3600, 100, 1),
(191133, 571, 4794.45, 5895.83, -30.9455, 2.44346, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30002, 75, "Saronite & Titanium"),
(@titan, 30002, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5125.49, 6015.81, -50.0045, 2.26892, 3600, 100, 1),
(191133, 571, 5125.49, 6015.81, -50.0045, 2.26892, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30003, 75, "Saronite & Titanium"),
(@titan, 30003, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5827.04, 4457.58, -130.453, 1.64061, 3600, 100, 1),
(191133, 571, 5827.04, 4457.58, -130.453, 1.64061, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30004, 75, "Saronite & Titanium"),
(@titan, 30004, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5455.97, 5712.2, -102.766, -0.593412, 3600, 100, 1),
(191133, 571, 5455.97, 5712.2, -102.766, -0.593412, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30005, 75, "Saronite & Titanium"),
(@titan, 30005, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6659.69, 4690.38, 0.182863, 1.78023, 3600, 100, 1),
(191133, 571, 6659.69, 4690.38, 0.182863, 1.78023, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30006, 75, "Saronite & Titanium"),
(@titan, 30006, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6672.22, 4932.34, -17.978, 2.94959, 3600, 100, 1),
(191133, 571, 6672.22, 4932.34, -17.978, 2.94959, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30007, 75, "Saronite & Titanium"),
(@titan, 30007, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6127.44, 5256.57, -127.884, 0.890117, 3600, 100, 1),
(191133, 571, 6127.44, 5256.57, -127.884, 0.890117, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30008, 75, "Saronite & Titanium"),
(@titan, 30008, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6174.17, 5636.43, -22.3877, -1.93731, 3600, 100, 1),
(191133, 571, 6174.17, 5636.43, -22.3877, -1.93731, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30009, 75, "Saronite & Titanium"),
(@titan, 30009, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5331.86, 4405.6, -126.997, -1.51844, 3600, 100, 1),
(191133, 571, 5331.86, 4405.6, -126.997, -1.51844, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30010, 75, "Saronite & Titanium"),
(@titan, 30010, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4724.21, 5107.49, -46.3651, -1.78023, 3600, 100, 1),
(191133, 571, 4724.21, 5107.49, -46.3651, -1.78023, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30011, 75, "Saronite & Titanium"),
(@titan, 30011, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5431.91, 3826.25, -65.5299, 1.09956, 3600, 100, 1),
(191133, 571, 5431.91, 3826.25, -65.5299, 1.09956, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30012, 75, "Saronite & Titanium"),
(@titan, 30012, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5094.27, 5217.79, -88.322, -2.21656, 3600, 100, 1),
(191133, 571, 5094.27, 5217.79, -88.322, -2.21656, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30013, 75, "Saronite & Titanium"),
(@titan, 30013, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5056.29, 4819.88, -132.884, -2.19912, 3600, 100, 1),
(191133, 571, 5056.29, 4819.88, -132.884, -2.19912, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30014, 75, "Saronite & Titanium"),
(@titan, 30014, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5015.7, 4691.84, -91.0594, 1.43117, 3600, 100, 1),
(191133, 571, 5015.7, 4691.84, -91.0594, 1.43117, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30015, 75, "Saronite & Titanium"),
(@titan, 30015, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6084.56, 4079.1, -46.7275, -2.30383, 3600, 100, 1),
(191133, 571, 6084.56, 4079.1, -46.7275, -2.30383, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30016, 75, "Saronite & Titanium"),
(@titan, 30016, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6310, 3957.29, 109.057, -0.767944, 3600, 100, 1),
(191133, 571, 6310, 3957.29, 109.057, -0.767944, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30017, 75, "Saronite & Titanium"),
(@titan, 30017, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5682.74, 3538.94, -8.81329, -2.35619, 3600, 100, 1),
(191133, 571, 5682.74, 3538.94, -8.81329, -2.35619, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30018, 75, "Saronite & Titanium"),
(@titan, 30018, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5762.14, 3502.19, 8.57112, -0.523598, 3600, 100, 1),
(191133, 571, 5762.14, 3502.19, 8.57112, -0.523598, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30019, 75, "Saronite & Titanium"),
(@titan, 30019, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 8069.04, -2777.4, 1050.31, -1.23918, 3600, 100, 1),
(191133, 571, 8069.04, -2777.4, 1050.31, -1.23918, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30020, 75, "Saronite & Titanium"),
(@titan, 30020, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6927.97, -28.9803, 805.172, 0.383971, 3600, 100, 1),
(191133, 571, 6927.97, -28.9803, 805.172, 0.383971, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30021, 75, "Saronite & Titanium"),
(@titan, 30021, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7224.43, -993.775, 926.922, -2.53072, 3600, 100, 1),
(191133, 571, 7224.43, -993.775, 926.922, -2.53072, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30022, 75, "Saronite & Titanium"),
(@titan, 30022, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7854.36, 49.8729, 1010.96, 2.02458, 3600, 100, 1),
(191133, 571, 7854.36, 49.8729, 1010.96, 2.02458, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30023, 75, "Saronite & Titanium"),
(@titan, 30023, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7005.42, -367.084, 788.1, -0.837757, 3600, 100, 1),
(191133, 571, 7005.42, -367.084, 788.1, -0.837757, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30024, 75, "Saronite & Titanium"),
(@titan, 30024, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 8196.15, -2734.56, 1036.62, -2.84488, 3600, 100, 1),
(191133, 571, 8196.15, -2734.56, 1036.62, -2.84488, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30025, 75, "Saronite & Titanium"),
(@titan, 30025, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6983.3, -1221.08, 809.737, 2.96704, 3600, 100, 1),
(191133, 571, 6983.3, -1221.08, 809.737, 2.96704, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30026, 75, "Saronite & Titanium"),
(@titan, 30026, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7247.44, -1258.09, 922.469, 0.122173, 3600, 100, 1),
(191133, 571, 7247.44, -1258.09, 922.469, 0.122173, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30027, 75, "Saronite & Titanium"),
(@titan, 30027, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6756.1, -1530.5, 369.068, 0.488691, 3600, 100, 1),
(191133, 571, 6756.1, -1530.5, 369.068, 0.488691, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30028, 75, "Saronite & Titanium"),
(@titan, 30028, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 8184.4, -2399.48, 1139.64, -0.698132, 3600, 100, 1),
(191133, 571, 8184.4, -2399.48, 1139.64, -0.698132, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30029, 75, "Saronite & Titanium"),
(@titan, 30029, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 8106.1, -2241.15, 1167.39, -0.349065, 3600, 100, 1),
(191133, 571, 8106.1, -2241.15, 1167.39, -0.349065, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30030, 75, "Saronite & Titanium"),
(@titan, 30030, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7705.49, -3346.28, 889.608, -0.069812, 3600, 100, 1),
(191133, 571, 7705.49, -3346.28, 889.608, -0.069812, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30031, 75, "Saronite & Titanium"),
(@titan, 30031, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7051.36, -2016.77, 769.801, -0.785397, 3600, 100, 1),
(191133, 571, 7051.36, -2016.77, 769.801, -0.785397, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30032, 75, "Saronite & Titanium"),
(@titan, 30032, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6799.45, -1602.82, 354.439, 1.55334, 3600, 100, 1),
(191133, 571, 6799.45, -1602.82, 354.439, 1.55334, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30033, 75, "Saronite & Titanium"),
(@titan, 30033, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5721.06, 3655.52, -25.2488, 0.279252, 3600, 100, 1),
(191133, 571, 5721.06, 3655.52, -25.2488, 0.279252, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30034, 75, "Saronite & Titanium"),
(@titan, 30034, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7744.65, 1799.4, 338.061, 3.03684, 3600, 100, 1),
(191133, 571, 7744.65, 1799.4, 338.061, 3.03684, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30035, 75, "Saronite & Titanium"),
(@titan, 30035, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6618.75, 356.354, 453.156, 0.680677, 3600, 100, 1),
(191133, 571, 6618.75, 356.354, 453.156, 0.680677, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30036, 75, "Saronite & Titanium"),
(@titan, 30036, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6481.97, 540.381, 438.703, 0.471238, 3600, 100, 1),
(191133, 571, 6481.97, 540.381, 438.703, 0.471238, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30037, 75, "Saronite & Titanium"),
(@titan, 30037, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6559.55, 659.112, 408.146, -2.67035, 3600, 100, 1),
(191133, 571, 6559.55, 659.112, 408.146, -2.67035, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30038, 75, "Saronite & Titanium"),
(@titan, 30038, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6751.8, 1325.14, 285.589, -1.6057, 3600, 100, 1),
(191133, 571, 6751.8, 1325.14, 285.589, -1.6057, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30039, 75, "Saronite & Titanium"),
(@titan, 30039, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7260.71, 1512.27, 322.274, 2.19912, 3600, 100, 1),
(191133, 571, 7260.71, 1512.27, 322.274, 2.19912, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30040, 75, "Saronite & Titanium"),
(@titan, 30040, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7472.37, 1305.69, 320.085, -2.28638, 3600, 100, 1),
(191133, 571, 7472.37, 1305.69, 320.085, -2.28638, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30041, 75, "Saronite & Titanium"),
(@titan, 30041, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 8478.73, 1445.28, 641.201, 1.25664, 3600, 100, 1),
(191133, 571, 8478.73, 1445.28, 641.201, 1.25664, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30042, 75, "Saronite & Titanium"),
(@titan, 30042, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7064.83, 1379.27, 307.581, 1.85005, 3600, 100, 1),
(191133, 571, 7064.83, 1379.27, 307.581, 1.85005, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30043, 75, "Saronite & Titanium"),
(@titan, 30043, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5665.19, 1897.49, 519.675, 2.93214, 3600, 100, 1),
(191133, 571, 5665.19, 1897.49, 519.675, 2.93214, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30044, 75, "Saronite & Titanium"),
(@titan, 30044, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7512.87, 1172.61, 344.485, -1.32645, 3600, 100, 1),
(191133, 571, 7512.87, 1172.61, 344.485, -1.32645, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30045, 75, "Saronite & Titanium"),
(@titan, 30045, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6477.44, 2487.12, 475.981, -0.279252, 3600, 100, 1),
(191133, 571, 6477.44, 2487.12, 475.981, -0.279252, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30046, 75, "Saronite & Titanium"),
(@titan, 30046, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5914.5, 2015.98, 516.339, 2.93214, 3600, 100, 1),
(191133, 571, 5914.5, 2015.98, 516.339, 2.93214, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30047, 75, "Saronite & Titanium"),
(@titan, 30047, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 8253.71, 1842.5, 563.077, 1.44862, 3600, 100, 1),
(191133, 571, 8253.71, 1842.5, 563.077, 1.44862, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30048, 75, "Saronite & Titanium"),
(@titan, 30048, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5843.15, 2256.14, 520.155, -1.06465, 3600, 100, 1),
(191133, 571, 5843.15, 2256.14, 520.155, -1.06465, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30049, 75, "Saronite & Titanium"),
(@titan, 30049, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7935.66, 1579.35, 411.484, -1.91986, 3600, 100, 1),
(191133, 571, 7935.66, 1579.35, 411.484, -1.91986, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30050, 75, "Saronite & Titanium"),
(@titan, 30050, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7980.9, 1539.41, 467.71, 1.46608, 3600, 100, 1),
(191133, 571, 7980.9, 1539.41, 467.71, 1.46608, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30051, 75, "Saronite & Titanium"),
(@titan, 30051, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6497.03, 3510.88, 540.232, -2.70526, 3600, 100, 1),
(191133, 571, 6497.03, 3510.88, 540.232, -2.70526, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30052, 75, "Saronite & Titanium"),
(@titan, 30052, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5957.89, 2517.91, 537.277, 1.09956, 3600, 100, 1),
(191133, 571, 5957.89, 2517.91, 537.277, 1.09956, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30053, 75, "Saronite & Titanium"),
(@titan, 30053, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7521.31, 2268.77, 391.406, -1.0472, 3600, 100, 1),
(191133, 571, 7521.31, 2268.77, 391.406, -1.0472, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30054, 75, "Saronite & Titanium"),
(@titan, 30054, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6448.21, 1897.02, 515.36, 0.366518, 3600, 100, 1),
(191133, 571, 6448.21, 1897.02, 515.36, 0.366518, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30055, 75, "Saronite & Titanium"),
(@titan, 30055, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5775.48, 2081.83, -342.742, 0.715585, 3600, 100, 1),
(191133, 571, 5775.48, 2081.83, -342.742, 0.715585, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30056, 75, "Saronite & Titanium"),
(@titan, 30056, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7102.52, 3022.01, 446.972, 1.79769, 3600, 100, 1),
(191133, 571, 7102.52, 3022.01, 446.972, 1.79769, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30057, 75, "Saronite & Titanium"),
(@titan, 30057, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6484.37, 294.937, 399.821, -1.15192, 3600, 100, 1),
(191133, 571, 6484.37, 294.937, 399.821, -1.15192, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30058, 75, "Saronite & Titanium"),
(@titan, 30058, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5790.74, 2214.07, 515.154, 1.309, 3600, 100, 1),
(191133, 571, 5790.74, 2214.07, 515.154, 1.309, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30059, 75, "Saronite & Titanium"),
(@titan, 30059, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5890.5, 1915.92, -345.982, -1.76278, 3600, 100, 1),
(191133, 571, 5890.5, 1915.92, -345.982, -1.76278, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30060, 75, "Saronite & Titanium"),
(@titan, 30060, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5354.23, 4820.88, -198.88, 1.6057, 3600, 100, 1),
(191133, 571, 5354.23, 4820.88, -198.88, 1.6057, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30061, 75, "Saronite & Titanium"),
(@titan, 30061, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5684.08, 5541.49, -72.1058, -1.64061, 3600, 100, 1),
(191133, 571, 5684.08, 5541.49, -72.1058, -1.64061, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30062, 75, "Saronite & Titanium"),
(@titan, 30062, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5385.53, 4913.98, -195.354, 1.83259, 3600, 100, 1),
(191133, 571, 5385.53, 4913.98, -195.354, 1.83259, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30063, 75, "Saronite & Titanium"),
(@titan, 30063, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5324.95, 5368.98, -123.416, -1.37881, 3600, 100, 1),
(191133, 571, 5324.95, 5368.98, -123.416, -1.37881, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30064, 75, "Saronite & Titanium"),
(@titan, 30064, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5978.92, 559.39, 212.441, -2.80997, 3600, 100, 1),
(191133, 571, 5978.92, 559.39, 212.441, -2.80997, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30065, 75, "Saronite & Titanium"),
(@titan, 30065, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5652.2, 3981.09, -83.0324, -1.13446, 3600, 100, 1),
(191133, 571, 5652.2, 3981.09, -83.0324, -1.13446, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30066, 75, "Saronite & Titanium"),
(@titan, 30066, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6277.39, 4221.15, -40.3804, 0.59341, 3600, 100, 1),
(191133, 571, 6277.39, 4221.15, -40.3804, 0.59341, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30067, 75, "Saronite & Titanium"),
(@titan, 30067, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6205.15, 4325.34, -38.2094, -0.052359, 3600, 100, 1),
(191133, 571, 6205.15, 4325.34, -38.2094, -0.052359, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30068, 75, "Saronite & Titanium"),
(@titan, 30068, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5945.59, 4566.13, -99.452, 1.69297, 3600, 100, 1),
(191133, 571, 5945.59, 4566.13, -99.452, 1.69297, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30069, 75, "Saronite & Titanium"),
(@titan, 30069, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6215.25, 5172.35, -97.6636, 0.244346, 3600, 100, 1),
(191133, 571, 6215.25, 5172.35, -97.6636, 0.244346, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30070, 75, "Saronite & Titanium"),
(@titan, 30070, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4866.02, 4570.89, -60.3061, 2.00713, 3600, 100, 1),
(191133, 571, 4866.02, 4570.89, -60.3061, 2.00713, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30071, 75, "Saronite & Titanium"),
(@titan, 30071, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6466.15, 137.682, 444.719, 2.35619, 3600, 100, 1),
(191133, 571, 6466.15, 137.682, 444.719, 2.35619, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30072, 75, "Saronite & Titanium"),
(@titan, 30072, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4546.78, 5769.55, -57.8889, 2.56563, 3600, 100, 1),
(191133, 571, 4546.78, 5769.55, -57.8889, 2.56563, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30073, 75, "Saronite & Titanium"),
(@titan, 30073, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4722.86, 5246.86, -42.0046, 1.18682, 3600, 100, 1),
(191133, 571, 4722.86, 5246.86, -42.0046, 1.18682, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30074, 75, "Saronite & Titanium"),
(@titan, 30074, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4884.83, 4321.19, -54.8871, -3.00195, 3600, 100, 1),
(191133, 571, 4884.83, 4321.19, -54.8871, -3.00195, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30075, 75, "Saronite & Titanium"),
(@titan, 30075, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5894.7, 1913.14, -345.937, -2.07694, 3600, 100, 1),
(191133, 571, 5894.7, 1913.14, -345.937, -2.07694, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30076, 75, "Saronite & Titanium"),
(@titan, 30076, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6107, 5455.44, -97.4798, 2.93214, 3600, 100, 1),
(191133, 571, 6107, 5455.44, -97.4798, 2.93214, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30077, 75, "Saronite & Titanium"),
(@titan, 30077, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5128.38, 4215.86, -83.4258, 1.6057, 3600, 100, 1),
(191133, 571, 5128.38, 4215.86, -83.4258, 1.6057, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30078, 75, "Saronite & Titanium"),
(@titan, 30078, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5735.86, 5612.5, -67.5915, -2.58308, 3600, 100, 1),
(191133, 571, 5735.86, 5612.5, -67.5915, -2.58308, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30079, 75, "Saronite & Titanium"),
(@titan, 30079, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5277.8, 3702.89, 12.7941, 1.76278, 3600, 100, 1),
(191133, 571, 5277.8, 3702.89, 12.7941, 1.76278, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30080, 75, "Saronite & Titanium"),
(@titan, 30080, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5010.67, 1804.19, 678.496, -2.86233, 3600, 100, 1),
(191133, 571, 5010.67, 1804.19, 678.496, -2.86233, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30081, 75, "Saronite & Titanium"),
(@titan, 30081, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4837.23, 4160.79, -3.63805, -0.628317, 3600, 100, 1),
(191133, 571, 4837.23, 4160.79, -3.63805, -0.628317, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30082, 75, "Saronite & Titanium"),
(@titan, 30082, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7720.6, 1424.71, 353.361, -1.62316, 3600, 100, 1),
(191133, 571, 7720.6, 1424.71, 353.361, -1.62316, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30083, 75, "Saronite & Titanium"),
(@titan, 30083, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6943.63, 3630.96, 830.104, -1.46608, 3600, 100, 1),
(191133, 571, 6943.63, 3630.96, 830.104, -1.46608, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30084, 75, "Saronite & Titanium"),
(@titan, 30084, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7779.62, 1830.56, 356.359, -2.53072, 3600, 100, 1),
(191133, 571, 7779.62, 1830.56, 356.359, -2.53072, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30085, 75, "Saronite & Titanium"),
(@titan, 30085, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7420.41, 3083.89, 586.887, -2.35619, 3600, 100, 1),
(191133, 571, 7420.41, 3083.89, 586.887, -2.35619, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30086, 75, "Saronite & Titanium"),
(@titan, 30086, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6640.88, 3346.68, 677.41, -0.767944, 3600, 100, 1),
(191133, 571, 6640.88, 3346.68, 677.41, -0.767944, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30087, 75, "Saronite & Titanium"),
(@titan, 30087, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7330.26, 2996.15, 434.107, -1.98967, 3600, 100, 1),
(191133, 571, 7330.26, 2996.15, 434.107, -1.98967, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30088, 75, "Saronite & Titanium"),
(@titan, 30088, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4988.2, 5373.05, -94.5907, 1.36136, 3600, 100, 1),
(191133, 571, 4988.2, 5373.05, -94.5907, 1.36136, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30089, 75, "Saronite & Titanium"),
(@titan, 30089, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5903.81, 380.04, 220.506, -2.72271, 3600, 100, 1),
(191133, 571, 5903.81, 380.04, 220.506, -2.72271, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30090, 75, "Saronite & Titanium"),
(@titan, 30090, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5905.28, 334.268, 230.584, -2.1293, 3600, 100, 1),
(191133, 571, 5905.28, 334.268, 230.584, -2.1293, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30091, 75, "Saronite & Titanium"),
(@titan, 30091, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6035.78, 631.157, 201.116, 0.994837, 3600, 100, 1),
(191133, 571, 6035.78, 631.157, 201.116, 0.994837, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30092, 75, "Saronite & Titanium"),
(@titan, 30092, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6830.67, 762.702, 409.857, 2.1293, 3600, 100, 1),
(191133, 571, 6830.67, 762.702, 409.857, 2.1293, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30093, 75, "Saronite & Titanium"),
(@titan, 30093, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 8292.69, 2611.04, 718.001, -2.93214, 3600, 100, 1),
(191133, 571, 8292.69, 2611.04, 718.001, -2.93214, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30094, 75, "Saronite & Titanium"),
(@titan, 30094, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7656.88, 1786.75, 350.272, -2.51327, 3600, 100, 1),
(191133, 571, 7656.88, 1786.75, 350.272, -2.51327, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30095, 75, "Saronite & Titanium"),
(@titan, 30095, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 8050.09, 2858.94, 510.469, -1.65806, 3600, 100, 1),
(191133, 571, 8050.09, 2858.94, 510.469, -1.65806, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30096, 75, "Saronite & Titanium"),
(@titan, 30096, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7689.33, 3181.03, 578.833, 0.401425, 3600, 100, 1),
(191133, 571, 7689.33, 3181.03, 578.833, 0.401425, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30097, 75, "Saronite & Titanium"),
(@titan, 30097, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4012.23, 2581.06, 358.498, -0.104719, 3600, 100, 1),
(191133, 571, 4012.23, 2581.06, 358.498, -0.104719, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30098, 75, "Saronite & Titanium"),
(@titan, 30098, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5170.72, 2170.47, 418.683, -0.471238, 3600, 100, 1),
(191133, 571, 5170.72, 2170.47, 418.683, -0.471238, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30099, 75, "Saronite & Titanium"),
(@titan, 30099, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5449.99, 3279.56, 417.628, -0.994837, 3600, 100, 1),
(191133, 571, 5449.99, 3279.56, 417.628, -0.994837, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30100, 75, "Saronite & Titanium"),
(@titan, 30100, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4586.99, 2144.87, 369.245, 3.05433, 3600, 100, 1),
(191133, 571, 4586.99, 2144.87, 369.245, 3.05433, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30101, 75, "Saronite & Titanium"),
(@titan, 30101, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4629.31, 2647.54, 373.596, 0.645772, 3600, 100, 1),
(191133, 571, 4629.31, 2647.54, 373.596, 0.645772, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30102, 75, "Saronite & Titanium"),
(@titan, 30102, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4817.05, 1830.32, 462.234, -2.25147, 3600, 100, 1),
(191133, 571, 4817.05, 1830.32, 462.234, -2.25147, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30103, 75, "Saronite & Titanium"),
(@titan, 30103, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4404, 1979.09, 411.626, 3.00195, 3600, 100, 1),
(191133, 571, 4404, 1979.09, 411.626, 3.00195, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30104, 75, "Saronite & Titanium"),
(@titan, 30104, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4732.1, 2841.06, 360.432, -0.95993, 3600, 100, 1),
(191133, 571, 4732.1, 2841.06, 360.432, -0.95993, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30105, 75, "Saronite & Titanium"),
(@titan, 30105, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4858.46, 3913.54, 380.702, 2.44346, 3600, 100, 1),
(191133, 571, 4858.46, 3913.54, 380.702, 2.44346, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30106, 75, "Saronite & Titanium"),
(@titan, 30106, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4405, 4150.25, 413.217, -2.65289, 3600, 100, 1),
(191133, 571, 4405, 4150.25, 413.217, -2.65289, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30107, 75, "Saronite & Titanium"),
(@titan, 30107, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4560.84, 3708.44, 373.765, 1.81514, 3600, 100, 1),
(191133, 571, 4560.84, 3708.44, 373.765, 1.81514, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30108, 75, "Saronite & Titanium"),
(@titan, 30108, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4645.42, 2396.93, 337.234, -0.942477, 3600, 100, 1),
(191133, 571, 4645.42, 2396.93, 337.234, -0.942477, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30109, 75, "Saronite & Titanium"),
(@titan, 30109, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4910.04, 3429.39, 360.794, 2.3911, 3600, 100, 1),
(191133, 571, 4910.04, 3429.39, 360.794, 2.3911, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30110, 75, "Saronite & Titanium"),
(@titan, 30110, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4489.51, 3493.71, 365.425, 2.11185, 3600, 100, 1),
(191133, 571, 4489.51, 3493.71, 365.425, 2.11185, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30111, 75, "Saronite & Titanium"),
(@titan, 30111, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4816.67, 3641.68, 365.962, -0.575957, 3600, 100, 1),
(191133, 571, 4816.67, 3641.68, 365.962, -0.575957, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30112, 75, "Saronite & Titanium"),
(@titan, 30112, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 8707.63, 1008.65, 443.877, 0.890117, 3600, 100, 1),
(191133, 571, 8707.63, 1008.65, 443.877, 0.890117, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30113, 75, "Saronite & Titanium"),
(@titan, 30113, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7476.56, 1295.25, 322.15, -0.558504, 3600, 100, 1),
(191133, 571, 7476.56, 1295.25, 322.15, -0.558504, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30114, 75, "Saronite & Titanium"),
(@titan, 30114, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5062.38, 4526.64, -96.4765, 0.209439, 3600, 100, 1),
(191133, 571, 5062.38, 4526.64, -96.4765, 0.209439, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30115, 75, "Saronite & Titanium"),
(@titan, 30115, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7653.1, 2792.67, 414.985, 0.122173, 3600, 100, 1),
(191133, 571, 7653.1, 2792.67, 414.985, 0.122173, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30116, 75, "Saronite & Titanium"),
(@titan, 30116, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 8168.02, 1303.41, 793.594, 0.157079, 3600, 100, 1),
(191133, 571, 8168.02, 1303.41, 793.594, 0.157079, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30117, 75, "Saronite & Titanium"),
(@titan, 30117, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 7523.6, 2698.61, 409.932, 2.96704, 3600, 100, 1),
(191133, 571, 7523.6, 2698.61, 409.932, 2.96704, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30118, 75, "Saronite & Titanium"),
(@titan, 30118, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 8266.34, 1755.56, 580.521, -2.91469, 3600, 100, 1),
(191133, 571, 8266.34, 1755.56, 580.521, -2.91469, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30119, 75, "Saronite & Titanium"),
(@titan, 30119, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4877.31, -3794.38, 341.362, 1.18682, 3600, 100, 1),
(191133, 571, 4877.31, -3794.38, 341.362, 1.18682, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30120, 75, "Saronite & Titanium"),
(@titan, 30120, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5970.19, -2870.24, 287.289, -0.663223, 3600, 100, 1),
(191133, 571, 5970.19, -2870.24, 287.289, -0.663223, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30121, 75, "Saronite & Titanium"),
(@titan, 30121, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6217.74, -2238.07, 238.705, -1.97222, 3600, 100, 1),
(191133, 571, 6217.74, -2238.07, 238.705, -1.97222, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30122, 75, "Saronite & Titanium"),
(@titan, 30122, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5512.26, -1314.16, 238.393, -0.209439, 3600, 100, 1),
(191133, 571, 5512.26, -1314.16, 238.393, -0.209439, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30123, 75, "Saronite & Titanium"),
(@titan, 30123, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5124.54, -2863.14, 292.838, -0.436332, 3600, 100, 1),
(191133, 571, 5124.54, -2863.14, 292.838, -0.436332, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30124, 75, "Saronite & Titanium"),
(@titan, 30124, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5193.19, -3341.85, 289.436, -2.65289, 3600, 100, 1),
(191133, 571, 5193.19, -3341.85, 289.436, -2.65289, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30125, 75, "Saronite & Titanium"),
(@titan, 30125, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5840.19, -2309.73, 288.201, -1.0821, 3600, 100, 1),
(191133, 571, 5840.19, -2309.73, 288.201, -1.0821, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30126, 75, "Saronite & Titanium"),
(@titan, 30126, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6365.95, -2193.24, 272.601, -0.471238, 3600, 100, 1),
(191133, 571, 6365.95, -2193.24, 272.601, -0.471238, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30127, 75, "Saronite & Titanium"),
(@titan, 30127, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5126.98, -1597.36, 236.562, -3.05433, 3600, 100, 1),
(191133, 571, 5126.98, -1597.36, 236.562, -3.05433, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30128, 75, "Saronite & Titanium"),
(@titan, 30128, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5309.97, -2060.15, 241.468, 1.62316, 3600, 100, 1),
(191133, 571, 5309.97, -2060.15, 241.468, 1.62316, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30129, 75, "Saronite & Titanium"),
(@titan, 30129, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5311.82, -3125.22, 280.913, 2.84488, 3600, 100, 1),
(191133, 571, 5311.82, -3125.22, 280.913, 2.84488, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30130, 75, "Saronite & Titanium"),
(@titan, 30130, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5380.2, -2170.01, 237.136, -1.32645, 3600, 100, 1),
(191133, 571, 5380.2, -2170.01, 237.136, -1.32645, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30131, 75, "Saronite & Titanium"),
(@titan, 30131, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5915.27, -1263.34, 261.516, -2.87979, 3600, 100, 1),
(191133, 571, 5915.27, -1263.34, 261.516, -2.87979, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30132, 75, "Saronite & Titanium"),
(@titan, 30132, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 4865.68, -2458.64, 213.651, 2.30383, 3600, 100, 1),
(191133, 571, 4865.68, -2458.64, 213.651, 2.30383, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30133, 75, "Saronite & Titanium"),
(@titan, 30133, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5953.86, -2800.04, 270.211, -1.0472, 3600, 100, 1),
(191133, 571, 5953.86, -2800.04, 270.211, -1.0472, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30134, 75, "Saronite & Titanium"),
(@titan, 30134, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6286.91, -2671.79, 304.413, -1.36136, 3600, 100, 1),
(191133, 571, 6286.91, -2671.79, 304.413, -1.36136, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30135, 75, "Saronite & Titanium"),
(@titan, 30135, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5410.57, -2534.09, 292.406, 2.51327, 3600, 100, 1),
(191133, 571, 5410.57, -2534.09, 292.406, 2.51327, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30136, 75, "Saronite & Titanium"),
(@titan, 30136, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5403.18, -2268.07, 243.903, 2.40855, 3600, 100, 1),
(191133, 571, 5403.18, -2268.07, 243.903, 2.40855, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30137, 75, "Saronite & Titanium"),
(@titan, 30137, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6051.72, -1285.41, 503.838, -1.88495, 3600, 100, 1),
(191133, 571, 6051.72, -1285.41, 503.838, -1.88495, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30138, 75, "Saronite & Titanium"),
(@titan, 30138, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5566.94, -1860.93, 235.266, -1.79769, 3600, 100, 1),
(191133, 571, 5566.94, -1860.93, 235.266, -1.79769, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30139, 75, "Saronite & Titanium"),
(@titan, 30139, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6331.42, -2977.62, 339.642, 1.67551, 3600, 100, 1),
(191133, 571, 6331.42, -2977.62, 339.642, 1.67551, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30140, 75, "Saronite & Titanium"),
(@titan, 30140, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6700.08, -4231.6, 461.299, 0.767944, 3600, 100, 1),
(191133, 571, 6700.08, -4231.6, 461.299, 0.767944, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30141, 75, "Saronite & Titanium"),
(@titan, 30141, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5104.01, -1243.18, 252.967, 2.25147, 3600, 100, 1),
(191133, 571, 5104.01, -1243.18, 252.967, 2.25147, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30142, 75, "Saronite & Titanium"),
(@titan, 30142, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6439.04, -330.39, 404.906, -0.663223, 3600, 100, 1),
(191133, 571, 6439.04, -330.39, 404.906, -0.663223, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30143, 75, "Saronite & Titanium"),
(@titan, 30143, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5086.03, -1155.55, 265.341, 1.48353, 3600, 100, 1),
(191133, 571, 5086.03, -1155.55, 265.341, 1.48353, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30144, 75, "Saronite & Titanium"),
(@titan, 30144, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5179.63, -3603.58, 295.863, -0.593412, 3600, 100, 1),
(191133, 571, 5179.63, -3603.58, 295.863, -0.593412, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30145, 75, "Saronite & Titanium"),
(@titan, 30145, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5068.39, -1175.99, 260.785, 2.42601, 3600, 100, 1),
(191133, 571, 5068.39, -1175.99, 260.785, 2.42601, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30146, 75, "Saronite & Titanium"),
(@titan, 30146, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6278.61, -2746.58, 303.185, 2.87979, 3600, 100, 1),
(191133, 571, 6278.61, -2746.58, 303.185, 2.87979, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30147, 75, "Saronite & Titanium"),
(@titan, 30147, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5384.13, -1101.8, 185.319, 2.58308, 3600, 100, 1),
(191133, 571, 5384.13, -1101.8, 185.319, 2.58308, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30148, 75, "Saronite & Titanium"),
(@titan, 30148, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6779.47, -4100.77, 470.973, -3.10665, 3600, 100, 1),
(191133, 571, 6779.47, -4100.77, 470.973, -3.10665, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30149, 75, "Saronite & Titanium"),
(@titan, 30149, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6131.64, -2383.84, 301.084, -0.261798, 3600, 100, 1),
(191133, 571, 6131.64, -2383.84, 301.084, -0.261798, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30150, 75, "Saronite & Titanium"),
(@titan, 30150, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5711.41, -3665.91, 372.22, -2.75761, 3600, 100, 1),
(191133, 571, 5711.41, -3665.91, 372.22, -2.75761, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30151, 75, "Saronite & Titanium"),
(@titan, 30151, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6572.52, -4193.88, 468.78, -1.55334, 3600, 100, 1),
(191133, 571, 6572.52, -4193.88, 468.78, -1.55334, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30152, 75, "Saronite & Titanium"),
(@titan, 30152, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5311.94, -1202.48, 246.599, -1.16937, 3600, 100, 1),
(191133, 571, 5311.94, -1202.48, 246.599, -1.16937, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30153, 75, "Saronite & Titanium"),
(@titan, 30153, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5557.93, -2331.11, 287.86, -1.50098, 3600, 100, 1),
(191133, 571, 5557.93, -2331.11, 287.86, -1.50098, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30154, 75, "Saronite & Titanium"),
(@titan, 30154, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5546.54, -1721.97, 243.669, -2.58308, 3600, 100, 1),
(191133, 571, 5546.54, -1721.97, 243.669, -2.58308, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30155, 75, "Saronite & Titanium"),
(@titan, 30155, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5697.81, -2317.47, 288.629, 1.13446, 3600, 100, 1),
(191133, 571, 5697.81, -2317.47, 288.629, 1.13446, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30156, 75, "Saronite & Titanium"),
(@titan, 30156, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6462.37, -3474.22, 388.903, -0.226892, 3600, 100, 1),
(191133, 571, 6462.37, -3474.22, 388.903, -0.226892, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30157, 75, "Saronite & Titanium"),
(@titan, 30157, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6436.63, -3241.96, 405.875, -1.01229, 3600, 100, 1),
(191133, 571, 6436.63, -3241.96, 405.875, -1.01229, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30158, 75, "Saronite & Titanium"),
(@titan, 30158, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6280.1, -2592.43, 302.372, -1.36136, 3600, 100, 1),
(191133, 571, 6280.1, -2592.43, 302.372, -1.36136, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30159, 75, "Saronite & Titanium"),
(@titan, 30159, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6033.01, -4086.71, 355.195, 1.83259, 3600, 100, 1),
(191133, 571, 6033.01, -4086.71, 355.195, 1.83259, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30160, 75, "Saronite & Titanium"),
(@titan, 30160, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 6792.44, -4281.66, 452.834, 0.855211, 3600, 100, 1),
(191133, 571, 6792.44, -4281.66, 452.834, 0.855211, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30161, 75, "Saronite & Titanium"),
(@titan, 30161, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 571, 5569.9, -3220.39, 373.561, 5.44059, 3600, 100, 1),
(191133, 571, 5569.9, -3220.39, 373.561, 5.44059, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30162, 75, "Saronite & Titanium"),
(@titan, 30162, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 599, 949.208, 845.198, 186.281, -2.60053, 3600, 100, 1),
(191133, 599, 949.208, 845.198, 186.281, -2.60053, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30163, 75, "Saronite & Titanium"),
(@titan, 30163, 25, "Saronite & Titanium");

INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
(189980, 599, 1063.82, 714.079, 203.998, 2.25147, 3600, 100, 1),
(191133, 599, 1063.82, 714.079, 203.998, 2.25147, 3600, 100, 1);
SET @saron:=(SELECT max(guid) FROM gameobject WHERE id=189980);
SET @titan:=(SELECT max(guid) FROM gameobject WHERE id=191133);
INSERT INTO pool_gameobject (guid, pool_entry, chance, description) VALUES
(@saron, 30164, 75, "Saronite & Titanium"),
(@titan, 30164, 25, "Saronite & Titanium");