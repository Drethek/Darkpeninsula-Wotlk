/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "InstanceScript.h"
#include "ulduar.h"

static DoorData const doorData[] =
{
    {   GO_LEVIATHAN_DOOR, BOSS_LEVIATHAN,    DOOR_TYPE_ROOM, BOUNDARY_S      },
    {   GO_XT_002_DOOR,    BOSS_XT002,        DOOR_TYPE_ROOM, BOUNDARY_S      },
    {   0,                 0,                 DOOR_TYPE_ROOM, BOUNDARY_NONE   },
};

class instance_ulduar : public InstanceMapScript
{
    public:
        instance_ulduar() : InstanceMapScript("instance_ulduar", 603) { }

        struct instance_ulduar_InstanceMapScript : public InstanceScript
        {
            instance_ulduar_InstanceMapScript(InstanceMap* map) : InstanceScript(map) { }

            uint32 Encounter[MAX_ENCOUNTER];
            std::string m_strInstData;

            // Creatures
            uint64 LeviathanGUID;
            uint64 IgnisGUID;
            uint64 RazorscaleGUID;
            uint64 RazorscaleController;
            uint64 RazorHarpoonGUIDs[4];
            uint64 ExpeditionCommanderGUID;
            uint64 XT002GUID;
            uint64 XTToyPileGUIDs[4];
            uint64 AssemblyGUIDs[3];
            uint64 KologarnGUID;
            uint64 AuriayaGUID;
            uint64 MimironGUID;
            uint64 HodirGUID;
            uint64 ThorimGUID;
            uint64 FreyaGUID;
            uint64 uiBrightleafGUID;
            uint64 uiIronbranchGUID;
            uint64 uiStonebarkGUID;
            uint64 KeeperGUIDs[3];
            uint64 VezaxGUID;
            uint64 YoggSaronGUID;
            uint64 AlgalonGUID;
            uint64 LeviathanGateGUID;
            uint64 VezaxDoorGUID;
            uint64 uiRunicColossusGUID;
            uint64 uiRuneGiantGUID;

            // GameObjects
            uint64 KologarnChestGUID;
            uint64 KologarnBridgeGUID;
            uint64 KologarnDoorGUID;
            uint64 ThorimChestGUID;
            uint64 HodirRareCacheGUID;
            uint64 HodirChestGUID;
            uint64 HodirDoorGUID;
            uint64 HodirIceDoorGUID;
            uint64 ArchivumDoorGUID;
            uint64 uiRunicDoorGUID;
            uint64 uiStoneDoorGUID;
            uint64 uiMimironElevatorGUID;
            uint64 uiLeviathanMKIIGUID;
            uint64 uiVX001GUID;
            uint64 uiAerialUnitGUID;
            uint64 uiMagneticCoreGUID;
            uint64 uiMimironTramGUID;
            uint64 uiFreyaImageGUID;
            uint64 uiThorimImageGUID;
            uint64 uiMimironImageGUID;
            uint64 uiHodirImageGUID;
            uint64 uiFreyaYSGUID;
            uint64 uiThorimYSGUID;
            uint64 uiMimironYSGUID;
            uint64 uiHodirYSGUID;
            uint64 uiYoggSaronBrainGUID;
            uint64 uiAlgalonDoor;
            uint64 UniverseGlobeGUID;
            uint64 UniverseFloor1GUID;
            uint64 UniverseFloor2GUID;

            // Miscellaneous
            uint32 TeamInInstance;
            uint32 HodirRareCacheData;
            uint32 ColossusData;
            uint8 elderCount;
            bool conSpeedAtory;
            bool Unbroken;

            std::set<uint64> mRubbleSpawns;

