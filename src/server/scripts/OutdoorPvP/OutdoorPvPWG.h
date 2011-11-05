/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
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

#ifndef OUTDOOR_PVP_WG_
#define OUTDOOR_PVP_WG_

#include "OutdoorPvP.h"


#define ZONE_DALARAN             4395
#define ZONE_WINTERGRASP         4197
#define POS_X_CENTER             5100
#define MAX_VEHICLE_PER_WORKSHOP    4

const Team TeamId2Team[3] = {ALLIANCE, HORDE, TEAM_OTHER};
const uint32 WintergraspFaction[3] = {1802, 1801, 35};
const uint32 WG_MARK_OF_HONOR = 43589;
const uint32 VehNumWorldState[2] = {3680,3490};
const uint32 MaxVehNumWorldState[2] = {3681,3491};
const uint32 ClockWorldState[2] = {3781,4354};
const uint8 CapturePointArtKit[3] = {2, 1, 21};
char const *fmtstring(char const *format, ...);

enum OutdoorPvPWGSpell
{
    // Wartime auras
    SPELL_RECRUIT                                = 37795,
    SPELL_CORPORAL                               = 33280,
    SPELL_LIEUTENANT                             = 55629,
    SPELL_TENACITY                               = 58549,
    SPELL_TENACITY_VEHICLE                       = 59911,
    SPELL_TOWER_CONTROL                          = 62064,
    SPELL_SPIRITUAL_IMMUNITY                     = 58729,

    // Reward spells
    SPELL_VICTORY_REWARD                         = 56902,
    SPELL_DEFEAT_REWARD                          = 58494,
    SPELL_DAMAGED_TOWER                          = 59135,
    SPELL_DESTROYED_TOWER                        = 59136,
    SPELL_DAMAGED_BUILDING                       = 59201,
    SPELL_INTACT_BUILDING                        = 59203,

    SPELL_TELEPORT_BRIDGE                        = 59096,
    SPELL_TELEPORT_FORTRESS                      = 60035,

    SPELL_TELEPORT_DALARAN                       = 53360,
    SPELL_TELEPORT_ALLIENCE_CAMP                 = 58632,
    SPELL_TELEPORT_HORDE_CAMP                    = 58633,
    SPELL_VICTORY_AURA                           = 60044,
};



const uint16 GameEventWintergraspDefender[2] = {50, 51};

enum OutdoorPvP_WG_Sounds
{
    OutdoorPvP_WG_SOUND_KEEP_CLAIMED            = 8192,
    OutdoorPvP_WG_SOUND_KEEP_CAPTURED_ALLIANCE  = 8173,
    OutdoorPvP_WG_SOUND_KEEP_CAPTURED_HORDE     = 8213,
    OutdoorPvP_WG_SOUND_KEEP_ASSAULTED_ALLIANCE = 8212,
    OutdoorPvP_WG_SOUND_KEEP_ASSAULTED_HORDE    = 8174,
    OutdoorPvP_WG_SOUND_NEAR_VICTORY            = 8456,
    OutdoorPvP_WG_SOUND_HORDE_WINS              = 8454,
    OutdoorPvP_WG_SOUND_ALLIANCE_WINS           = 8455,
    OutdoorPvP_WG_SOUND_START_BATTLE            = 11803,
    OutdoorPvP_WG_SOUND_WORKSHOP_Horde          = 6205,
    OutdoorPvP_WG_SOUND_WORKSHOP_ALLIANCE       = 6298,
    OutdoorPvP_WG_HORDE_CAPTAIN                 = 8333,
    OutdoorPvP_WG_ALLIANCE_CAPTAIN              = 8232
};

enum DataId
{
    DATA_ENGINEER_DIE,
};