            void Initialize()
            {
                SetBossNumber(MAX_ENCOUNTER);
                LoadDoorData(doorData);
                IgnisGUID                        = 0;
                RazorscaleGUID                   = 0;
                RazorscaleController             = 0;
                ExpeditionCommanderGUID          = 0;
                XT002GUID                        = 0;
                KologarnGUID                     = 0;
                AuriayaGUID                      = 0;
                MimironGUID                      = 0;
                HodirGUID                        = 0;
                ThorimGUID                       = 0;
                FreyaGUID                        = 0;
                VezaxGUID                        = 0;
                YoggSaronGUID                    = 0;
                AlgalonGUID                      = 0;
                KologarnChestGUID                = 0;
                KologarnBridgeGUID               = 0;
                ThorimChestGUID                  = 0;
                HodirRareCacheGUID               = 0;
                HodirChestGUID                   = 0;
                LeviathanGateGUID                = 0;
                VezaxDoorGUID                    = 0;
                HodirDoorGUID                    = 0;
                HodirIceDoorGUID                 = 0;
                ArchivumDoorGUID                 = 0;
                TeamInInstance                   = 0;
                HodirRareCacheData               = 0;
                ColossusData                     = 0;
                elderCount                       = 0;
                uiRunicDoorGUID                  = 0;
                uiStoneDoorGUID                  = 0;
                uiLeviathanMKIIGUID              = 0;
                uiVX001GUID                      = 0;
                uiAerialUnitGUID                 = 0;
                uiMagneticCoreGUID               = 0;
                uiFreyaImageGUID                 = 0;
                uiThorimImageGUID                = 0;
                uiMimironImageGUID               = 0;
                uiHodirImageGUID                 = 0;
                uiFreyaYSGUID                    = 0;
                uiThorimYSGUID                   = 0;
                uiMimironYSGUID                  = 0;
                uiHodirYSGUID                    = 0;
                uiYoggSaronBrainGUID             = 0;
                uiAlgalonDoor                    = 0;
                UniverseGlobeGUID                = 0;
                UniverseFloor1GUID               = 0;
                UniverseFloor2GUID               = 0;
                conSpeedAtory                    = false;
                Unbroken                         = true;

                memset(Encounter, 0, sizeof(Encounter));
                memset(XTToyPileGUIDs, 0, sizeof(XTToyPileGUIDs));
                memset(AssemblyGUIDs, 0, sizeof(AssemblyGUIDs));
                memset(RazorHarpoonGUIDs, 0, sizeof(RazorHarpoonGUIDs));
                memset(KeeperGUIDs, 0, sizeof(KeeperGUIDs));
            }

            bool IsEncounterInProgress() const
            {
                for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                {
                    if (Encounter[i] == IN_PROGRESS)
                        return true;
                }

                return false;
            }

            void OnPlayerEnter(Player* player)
            {
                if (!TeamInInstance)
                    TeamInInstance = player->GetTeam();
            }

            void OnCreatureCreate(Creature* creature)
            {
                if (!TeamInInstance)
                {
                    Map::PlayerList const& Players = instance->GetPlayers();
                    if (!Players.isEmpty())
                        if (Player* player = Players.begin()->getSource())
                            TeamInInstance = player->GetTeam();
                }

                switch (creature->GetEntry())
                {
                    case NPC_LEVIATHAN:
                        LeviathanGUID = creature->GetGUID();
                        break;
                    case NPC_IGNIS:
                        IgnisGUID = creature->GetGUID();
                        break;
                    case NPC_RAZORSCALE:
                        RazorscaleGUID = creature->GetGUID();
                        break;
                    case NPC_RAZORSCALE_CONTROLLER:
                        RazorscaleController = creature->GetGUID();
                        break;
                    case NPC_EXPEDITION_COMMANDER:
                        ExpeditionCommanderGUID = creature->GetGUID();
                        break;
                    case NPC_XT002:
                        XT002GUID = creature->GetGUID();
                        break;
                    case NPC_XT_TOY_PILE:
                        for (uint8 i = 0; i < 4; ++i)
                            if (!XTToyPileGUIDs[i])
                                XTToyPileGUIDs[i] = creature->GetGUID();
                        break;

                    // Assembly of Iron
                    case NPC_STEELBREAKER:
                        AssemblyGUIDs[0] = creature->GetGUID();
                        break;
                    case NPC_MOLGEIM:
                        AssemblyGUIDs[1] = creature->GetGUID();
                        break;
                    case NPC_BRUNDIR:
                        AssemblyGUIDs[2] = creature->GetGUID();
                        break;

                    // Freya's Keeper
                    case NPC_IRONBRANCH:
                        KeeperGUIDs[0] = creature->GetGUID();
                        if (GetBossState(BOSS_FREYA) == DONE)
                            creature->DespawnOrUnsummon();
                        break;
                    case NPC_BRIGHTLEAF:
                        KeeperGUIDs[1] = creature->GetGUID();
                        if (GetBossState(BOSS_FREYA) == DONE)
                            creature->DespawnOrUnsummon();
                        break;
                    case NPC_STONEBARK:
                        KeeperGUIDs[2] = creature->GetGUID();
                        if (GetBossState(BOSS_FREYA) == DONE)
                            creature->DespawnOrUnsummon();
                         break;

                    // Kologarn
                    case NPC_KOLOGARN:
                        KologarnGUID = creature->GetGUID();
                        break;
                    case NPC_AURIAYA:
                        AuriayaGUID = creature->GetGUID();
                        break;
                    case NPC_MIMIRON:
                        MimironGUID = creature->GetGUID();
                        break;
                    case NPC_HODIR:
                        HodirGUID = creature->GetGUID();
                        break;
                    case NPC_THORIM:
                        ThorimGUID = creature->GetGUID();
                        break;
                    case NPC_FREYA:
                        FreyaGUID = creature->GetGUID();
                        break;
                    case NPC_VEZAX:
                        VezaxGUID = creature->GetGUID();
                        break;
                    case NPC_YOGGSARON:
                        YoggSaronGUID = creature->GetGUID();
                        break;
                    case NPC_ALGALON:
                        AlgalonGUID = creature->GetGUID();
                        break;

                    // Hodir's Helper NPCs
                    case NPC_EIVI_NIGHTFEATHER:
                        if (TeamInInstance == HORDE)
                            creature->UpdateEntry(NPC_TOR_GREYCLOUD, HORDE);
                        break;
                    case NPC_ELLIE_NIGHTFEATHER:
                        if (TeamInInstance == HORDE)
                            creature->UpdateEntry(NPC_KAR_GREYCLOUD, HORDE);
                        break;
                    case NPC_ELEMENTALIST_MAHFUUN:
                        if (TeamInInstance == HORDE)
                            creature->UpdateEntry(NPC_SPIRITWALKER_TARA, HORDE);
                        break;
                    case NPC_ELEMENTALIST_AVUUN:
                        if (TeamInInstance == HORDE)
                            creature->UpdateEntry(NPC_SPIRITWALKER_YONA, HORDE);
                        break;
                    case NPC_MISSY_FLAMECUFFS:
                        if (TeamInInstance == HORDE)
                            creature->UpdateEntry(NPC_AMIRA_BLAZEWEAVER, HORDE);
                        break;
                    case NPC_SISSY_FLAMECUFFS:
                        if (TeamInInstance == HORDE)
                            creature->UpdateEntry(NPC_VEESHA_BLAZEWEAVER, HORDE);
                        break;
                    case NPC_FIELD_MEDIC_PENNY:
                        if (TeamInInstance == HORDE)
                            creature->UpdateEntry(NPC_BATTLE_PRIEST_ELIZA, HORDE);
                        break;
                    case NPC_FIELD_MEDIC_JESSI:
                        if (TeamInInstance == HORDE)
                            creature->UpdateEntry(NPC_BATTLE_PRIEST_GINA, HORDE);
                        break;
                    case NPC_RUNIC_COLOSSUS:
                        uiRunicColossusGUID = creature->GetGUID();
                        break;
                    case NPC_RUNE_GIANT:
                        uiRuneGiantGUID = creature->GetGUID();
                        break;
                    case NPC_LEVIATHAN_MK_II:
                        uiLeviathanMKIIGUID = creature->GetGUID();
                        break;
                    case NPC_VX_001:
                        uiVX001GUID = creature->GetGUID();
                        break;
                    case NPC_AERIAL_UNIT:
                        uiAerialUnitGUID = creature->GetGUID();
                        break;
                    case NPC_MAGNETIC_CORE:
                        uiMagneticCoreGUID = creature->GetGUID();
                        break;

                    // Keeper's Images
                    case NPC_FREY_IMAGE:
                    {
                        uiFreyaImageGUID = creature->GetGUID();
                        InstanceScript* pInstance = creature->GetInstanceScript();
                        creature->SetVisible(false);
                        if (pInstance && pInstance->GetBossState(BOSS_VEZAX) == DONE)
                            creature->SetVisible(true);
                    }
                    case NPC_THORIM_IMAGE:
                    {
                        uiThorimImageGUID = creature->GetGUID();
                        InstanceScript* pInstance = creature->GetInstanceScript();
                        creature->SetVisible(false);
                        if (pInstance && pInstance->GetBossState(BOSS_VEZAX) == DONE)
                            creature->SetVisible(true);
                        break;
                    }
                    case NPC_MIMIRON_IMAGE:
                    {
                        uiMimironImageGUID = creature->GetGUID();
                        InstanceScript* pInstance = creature->GetInstanceScript();
                        creature->SetVisible(false);
                        if (pInstance && pInstance->GetBossState(BOSS_VEZAX) == DONE)
                            creature->SetVisible(true);
                        break;
                    }            
                    case NPC_HODIR_IMAGE: 
                    {
                        uiHodirImageGUID = creature->GetGUID();
                        InstanceScript* pInstance = creature->GetInstanceScript();
                        creature->SetVisible(false);
                        if (pInstance && pInstance->GetBossState(BOSS_VEZAX) == DONE)
                            creature->SetVisible(true);
                        break;
                    }
                    case NPC_YS_FREYA:
                        uiFreyaYSGUID = creature->GetGUID();
                        break;
                    case NPC_YS_THORIM:
                        uiThorimYSGUID = creature->GetGUID();
                        break;
                    case NPC_YS_MIMIRON:
                        uiMimironYSGUID = creature->GetGUID();
                        break;
                    case NPC_YS_HODIR:
                        uiHodirYSGUID = creature->GetGUID();
                        break;
                    case NPC_YOGGSARON_BRAIN:
                        uiYoggSaronBrainGUID = creature->GetGUID();
                        break;
                    }

                // Some npcs are faction dependent
                if (TeamInInstance == HORDE)
                {
                    switch(creature->GetEntry())
                    {
                        case 33062:
                            creature->SetDisplayId(25871);
                            break;
                        case 33325:
                            creature->UpdateEntry(32941, HORDE);
                            break;
                        case 32901:
                            creature->UpdateEntry(33333, HORDE);
                            break;
                        case 33328:
                            creature->UpdateEntry(33332, HORDE);
                            break;
                        case 32900:
                            creature->UpdateEntry(32950, HORDE);
                            break;
                        case 32893:
                            creature->UpdateEntry(33331, HORDE);
                            break;
                        case 33327:
                            creature->UpdateEntry(32946, HORDE);
                            break;
                        case 32897:
                            creature->UpdateEntry(32948, HORDE);
                            break;
                        case 33326:
                            creature->UpdateEntry(33330, HORDE);
                            break;
                        case 32907:
                            creature->UpdateEntry(32908, HORDE);
                            break;
                        case 32885:
                            creature->UpdateEntry(32883, HORDE);
                            break;
                    }
                }
            }