enum OutdoorPvP_WG_KeepStatus
{
    OutdoorPvP_WG_KEEP_TYPE_NEUTRAL             = 0,
    OutdoorPvP_WG_KEEP_TYPE_CONTESTED           = 1,
    OutdoorPvP_WG_KEEP_STATUS_ALLY_CONTESTED    = 1,
    OutdoorPvP_WG_KEEP_STATUS_HORDE_CONTESTED   = 2,
    OutdoorPvP_WG_KEEP_TYPE_OCCUPIED            = 3,
    OutdoorPvP_WG_KEEP_STATUS_ALLY_OCCUPIED     = 3,
    OutdoorPvP_WG_KEEP_STATUS_HORDE_OCCUPIED    = 4
};


enum OutdoorPVPWGStatus
{
    WORLDSTATE_WINTERGRASP_WARTIME               = 31001,
    WORLDSTATE_WINTERGRASP_TIMER                 = 31002,
    WORLDSTATE_WINTERGRASP_DEFENDERS             = 31003,
    WORLDSTATE_WINTERGRASP_CONTROLING_FACTION    = 31004,
    WORLDSTATE_VALUE_COUNT,
};

enum OutdoorPvPWGCreType
{
    CREATURE_OTHER,
    CREATURE_SIEGE_VEHICLE,
    CREATURE_TURRET_ATTACKER,
    CREATURE_TURRET_DEFENDER,
    CREATURE_ENGINEER,
    CREATURE_GUARD,
    CREATURE_SPECIAL,
    CREATURE_SPIRIT_GUIDE,
    CREATURE_SPIRIT_HEALER,
    CREATURE_QUESTGIVER,
};

enum OutdoorPvPWGBuildingType
{
    BUILDING_WALL,
    BUILDING_WORKSHOP,
    BUILDING_TOWER,
};

enum OutdoorPvPWGDamageState
{ // Do not change order
    DAMAGE_INTACT,
    DAMAGE_DAMAGED,
    DAMAGE_DESTROYED,
};

typedef uint32 TeamPair[2];

enum OutdoorPvPWGQuest
{
    A_VICTORY_IN_WG                              = 13181,
    H_VICTORY_IN_WG                              = 13183,
    CRE_PVP_KILL                                 = 31086, //Quest Objective - Fixme: this should be handled by DB
    CRE_PVP_KILL_V                               = 31093, //Quest Objective - Fixme: this should be handled by DB
    TOWER_PVP_DESTROYED                          = 35074, //Quest Objective - Toppling the Towers & Southern Sabotage
};

enum OutdoorPvPWGCreEntry
{
    CRE_ENG_A                                    = 30499,
    CRE_ENG_H                                    = 30400,
    CRE_SPI_A                                    = 31842,
    CRE_SPI_H                                    = 31841,
};

const TeamPair OutdoorPvPWGCreEntryPair[] =
{
    {32307, 32308}, // Guards
    {30739, 30740}, // Champions
    {32296, 32294}, // Quartermaster
    {32615, 32626}, // Warbringer & Brigadier General
    {0,0} // Do not delete Used in LoadTeamPair
};

const TeamPair OutdoorPvPWGGODisplayPair[] =
{
    {5651, 5652},
    {8256, 8257},
    {0,0} // Do not delete Used in LoadTeamPair
};

enum WG_NPC_ENTRIES
{
    WG_CREATURE_GUARD_A                 = 32308,
    WG_CREATURE_GUARD_H                 = 32307,
    WG_CREATURE_CHAMPION_A              = 30740,
    WG_CREATURE_CHAMPION_H              = 30739,
    WG_CREATURE_QUARTERMASTER_1_A       = 32294,
    WG_CREATURE_QUARTERMASTER_1_H       = 32296,
    WG_CREATURE_QUARTERMASTER_2_A       = 39172,
    WG_CREATURE_QUARTERMASTER_2_H       = 39173,
    WG_CREATURE_SPIRIT_GUIDE_A          = 31842,
    WG_CREATURE_SPIRIT_GUIDE_H          = 31841,
    WG_CREATURE_SPIRIT_HEALER_A         = 6491,
    WG_CREATURE_SPIRIT_HEALER_H         = 6491,
    WG_CREATURE_ENGINEER_A              = 30499,
    WG_CREATURE_ENGINEER_H              = 30400,
    WG_CREATURE_ENHANCEMENT_A           = 31051,
    WG_CREATURE_ENHANCEMENT_H           = 31101,
    WG_CREATURE_QUESTGIVER_1_A          = 31052,
    WG_CREATURE_QUESTGIVER_1_H          = 31102,
    WG_CREATURE_QUESTGIVER_2_A          = 31109,
    WG_CREATURE_QUESTGIVER_2_H          = 31107,
    WG_CREATURE_QUESTGIVER_3_A          = 31153,
    WG_CREATURE_QUESTGIVER_3_H          = 31151,
    WG_CREATURE_QUESTGIVER_4_A          = 31108,
    WG_CREATURE_QUESTGIVER_4_H          = 31106,
    WG_CREATURE_QUESTGIVER_5_A          = 31054,
    WG_CREATURE_QUESTGIVER_5_H          = 31053,
    WG_CREATURE_QUESTGIVER_6_A          = 31036,
    WG_CREATURE_QUESTGIVER_6_H          = 31091,
    WG_CREATURE_QUESTGIVER_PVP_1_A      = 15351,
    WG_CREATURE_QUESTGIVER_PVP_1_H      = 15350,
    WG_CREATURE_QUESTGIVER_PVP_2_A      = 32626,
    WG_CREATURE_QUESTGIVER_PVP_2_H      = 32615,
    WG_CREATURE_SIEGE_VEHICLE_A         = 28312,
    WG_CREATURE_SIEGE_VEHICLE_H         = 32627,
    WG_CREATURE_SIEGE_TURRET_A          = 28319,
    WG_CREATURE_SIEGE_TURRET_H          = 32629,
    WG_CREATURE_CATAPULT_A              = 27881,
    WG_CREATURE_CATAPULT_H              = 27881,
    WG_CREATURE_DEMOLISHER_A            = 28094,
    WG_CREATURE_DEMOLISHER_H            = 28094,
    WG_CREATURE_TOWER_CANNON_A          = 28366,
    WG_CREATURE_TOWER_CANNON_H          = 28366,
    WG_CREATURE_FLIGHTMASTER_A          = 30869,
    WG_CREATURE_FLIGHTMASTER_H          = 30870,
    WG_CREATURE_WEAPON_CONTROL_A        = 27852,
    WG_CREATURE_WEAPON_CONTROL_H        = 27852,

    // Elementals
    WG_CREATURE_LIVING_LASHER           = 30845,
    WG_CREATURE_MATURE_LASHER           = 34300,
    WG_CREATURE_WANDERING_SHADOW        = 30842,
    WG_CREATURE_SHADOW_REVENANT         = 30872,
    WG_CREATURE_GLACIAL_SPIRIT          = 30846,
    WG_CREATURE_WATER_REVENANT          = 30877,
    WG_CREATURE_CHILLED_EARTH_ELEMENTAL = 30849,
    WG_CREATURE_EARTHBOUND_REVENANT     = 30876,
    WG_CREATURE_WHISPERING_WIND         = 30848,
    WG_CREATURE_TEMPEST_REVENANT        = 30875,
    WG_CREATURE_RAGING_FLAME            = 30847,
    WG_CREATURE_FLAME_REVENANT          = 30873
};

const uint32 AreaPOIIconId[3][3] = {{7,8,9},{4,5,6},{1,2,3}};
typedef std::list<const AreaPOIEntry *> AreaPOIList;

struct BuildingState
{
    explicit BuildingState(uint32 _worldState, TeamId _team, bool asDefault)
        : worldState(_worldState), health(0)
        , defaultTeam(asDefault ? _team : OTHER_TEAM(_team)), team(_team), damageState(DAMAGE_INTACT)
        , building(NULL), type(BUILDING_WALL), graveTeam(NULL)
    {}
    uint32 worldState;
    uint32 health;
    TeamId defaultTeam;
    OutdoorPvPWGDamageState damageState;
    GameObject *building;
    uint32 *graveTeam;
    OutdoorPvPWGBuildingType type;