            void OnGameObjectCreate(GameObject* gameObject)
            {
                switch (gameObject->GetEntry())
                {
                    case GO_KOLOGARN_CHEST_HERO:
                    case GO_KOLOGARN_CHEST:
                        KologarnChestGUID = gameObject->GetGUID();
                        break;
                    case GO_KOLOGARN_BRIDGE:
                        KologarnBridgeGUID = gameObject->GetGUID();
                        if (GetBossState(BOSS_KOLOGARN) == DONE)
                            HandleGameObject(0, false, gameObject);
                        break;
                    case GO_KOLOGARN_DOOR:
                        KologarnDoorGUID = gameObject->GetGUID();
                        break;
                    case GO_THORIM_CHEST_HERO:
                    case GO_THORIM_CHEST:
                        ThorimChestGUID = gameObject->GetGUID();
                        break;
                    case GO_HODIR_RARE_CACHE_OF_WINTER_HERO:
                    case GO_HODIR_RARE_CACHE_OF_WINTER:
                        HodirRareCacheGUID = gameObject->GetGUID();
                        break;
                    case GO_HODIR_CHEST_HERO:
                    case GO_HODIR_CHEST:
                        HodirChestGUID = gameObject->GetGUID();
                        break;
                    case GO_LEVIATHAN_DOOR:
                        AddDoor(gameObject, true);
                        break;
                    case GO_LEVIATHAN_GATE:
                        LeviathanGateGUID = gameObject->GetGUID();
                        if (GetBossState(BOSS_LEVIATHAN) == DONE)
                            gameObject->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                        break;
                    case GO_XT_002_DOOR:
                        AddDoor(gameObject, true);
                        break;
                    case GO_VEZAX_DOOR:
                        VezaxDoorGUID = gameObject->GetGUID();
                        HandleGameObject(0, false, gameObject);
                        break;
                    case GO_RAZOR_HARPOON_1:
                        RazorHarpoonGUIDs[0] = gameObject->GetGUID();
                        break;
                    case GO_RAZOR_HARPOON_2:
                        RazorHarpoonGUIDs[1] = gameObject->GetGUID();
                        break;
                    case GO_RAZOR_HARPOON_3:
                        RazorHarpoonGUIDs[2] = gameObject->GetGUID();
                        break;
                    case GO_RAZOR_HARPOON_4:
                        RazorHarpoonGUIDs[3] = gameObject->GetGUID();
                        break;
                    case GO_MOLE_MACHINE:
                        if (GetBossState(BOSS_RAZORSCALE) == IN_PROGRESS)
                            gameObject->SetGoState(GO_STATE_ACTIVE);
                    case GO_HODIR_DOOR:
                        HodirDoorGUID = gameObject->GetGUID();
                        break;
                    case GO_HODIR_ICE_DOOR:
                        HodirIceDoorGUID = gameObject->GetGUID();
                        break;
                    case GO_ARCHIVUM_DOOR:
                        ArchivumDoorGUID = gameObject->GetGUID();
                        if (GetBossState(BOSS_ASSEMBLY_OF_IRON) != DONE)
                            HandleGameObject(ArchivumDoorGUID, false);
                        break;
                    case GO_ALGALON_DOOR:
                        uiAlgalonDoor = gameObject->GetGUID();
                        HandleGameObject(0, false, gameObject);
                        break;
                    case GO_UNIVERSE_GLOBE:
                        UniverseGlobeGUID = gameObject->GetGUID();
                        HandleGameObject(0, false, gameObject);
                        break;
                    case GO_UNIVERSE_FLOOR_1:
                        UniverseFloor1GUID = gameObject->GetGUID();
                        HandleGameObject(0, false, gameObject);
                        break;
                    case GO_UNIVERSE_FLOOR_2:
                        UniverseFloor2GUID = gameObject->GetGUID();
                        HandleGameObject(0, true, gameObject);
                        break;
                    case GO_RUNIC_DOOR:
                       uiRunicDoorGUID = gameObject->GetGUID();
                       break;
                    case GO_STONE_DOOR:
                        uiStoneDoorGUID = gameObject->GetGUID();
                        break;
                    case GO_MIMIRON_ELEVATOR:
                        uiMimironElevatorGUID = gameObject->GetGUID();
                        break;
                    case GO_MIMIRON_TRAM:
                        uiMimironTramGUID = gameObject->GetGUID();
                        break;
                }
            }

            void OnGameObjectRemove(GameObject* gameObject)
            {
                switch (gameObject->GetEntry())
                {
                    case GO_LEVIATHAN_DOOR:
                        AddDoor(gameObject, false);
                        break;
                    case GO_XT_002_DOOR:
                        AddDoor(gameObject, false);
                    default:
                        break;
                }
            }

            void OnCreatureDeath(Creature* creature)
            {
                switch (creature->GetEntry())
                {
                    case NPC_CORRUPTED_SERVITOR:
                    case NPC_MISGUIDED_NYMPH:
                    case NPC_GUARDIAN_LASHER:
                    case NPC_FOREST_SWARMER:
                    case NPC_MANGROVE_ENT:
                    case NPC_IRONROOT_LASHER:
                    case NPC_NATURES_BLADE:
                    case NPC_GUARDIAN_OF_LIFE:
                        if (!conSpeedAtory)
                        {
                            DoStartTimedAchievement(ACHIEVEMENT_TIMED_TYPE_EVENT, CRITERIA_CON_SPEED_ATORY);
                            conSpeedAtory = true;
                        }
                        break;
                    default:
                        break;
                }
            }

            void ProcessEvent(WorldObject* /*gameObject*/, uint32 eventId)
            {
                // Flame Leviathan's Tower Event triggers
                Creature* FlameLeviathan = instance->GetCreature(LeviathanGUID);
                if (FlameLeviathan && FlameLeviathan->isAlive()) // No leviathan, no event triggering ;)
                    switch (eventId)
                    {
                        case EVENT_TOWER_OF_STORM_DESTROYED:
                            FlameLeviathan->AI()->DoAction(ACTION_TOWER_OF_STORM_DESTROYED);
                            break;
                        case EVENT_TOWER_OF_FROST_DESTROYED:
                            FlameLeviathan->AI()->DoAction(ACTION_TOWER_OF_FROST_DESTROYED);
                            break;
                        case EVENT_TOWER_OF_FLAMES_DESTROYED:
                            FlameLeviathan->AI()->DoAction(ACTION_TOWER_OF_FLAMES_DESTROYED);
                            break;
                        case EVENT_TOWER_OF_LIFE_DESTROYED:
                            FlameLeviathan->AI()->DoAction(ACTION_TOWER_OF_LIFE_DESTROYED);
                            break;
                    }
            }