    void SendUpdate(Player *player) const
    {
        player->SendUpdateWorldState(worldState, AreaPOIIconId[team][damageState]);
    }

    void FillData(WorldPacket &data) const
    {
        data << worldState << AreaPOIIconId[team][damageState];
    }

    TeamId GetTeam() const { return team; }
    void SetTeam(TeamId t)
    {
        team = t;
        if(graveTeam)
            if (uint32 newTeam = TeamId2Team[t])
                *graveTeam = newTeam;
    }

private:
    TeamId team;
};

typedef std::map<uint32, uint32> TeamPairMap;

class OPvPCapturePointWG;

class OutdoorPvPWG : public OutdoorPvP
{
    protected:
        typedef std::map<uint32, BuildingState *> BuildingStateMap;
        typedef std::set<Creature*> CreatureSet;
        typedef std::set<GameObject*> GameObjectSet;
        typedef std::map<std::pair<uint32, bool>, Position> QuestGiverPositionMap;
        typedef std::map<uint32, Creature*> QuestGiverMap;
        typedef std::set<uint64> PlayerSetGuid;
        typedef std::set<Group*> GroupSet;
    public:
        OutdoorPvPWG();
        bool SetupOutdoorPvP();
        int TeamIDsound;
        uint32 GetCreatureEntry(uint32 guidlow, const CreatureData *data);
        uint32 m_timer;

        void OnCreatureCreate(Creature *creature);
        void OnCreatureRemove(Creature *creature);
        void OnGameObjectCreate(GameObject *go);
        void OnGameObjectRemove(GameObject *go);

        void ProcessEvent(WorldObject *objin, uint32 eventId);

        void HandlePlayerEnterZone(Player *plr, uint32 zone);
        void HandlePlayerLeaveZone(Player *plr, uint32 zone);
        void HandlePlayerResurrects(Player * plr, uint32 zone);
        void HandleKill(Player *killer, Unit *victim);

        bool Update(uint32 diff);  

        void BroadcastStateChange(BuildingState *state) const;

        uint32 GetData(uint32 id);
        void SetData(uint32 id, uint32 value) {};

        void ModifyWorkshopCount(TeamId team, bool add);
        uint32 GetTimer() const { return m_timer / 1000; };
        bool isWarTime() const { return m_wartime; };
        void setTimer(uint32 timer) { if (timer >= 0) m_timer = timer; };
        uint32 GetNumPlayersA() const { return m_players[TEAM_ALLIANCE].size(); };
        uint32 GetNumPlayersH() const { return m_players[TEAM_HORDE].size(); };
        TeamId getDefenderTeam() const { return m_defender; };
        TeamId getAttackerTeam() const { return OTHER_TEAM(m_defender); };
        void forceChangeTeam();
        void forceStopBattle();
        void forceStartBattle();

        // Temporal BG specific till 3.2
        void SendAreaSpiritHealerQueryOpcode(Player *pl, const uint64& guid);
        void AddPlayerToResurrectQueue(uint64 npc_guid, uint64 player_guid);
        void RemovePlayerFromResurrectQueue(uint64 player_guid);
        void RelocateAllianceDeadPlayers(Creature *cr);
        void RelocateHordeDeadPlayers(Creature *cr);
        void KickAfk();
        // BG end