            bool SetBossState(uint32 type, EncounterState state)
            {
                if (!InstanceScript::SetBossState(type, state))
                    return false;

                switch (type)
                {
                    case BOSS_LEVIATHAN:
                    case BOSS_IGNIS:
                    case BOSS_RAZORSCALE:
                    case BOSS_XT002:
                    case BOSS_AURIAYA:
                    case BOSS_MIMIRON:
                    case BOSS_FREYA:
                        break;
                    case BOSS_ASSEMBLY_OF_IRON:
                        if (state == DONE)
                            HandleGameObject(ArchivumDoorGUID, true);
                        break;
                    case BOSS_VEZAX:
                        if (state == DONE)
                        {
                            HandleGameObject(VezaxDoorGUID, true);

                            // Keeper's Images
                            if (Creature* pFreya = instance->GetCreature(uiFreyaImageGUID))
                                pFreya->SetVisible(true);
                            if (Creature* pThorim = instance->GetCreature(uiThorimImageGUID))
                                pThorim->SetVisible(true);
                            if (Creature* pMimiron = instance->GetCreature(uiMimironImageGUID))
                                pMimiron->SetVisible(true);
                            if (Creature* pHodir = instance->GetCreature(uiHodirImageGUID))
                                pHodir->SetVisible(true);
                        }
                        break;
                    case BOSS_YOGGSARON:
                        break;
                    case BOSS_KOLOGARN:
                        if (state == DONE)
                        {
                            if (GameObject* gameObject = instance->GetGameObject(KologarnChestGUID))
                            {
                                gameObject->SetRespawnTime(gameObject->GetRespawnDelay());
                                gameObject->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                            }
                            HandleGameObject(KologarnBridgeGUID, false);
                        }
                        if (state == IN_PROGRESS)
                            HandleGameObject(KologarnDoorGUID, false);
                        else
                            HandleGameObject(KologarnDoorGUID, true);
                        break;
                    case BOSS_HODIR:
                        if (state == DONE)
                        {
                            if (GameObject* HodirRareCache = instance->GetGameObject(HodirRareCacheGUID))
                                if (GetData(DATA_HODIR_RARE_CACHE))
                                    HodirRareCache->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                            if (GameObject* HodirChest = instance->GetGameObject(HodirChestGUID))
                                HodirChest->SetRespawnTime(HodirChest->GetRespawnDelay());
                            HandleGameObject(HodirDoorGUID, true);
                            HandleGameObject(HodirIceDoorGUID, true);
                        }
                        break;
                    case BOSS_THORIM:
                        if (state == DONE)
                            if (GameObject* gameObject = instance->GetGameObject(ThorimChestGUID))
                                gameObject->SetRespawnTime(gameObject->GetRespawnDelay());
                        break;
                    case BOSS_ALGALON:
                        if (state == IN_PROGRESS)
                            HandleGameObject(uiAlgalonDoor, false);
                        else
                            HandleGameObject(uiAlgalonDoor, true);
                        break;
                }

                return true;
            }

            void SetData(uint32 type, uint32 data)
            {
                switch (type)
                {
                    case DATA_COLOSSUS:
                        ColossusData = data;
                        if (data == 2)
                        {
                            if (Creature* Leviathan = instance->GetCreature(LeviathanGUID))
                                Leviathan->AI()->DoAction(ACTION_MOVE_TO_CENTER_POSITION);
                            if (GameObject* gameObject = instance->GetGameObject(LeviathanGateGUID))
                                gameObject->SetGoState(GO_STATE_ACTIVE_ALTERNATIVE);
                            SaveToDB();
                        }
                        break;
                    case DATA_HODIR_RARE_CACHE:
                        HodirRareCacheData = data;
                        if (!HodirRareCacheData)
                        {
                            if (Creature* Hodir = instance->GetCreature(HodirGUID))
                                if (GameObject* gameObject = instance->GetGameObject(HodirRareCacheGUID))
                                    Hodir->RemoveGameObject(gameObject, false);
                        }
                        break;
                    case DATA_UNBROKEN:
                        Unbroken = bool(data);
                        break;
                    case DATA_RUNIC_DOOR:
                        if (GameObject* pRunicDoor = instance->GetGameObject(uiRunicDoorGUID))
                            pRunicDoor->SetGoState(GOState(data));
                        break;
                    case DATA_STONE_DOOR:
                        if (GameObject* pStoneDoor = instance->GetGameObject(uiStoneDoorGUID))
                            pStoneDoor->SetGoState(GOState(data));
                        break;
                    case DATA_MIMIRON_ELEVATOR:
                        if (GameObject* MimironElevator = instance->GetGameObject(uiMimironElevatorGUID))
                            MimironElevator->SetGoState(GOState(data));
                        break;
                    case DATA_CALL_TRAM:
                        if (GameObject* MimironTram = instance->GetGameObject(uiMimironTramGUID))
                        {
                            // Load Mimiron Tram (unfortunally only server side)
                            instance->LoadGrid(2307, 284.632f);

                            if (data == 0)
                                MimironTram->SetGoState(GO_STATE_READY);
                            if (data == 1)
                                MimironTram->SetGoState(GO_STATE_ACTIVE);

                            // Send movement update to players
                            if (Map* pMap = MimironTram->GetMap())
                            {
                                if (pMap->IsDungeon())
                                {
                                    Map::PlayerList const &PlayerList = pMap->GetPlayers();

                                    if (!PlayerList.isEmpty())
                                    {
                                        for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                                        {
                                            if (i->getSource())
                                            {
                                                UpdateData data;
                                                WorldPacket pkt;
                                                MimironTram->BuildValuesUpdateBlockForPlayer(&data, i->getSource());
                                                data.BuildPacket(&pkt);
                                                i->getSource()->GetSession()->SendPacket(&pkt);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    case DATA_ALGALON:
                        if (data == SPECIAL)
                            HandleGameObject(uiAlgalonDoor,true);
                        break;
                    case DATA_UNIVERSE_GLOBE:
                        if(data == GO_STATE_READY)
                            HandleGameObject(UniverseGlobeGUID, false);
                        if(data == GO_STATE_ACTIVE)
                            HandleGameObject(UniverseGlobeGUID, true);
                        break;
                    case DATA_UNIVERSE_FLOOR_1:
                        if(data == GO_STATE_READY)
                            HandleGameObject(UniverseFloor1GUID, false);
                        if(data == GO_STATE_ACTIVE)
                            HandleGameObject(UniverseFloor1GUID, true);
                        break;
                    case DATA_UNIVERSE_FLOOR_2:
                        if(data == GO_STATE_READY)
                            HandleGameObject(UniverseFloor2GUID, false);
                        if(data == GO_STATE_ACTIVE)
                            HandleGameObject(UniverseFloor2GUID, true);
                        break;
                    default:
                        break;
                }
            }

            void SetData64(uint32 /*type*/, uint64 /*data*/)
            {
            }

            uint64 GetData64(uint32 data)
            {
                switch (data)
                {
                    case BOSS_LEVIATHAN:
                        return LeviathanGUID;
                    case BOSS_IGNIS:
                        return IgnisGUID;
                    case BOSS_RAZORSCALE:
                        return RazorscaleGUID;
                    case DATA_RAZORSCALE_CONTROL:
                        return RazorscaleController;
                    case BOSS_XT002:
                        return XT002GUID;
                    case DATA_TOY_PILE_0:
                    case DATA_TOY_PILE_1:
                    case DATA_TOY_PILE_2:
                    case DATA_TOY_PILE_3:
                        return XTToyPileGUIDs[data - DATA_TOY_PILE_0];
                    case BOSS_KOLOGARN:
                        return KologarnGUID;
                    case BOSS_AURIAYA:
                        return AuriayaGUID;
                    case BOSS_MIMIRON:
                        return MimironGUID;
                    case BOSS_HODIR:
                        return HodirGUID;
                    case BOSS_THORIM:
                        return ThorimGUID;
                    case BOSS_FREYA:
                        return FreyaGUID;
                    case BOSS_VEZAX:
                        return VezaxGUID;
                    case BOSS_YOGGSARON:
                        return YoggSaronGUID;
                    case BOSS_ALGALON:
                        return AlgalonGUID;

                    // Razorscale expedition commander
                    case DATA_EXPEDITION_COMMANDER:
                        return ExpeditionCommanderGUID;
                    case GO_RAZOR_HARPOON_1:
                        return RazorHarpoonGUIDs[0];
                    case GO_RAZOR_HARPOON_2:
                        return RazorHarpoonGUIDs[1];
                    case GO_RAZOR_HARPOON_3:
                        return RazorHarpoonGUIDs[2];
                    case GO_RAZOR_HARPOON_4:
                        return RazorHarpoonGUIDs[3];

                    // Assembly of Iron
                    case BOSS_STEELBREAKER:
                        return AssemblyGUIDs[0];
                    case BOSS_MOLGEIM:
                        return AssemblyGUIDs[1];
                    case BOSS_BRUNDIR:
                        return AssemblyGUIDs[2];

                    // Freya's Keepers
                    case BOSS_BRIGHTLEAF:
                        return KeeperGUIDs[0];
                    case BOSS_IRONBRANCH:
                        return KeeperGUIDs[1];
                    case BOSS_STONEBARK:
                        return KeeperGUIDs[2];

                    // Thorim
                    case DATA_RUNIC_COLOSSUS:
                        return uiRunicColossusGUID;
                    case DATA_RUNE_GIANT:
                        return uiRuneGiantGUID;

                    // Mimiron
                    case DATA_LEVIATHAN_MK_II:
                        return uiLeviathanMKIIGUID;
                    case DATA_VX_001:
                        return uiVX001GUID;
                    case DATA_AERIAL_UNIT:
                        return uiAerialUnitGUID;
                    case DATA_MAGNETIC_CORE:
                        return uiMagneticCoreGUID;

                    // Yoggsaron
                    case DATA_YS_FREYA:
                        return uiFreyaYSGUID;
                    case DATA_YS_THORIM:
                        return uiThorimYSGUID;
                    case DATA_YS_MIMIRON:
                        return uiMimironYSGUID;
                    case DATA_YS_HODIR:
                        return uiHodirYSGUID;
                    case DATA_YOGGSARON_BRAIN:
                        return uiYoggSaronBrainGUID;
                }

                return 0;
            }

            uint32 GetData(uint32 type)
            {
                switch (type)
                {
                    case DATA_COLOSSUS:
                        return ColossusData;
                    case DATA_HODIR_RARE_CACHE:
                        return HodirRareCacheData;
                    case DATA_UNBROKEN:
                        return uint32(Unbroken);
                    default:
                        break;
                }

                return 0;
            }

            std::string GetSaveData()
            {
                OUT_SAVE_INST_DATA;

                std::ostringstream saveStream;
                saveStream << "U U " << GetBossSaveData() << GetData(DATA_COLOSSUS);

                OUT_SAVE_INST_DATA_COMPLETE;
                return saveStream.str();
            }

            void Load(char const* strIn)
            {
                if (!strIn)
                {
                    OUT_LOAD_INST_DATA_FAIL;
                    return;
                }

                OUT_LOAD_INST_DATA(strIn);

                char dataHead1, dataHead2;

                std::istringstream loadStream(strIn);
                loadStream >> dataHead1 >> dataHead2;

                if (dataHead1 == 'U' && dataHead2 == 'U')
                {
                    for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                    {
                        uint32 tmpState;
                        loadStream >> tmpState;
                        if (tmpState == IN_PROGRESS || tmpState > SPECIAL)
                            tmpState = NOT_STARTED;

                        if (i == DATA_COLOSSUS)
                            SetData(i, tmpState);
                        else
                            SetBossState(i, EncounterState(tmpState));
                    }
                }

                OUT_LOAD_INST_DATA_COMPLETE;
            }
        };

        InstanceScript* GetInstanceScript(InstanceMap* map) const
        {
            return new instance_ulduar_InstanceMapScript(map);
        }
};

class go_call_tram : public GameObjectScript
{
public:
    go_call_tram() : GameObjectScript("go_call_tram") { }

    bool OnGossipHello(Player* /*player*/, GameObject* pGo)
    {
        InstanceScript* pInstance = pGo->GetInstanceScript();

        if (!pInstance)
            return false;

        switch(pGo->GetEntry())
        {
            case 194914:
            case 194438:
                pInstance->SetData(DATA_CALL_TRAM, 0);
                break;
            case 194912:
            case 194437:
                pInstance->SetData(DATA_CALL_TRAM, 1);
                break;
        }
        return true;
    }
};

void AddSC_instance_ulduar()
{
    new instance_ulduar();
    new go_call_tram();
}