        // Queue System
        void InviteInQueue(Player* plr);
        void InviteToGame(Player* plr);
        void PlayerAcceptInvite(Player* plr);
        void PlayerAcceptInviteGame(Player* plr);
        void SendLeaveMessage(Player* plr);
        void PlayerLeaveQueue(Player* plr);
        void SendMessageToPlayer(Player* plr);
        void PlayerInviteToGameTemp(Player* plr);
        void KickPlayerInWaitToGame();
        uint64 InviteToGameTemp[240][2];
        // Players in Wait List
        PlayerSetGuid PlayerInWait[2];
        // Players in War List
        PlayerSetGuid PlayerInWar[2];
        // Queue System End
        void SendInitWorldStatesTo(Player *player = NULL) const;		
    protected:
        // Temporal BG specific till 3.2
        std::vector<uint64> m_ResurrectQueue;               // Player GUID
        uint32 m_LastResurrectTime;
        // Spirit Guide guid + Player list GUIDS
        std::map<uint64, std::vector<uint64> >  m_ReviveQueue;

        uint32 GetLastResurrectTime() const { return m_LastResurrectTime; }
        uint32 GetReviveQueueSize() const { return m_ReviveQueue.size(); }
        // BG end

        TeamId m_defender;
        int32 m_tenacityStack;

        BuildingStateMap m_buildingStates;
        BuildingState *m_gate;

        CreatureSet m_creatures;
        CreatureSet m_vehicles[2];
        GameObjectSet m_gobjects;
        QuestGiverMap m_questgivers;

        TeamPairMap m_creEntryPair, m_goDisplayPair;
        QuestGiverPositionMap m_qgPosMap;

        bool m_wartime;
        bool m_changeDefender;
        bool m_changeAlly;
        bool m_changeHorde;
        uint32 m_clock[2];
        uint32 m_workshopCount[2];
        uint32 m_towerDestroyedCount[2];
        uint32 m_towerDamagedCount[2];
        uint32 m_WSSaveTimer;

        OPvPCapturePointWG *GetWorkshop(uint32 lowguid) const;
        OPvPCapturePointWG *GetWorkshopByEngGuid(uint32 lowguid) const;
        OPvPCapturePointWG *GetWorkshopByGOGuid(uint32 lowguid) const;

        void StartBattle();
        void EndBattle();

        void UpdateClock();
        void UpdateClockDigit(uint32 &timer, uint32 digit, uint32 mod);
        void PromotePlayer(Player *player) const;
        void UpdateTenacityStack();
        void UpdateCreatureObject();
        void UpdateAllWorldObject();
        bool UpdateCreatureInfo(Creature *creature);
        bool UpdateGameObjectInfo(GameObject *go) const;

        bool CanBuildVehicle(OPvPCapturePointWG *workshop) const;
        OutdoorPvPWGCreType GetCreatureType(uint32 entry) const;

        void RebuildAllBuildings();

        void RemoveOfflinePlayerWGAuras();
        void RewardMarkOfHonor(Player *player, uint32 count);
        void MoveQuestGiver(uint32 guid);
        void LoadQuestGiverMap(uint32 guid, Position posHorde, Position posAlli);
        bool UpdateQuestGiverPosition(uint32 guid, Creature *creature);
    private:
        Group* GetFreeBgRaid(uint32 TeamID);
        bool AddOrSetPlayerToCorrectBgGroup(Player *plr);
        GroupSet m_Groups[2];
        uint32 m_uiKickAfkTimer;
        uint32 m_uiKickInviteToGame;
        bool m_bFirstplayer;
        bool m_InviteQueue;
        WorldPacket BuildPacket(std::string msg);
};

class OPvPCapturePointWG : public OPvPCapturePoint
{
    public:
        explicit OPvPCapturePointWG(OutdoorPvPWG *opvp, BuildingState *state);
        void SetTeamByBuildingState();
        void ChangeState() {}
        void ChangeTeam(TeamId oldteam);

        uint32 *m_spiEntry;
        uint32 m_spiGuid;
        Creature *m_spiritguide;
        Creature *m_spiritguide_horde;
        Creature *m_spiritguide_alliance;
        uint32 *m_engEntry;
        uint32 m_engGuid;
        Creature *m_engineer;
        uint32 m_workshopGuid;
        BuildingState *m_buildingState;
    protected:
        OutdoorPvPWG *m_wintergrasp;
};

#endif
