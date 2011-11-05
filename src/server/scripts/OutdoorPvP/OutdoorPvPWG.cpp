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

#include "OutdoorPvPWG.h"
#include "OutdoorPvPMgr.h"
#include "SpellAuras.h"
#include "Vehicle.h"
#include "ObjectMgr.h"
#include "World.h"
#include "Chat.h"
#include "MapManager.h"
#include "Group.h"

#define  MAX_FMT_STRING    32000

Creature* FortressSpirit;

/* Vehicle teleport system*/
Map* pMap;

void _LoadTeamPair(TeamPairMap &pairMap, const TeamPair *pair)
{
    while((*pair)[0])
    {
        pairMap[(*pair)[0]] = (*pair)[1];
        pairMap[(*pair)[1]] = (*pair)[0];
        ++pair;
    }
}

void _RespawnCreatureIfNeeded(Creature *cr, uint32 entry)
{
    if (cr)
    {
        // SetOriginalEntry as used before may lead to crash
        cr->UpdateEntry(entry);
        //if (cr->GetAreaId() == 4575)
        //    cr->AI()->EnterEvadeMode();
		if (entry != cr->GetEntry() || !cr->isAlive())
            cr->Respawn(true);
        cr->SetVisible(true);
    }
}

char const *fmtstring(char const *format, ...)
{
    va_list argptr;
    static char temp_buffer[MAX_FMT_STRING];
    static char string[MAX_FMT_STRING];
    static int index = 0;
    char *buf;
    int len;

    va_start(argptr, format);
    vsnprintf(temp_buffer,MAX_FMT_STRING, format, argptr);
    va_end(argptr);

    len = strlen(temp_buffer);

    if (len >= MAX_FMT_STRING)
        return "ERROR";

    if (len + index >= MAX_FMT_STRING-1)
    {
        index = 0;
    }

    buf = &string[index];
    memcpy(buf, temp_buffer, len+1);

    index += len + 1;

    return buf;
}

OutdoorPvPWG::OutdoorPvPWG()
{
    m_TypeId = OUTDOOR_PVP_WG;

    // Temporal copy of BG system till 3.2
    m_LastResurrectTime = 0;

    //Timer for kick afk players
    m_uiKickAfkTimer = 0;

    //Timer for kick Player before Join Game
    m_uiKickInviteToGame = 0;

    // Initialize InviteToGameTemp
    for (uint32 x = 0; x < 240; ++x)
    {
        for (uint32 y = 0; y < 2; ++y)
        {
            InviteToGameTemp[x][y] = uint64(0);
        }
    }
}

bool OutdoorPvPWG::SetupOutdoorPvP()
{
    if (!sWorld->getBoolConfig(CONFIG_OUTDOORPVP_WINTERGRASP_ENABLED))
    {
        sWorld->setWorldState(WORLDSTATE_WINTERGRASP_CONTROLING_FACTION, TEAM_NEUTRAL);
        return false;
    }

    // Load worlstates
    m_wartime = sWorld->getWorldState(WORLDSTATE_WINTERGRASP_WARTIME) ? true : false;
    m_timer = uint32(sWorld->getWorldState(WORLDSTATE_WINTERGRASP_TIMER));
    m_defender = TeamId(sWorld->getWorldState(WORLDSTATE_WINTERGRASP_DEFENDERS)%2);
    m_WSSaveTimer = sWorld->getIntConfig(CONFIG_OUTDOORPVP_WINTERGRASP_SAVESTATE_PERIOD);

    if (m_timer == 0)
         m_timer = sWorld->getIntConfig(CONFIG_OUTDOORPVP_WINTERGRASP_START_TIME) * MINUTE * IN_MILLISECONDS;

    sWorld->setWorldState(WORLDSTATE_WINTERGRASP_CONTROLING_FACTION, getDefenderTeam());
    m_changeDefender = false;
    m_workshopCount[TEAM_ALLIANCE] = 0;
    m_workshopCount[TEAM_HORDE] = 0;
    m_tenacityStack = 0;
    m_gate = NULL;
    m_uiKickAfkTimer = 20000;
    m_uiKickInviteToGame = 1000;

    std::list<uint32> engGuids;
    std::list<uint32> spiritGuids;

    // Store Eng, spirit guide guids and questgiver for later use
    QueryResult result = WorldDatabase.PQuery("SELECT `guid`, `id` FROM `creature` WHERE `creature`.`map` = 571"
         " AND `creature`.`id` IN (%u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u);",
         CRE_ENG_A, CRE_ENG_H, CRE_SPI_A, CRE_SPI_H, 31101, 31051, 31102, 31052,
         //31107, 31109, 31151, 31153, 31106, 31108, 31053, 31054, 31091, 31036, WG_CREATURE_CHAMPION_A, WG_CREATURE_CHAMPION_H);
		 31107, 31109, 31151, 31153, 31106, 31108, 31053, 31054, 31091, 31036);
    if (!result)
        sLog->outError("Cannot find siege workshop master or spirit guides in creature!");
    else
    {
        do
        {
            Position posHorde, posAlli;
            Field *fields = result->Fetch();
            switch(fields[1].GetUInt32())
            {
                case CRE_ENG_A:
                case CRE_ENG_H:
                    engGuids.push_back(fields[0].GetUInt32());
                    break;
                case CRE_SPI_A:
                case CRE_SPI_H:
                    spiritGuids.push_back(fields[0].GetUInt32());
                    break;
                case 31051:
                    posHorde.Relocate(5081.7f, 2173.73f, 365.878f, 0.855211f);
                    posAlli.Relocate(5296.56f, 2789.87f, 409.275f, 0.733038f);
                    LoadQuestGiverMap(fields[0].GetUInt32(), posHorde, posAlli);
                    break;
                case 31101:
                    posHorde.Relocate(5296.56f, 2789.87f, 409.275f, 0.733038f);
                    posAlli.Relocate(5016.57f, 3677.53f, 362.982f, 5.7525f);
                    LoadQuestGiverMap(fields[0].GetUInt32(), posHorde, posAlli);
                    break;
                case 31052:
                    posHorde.Relocate(5100.07f, 2168.89f, 365.779f, 1.97222f);
                    posAlli.Relocate(5298.43f, 2738.76f, 409.316f, 3.97174f);
                    LoadQuestGiverMap(fields[0].GetUInt32(), posHorde, posAlli);
                    break;
                case 31102:
                    posHorde.Relocate(5298.43f, 2738.76f, 409.316f, 3.97174f);
                    posAlli.Relocate(5030.44f, 3659.82f, 363.194f, 1.83336f);
                    LoadQuestGiverMap(fields[0].GetUInt32(), posHorde, posAlli);
                    break;
                case 31109:
                    posHorde.Relocate(5080.4f, 2199.0f, 359.489f, 2.96706f);
                    posAlli.Relocate(5234.97f, 2883.4f, 409.275f, 4.29351f);
                    LoadQuestGiverMap(fields[0].GetUInt32(), posHorde, posAlli);
                    break;
                case 31107:
                    posHorde.Relocate(5234.97f, 2883.4f, 409.275f, 4.29351f);
                    posAlli.Relocate(5008.64f, 3659.91f, 361.07f, 4.0796f);
                    LoadQuestGiverMap(fields[0].GetUInt32(), posHorde, posAlli);
                    break;
                case 31153:
                    posHorde.Relocate(5088.49f, 2188.18f, 365.647f, 5.25344f);
                    posAlli.Relocate(5366.13f, 2833.4f, 409.323f, 3.14159f);
                    LoadQuestGiverMap(fields[0].GetUInt32(), posHorde, posAlli);
                    break;
                case 31151:
                    posHorde.Relocate(5366.13f, 2833.4f, 409.323f, 3.14159f);
                    posAlli.Relocate(5032.33f, 3680.7f, 363.018f, 3.43167f);
                    LoadQuestGiverMap(fields[0].GetUInt32(), posHorde, posAlli);
                    break;
                case 31108:
                    posHorde.Relocate(5095.67f, 2193.28f, 365.924f, 4.93928f);
                    posAlli.Relocate(5295.56f, 2926.67f, 409.275f, 0.872665f);
                    LoadQuestGiverMap(fields[0].GetUInt32(), posHorde, posAlli);
                    break;
                case 31106:
                    posHorde.Relocate(5295.56f, 2926.67f, 409.275f, 0.872665f);
                    posAlli.Relocate(5032.66f, 3674.28f, 363.053f, 2.9447f);
                    LoadQuestGiverMap(fields[0].GetUInt32(), posHorde, posAlli);
                    break;
                case 31054:
                    posHorde.Relocate(5088.61f, 2167.66f, 365.689f, 0.680678f);
                    posAlli.Relocate(5371.4f, 3026.51f, 409.206f, 3.25003f);
                    LoadQuestGiverMap(fields[0].GetUInt32(), posHorde, posAlli);
                    break;
                case 31053:
                    posHorde.Relocate(5371.4f, 3026.51f, 409.206f, 3.25003f);
                    posAlli.Relocate(5032.44f, 3668.66f, 363.11f, 2.87402f);
                    LoadQuestGiverMap(fields[0].GetUInt32(), posHorde, posAlli);
                    break;
                case 31036:
                    posHorde.Relocate(5078.28f, 2183.7f, 365.029f, 1.46608f);
                    posAlli.Relocate(5359.13f, 2837.99f, 409.364f, 4.69893f);
                    LoadQuestGiverMap(fields[0].GetUInt32(), posHorde, posAlli);
                    break;
                case 31091:
                    posHorde.Relocate(5359.13f, 2837.99f, 409.364f, 4.69893f);
                    posAlli.Relocate(5022.43f, 3659.91f, 361.61f, 1.35426f);
                    LoadQuestGiverMap(fields[0].GetUInt32(), posHorde, posAlli);
                    break;
                default:
                    break;
            }
        }while(result->NextRow());
    }

    // Select POI
    AreaPOIList areaPOIs;
    float minX = 9999, minY = 9999, maxX = -9999, maxY = -9999;
    for (uint32 i = 0; i < sAreaPOIStore.GetNumRows(); ++i)
    {
        const AreaPOIEntry * poiInfo = sAreaPOIStore.LookupEntry(i);
        if (poiInfo && poiInfo->zoneId == ZONE_WINTERGRASP)
        {
            areaPOIs.push_back(poiInfo);
            if (minX > poiInfo->x) minX = poiInfo->x;
            if (minY > poiInfo->y) minY = poiInfo->y;
            if (maxX < poiInfo->x) maxX = poiInfo->x;
            if (maxY < poiInfo->y) maxY = poiInfo->y;
        }
    }
    minX -= 20; minY -= 20; maxX += 20; maxY += 20;

    // Coords: 4290.330078, 1790.359985 - 5558.379883, 4048.889893
    result = WorldDatabase.PQuery("SELECT `guid` FROM `gameobject`,`gameobject_template`"
        " WHERE `gameobject`.`map` = 571"
        " AND `gameobject`.`position_x` > %f AND `gameobject`.`position_y` > %f"
        " AND `gameobject`.`position_x` < %f AND `gameobject`.`position_y` < %f"
        " AND `gameobject_template`.`type` = 33"
        " AND `gameobject`.`id` = `gameobject_template`.`entry`",
        minX, minY, maxX, maxY);
    if (!result)
        return false;

    do
    {
        Field *fields = result->Fetch();

        uint32 guid = fields[0].GetUInt32();
        GameObjectData const * goData = sObjectMgr->GetGOData(guid);
        if (!goData) // this should not happen
            continue;

        float x = goData->posX, y = goData->posY;
        float minDist = 100;
        AreaPOIList::iterator poi = areaPOIs.end();
        for (AreaPOIList::iterator itr = areaPOIs.begin(); itr != areaPOIs.end(); ++itr)
        {
            if (!(*itr)->icon[1]) // note: may for other use
                continue;

            float dist = (abs((*itr)->x - x) + abs((*itr)->y - y));
            if (minDist > dist)
            {
                minDist = dist;
                poi = itr;
            }
        }

        if (poi == areaPOIs.end())
            continue;

        // add building to the list
        TeamId teamId = x > POS_X_CENTER ? getDefenderTeam() : getAttackerTeam();
        m_buildingStates[guid] = new BuildingState((*poi)->worldState, teamId, getDefenderTeam() != TEAM_ALLIANCE);
        if ((*poi)->id == 2246)
            m_gate = m_buildingStates[guid];
        areaPOIs.erase(poi);

        // add capture point
        uint32 capturePointEntry = 0;

        switch(goData->id)
        {
            case 192028: // NW
            case 192030: // W
            case 192032: // SW
                capturePointEntry = 190475;
                break;
            case 192029: // NE
            case 192031: // E
            case 192033: // SE
                capturePointEntry = 190487;
                break;
        }

        if (capturePointEntry)
        {
            uint32 engGuid = 0;
            uint32 spiritGuid = 0;
            // Find closest Eng to Workshop
            float minDist = 100;
            for (std::list<uint32>::iterator itr = engGuids.begin(); itr != engGuids.end(); ++itr)
            {
                const CreatureData *creData = sObjectMgr->GetCreatureData(*itr);
                if (!creData)
                    continue;

                float dist = (abs(creData->posX - x) + abs(creData->posY - y));
                if (minDist > dist)
                {
                    minDist = dist;
                    engGuid = *itr;
                }
            }

            if (!engGuid)
            {
                sLog->outError("Cannot find nearby siege workshop master!");
                continue;
            }
            else
                engGuids.remove(engGuid);
            // Find closest Spirit Guide to Workshop
            minDist = 255;
            for (std::list<uint32>::iterator itr = spiritGuids.begin(); itr != spiritGuids.end(); ++itr)
            {
                const CreatureData *creData = sObjectMgr->GetCreatureData(*itr);
                if (!creData)
                    continue;

                float dist = (abs(creData->posX - x) + abs(creData->posY - y));
                if (minDist > dist)
                {
                    minDist = dist;
                    spiritGuid = *itr;
                }
            }

            // Inside fortress won't be capturable
            OPvPCapturePointWG *workshop = new OPvPCapturePointWG(this, m_buildingStates[guid]);
            if (goData->posX < POS_X_CENTER && !workshop->SetCapturePointData(capturePointEntry, goData->mapid, goData->posX + 40 * cos(goData->orientation + M_PI / 2), goData->posY + 40 * sin(goData->orientation + M_PI / 2), goData->posZ))
            {
                delete workshop;
                sLog->outError("Cannot add capture point!");
                continue;
            }

            const CreatureData *creData = sObjectMgr->GetCreatureData(engGuid);
            if (!creData)
                continue;

            workshop->m_engEntry = const_cast<uint32*>(&creData->id);
            const_cast<CreatureData*>(creData)->displayid = 0;
            workshop->m_engGuid = engGuid;

            // Back spirit is linked to one of the inside workshops, 1 workshop wont have spirit
            if (spiritGuid)
            {
                spiritGuids.remove(spiritGuid);

                const CreatureData *spiritData = sObjectMgr->GetCreatureData(spiritGuid);
                if (!spiritData)
                    continue;

                workshop->m_spiEntry = const_cast<uint32*>(&spiritData->id);
                const_cast<CreatureData*>(spiritData)->displayid = 0;
                workshop->m_spiGuid = spiritGuid;
            }
            else
                workshop->m_spiGuid = 0;
            workshop->m_workshopGuid = guid;
            AddCapturePoint(workshop);
            m_buildingStates[guid]->type = BUILDING_WORKSHOP;
            workshop->SetTeamByBuildingState();
        }
    }while(result->NextRow());

    engGuids.clear();
    spiritGuids.clear();

    if (!m_gate)
    {
        sLog->outError("Cannot find wintergrasp fortress gate!");
        return false;
    }

    // Load Graveyard
    GraveYardMap::const_iterator graveLow  = sObjectMgr->mGraveYardMap.lower_bound(ZONE_WINTERGRASP);
    GraveYardMap::const_iterator graveUp   = sObjectMgr->mGraveYardMap.upper_bound(ZONE_WINTERGRASP);
    for (AreaPOIList::iterator itr = areaPOIs.begin(); itr != areaPOIs.end();)
    {
        if ((*itr)->icon[1] == 8)
        {
            // find or create grave yard
            const WorldSafeLocsEntry *loc = sObjectMgr->GetClosestGraveYard((*itr)->x, (*itr)->y, (*itr)->z, (*itr)->mapId, 0);
            if (!loc)
            {
                ++itr;
                continue;
            }

            GraveYardMap::const_iterator graveItr;
            for (graveItr = graveLow; graveItr != graveUp; ++graveItr)
                if (graveItr->second.safeLocId == loc->ID)
                    break;
            if (graveItr == graveUp)
            {
                GraveYardData graveData;
                graveData.safeLocId = loc->ID;
                graveData.team = 0;
                graveItr = sObjectMgr->mGraveYardMap.insert(std::make_pair(ZONE_WINTERGRASP, graveData));
            }

            for (BuildingStateMap::iterator stateItr = m_buildingStates.begin(); stateItr != m_buildingStates.end(); ++stateItr)
            {
                if (stateItr->second->worldState == (*itr)->worldState)
                {
                    stateItr->second->graveTeam = const_cast<uint32*>(&graveItr->second.team);
                    break;
                }
            }
            areaPOIs.erase(itr++);
        }
        else
            ++itr;
    }

    //Titan Relic
    sObjectMgr->AddGOData(192829, 571, 5440.0f, 2840.8f, 420.43f + 10.0f, 0);

    _LoadTeamPair(m_goDisplayPair, OutdoorPvPWGGODisplayPair);
    _LoadTeamPair(m_creEntryPair, OutdoorPvPWGCreEntryPair);

    m_towerDamagedCount[TEAM_ALLIANCE] = 0;
    m_towerDestroyedCount[TEAM_ALLIANCE] = 0;
    m_towerDamagedCount[TEAM_HORDE] = 0;
    m_towerDestroyedCount[TEAM_HORDE] = 0;

    RemoveOfflinePlayerWGAuras();

    RegisterZone(ZONE_WINTERGRASP);

    if (m_wartime)
    {
        uint32 m_WSTimer = m_timer;
        StartBattle();
        m_timer = m_WSTimer;
    }

    return true;
}

void OutdoorPvPWG::ProcessEvent(WorldObject *objin, uint32 eventId)
{
    GameObject* obj = objin->ToGameObject();
    if (!obj)
        return;

    if (obj->GetEntry() == 192829) // Titan Relic
    {
        if (obj->GetGOInfo()->goober.eventId == eventId && isWarTime() && m_gate && m_gate->damageState == DAMAGE_DESTROYED)
        {
            m_changeDefender = true;
            m_timer = 0;
        }
    }
    else if (obj->GetGoType() == GAMEOBJECT_TYPE_DESTRUCTIBLE_BUILDING)
    {
        BuildingStateMap::const_iterator itr = m_buildingStates.find(obj->GetDBTableGUIDLow());
        if (itr == m_buildingStates.end())
            return;

        std::string msgStr;
        switch(eventId)
        { // TODO - Localized msgs of GO names
            case 19672: case 19675: // Flamewatch Tower
                msgStr = "Flamewatch";
                break;
            case 18553: case 19677: // Shadowsight Tower
                msgStr = "Shadowsight";
                break;
            case 19673: case 19676: // Winter's Edge Tower
                msgStr = "Winter's Edge";
                break;
            case 19776: case 19778: // E Workshop damaged
                msgStr = "Sunken Ring";
                break;
            case 19777: case 19779: // W Workshop damaged
                msgStr = "Broken Temple";
                break;
            case 19782: case 19786: // NW Workshop damaged
                msgStr = "north-western";
                break;
            case 19783: case 19787: // NE Workshop damaged
                msgStr = "north-eastern";
                break;
            case 19784: case 19788: // SW Workshop damaged
                msgStr = "Westpark";
                break;
            case 19785: case 19789: // SE Workshop damaged
                msgStr = "Eastpark";
                break;
            case 19657: case 19661: // NW Wintergrasp Keep Tower damaged
                msgStr = "north-western";
                break;
            case 19658: case 19663: // NE Wintergrasp Keep Tower damaged
                msgStr = "north-eastern";
                break;
            case 19659: case 19662: // SW Wintergrasp Keep Tower damaged
                msgStr = "south-western";
                break;
            case 19660: case 19664: // SE Wintergrasp Keep Tower damaged
                msgStr = "south-eastern";
                break;
            default:
                msgStr = "";
        }

        BuildingState *state = itr->second;
        if (eventId == obj->GetGOInfo()->building.damagedEvent)
        {
            state->damageState = DAMAGE_DAMAGED;
            switch(state->type)
            {
                case BUILDING_WORKSHOP:
                    msgStr = fmtstring(sObjectMgr->GetTrinityStringForDBCLocale(LANG_BG_WG_WORKSHOP_DAMAGED), msgStr.c_str(), sObjectMgr->GetTrinityStringForDBCLocale(getDefenderTeam() == TEAM_ALLIANCE ? LANG_BG_AB_ALLY : LANG_BG_AB_HORDE));
                    sWorld->SendZoneText(ZONE_WINTERGRASP, msgStr.c_str());
                    break;
                case BUILDING_WALL:
                    sWorld->SendZoneText(ZONE_WINTERGRASP, sObjectMgr->GetTrinityStringForDBCLocale(LANG_BG_WG_FORTRESS_UNDER_ATTACK));
                    for (PlayerSet::iterator itr = m_players[getDefenderTeam()].begin(); itr != m_players[getDefenderTeam()].end(); ++itr)
                    {
                        if (getDefenderTeam()==TEAM_ALLIANCE)
                        {
                            TeamIDsound=OutdoorPvP_WG_SOUND_KEEP_ASSAULTED_HORDE; //Allience Worn Sound
                        }
                        else TeamIDsound=OutdoorPvP_WG_SOUND_KEEP_ASSAULTED_ALLIANCE;  //Horde Worn Sound
                            (*itr)->PlayDirectSound(TeamIDsound) ; // Wintergrasp Fortress under Siege
                    }
                    for (PlayerSet::iterator itr = m_players[getAttackerTeam()].begin(); itr != m_players[getAttackerTeam()].end(); ++itr)
                    {
                        if (getDefenderTeam()==TEAM_ALLIANCE)
                        {
                            TeamIDsound=OutdoorPvP_WG_SOUND_KEEP_ASSAULTED_HORDE; //Allience Worn Sound
                        }
                        else TeamIDsound=OutdoorPvP_WG_SOUND_KEEP_ASSAULTED_ALLIANCE;  //Horde Worn Sound
                            (*itr)->PlayDirectSound(TeamIDsound) ; // Wintergrasp Fortress under Siege
                    }
                    break;
                case BUILDING_TOWER:
                    ++m_towerDamagedCount[state->GetTeam()];
                    msgStr = fmtstring(sObjectMgr->GetTrinityStringForDBCLocale(LANG_BG_WG_TOWER_DAMAGED), msgStr.c_str());
                    sWorld->SendZoneText(ZONE_WINTERGRASP, msgStr.c_str());
                    for (PlayerSet::iterator itr = m_players[getDefenderTeam()].begin(); itr != m_players[getDefenderTeam()].end(); ++itr)
                    {
                        if (getDefenderTeam()==TEAM_ALLIANCE)
                        {
                            TeamIDsound=OutdoorPvP_WG_SOUND_KEEP_CAPTURED_HORDE; //Allience Worn Sound
                        }
                        else TeamIDsound=OutdoorPvP_WG_SOUND_KEEP_CAPTURED_ALLIANCE;  //Horde Worn Sound
                            (*itr)->PlayDirectSound(TeamIDsound) ; // Wintergrasp Fortress under Siege
                    }
                    for (PlayerSet::iterator itr = m_players[getAttackerTeam()].begin(); itr != m_players[getAttackerTeam()].end(); ++itr)
                    {
                        if (getDefenderTeam()==TEAM_ALLIANCE)
                        {
                            TeamIDsound=OutdoorPvP_WG_SOUND_KEEP_CAPTURED_HORDE; //Allience Worn Sound
                        }
                        else TeamIDsound=OutdoorPvP_WG_SOUND_KEEP_CAPTURED_ALLIANCE;  //Horde Worn Sound
                            (*itr)->PlayDirectSound(TeamIDsound) ; // Wintergrasp Fortress under Siege
                    }
                    break;
            }
        }
        else if (eventId == obj->GetGOInfo()->building.destroyedEvent)
        {
            state->damageState = DAMAGE_DESTROYED;

            switch(state->type)
            {
                case BUILDING_WORKSHOP:
                    ModifyWorkshopCount(state->GetTeam(), false);
                    msgStr = fmtstring(sObjectMgr->GetTrinityStringForDBCLocale(LANG_BG_WG_WORKSHOP_DESTROYED), msgStr.c_str(), sObjectMgr->GetTrinityStringForDBCLocale(getDefenderTeam() == TEAM_ALLIANCE ? LANG_BG_AB_ALLY : LANG_BG_AB_HORDE));
                    sWorld->SendZoneText(ZONE_WINTERGRASP, msgStr.c_str());
                    break;
                case BUILDING_WALL:
                    sWorld->SendZoneText(ZONE_WINTERGRASP, sObjectMgr->GetTrinityStringForDBCLocale(LANG_BG_WG_FORTRESS_UNDER_ATTACK));
                    for (PlayerSet::iterator itr = m_players[getDefenderTeam()].begin(); itr != m_players[getDefenderTeam()].end(); ++itr)
                    {
                        if (getDefenderTeam()==TEAM_ALLIANCE)
                        {
                            TeamIDsound=OutdoorPvP_WG_SOUND_KEEP_CAPTURED_HORDE; //Allience Worn Sound
                        }
                        else TeamIDsound=OutdoorPvP_WG_SOUND_KEEP_CAPTURED_ALLIANCE;  //Horde Worn Sound
                            (*itr)->PlayDirectSound(TeamIDsound) ; // Wintergrasp Fortress under Siege
                    }
                    for (PlayerSet::iterator itr = m_players[getAttackerTeam()].begin(); itr != m_players[getAttackerTeam()].end(); ++itr)
                    {
                        if (getDefenderTeam()==TEAM_ALLIANCE)
                        {
                            TeamIDsound=OutdoorPvP_WG_SOUND_KEEP_CAPTURED_HORDE; //Allience Worn Sound
                        }
                        else TeamIDsound=OutdoorPvP_WG_SOUND_KEEP_CAPTURED_ALLIANCE;  //Horde Worn Sound
                            (*itr)->PlayDirectSound(TeamIDsound) ; // Wintergrasp Fortress under Siege
                    }
                    break;
                case BUILDING_TOWER:
                    --m_towerDamagedCount[state->GetTeam()];
                    ++m_towerDestroyedCount[state->GetTeam()];
                    if (state->GetTeam() == getAttackerTeam())
                    {
                        TeamCastSpell(getAttackerTeam(), -SPELL_TOWER_CONTROL);
                        TeamCastSpell(getDefenderTeam(), -SPELL_TOWER_CONTROL);
                        uint32 attStack = 3 - m_towerDestroyedCount[getAttackerTeam()];
                        if (m_towerDestroyedCount[getAttackerTeam()])
                            for (PlayerSet::iterator itr = m_players[getDefenderTeam()].begin(); itr != m_players[getDefenderTeam()].end(); ++itr)
                                if ((*itr)->getLevel() >= 75)
                                    (*itr)->SetAuraStack(SPELL_TOWER_CONTROL, (*itr), m_towerDestroyedCount[getAttackerTeam()]);

                        if (attStack!=0)
                        {
                            for (PlayerSet::iterator itr = m_players[getAttackerTeam()].begin(); itr != m_players[getAttackerTeam()].end(); ++itr)
                                if ((*itr)->getLevel() >= 75)
                                    (*itr)->SetAuraStack(SPELL_TOWER_CONTROL, (*itr), attStack);
                        }
                        else
                        {
                            if (m_timer < 600000)
                                m_timer = 0;
                            else
                                m_timer = m_timer - 600000; // - 10 mins
                        }
                    }
                    msgStr = fmtstring(sObjectMgr->GetTrinityStringForDBCLocale(LANG_BG_WG_TOWER_DESTROYED), msgStr.c_str());
                    sWorld->SendZoneText(ZONE_WINTERGRASP, msgStr.c_str());
                    for (PlayerSet::iterator itr = m_players[getDefenderTeam()].begin(); itr != m_players[getDefenderTeam()].end(); ++itr)
                    {
                        if (getDefenderTeam()==TEAM_ALLIANCE)
                        {
                            TeamIDsound=OutdoorPvP_WG_HORDE_CAPTAIN; //Allience Worn Sound
                        }
                        else TeamIDsound=OutdoorPvP_WG_ALLIANCE_CAPTAIN;  //Horde Worn Sound
                            (*itr)->PlayDirectSound(TeamIDsound) ; // Wintergrasp Fortress under Siege
                    }

                    for (PlayerSet::iterator itr = m_players[getAttackerTeam()].begin(); itr != m_players[getAttackerTeam()].end(); ++itr)
                    {
                        if (getDefenderTeam()==TEAM_ALLIANCE)
                        {
                            TeamIDsound=OutdoorPvP_WG_HORDE_CAPTAIN; //Allience Worn Sound
                        }
                        else TeamIDsound=OutdoorPvP_WG_ALLIANCE_CAPTAIN;  //Horde Worn Sound
                           (*itr)->PlayDirectSound(TeamIDsound) ; // Wintergrasp Fortress destroyed Siege
                    }
                    break;
            }
            BroadcastStateChange(state);
        }
    }
}

void OutdoorPvPWG::RemoveOfflinePlayerWGAuras()
{
    // if server crashed while in battle there could be players with rank or tenacity
    CharacterDatabase.PExecute("DELETE FROM `character_aura` WHERE `spell` IN (%u, %u, %u, %u, %u)",
        SPELL_RECRUIT, SPELL_CORPORAL, SPELL_LIEUTENANT, SPELL_TENACITY, SPELL_TOWER_CONTROL);
}

void OutdoorPvPWG::ModifyWorkshopCount(TeamId team, bool add)
{
    if (team == TEAM_NEUTRAL)
        return;

    if (add)
        ++m_workshopCount[team];
    else if (m_workshopCount[team])
        --m_workshopCount[team];
    else
        sLog->outError("OutdoorPvPWG::ModifyWorkshopCount: negative workshop count!");

    SendUpdateWorldState(MaxVehNumWorldState[team], m_workshopCount[team] * MAX_VEHICLE_PER_WORKSHOP);
}

uint32 OutdoorPvPWG::GetCreatureEntry(uint32 guidlow, const CreatureData *data)
{
    if (getDefenderTeam() == TEAM_ALLIANCE)
    {
        TeamPairMap::const_iterator itr = m_creEntryPair.find(data->id);
        if (itr != m_creEntryPair.end())
        {
            const_cast<CreatureData*>(data)->displayid = 0;
            return itr->second;
        }
    }
    return data->id;
}

OutdoorPvPWGCreType OutdoorPvPWG::GetCreatureType(uint32 entry) const
{
    // VEHICLES, GUARDS and TURRETS gives kill credit
    // OTHER Not in wartime
    // TURRET Only during wartime
    // SPECIAL like "OTHER" but no despawn conditions
    // Entries like Case A: Case: B have their own despawn function
    switch(entry)
    {
        case 27881: // Catapult
        case 28094: // Demolisher
        case 28312: // Alliance Siege Engine
        case 32627: // Horde Siege Engine
        case 28319: // Siege turret
        case 32629: // Siege turret
            return CREATURE_SIEGE_VEHICLE;
        case 28366: // Wintergrasp Tower cannon Attacker
            return CREATURE_TURRET_ATTACKER;
        case 283666: // Wintergrasp Tower cannon Defender
            return CREATURE_TURRET_DEFENDER;
        case CRE_ENG_A: // Alliance Engineer
        case CRE_ENG_H: // Horde Engineer
            return CREATURE_ENGINEER;
        case 30739:case 30740: // Champions
        case 32307:case 32308: // Guards
            return CREATURE_GUARD;
        case CRE_SPI_A: // Dwarven Spirit Guide
        case CRE_SPI_H: // Taunka Spirit Guide
            return CREATURE_SPIRIT_GUIDE;
        case 6491: // Spirit Healers
            return CREATURE_SPIRIT_HEALER;
        case 31101:case 31051: // Hoodoo Master & Sorceress
        case 31102:case 31052: // Vieron Blazefeather & Bowyer
        case 31107:case 31109: // Lieutenant & Senior Demolitionist
        case 31151:case 31153: // Tactical Officer
        case 31106:case 31108: // Siegesmith & Siege Master
        case 31053:case 31054: // Primalist & Anchorite
        case 31091:case 31036: // Commander
            return CREATURE_QUESTGIVER;
        case 32615:case 32626: // Warbringer && Brigadier General
        case 32296:case 32294: // Quartermaster
        case 30870:case 30869: // Flight Masters
            return CREATURE_SPECIAL;
        default:
            return CREATURE_OTHER; // Revenants, Elementals, etc
    }
}

void OutdoorPvPWG::OnCreatureCreate(Creature *creature)
{
    bool add = true;
    uint32 entry = creature->GetEntry();
    switch(GetCreatureType(entry))
    {
        case CREATURE_SIEGE_VEHICLE:
        {
            if (!creature->isSummon())
                return;

            TeamId team;
            if (add)
            {
                if (creature->getFaction() == WintergraspFaction[TEAM_ALLIANCE])
                    team = TEAM_ALLIANCE;
                else if (creature->getFaction() == WintergraspFaction[TEAM_HORDE])
                    team = TEAM_HORDE;
                else
                    return;

                if (uint32 engLowguid = GUID_LOPART(((TempSummon*)creature)->GetSummonerGUID()))
                {
                    if (OPvPCapturePointWG *workshop = GetWorkshopByEngGuid(engLowguid))
                    {
                        if (CanBuildVehicle(workshop))
                            m_vehicles[team].insert(creature);
                        else
                        {
                            creature->setDeathState(DEAD);
                            creature->SetRespawnTime(DAY);
                            return;
                        }
                    }
                }

                if (m_tenacityStack > 0 && team == TEAM_ALLIANCE)
                    creature->SetAuraStack(SPELL_TENACITY_VEHICLE, creature, m_tenacityStack);
                else if (m_tenacityStack < 0 && team == TEAM_HORDE)
                    creature->SetAuraStack(SPELL_TENACITY_VEHICLE, creature, -m_tenacityStack);
            }
            else // the faction may be changed in uncharm
            {
                // TODO: now you have to wait until the corpse of vehicle disappear to build a new one
                if (m_vehicles[TEAM_ALLIANCE].erase(creature))
                    team = TEAM_ALLIANCE;
                else if (m_vehicles[TEAM_HORDE].erase(creature))
                    team = TEAM_HORDE;
                else
                    return;
            }
            SendUpdateWorldState(VehNumWorldState[team], m_vehicles[team].size());

            break;
        }
        case CREATURE_QUESTGIVER:
            if (add)
            {
                m_questgivers[creature->GetDBTableGUIDLow()] = creature;
                creature->SetReactState(REACT_PASSIVE);
            }
            else
                m_questgivers.erase(creature->GetDBTableGUIDLow());
            break;
        case CREATURE_ENGINEER:
            for (OutdoorPvP::OPvPCapturePointMap::iterator itr = m_capturePoints.begin(); itr != m_capturePoints.end(); ++itr)
            {
                if (OPvPCapturePointWG *workshop = dynamic_cast<OPvPCapturePointWG*>(itr->second))
                    if (workshop->m_engGuid == creature->GetDBTableGUIDLow())
                    {
                        workshop->m_engineer = add ? creature : NULL;
                        break;
                    }
            }
            break;
        case CREATURE_SPIRIT_GUIDE:
            for (OutdoorPvP::OPvPCapturePointMap::iterator itr = m_capturePoints.begin(); itr != m_capturePoints.end(); ++itr)
            {
                if (OPvPCapturePointWG *workshop = dynamic_cast<OPvPCapturePointWG*>(itr->second))
                    if (workshop->m_spiGuid == creature->GetDBTableGUIDLow())
                    {
                        workshop->m_spiritguide = add ? creature : NULL;
                        break;
                    }
            }
            creature->CastSpell(creature, SPELL_SPIRITUAL_IMMUNITY, true);
        case CREATURE_SPIRIT_HEALER:
        case CREATURE_TURRET_ATTACKER:
        case CREATURE_TURRET_DEFENDER:
        case CREATURE_OTHER:
            if (add)
                UpdateCreatureInfo(creature);
        default:
            if (add)
                m_creatures.insert(creature);
            else
                m_creatures.erase(creature);
            break;
    }
}

void OutdoorPvPWG::OnCreatureRemove(Creature *creature)
{
    bool add = false;
    uint32 entry = creature->GetEntry();
    switch(GetCreatureType(entry))
    {
        case CREATURE_SIEGE_VEHICLE:
        {
            if (!creature->isSummon())
                return;

            TeamId team;
            if (add)
            {
                if (creature->getFaction() == WintergraspFaction[TEAM_ALLIANCE])
                    team = TEAM_ALLIANCE;
                else if (creature->getFaction() == WintergraspFaction[TEAM_HORDE])
                    team = TEAM_HORDE;
                else
                    return;

                if (uint32 engLowguid = GUID_LOPART(((TempSummon*)creature)->GetSummonerGUID()))
                {
                    if (OPvPCapturePointWG *workshop = GetWorkshopByEngGuid(engLowguid))
                    {
                        if (CanBuildVehicle(workshop))
                            m_vehicles[team].insert(creature);
                        else
                        {
                            creature->setDeathState(DEAD);
                            creature->SetRespawnTime(DAY);
                            return;
                        }
                    }
                }

                if (m_tenacityStack > 0 && team == TEAM_ALLIANCE)
                    creature->SetAuraStack(SPELL_TENACITY_VEHICLE, creature, m_tenacityStack);
                else if (m_tenacityStack < 0 && team == TEAM_HORDE)
                    creature->SetAuraStack(SPELL_TENACITY_VEHICLE, creature, -m_tenacityStack);
            }
            else // the faction may be changed in uncharm
            {
                // TODO: now you have to wait until the corpse of vehicle disappear to build a new one
                if (m_vehicles[TEAM_ALLIANCE].erase(creature))
                    team = TEAM_ALLIANCE;
                else if (m_vehicles[TEAM_HORDE].erase(creature))
                    team = TEAM_HORDE;
                else
                    return;
            }
            SendUpdateWorldState(VehNumWorldState[team], m_vehicles[team].size());

            break;
        }
        case CREATURE_QUESTGIVER:
            if (add)
                m_questgivers[creature->GetDBTableGUIDLow()] = creature;
            else
                m_questgivers.erase(creature->GetDBTableGUIDLow());
            break;
        case CREATURE_ENGINEER:
            for (OutdoorPvP::OPvPCapturePointMap::iterator itr = m_capturePoints.begin(); itr != m_capturePoints.end(); ++itr)
            {
                if (OPvPCapturePointWG *workshop = dynamic_cast<OPvPCapturePointWG*>(itr->second))
                    if (workshop->m_engGuid == creature->GetDBTableGUIDLow())
                    {
                        workshop->m_engineer = add ? creature : NULL;
                        break;
                    }
            }
			m_creatures.erase(creature); // prevents crash, but i think it's wrong
            break;
        case CREATURE_SPIRIT_GUIDE:
            for (OutdoorPvP::OPvPCapturePointMap::iterator itr = m_capturePoints.begin(); itr != m_capturePoints.end(); ++itr)
            {
                if (OPvPCapturePointWG *workshop = dynamic_cast<OPvPCapturePointWG*>(itr->second))
                    if (workshop->m_spiGuid == creature->GetDBTableGUIDLow())
                    {
                        workshop->m_spiritguide = add ? creature : NULL;
                        break;
                    }
            }
			m_creatures.erase(creature); // prevents crash, but i think it's wrong
			break;
        case CREATURE_SPIRIT_HEALER:
        case CREATURE_TURRET_ATTACKER:
        case CREATURE_TURRET_DEFENDER:
        case CREATURE_OTHER:
            if (add)
                UpdateCreatureInfo(creature);
        default:
            if (add)
                m_creatures.insert(creature);
            else
                m_creatures.erase(creature);
            break;
    }
}

void OutdoorPvPWG::OnGameObjectCreate(GameObject *go)
{
    bool add = true;
    OutdoorPvP::OnGameObjectCreate(go);

    if (UpdateGameObjectInfo(go))
    {
        if (add) m_gobjects.insert(go);
        else m_gobjects.erase(go);
    }
    //do we need to store building?
    else if (go->GetGoType() == GAMEOBJECT_TYPE_DESTRUCTIBLE_BUILDING)
    {
        BuildingStateMap::const_iterator itr = m_buildingStates.find(go->GetDBTableGUIDLow());
        if (itr != m_buildingStates.end())
        {
            itr->second->building = add ? go : NULL;
            if (go->GetGOInfo()->displayId == 7878 || go->GetGOInfo()->displayId == 7900)
                itr->second->type = BUILDING_TOWER;
            if (!add || itr->second->damageState == DAMAGE_INTACT && !itr->second->health)
                itr->second->health = go->GetGOValue()->Building.Health;
            else
            {
                go->GetGOValue()->Building.Health = itr->second->health;
                if (itr->second->damageState == DAMAGE_DAMAGED)
                    go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_DAMAGED);
                else if (itr->second->damageState == DAMAGE_DESTROYED)
                    go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_DESTROYED);
            }
        }
    }
}

void OutdoorPvPWG::OnGameObjectRemove(GameObject *go)
{
    bool add = false;
    OutdoorPvP::OnGameObjectRemove(go);

    if (UpdateGameObjectInfo(go))
    {
        if (add) m_gobjects.insert(go);
        else m_gobjects.erase(go);
    }
    //do we need to store building?
    else if (go->GetGoType() == GAMEOBJECT_TYPE_DESTRUCTIBLE_BUILDING)
    {
        BuildingStateMap::const_iterator itr = m_buildingStates.find(go->GetDBTableGUIDLow());
        if (itr != m_buildingStates.end())
        {
            itr->second->building = add ? go : NULL;
            if (go->GetGOInfo()->displayId == 7878 || go->GetGOInfo()->displayId == 7900)
                itr->second->type = BUILDING_TOWER;
            if (!add || itr->second->damageState == DAMAGE_INTACT && !itr->second->health)
                itr->second->health = go->GetGOValue()->Building.Health;
            else
            {
                go->GetGOValue()->Building.Health = itr->second->health;
                if (itr->second->damageState == DAMAGE_DAMAGED)
                    go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_DAMAGED);
                else if (itr->second->damageState == DAMAGE_DESTROYED)
                    go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_DESTROYED);
            }
        }
    }
}

void OutdoorPvPWG::UpdateCreatureObject()
{
    //update creature factions 
    for (CreatureSet::iterator itr = m_creatures.begin(); itr != m_creatures.end(); ++itr)
        UpdateCreatureInfo(*itr);
    for (QuestGiverMap::iterator itr = m_questgivers.begin(); itr != m_questgivers.end(); ++itr)
        UpdateQuestGiverPosition((*itr).first, (*itr).second);
}

void OutdoorPvPWG::UpdateAllWorldObject()
{
    // update go factions
    for (GameObjectSet::iterator itr = m_gobjects.begin(); itr != m_gobjects.end(); ++itr)
        UpdateGameObjectInfo(*itr);

    // rebuild and update building states
    RebuildAllBuildings();

    // update capture points
    for (OPvPCapturePointMap::iterator itr = m_capturePoints.begin(); itr != m_capturePoints.end(); ++itr)
        if (OPvPCapturePointWG *workshop = dynamic_cast<OPvPCapturePointWG*>(itr->second))
            workshop->SetTeamByBuildingState();
}

void OutdoorPvPWG::RebuildAllBuildings()
{
    for (BuildingStateMap::const_iterator itr = m_buildingStates.begin(); itr != m_buildingStates.end(); ++itr)
    {
        if (itr->second->building && itr->second->building->GetGoType() == GAMEOBJECT_TYPE_DESTRUCTIBLE_BUILDING)
        {
            UpdateGameObjectInfo(itr->second->building);
            itr->second->building->SetDestructibleState(GO_DESTRUCTIBLE_REBUILDING, NULL, true);
            itr->second->health = itr->second->building->GetGOValue()->Building.Health;
            itr->second->damageState = DAMAGE_INTACT;
        }
        else
            itr->second->health = 0;

        itr->second->SetTeam(getDefenderTeam() == TEAM_ALLIANCE ? OTHER_TEAM(itr->second->defaultTeam) : itr->second->defaultTeam);
    }
    m_towerDamagedCount[TEAM_ALLIANCE] = 0;
    m_towerDestroyedCount[TEAM_ALLIANCE] = 0;
    m_towerDamagedCount[TEAM_HORDE] = 0;
    m_towerDestroyedCount[TEAM_HORDE] = 0;
}

void OutdoorPvPWG::SendInitWorldStatesTo(Player *player) const
{
    WorldPacket data(SMSG_INIT_WORLD_STATES, (4+4+4+2+(m_buildingStates.size()*8)));
    data << uint32(571);
    data << uint32(ZONE_WINTERGRASP);
    data << uint32(0);
    data << uint16(4+2+4+m_buildingStates.size());

    data << uint32(3803) << uint32(getDefenderTeam() == TEAM_ALLIANCE ? 1 : 0);
    data << uint32(3802) << uint32(getDefenderTeam() != TEAM_ALLIANCE ? 1 : 0);
    data << uint32(3801) << uint32(isWarTime() ? 0 : 1);
    data << uint32(3710) << uint32(isWarTime() ? 1 : 0);

    for (uint32 i = 0; i < 2; ++i)
        data << ClockWorldState[i] << m_clock[i];

    data << uint32(3490) << uint32(m_vehicles[TEAM_HORDE].size());
    data << uint32(3491) << m_workshopCount[TEAM_HORDE] * MAX_VEHICLE_PER_WORKSHOP;
    data << uint32(3680) << uint32(m_vehicles[TEAM_ALLIANCE].size());
    data << uint32(3681) << m_workshopCount[TEAM_ALLIANCE] * MAX_VEHICLE_PER_WORKSHOP;

    for (BuildingStateMap::const_iterator itr = m_buildingStates.begin(); itr != m_buildingStates.end(); ++itr)
        itr->second->FillData(data);

    if (player)
        player->GetSession()->SendPacket(&data);
    else
        BroadcastPacket(data);
}

void OutdoorPvPWG::BroadcastStateChange(BuildingState *state) const
{
    if (m_sendUpdate)
        for (uint32 team = 0; team < 2; ++team)
            for (PlayerSet::const_iterator p_itr = m_players[team].begin(); p_itr != m_players[team].end(); ++p_itr)
                state->SendUpdate(*p_itr);
}

// Called at Start and Battle End
bool OutdoorPvPWG::UpdateCreatureInfo(Creature *creature)
{  
    if (!creature)
        return false;

    uint32 entry = creature->GetEntry();
    switch(GetCreatureType(entry))
    {
        case CREATURE_TURRET_ATTACKER:
            if (isWarTime())
            {
                if (!creature->isAlive())
                    creature->Respawn(true);

                creature->setFaction(WintergraspFaction[getAttackerTeam()]);
                creature->SetVisible(true);
            }
            else
            {
                if (creature->IsVehicle() && creature->GetVehicleKit())
                    creature->GetVehicleKit()->RemoveAllPassengers();
                creature->SetVisible(false);
                creature->setFaction(35);
            }
            return false;
        case CREATURE_TURRET_DEFENDER:
            if (isWarTime())
            {
                if (!creature->isAlive())
                    creature->Respawn(true);

                creature->setFaction(WintergraspFaction[getDefenderTeam()]);
                creature->SetVisible(true);
            }
            else
            {
                if (creature->IsVehicle() && creature->GetVehicleKit())
                    creature->GetVehicleKit()->RemoveAllPassengers();
                creature->SetVisible(false);
                creature->setFaction(35);
            }
            return false;
        case CREATURE_OTHER:
            if(creature->isCharmedOwnedByPlayerOrPlayer())
                return false;

            if (isWarTime())
            {
                creature->SetVisible(false);
                creature->setFaction(35);
            }
            else
            {
                creature->RestoreFaction();
                creature->SetVisible(true);
            }
            return false;
        case CREATURE_SPIRIT_GUIDE:
            /*Vehicle teleport system*/
            pMap = creature->GetMap();
            if (isWarTime())
            {
                if (creature->GetAreaId() == 4575) // Select Fortress Spirit
                {
                    FortressSpirit = creature;
                    if (getDefenderTeam() == TEAM_ALLIANCE) // Fortress Spirit Alliance
                            FortressSpirit->UpdateEntry(CRE_SPI_A);
                    if (getDefenderTeam() == TEAM_HORDE) // Fortress Spirit Horde
                        FortressSpirit->UpdateEntry(CRE_SPI_H);
                }
                creature->SetVisible(true);
            }
            else
                creature->SetVisible(false);
            return false;
        case CREATURE_SPIRIT_HEALER:
            creature->SetVisible(isWarTime() ? false : true);
            return false;
        case CREATURE_ENGINEER:
            return false;
        case CREATURE_SIEGE_VEHICLE:
            if (!isWarTime())
            {
                if (creature->IsVehicle() && creature->GetVehicleKit())
                    creature->GetVehicleKit()->RemoveAllPassengers();
                creature->DisappearAndDie();
            }
            return false;
        case CREATURE_QUESTGIVER:
		    if (creature)
                creature->AI()->EnterEvadeMode();
            return false;
        case CREATURE_GUARD:
        case CREATURE_SPECIAL:
        {
            TeamPairMap::const_iterator itr = m_creEntryPair.find(creature->GetCreatureData()->id);
            if (itr != m_creEntryPair.end())
            {
                entry = getDefenderTeam() == TEAM_ALLIANCE ? itr->second : itr->first;
                _RespawnCreatureIfNeeded(creature, entry);
            }
            return false;
        }
        default:
            return false;
    }
}

bool OutdoorPvPWG::UpdateQuestGiverPosition(uint32 guid, Creature *creature)
{
    assert(guid);
    Position pos = m_qgPosMap[std::pair<uint32, bool>(guid, getDefenderTeam() == TEAM_HORDE)];

    if (creature && creature->IsInWorld())
    {
        // if not questgiver or position is the same, do nothing
        if (creature->GetPositionX() == pos.GetPositionX() &&
            creature->GetPositionY() == pos.GetPositionY() &&
            creature->GetPositionZ() == pos.GetPositionZ())
            return false;

        if (creature->isAlive() && creature->isInCombat())
        {
            creature->CombatStop(true);
            creature->getHostileRefManager().deleteReferences();
        }
        creature->SetHomePosition(pos);
        if (creature->GetEntry() != 30400 || creature->GetEntry() != 30499)
            creature->SetReactState(REACT_AGGRESSIVE);
        creature->DestroyForNearbyPlayers();
        if (!creature->GetMap()->IsLoaded(pos.GetPositionX(), pos.GetPositionY()))
            creature->GetMap()->LoadGrid(pos.GetPositionX(), pos.GetPositionY());
        creature->GetMap()->CreatureRelocation(creature, pos.GetPositionX(), pos.GetPositionY(), pos.GetPositionZ(), pos.GetOrientation());
        if (!creature->isAlive())
            creature->Respawn(true);
    }
    else
        sObjectMgr->MoveCreData(guid, 571, pos);

    return true;
}

// Return false = Need to rebuild at battle End/Start
//        true  = no need to rebuild (ie: Banners or teleporters)
bool OutdoorPvPWG::UpdateGameObjectInfo(GameObject *go) const
{
	if (!go)
	    return true;

    uint32 attFaction;
    uint32 defFaction;

    if (isWarTime())
    {
        attFaction = WintergraspFaction[getAttackerTeam()];
        defFaction = WintergraspFaction[getDefenderTeam()];
    }
    else
    {
        attFaction = 35;
        defFaction = 35;
    }
    
    if (!go || !go->GetGOInfo())
        return false;

    switch(go->GetGOInfo()->displayId)
    {
        case 8244: // Defender's Portal - Vehicle Teleporter
            go->SetUInt32Value(GAMEOBJECT_FACTION, WintergraspFaction[getDefenderTeam()]);
            return true;
        case 7967: // Titan relic
            go->SetUInt32Value(GAMEOBJECT_FACTION, WintergraspFaction[getAttackerTeam()]);
            return true;
        case 5651: // Small Alliance Banner
        case 8256: // Big Alliance Banner
            if (getDefenderTeam() == TEAM_ALLIANCE)
            {
                if (go->GetAreaId() == 4575 || go->GetAreaId() == 4539 || go->GetAreaId() == 4538)
                    go->SetPhaseMask(1, true);
                else go->SetPhaseMask(2, true);
            }
            else
            {
                if (go->GetAreaId() == 4575 || go->GetAreaId() == 4539 || go->GetAreaId() == 4538)
                    go->SetPhaseMask(2, true);
                else go->SetPhaseMask(1, true);
            }
            return true;
        case 5652: // Small Horde Banner
        case 8257: // Big Horde Banner
            if (getDefenderTeam() == TEAM_ALLIANCE)
            {
                if (go->GetAreaId() == 4575 || go->GetAreaId() == 4539 || go->GetAreaId() == 4538)
                    go->SetPhaseMask(2, true);
                else go->SetPhaseMask(1, true);
            }
            else
            {
                if (go->GetAreaId() == 4575 || go->GetAreaId() == 4539 || go->GetAreaId() == 4538)
                    go->SetPhaseMask(1, true);
                else go->SetPhaseMask(2, true);
            }
            return true;
        case 8165: // Wintergrasp Keep Door
        case 7877: // Wintergrasp Fortress Wall
        case 7878: // Wintergrasp Keep Tower
        case 7906: // Wintergrasp Fortress Gate
        case 7909: // Wintergrasp Wall
            go->SetUInt32Value(GAMEOBJECT_FACTION, defFaction);
            return false;
        case 7900: // Flamewatch Tower - Shadowsight Tower - Winter's Edge Tower
            go->SetUInt32Value(GAMEOBJECT_FACTION, attFaction);
            return false;
        case 8208: // Goblin Workshop
            OPvPCapturePointWG *workshop = GetWorkshopByGOGuid((uint32)go->GetGUID());
            if (workshop)
                go->SetUInt32Value(GAMEOBJECT_FACTION, WintergraspFaction[workshop->m_buildingState->GetTeam()]);
            return false;
    }

    // Note: this is only for test, still need db support
    TeamPairMap::const_iterator itr = m_goDisplayPair.find(go->GetGOInfo()->displayId);
    if (itr != m_goDisplayPair.end())
    {
        go->SetUInt32Value(GAMEOBJECT_DISPLAYID, getDefenderTeam() == TEAM_ALLIANCE ?
            itr->second : itr->first);
        return true;
    }
    return false;
}

void OutdoorPvPWG::HandlePlayerEnterZone(Player * plr, uint32 zone)
{
	// Dismount Player When Enter in WG
	if((plr && plr->HasAuraType(SPELL_AURA_FLY) || plr->HasAuraType(SPELL_AURA_MOD_INCREASE_MOUNTED_FLIGHT_SPEED)) && isWarTime())
		plr->CastSpell(plr, 58730, true);

    if (!sWorld->getBoolConfig(CONFIG_OUTDOORPVP_WINTERGRASP_ENABLED))
        return;

    // Send Queue Invite to Players 
    if( (sWorld->GetWintergrapsTimerToJoin() == 1) && !(PlayerInWait[plr->GetTeamId()].count(plr->GetGUID())) )
    {
        if (plr->getLevel() >= 75)
            InviteInQueue(plr);
        else
        {
            plr->CastSpell(plr, SPELL_TELEPORT_DALARAN, true);
            return;
        }
    }

    // Send Invite to Players When Battle is Already Started
    if ( (isWarTime()) && (sWorld->GetWintergrapsTimerToJoin() == 0) && !(PlayerInWar[plr->GetTeamId()].count(plr->GetGUID())) )
    {
        if (plr->getLevel() >= 75)
            InviteToGame(plr);
        else
        {		
            plr->CastSpell(plr, SPELL_TELEPORT_DALARAN, true);
            return;
        }
    }

    SendInitWorldStatesTo(plr);
    OutdoorPvP::HandlePlayerEnterZone(plr, zone);
    UpdateTenacityStack();
}

// Reapply Auras if needed
void OutdoorPvPWG::HandlePlayerResurrects(Player * plr, uint32 zone)
{
    if (!sWorld->getBoolConfig(CONFIG_OUTDOORPVP_WINTERGRASP_ENABLED))
        return;

    if (isWarTime())
    {
        if (plr->getLevel() >= 75)
        {
            // Tenacity
            if (plr->GetTeamId() == TEAM_ALLIANCE && m_tenacityStack > 0 ||
                plr->GetTeamId() == TEAM_HORDE && m_tenacityStack < 0)
            {
                if (plr->HasAura(SPELL_TENACITY))
                    plr->RemoveAurasDueToSpell(SPELL_TENACITY);

                int32 newStack = m_tenacityStack < 0 ? -m_tenacityStack : m_tenacityStack;
                if (newStack > 20)
                    newStack = 20;
                plr->SetAuraStack(SPELL_TENACITY, plr, newStack);
            }

            // Tower Control
            if (plr->GetTeamId() == getAttackerTeam())
            {
                if (m_towerDestroyedCount[getAttackerTeam()] < 3)
                    plr->SetAuraStack(SPELL_TOWER_CONTROL, plr, 3 - m_towerDestroyedCount[getAttackerTeam()]);
            }
            else
            {
                if (m_towerDestroyedCount[getAttackerTeam()])
                    plr->SetAuraStack(SPELL_TOWER_CONTROL, plr, m_towerDestroyedCount[getAttackerTeam()]);
            }
        }
    }
    OutdoorPvP::HandlePlayerResurrects(plr, zone);
}

void OutdoorPvPWG::HandlePlayerLeaveZone(Player * plr, uint32 zone)
{
	// Cleanup Dismount Player
	if(plr && plr->HasAura(58730))
		plr->RemoveAurasDueToSpell(58730);

    if (!sWorld->getBoolConfig(CONFIG_OUTDOORPVP_WINTERGRASP_ENABLED))
        return;

    if (plr && plr->GetVehicle()) // dismiss in change zone case
        plr->GetVehicle()->Dismiss();
    
    if(plr && plr->HasAura(SPELL_RECRUIT))
        plr->RemoveAurasDueToSpell(SPELL_RECRUIT);
    if(plr && plr->HasAura(SPELL_CORPORAL))
        plr->RemoveAurasDueToSpell(SPELL_CORPORAL);
    if(plr && plr->HasAura(SPELL_LIEUTENANT))
        plr->RemoveAurasDueToSpell(SPELL_LIEUTENANT);
    if(plr && plr->HasAura(SPELL_TOWER_CONTROL))
        plr->RemoveAurasDueToSpell(SPELL_TOWER_CONTROL);
    if(plr && plr->HasAura(SPELL_SPIRITUAL_IMMUNITY))
        plr->RemoveAurasDueToSpell(SPELL_SPIRITUAL_IMMUNITY);
    if(plr && plr->HasAura(SPELL_TENACITY))
        plr->RemoveAurasDueToSpell(SPELL_TENACITY);

    //Remove from war list	
    if(isWarTime())
    {
        if(PlayerInWar[plr->GetTeamId()].count((plr)->GetGUID()))
        {	
            if(Group* group = plr->GetGroup()) // remove from raid group if player is member
            {
		        if (!group->RemoveMember(plr->GetGUID(), GROUP_REMOVEMETHOD_LEAVE))             // group was disbanded
		        {
                    m_Groups[plr->GetTeamId()].erase(group);
                    group = NULL;
                }
            }

            PlayerInWar[plr->GetTeamId()].erase(plr->GetGUID());	
            SendLeaveMessage(plr);
        }
    }

    // Cleanup InviteToGameTemp
    for (uint32 x = 0; x < 240; ++x)
    {
        for (uint32 y = 0; y < 2; ++y)
        {
            if(InviteToGameTemp[x][y] == plr->GetGUID())
            {
                InviteToGameTemp[x][y] = uint64(0);
                InviteToGameTemp[x][y+1] = uint64(0);
            }
            else
                y = y+1;
        }
    }

    OutdoorPvP::HandlePlayerLeaveZone(plr, zone);
    UpdateTenacityStack();
}

void OutdoorPvPWG::PromotePlayer(Player *killer) const
{
    Aura * aur;
    if (aur = killer->GetAura(SPELL_RECRUIT))
    {
        if (aur->GetStackAmount() >= 5)
        {
            killer->RemoveAura(SPELL_RECRUIT);
            killer->CastSpell(killer, SPELL_CORPORAL, true);
            ChatHandler(killer).PSendSysMessage(LANG_BG_WG_RANK1);
        }
        else
            killer->CastSpell(killer, SPELL_RECRUIT, true);
    }
    else if (aur = killer->GetAura(SPELL_CORPORAL))
    {
        if (aur->GetStackAmount() >= 5)
        {
            killer->RemoveAura(SPELL_CORPORAL);
            killer->CastSpell(killer, SPELL_LIEUTENANT, true);
            ChatHandler(killer).PSendSysMessage(LANG_BG_WG_RANK2);
        }
        else
            killer->CastSpell(killer, SPELL_CORPORAL, true);
    }
}

void OutdoorPvPWG::HandleKill(Player *killer, Unit *victim)
{
    if (!sWorld->getBoolConfig(CONFIG_OUTDOORPVP_WINTERGRASP_ENABLED) || !isWarTime())
        return;

    bool ok = false;
    if (victim->GetTypeId() == TYPEID_PLAYER)
    {
        if (victim->getLevel() >= 70)
            ok = true;
        killer->RewardPlayerAndGroupAtEvent(CRE_PVP_KILL, victim);
    }
    else
    {
        switch(GetCreatureType(victim->GetEntry()))
        {
            case CREATURE_SIEGE_VEHICLE:
                killer->RewardPlayerAndGroupAtEvent(CRE_PVP_KILL_V, victim);
                ok = true;
                break;
            case CREATURE_GUARD:
                killer->RewardPlayerAndGroupAtEvent(CRE_PVP_KILL, victim);
                ok = true;
                break;
            case CREATURE_TURRET_ATTACKER:
                ok = true;
                break;
            case CREATURE_TURRET_DEFENDER:
                ok = true;
                break;
        }
    }

    if (ok)
    {
        if (Group *pGroup = killer->GetGroup())
        {
            for (GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
                if (itr->getSource()->IsAtGroupRewardDistance(killer) && itr->getSource()->getLevel() > 76)
                    PromotePlayer(itr->getSource());
        }
        else if (killer->getLevel() > 76)
            PromotePlayer(killer);
    }
}

// Recalculates Tenacity and applies it to Players / Vehicles
void OutdoorPvPWG::UpdateTenacityStack()
{
    if (!isWarTime())
        return;

    TeamId team = TEAM_NEUTRAL;
    uint32 allianceNum = 0;
    uint32 hordeNum = 0;
    int32 newStack = 0;
	double stack_coefficient = 3.75; // not sure about it, I got it from some empirical deductions: need test

    for (PlayerSet::iterator itr = m_players[TEAM_ALLIANCE].begin(); itr != m_players[TEAM_ALLIANCE].end(); ++itr)
        if ((*itr) && (*itr)->getLevel() >= 75)
            ++allianceNum;

    for (PlayerSet::iterator itr = m_players[TEAM_HORDE].begin(); itr != m_players[TEAM_HORDE].end(); ++itr)
        if ((*itr) && (*itr)->getLevel() >= 75)
            ++hordeNum;

    if (allianceNum && hordeNum)
    {
        if (allianceNum < hordeNum)
            newStack = int32((float(hordeNum) / float(allianceNum) - 1)*stack_coefficient); // positive, should cast on alliance
        else if (allianceNum > hordeNum)
            newStack = int32((1 - float(allianceNum) / float(hordeNum))*stack_coefficient); // negative, should cast on horde
    }

    if (newStack == m_tenacityStack)
        return;

    if (m_tenacityStack > 0 && newStack <= 0) // old buff was on alliance
        team = TEAM_ALLIANCE;
    else if (m_tenacityStack < 0 && newStack >= 0) // old buff was on horde
        team = TEAM_HORDE;

    m_tenacityStack = newStack;

    // Remove old buff
    if (team != TEAM_NEUTRAL)
    {
        for (PlayerSet::const_iterator itr = m_players[team].begin(); itr != m_players[team].end(); ++itr)
            if ((*itr) && (*itr)->getLevel() >= 75)
                (*itr)->RemoveAurasDueToSpell(SPELL_TENACITY);

        for (CreatureSet::const_iterator itr = m_vehicles[team].begin(); itr != m_vehicles[team].end(); ++itr)
        { 
            if((*itr))		
                (*itr)->RemoveAurasDueToSpell(SPELL_TENACITY_VEHICLE);
        }
    }

    // Apply new buff
    if (newStack)
    {
        team = newStack > 0 ? TEAM_ALLIANCE : TEAM_HORDE;
        if (newStack < 0)
            newStack = -newStack;
        if (newStack > 20)
            newStack = 20;

        for (PlayerSet::const_iterator itr = m_players[team].begin(); itr != m_players[team].end(); ++itr)
            if ((*itr) && (*itr)->getLevel() >= 75)
                (*itr)->SetAuraStack(SPELL_TENACITY, (*itr), newStack);

        for (CreatureSet::const_iterator itr = m_vehicles[team].begin(); itr != m_vehicles[team].end(); ++itr)
        {
            if((*itr))
                (*itr)->SetAuraStack(SPELL_TENACITY_VEHICLE, (*itr), newStack);
        }
    }
}

void OutdoorPvPWG::UpdateClockDigit(uint32 &timer, uint32 digit, uint32 mod)
{
    uint32 value = timer%mod;
    if (m_clock[digit] != value)
    {
        m_clock[digit] = value;
        SendUpdateWorldState(ClockWorldState[digit], uint32(timer + time(NULL)));
        sWorld->SetWintergrapsTimer(timer + (uint32)time(NULL), digit);
    }
}

void OutdoorPvPWG::UpdateClock()
{
    uint32 timer = m_timer / 1000;
    if (!isWarTime())
        UpdateClockDigit(timer, 1, 10);
    else
        UpdateClockDigit(timer, 0, 10);

    // Announce in Dalaran 30 minutes
    if (m_timer >= 1800000 && m_timer <= 1801000 && m_wartime == false)
       sWorld->SendWorldText(LANG_BG_WG_WORLD_ANNOUNCE_30);
    // Announce in Dalaran 10 minutes
    else if (m_timer >= 600000 && m_timer <= 601000 && m_wartime == false)
      sWorld->SendWorldText(LANG_BG_WG_WORLD_ANNOUNCE_10);

    // SetWintergrapsTimerToJoin 15 minutes 
    if ((m_timer<=900000) && (m_wartime==false)) 
        sWorld->SetWintergrapsTimerToJoin(1);
    else
        sWorld->SetWintergrapsTimerToJoin(0);

    // Invite Players in Queue 15 minutes 
    if ((m_timer>900000) && (m_timer<902000) && (m_wartime==false)) 
    {		
        for (PlayerSet::iterator itr = m_players[getDefenderTeam()].begin(); itr != m_players[getDefenderTeam()].end(); ++itr)
        {
            InviteInQueue((*itr));
        }

        for (PlayerSet::iterator itr = m_players[getAttackerTeam()].begin(); itr != m_players[getAttackerTeam()].end(); ++itr)
        {
            InviteInQueue((*itr));
        }
    }
}

bool OutdoorPvPWG::Update(uint32 diff)
{
    if (!sWorld->getBoolConfig(CONFIG_OUTDOORPVP_WINTERGRASP_ENABLED))
        return false;

	if(isWarTime())
	{	
        if (m_uiKickInviteToGame <= diff)
        {	
            KickPlayerInWaitToGame();
            m_uiKickInviteToGame = 1000;
        }else m_uiKickInviteToGame -= diff;

        if (m_uiKickAfkTimer <= diff)
        {	
            KickAfk();
            m_uiKickAfkTimer = 20000;
        }else m_uiKickAfkTimer -= diff;
    }

    if (m_timer > diff)
    {
        m_timer -= diff;

        if (isWarTime())
        {
            OutdoorPvP::Update(diff); // update capture points

            /*********************************************************/
            /***      BATTLEGROUND VEHICLE TELEPORTER SYSTEM       ***/
            /*********************************************************/
            if (pMap)
            {
                Map::PlayerList const &PlayerList = pMap->GetPlayers();
                for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                {
                    if (getDefenderTeam() == TEAM_ALLIANCE)
                    {
                        if (i->getSource()->ToPlayer()->GetTeam() == ALLIANCE)
                        {
                            if (i->getSource()->GetDistance2d(5314.51f, 2703.69f) <= 5 && i->getSource()->IsOnVehicle(i->getSource()->GetVehicleCreatureBase()) && i->getSource()->isAlive())
                            {
                                Creature* Old = i->getSource()->GetVehicleCreatureBase();
                                if (Old->GetEntry() == 28319) // Alliance Turret
                                {
                                    i->getSource()->ExitVehicle();
                                    i->getSource()->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                    Old->SetVisible(true);
                                    Old->ToTempSummon()->UnSummon();
                                }
                                else
                                {
                                    Unit* Driver = Old->GetVehicleKit()->GetPassenger(0);
                                    Unit* Passenger1 = Old->GetVehicleKit()->GetPassenger(1);
                                    Unit* Passenger2 = Old->GetVehicleKit()->GetPassenger(2);
                                    Unit* Passenger3 = Old->GetVehicleKit()->GetPassenger(3);
                                    if (Driver && Driver->isAlive())
                                    {
                                        Creature* New = i->getSource()->SummonCreature(Old->GetEntry(), 5141.191406f, 2841.045410f, 408.703217f, 3.163321f, TEMPSUMMON_MANUAL_DESPAWN);
                                        m_vehicles[TEAM_ALLIANCE].insert(New);
                                        New->SetPower(POWER_MANA, Old->GetPower(POWER_MANA));
                                        New->SetPower(POWER_RAGE, Old->GetPower(POWER_RAGE));
                                        New->SetPower(POWER_FOCUS, Old->GetPower(POWER_FOCUS));
                                        New->SetPower(POWER_ENERGY, Old->GetPower(POWER_ENERGY));
                                        New->SetHealth(Old->GetHealth());
                                        New->SetRespawnTime(Old->GetRespawnTime());
                                        Old->GetVehicleKit()->Uninstall();
                                        Old->SetVisible(true);
                                        Old->ForcedDespawn();
                                        Vehicle *vehicle = New->GetVehicleKit();
                                        Driver->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                        Driver->_EnterVehicle(vehicle, 0);
                                        if (Passenger1 && Passenger1->isAlive())
                                            Passenger1->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                        if (Passenger2 && Passenger2->isAlive())
                                            Passenger2->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                        if (Passenger3 && Passenger3->isAlive())
                                            Passenger3->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                    }
                                }
                            }
                            if (i->getSource()->GetDistance2d(5316.25f, 2977.04f) <= 5 && i->getSource()->IsOnVehicle(i->getSource()->GetVehicleCreatureBase()))
                            {
                                Creature* Old = i->getSource()->GetVehicleCreatureBase();
                                if (Old->GetEntry() == 28319) // Alliance Turret
                                {
                                    i->getSource()->ExitVehicle();
                                    i->getSource()->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                    Old->SetVisible(true);
                                    Old->ToTempSummon()->UnSummon();
                                }
                                else
                                {
                                    Unit* Driver = Old->GetVehicleKit()->GetPassenger(0);
                                    Unit* Passenger1 = Old->GetVehicleKit()->GetPassenger(1);
                                    Unit* Passenger2 = Old->GetVehicleKit()->GetPassenger(2);
                                    Unit* Passenger3 = Old->GetVehicleKit()->GetPassenger(3);
                                    if (Driver && Driver->isAlive())
                                    {
                                        Creature* New = i->getSource()->SummonCreature(Old->GetEntry(), 5141.191406f, 2841.045410f, 408.703217f, 3.163321f, TEMPSUMMON_MANUAL_DESPAWN);
                                        m_vehicles[TEAM_ALLIANCE].insert(New);
                                        New->SetPower(POWER_MANA, Old->GetPower(POWER_MANA));
                                        New->SetPower(POWER_RAGE, Old->GetPower(POWER_RAGE));
                                        New->SetPower(POWER_FOCUS, Old->GetPower(POWER_FOCUS));
                                        New->SetPower(POWER_ENERGY, Old->GetPower(POWER_ENERGY));
                                        New->SetHealth(Old->GetHealth());
                                        New->SetRespawnTime(Old->GetRespawnTime());
                                        Old->GetVehicleKit()->Uninstall();
                                        Old->SetVisible(true);
                                        Old->ForcedDespawn();
                                        Vehicle *vehicle = New->GetVehicleKit();
                                        Driver->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                        Driver->_EnterVehicle(vehicle, 0);
                                        if (Passenger1 && Passenger1->isAlive())
                                            Passenger1->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                        if (Passenger2 && Passenger2->isAlive())
                                            Passenger2->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                        if (Passenger3 && Passenger3->isAlive())
                                            Passenger3->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        if (i->getSource()->ToPlayer()->GetTeam() == HORDE)
                        {
                            if (i->getSource()->GetDistance2d(5314.51f, 2703.69f) <= 5 && i->getSource()->IsOnVehicle(i->getSource()->GetVehicleCreatureBase()) && i->getSource()->isAlive())
                            {
                                Creature* Old = i->getSource()->GetVehicleCreatureBase();
                                if (Old->GetEntry() == 32629) // Horde Turret
                                {
                                    i->getSource()->ExitVehicle();
                                    i->getSource()->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                    Old->SetVisible(true);
                                    Old->ToTempSummon()->UnSummon();
                                }
                                else
                                {
                                    Unit* Driver = Old->GetVehicleKit()->GetPassenger(0);
                                    Unit* Passenger1 = Old->GetVehicleKit()->GetPassenger(1);
                                    Unit* Passenger2 = Old->GetVehicleKit()->GetPassenger(2);
                                    Unit* Passenger3 = Old->GetVehicleKit()->GetPassenger(3);
                                    if (Driver && Driver->isAlive())
                                    {
                                        Creature* New = i->getSource()->SummonCreature(Old->GetEntry(), 5141.191406f, 2841.045410f, 408.703217f, 3.163321f, TEMPSUMMON_MANUAL_DESPAWN);
                                        m_vehicles[TEAM_HORDE].insert(New);
                                        New->SetPower(POWER_MANA, Old->GetPower(POWER_MANA));
                                        New->SetPower(POWER_RAGE, Old->GetPower(POWER_RAGE));
                                        New->SetPower(POWER_FOCUS, Old->GetPower(POWER_FOCUS));
                                        New->SetPower(POWER_ENERGY, Old->GetPower(POWER_ENERGY));
                                        New->SetHealth(Old->GetHealth());
                                        New->SetRespawnTime(Old->GetRespawnTime());
                                        Old->GetVehicleKit()->Uninstall();
                                        Old->SetVisible(true);
                                        Old->ForcedDespawn();
                                        Vehicle *vehicle = New->GetVehicleKit();
                                        Driver->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                        Driver->_EnterVehicle(vehicle, 0);
                                        if (Passenger1 && Passenger1->isAlive())
                                            Passenger1->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                        if (Passenger2 && Passenger2->isAlive())
                                            Passenger2->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                        if (Passenger3 && Passenger3->isAlive())
                                            Passenger3->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                    }
                                }
                            }
                            if (i->getSource()->GetDistance2d(5316.25f, 2977.04f) <= 5 && i->getSource()->IsOnVehicle(i->getSource()->GetVehicleCreatureBase()))
                            {
                                Creature* Old = i->getSource()->GetVehicleCreatureBase();
                                if (Old->GetEntry() == 32629) // Horde Turret
                                {
                                    i->getSource()->ExitVehicle();
                                    i->getSource()->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                    Old->SetVisible(true);
                                    Old->ToTempSummon()->UnSummon();
                                }
                                else
                                {
                                    Unit* Driver = Old->GetVehicleKit()->GetPassenger(0);
                                    Unit* Passenger1 = Old->GetVehicleKit()->GetPassenger(1);
                                    Unit* Passenger2 = Old->GetVehicleKit()->GetPassenger(2);
                                    Unit* Passenger3 = Old->GetVehicleKit()->GetPassenger(3);
                                    if (Driver && Driver->isAlive())
                                    {
                                        Creature* New = i->getSource()->SummonCreature(Old->GetEntry(), 5141.191406f, 2841.045410f, 408.703217f, 3.163321f, TEMPSUMMON_MANUAL_DESPAWN);
                                        m_vehicles[TEAM_HORDE].insert(New);
                                        New->SetPower(POWER_MANA, Old->GetPower(POWER_MANA));
                                        New->SetPower(POWER_RAGE, Old->GetPower(POWER_RAGE));
                                        New->SetPower(POWER_FOCUS, Old->GetPower(POWER_FOCUS));
                                        New->SetPower(POWER_ENERGY, Old->GetPower(POWER_ENERGY));
                                        New->SetHealth(Old->GetHealth());
                                        New->SetRespawnTime(Old->GetRespawnTime());
                                        Old->GetVehicleKit()->Uninstall();
                                        Old->SetVisible(true);
                                        Old->ForcedDespawn();
                                        Vehicle *vehicle = New->GetVehicleKit();
                                        Driver->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                        Driver->_EnterVehicle(vehicle, 0);
                                        if (Passenger1 && Passenger1->isAlive())
                                            Passenger1->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                        if (Passenger2 && Passenger2->isAlive())
                                            Passenger2->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                        if (Passenger3 && Passenger3->isAlive())
                                            Passenger3->NearTeleportTo(5141.191406f, 2841.045410f, 408.703217f, 3.163321f, true); // Out of the Fortress Gate
                                    }
                                }
                            }
                        }
                    }
                }
            }

            /*********************************************************/
            /***        BATTLEGROUND RESSURECTION SYSTEM           ***/
            /*********************************************************/

            //this should be handled by spell system
            m_LastResurrectTime += diff;
            if (m_LastResurrectTime >= RESURRECTION_INTERVAL)
            {
                if (GetReviveQueueSize())
                {
                    for (std::map<uint64, std::vector<uint64> >::iterator itr = m_ReviveQueue.begin(); itr != m_ReviveQueue.end(); ++itr)
                    {
                        Creature* sh = NULL;
                        for (std::vector<uint64>::const_iterator itr2 = (itr->second).begin(); itr2 != (itr->second).end(); ++itr2)
                        {
                            Player *plr = ObjectAccessor::FindPlayer(*itr2);
                            if (!plr)
                                continue;
                            if (!sh && plr->IsInWorld())
                            {
                                sh = plr->GetMap()->GetCreature(itr->first);
                                // only for visual effect
                                if (sh)
                                    // Spirit Heal, effect 117
                                    sh->CastSpell(sh, SPELL_SPIRIT_HEAL, true);
                            }

                            // Resurrection visual
                            if (sh && plr->GetDistance2d(sh) <= 18.0f)
                            {
                                plr->CastSpell(plr, SPELL_RESURRECTION_VISUAL, true);
                                m_ResurrectQueue.push_back(*itr2);
                            }
                        }
                        (itr->second).clear();
                    }

                    m_ReviveQueue.clear();
                    m_LastResurrectTime = 0;
                }
                else
                    // queue is clear and time passed, just update last resurrection time
                    m_LastResurrectTime = 0;
            }
            else if (m_LastResurrectTime > 500)    // Resurrect players only half a second later, to see spirit heal effect on NPC
            {
                for (std::vector<uint64>::const_iterator itr = m_ResurrectQueue.begin(); itr != m_ResurrectQueue.end(); ++itr)
                {
                    Player *plr = ObjectAccessor::FindPlayer(*itr);
                    if (!plr)
                        continue;
                    plr->ResurrectPlayer(1.0f);
                    plr->CastSpell(plr, 6962, true);
                    plr->CastSpell(plr, SPELL_SPIRIT_HEAL_MANA, true);
                    sObjectAccessor->ConvertCorpseForPlayer(*itr);
                }
                m_ResurrectQueue.clear();
            }
        }
        UpdateClock();
    }
    else
    {
        m_sendUpdate = false;
        int32 entry = LANG_BG_WG_DEFENDED;

        if (m_changeDefender)
        {
            m_changeDefender = false;
            m_defender = getAttackerTeam();
            entry = LANG_BG_WG_CAPTURED;
        }
        
        if (m_changeAlly == true || m_changeHorde == true) // If WG is switching (.wg switch)
        {
            RebuildAllBuildings();
            m_changeAlly = false;
            m_changeHorde = false;
        }

        if (isWarTime())
        {
            if (m_timer != 1) // 1 = forceStopBattle
                sWorld->SendZoneText(ZONE_WINTERGRASP, fmtstring(sObjectMgr->GetTrinityStringForDBCLocale(entry), sObjectMgr->GetTrinityStringForDBCLocale(getDefenderTeam() == TEAM_ALLIANCE ? LANG_BG_AB_ALLY : LANG_BG_AB_HORDE)));
            EndBattle();
        }
        else
        {
            if (m_timer != 1) // 1 = forceStartBattle
                sWorld->SendZoneText(ZONE_WINTERGRASP, sObjectMgr->GetTrinityStringForDBCLocale(LANG_BG_WG_BATTLE_STARTS));
            StartBattle();
        }

        UpdateCreatureObject();
        UpdateClock();

        SendInitWorldStatesTo();
        m_sendUpdate = true;
    }

    if (m_WSSaveTimer < diff)
    {
        sWorld->setWorldState(WORLDSTATE_WINTERGRASP_WARTIME, m_wartime);
        sWorld->setWorldState(WORLDSTATE_WINTERGRASP_TIMER, m_timer);
        sWorld->setWorldState(WORLDSTATE_WINTERGRASP_DEFENDERS, m_defender);
        m_WSSaveTimer = sWorld->getIntConfig(CONFIG_OUTDOORPVP_WINTERGRASP_SAVESTATE_PERIOD);
    }
    else
        m_WSSaveTimer -= diff;

    return false;
}

void OutdoorPvPWG::forceStartBattle()
{ // Uptime will do all the work
    m_wartime = false;

    if (m_timer != 1)
    {
        m_timer = 1;
        sWorld->SendZoneText(ZONE_WINTERGRASP, sObjectMgr->GetTrinityStringForDBCLocale(LANG_BG_WG_BATTLE_FORCE_START));
    }
}

void OutdoorPvPWG::forceStopBattle()
{ // Uptime will do all the work.

    if (!isWarTime())
        m_wartime = true;

    if (m_timer != 1)
    {
        m_timer = 1;
        sWorld->SendZoneText(ZONE_WINTERGRASP, sObjectMgr->GetTrinityStringForDBCLocale(LANG_BG_WG_BATTLE_FORCE_STOP));
    }
}

void OutdoorPvPWG::forceChangeTeam()
{
    m_changeDefender = true;
    m_timer = 1;
    m_changeAlly = true;
    m_changeHorde = true;

    sWorld->SendZoneText(ZONE_WINTERGRASP, fmtstring(sObjectMgr->GetTrinityStringForDBCLocale(LANG_BG_WG_SWITCH_FACTION), sObjectMgr->GetTrinityStringForDBCLocale(getAttackerTeam() == TEAM_ALLIANCE ? LANG_BG_AB_ALLY : LANG_BG_AB_HORDE)));
    if (isWarTime())
        forceStartBattle();
    else
        forceStopBattle();
}

// Can be forced by gm's while in battle so have to reset in case it was wartime
void OutdoorPvPWG::StartBattle()
{
    // Cleanup InviteToGameTemp
    for (uint32 x = 0; x < 240; ++x)
    {
        for (uint32 y = 0; y < 2; ++y)
        {
            InviteToGameTemp[x][y] = uint64(0);
        }
    }

    for(int team=0;team<2;team++)
    {
        m_Groups[team].clear();
    }

    m_wartime = true;
    UpdateAllWorldObject();
    UpdateCreatureObject();
    m_timer = sWorld->getIntConfig(CONFIG_OUTDOORPVP_WINTERGRASP_BATTLE_TIME) * MINUTE * IN_MILLISECONDS;

    for (PlayerSet::iterator itr = m_players[getDefenderTeam()].begin(); itr != m_players[getDefenderTeam()].end(); ++itr)
    {
        if ((*itr) && (*itr)->getLevel() < 75)
            (*itr)->CastSpell((*itr), SPELL_TELEPORT_DALARAN, true);
    }
    for (PlayerSet::iterator itr = m_players[getAttackerTeam()].begin(); itr != m_players[getAttackerTeam()].end(); ++itr)
    {
        if ((*itr) && (*itr)->getLevel() < 75)
            (*itr)->CastSpell((*itr), SPELL_TELEPORT_DALARAN, true);
    }

    // Remove Essence of Wintergrasp to all players
    sWorld->setWorldState(WORLDSTATE_WINTERGRASP_CONTROLING_FACTION, TEAM_NEUTRAL);
    sWorld->UpdateAreaDependentAuras();

    // Start Battle Sound for Defenders And Attackers
    for (PlayerSet::iterator itr = m_players[getDefenderTeam()].begin(); itr != m_players[getDefenderTeam()].end(); ++itr)
    {
        if((*itr))
            (*itr)->PlayDirectSound(OutdoorPvP_WG_SOUND_START_BATTLE); // START Battle
    }
    for (PlayerSet::iterator itr = m_players[getAttackerTeam()].begin(); itr != m_players[getAttackerTeam()].end(); ++itr)
    {
        if((*itr))
            (*itr)->PlayDirectSound(OutdoorPvP_WG_SOUND_START_BATTLE); // START Battle
    }

    // destroyed all vehicles
    for (uint32 team = 0; team < 2; ++team)
    {
        while(!m_vehicles[team].empty())
        {
            Creature *veh = *m_vehicles[team].begin();
            m_vehicles[team].erase(m_vehicles[team].begin());
            veh->setDeathState(JUST_DIED);
        }
    }

    // Remove All Wintergrasp auras. Add Recruit rank and Tower Control
    for (PlayerSet::iterator itr = m_players[getAttackerTeam()].begin(); itr != m_players[getAttackerTeam()].end(); ++itr)
    {
        if( !(PlayerInWait[(*itr)->GetTeamId()].count((*itr)->GetGUID())) )
            InviteToGame((*itr));
    }

    // Remove All Wintergrasp auras. Add Recruit rank
    for (PlayerSet::iterator itr = m_players[getDefenderTeam()].begin(); itr != m_players[getDefenderTeam()].end(); ++itr)
    {
        if( !(PlayerInWait[(*itr)->GetTeamId()].count((*itr)->GetGUID())) )
            InviteToGame((*itr));
    }

    //Send invite to all player in wait list
    for (uint32 team = 0; team < 2; ++team)
    {    
        for (PlayerSetGuid::const_iterator p_itr = PlayerInWait[team].begin(); p_itr != PlayerInWait[team].end(); ++p_itr)
        {
            if(Player* plr=sObjectAccessor->FindPlayer(*p_itr))
                InviteToGame(plr);
        }
    }

    UpdateTenacityStack();
}

void OutdoorPvPWG::EndBattle()
{
    //Cleanup Temp
    for (uint32 x = 0; x < 240; ++x)
    {
        for (uint32 y = 0; y < 2; ++y)
        {
            InviteToGameTemp[x][y] = uint64(0);
        }
    }

    // Cast Essence of Wintergrasp to all players (CheckCast will determine who to cast)
    sWorld->setWorldState(WORLDSTATE_WINTERGRASP_CONTROLING_FACTION, getDefenderTeam());
    sWorld->UpdateAreaDependentAuras();

    //Sound on End Battle
    for (PlayerSet::iterator itr = m_players[getDefenderTeam()].begin(); itr != m_players[getDefenderTeam()].end(); ++itr)
    {
        if (getDefenderTeam()==TEAM_ALLIANCE)
        {
            TeamIDsound=OutdoorPvP_WG_SOUND_ALLIANCE_WINS; //Allience Win
        }
        else TeamIDsound=OutdoorPvP_WG_SOUND_HORDE_WINS;  //Horde Win
        {
            if((*itr))
                (*itr)->PlayDirectSound(TeamIDsound) ; // SoundOnEndWin
        }
    }
    for (PlayerSet::iterator itr = m_players[getAttackerTeam()].begin(); itr != m_players[getAttackerTeam()].end(); ++itr)
    {
        if((*itr))
            (*itr)->PlayDirectSound(OutdoorPvP_WG_SOUND_NEAR_VICTORY) ; // SoundOnEndLoose
    }

    //Disband Defender Team
    for (PlayerSet::iterator itr = m_players[getDefenderTeam()].begin(); itr != m_players[getDefenderTeam()].end(); ++itr)
    {
        if(PlayerInWar[(*itr)->GetTeamId()].count(((*itr))->GetGUID()))
        {
            if(Group* group = (*itr)->GetGroup()) // remove from raid group if player is member
            {
                if (!group->RemoveMember((*itr)->GetGUID(), GROUP_REMOVEMETHOD_LEAVE))             // group was disbanded
                {
                    m_Groups[(*itr)->GetTeamId()].erase(group);
                    group = NULL;
                }
            }

            PlayerInWar[(*itr)->GetTeamId()].erase((*itr)->GetGUID());	
            SendLeaveMessage((*itr));
        }
    }

    //Disband Attacker Team
    for (PlayerSet::iterator itr = m_players[getAttackerTeam()].begin(); itr != m_players[getAttackerTeam()].end(); ++itr)
    {
        if(PlayerInWar[(*itr)->GetTeamId()].count(((*itr))->GetGUID()))
        {
            if(Group* group = (*itr)->GetGroup()) // remove from raid group if player is member
            {
                if (!group->RemoveMember((*itr)->GetGUID(), GROUP_REMOVEMETHOD_LEAVE))             // group was disbanded
                {
                    m_Groups[(*itr)->GetTeamId()].erase(group);
                    group = NULL;
                }
            }

            PlayerInWar[(*itr)->GetTeamId()].erase((*itr)->GetGUID());	
            SendLeaveMessage((*itr));
        }
    }

    for (uint32 team = 0; team < 2; ++team)
    {
        // destroyed all vehicles
        while(!m_vehicles[team].empty())
        {
            Creature *veh = *m_vehicles[team].begin();
            m_vehicles[team].erase(m_vehicles[team].begin());
            veh->setDeathState(JUST_DIED);
        }

        if (m_players[team].empty())
            continue;

        for (PlayerSet::iterator itr = m_players[team].begin(); itr != m_players[team].end(); ++itr)
        {
            if((*itr))
            {
                // When WG ends the zone is cleaned including corpses, revive all players if dead
                if ((*itr)->isDead())
                {
                    (*itr)->ResurrectPlayer(1.0f);
                    sObjectAccessor->ConvertCorpseForPlayer((*itr)->GetGUID());
                }
                if((*itr) && (*itr)->HasAura(SPELL_TENACITY))
                    (*itr)->RemoveAurasDueToSpell(SPELL_TENACITY);
                (*itr)->CombatStop(true);
                (*itr)->getHostileRefManager().deleteReferences();
            }
        }

        if (m_timer == 1) // Battle End was forced so no reward.
        {
            for (PlayerSet::iterator itr = m_players[team].begin(); itr != m_players[team].end(); ++itr)
            {
                if((*itr) && (*itr)->HasAura(SPELL_RECRUIT))
                    (*itr)->RemoveAurasDueToSpell(SPELL_RECRUIT);
                if((*itr) && (*itr)->HasAura(SPELL_CORPORAL))
                    (*itr)->RemoveAurasDueToSpell(SPELL_CORPORAL);
                if((*itr) && (*itr)->HasAura(SPELL_LIEUTENANT))
                    (*itr)->RemoveAurasDueToSpell(SPELL_LIEUTENANT);
                if((*itr) && (*itr)->HasAura(SPELL_TOWER_CONTROL))
                    (*itr)->RemoveAurasDueToSpell(SPELL_TOWER_CONTROL);
                if((*itr) && (*itr)->HasAura(SPELL_SPIRITUAL_IMMUNITY))
                    (*itr)->RemoveAurasDueToSpell(SPELL_SPIRITUAL_IMMUNITY);
            }
            continue;
        }

        // calculate rewards
        uint32 intactNum = 0;
        uint32 damagedNum = 0;
        for (OutdoorPvP::OPvPCapturePointMap::const_iterator itr = m_capturePoints.begin(); itr != m_capturePoints.end(); ++itr)
            if (OPvPCapturePointWG *workshop = dynamic_cast<OPvPCapturePointWG*>(itr->second))
                if (workshop->m_buildingState->GetTeam() == team)
                    if (workshop->m_buildingState->damageState == DAMAGE_DAMAGED)
                        ++damagedNum;
                    else if (workshop->m_buildingState->damageState == DAMAGE_INTACT)
                        ++intactNum;

        uint32 spellRewardId = team == getDefenderTeam() ? SPELL_VICTORY_REWARD : SPELL_DEFEAT_REWARD;
        uint32 baseHonor = 0;
        uint32 marks = 0;
        uint32 playersWithRankNum = 0;
        uint32 honor = 0;

        if (sWorld->getBoolConfig(CONFIG_OUTDOORPVP_WINTERGRASP_CUSTOM_HONOR))
        {
            // Calculate Level 70+ with Corporal or Lieutenant rank
            for (PlayerSet::iterator itr = m_players[team].begin(); itr != m_players[team].end(); ++itr)
                if ((*itr)->getLevel() > 75 && ((*itr)->HasAura(SPELL_LIEUTENANT) || (*itr)->HasAura(SPELL_CORPORAL)))
                    ++playersWithRankNum;

            baseHonor = team == getDefenderTeam() ? sWorld->getIntConfig(CONFIG_OUTDOORPVP_WINTERGRASP_WIN_BATTLE) : sWorld->getIntConfig(CONFIG_OUTDOORPVP_WINTERGRASP_LOSE_BATTLE);
            baseHonor += (sWorld->getIntConfig(CONFIG_OUTDOORPVP_WINTERGRASP_DAMAGED_TOWER) * m_towerDamagedCount[OTHER_TEAM(team)]);
            baseHonor += (sWorld->getIntConfig(CONFIG_OUTDOORPVP_WINTERGRASP_DESTROYED_TOWER) * m_towerDestroyedCount[OTHER_TEAM(team)]);
            baseHonor += (sWorld->getIntConfig(CONFIG_OUTDOORPVP_WINTERGRASP_INTACT_BUILDING) * intactNum);
            baseHonor += (sWorld->getIntConfig(CONFIG_OUTDOORPVP_WINTERGRASP_DAMAGED_BUILDING) * damagedNum);
            if (playersWithRankNum)
                baseHonor /= playersWithRankNum;
        }

        for (PlayerSet::iterator itr = m_players[team].begin(); itr != m_players[team].end(); ++itr)
        {
            if ((*itr)->getLevel() < 70)
                continue; // No rewards for level <70

            // give rewards
            if (sWorld->getBoolConfig(CONFIG_OUTDOORPVP_WINTERGRASP_CUSTOM_HONOR))
            {
                if (team == getDefenderTeam())
                {
                    if ((*itr)->HasAura(SPELL_LIEUTENANT))
                    {
                        marks = 3;
                        honor = baseHonor;
                    }
                    else if ((*itr)->HasAura(SPELL_CORPORAL))
                    {
                        marks = 2;
                        honor = baseHonor;
                    }
                    else
                    {
                        marks = 1;
                        honor = 0;
                    }
                }
                else
                {
                    if ((*itr)->HasAura(SPELL_LIEUTENANT))
                    {
                        marks = 1;
                        honor = baseHonor;
                    }
                    else if ((*itr)->HasAura(SPELL_CORPORAL))
                    {
                        marks = 1;
                        honor = baseHonor;
                    }
                    else
                    {
                        marks = 0;
                        honor = 0;
                    }
                }
                (*itr)->RewardHonor(NULL, 1, honor);
                RewardMarkOfHonor(*itr, marks);
                (*itr)->GetAchievementMgr().UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, spellRewardId);
            }
            else
            {
                if ((*itr)->HasAura(SPELL_LIEUTENANT) || (*itr)->HasAura(SPELL_CORPORAL))
                {
                    // TODO - Honor from SpellReward should be shared by team players
                    // TODO - Marks should be given depending on Rank but 3 are given
                    // each time so Won't give any to recruits
                    (*itr)->CastSpell(*itr, spellRewardId, true);
                    for (uint32 i = 0; i < intactNum; ++i)
                        (*itr)->CastSpell(*itr, SPELL_INTACT_BUILDING, true);
                    for (uint32 i = 0; i < damagedNum; ++i)
                        (*itr)->CastSpell(*itr, SPELL_DAMAGED_BUILDING, true);
                    for (uint32 i = 0; i < m_towerDamagedCount[OTHER_TEAM(team)]; ++i)
                        (*itr)->CastSpell(*itr, SPELL_DAMAGED_TOWER, true);
                    for (uint32 i = 0; i < m_towerDestroyedCount[OTHER_TEAM(team)]; ++i)
                        (*itr)->CastSpell(*itr, SPELL_DESTROYED_TOWER, true);
                }
            }
            if (team == getDefenderTeam())
            {
                if ((*itr)->HasAura(SPELL_LIEUTENANT) || (*itr)->HasAura(SPELL_CORPORAL))
                {
                    (*itr)->AreaExploredOrEventHappens(A_VICTORY_IN_WG);
                    (*itr)->AreaExploredOrEventHappens(H_VICTORY_IN_WG);
                }
            }

            if((*itr) && (*itr)->HasAura(SPELL_RECRUIT))
                (*itr)->RemoveAurasDueToSpell(SPELL_RECRUIT);
            if((*itr) && (*itr)->HasAura(SPELL_CORPORAL))
                (*itr)->RemoveAurasDueToSpell(SPELL_CORPORAL);
            if((*itr) && (*itr)->HasAura(SPELL_LIEUTENANT))
                (*itr)->RemoveAurasDueToSpell(SPELL_LIEUTENANT);
            if((*itr) && (*itr)->HasAura(SPELL_TOWER_CONTROL))
                (*itr)->RemoveAurasDueToSpell(SPELL_TOWER_CONTROL);
            if((*itr) && (*itr)->HasAura(SPELL_SPIRITUAL_IMMUNITY))
                (*itr)->RemoveAurasDueToSpell(SPELL_SPIRITUAL_IMMUNITY);
        }
    }

    for (uint32 team = 0; team < 2; ++team)
    {
        // Cleanup Players in Queue
        for (PlayerSetGuid::const_iterator p_itr = PlayerInWait[team].begin(); p_itr != PlayerInWait[team].end(); ++p_itr)
            if(Player* plr=sObjectAccessor->FindPlayer(*p_itr))
                PlayerInWait[team].erase(plr->GetGUID());

        // Cleanup Players in War
        for (PlayerSetGuid::const_iterator p_itr = PlayerInWar[team].begin(); p_itr != PlayerInWar[team].end(); ++p_itr)
            if(Player* plr=sObjectAccessor->FindPlayer(*p_itr))
                PlayerInWar[team].erase(plr->GetGUID());
    }

    m_wartime = false;
    m_timer = sWorld->getIntConfig(CONFIG_OUTDOORPVP_WINTERGRASP_INTERVAL) * MINUTE * IN_MILLISECONDS;
    TeamCastSpell(getAttackerTeam(), SPELL_TELEPORT_DALARAN);
    RemoveOfflinePlayerWGAuras();

    // Update go factions
    for (GameObjectSet::iterator itr = m_gobjects.begin(); itr != m_gobjects.end(); ++itr)
        UpdateGameObjectInfo(*itr);
}

bool OutdoorPvPWG::CanBuildVehicle(OPvPCapturePointWG *workshop) const
{
    TeamId team = workshop->m_buildingState->GetTeam();
    if (team == TEAM_NEUTRAL)
        return false;

    return isWarTime()
        && workshop->m_buildingState->damageState != DAMAGE_DESTROYED
        && m_vehicles[team].size() < m_workshopCount[team] * MAX_VEHICLE_PER_WORKSHOP;
}

uint32 OutdoorPvPWG::GetData(uint32 id)
{
    // if can build more vehicles
    if (OPvPCapturePointWG *workshop = GetWorkshopByEngGuid(id))
        return CanBuildVehicle(workshop) ? 1 : 0;

    return 0;
}

void OutdoorPvPWG::RewardMarkOfHonor(Player *plr, uint32 count)
{
    // 'Inactive' this aura prevents the player from gaining honor points and battleground tokens
    if (plr->HasAura(SPELL_AURA_PLAYER_INACTIVE))
        return;
    if (count == 0)
        return;

    ItemPosCountVec dest;
    uint32 no_space_count = 0;
    uint8 msg = plr->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, WG_MARK_OF_HONOR, count, &no_space_count);

    if (msg == EQUIP_ERR_ITEM_NOT_FOUND)
    {
        sLog->outErrorDb("Wintergrasp reward item (Entry %u) not exist in `item_template`.", WG_MARK_OF_HONOR);
        return;
    }

    if (msg != EQUIP_ERR_OK) // convert to possible store amount
        count -= no_space_count;

    if (count != 0 && !dest.empty()) // can add some
        if (Item* item = plr->StoreNewItem(dest, WG_MARK_OF_HONOR, true, 0))
            plr->SendNewItem(item, count, true, false);
}

void OutdoorPvPWG::LoadQuestGiverMap(uint32 guid, Position posHorde, Position posAlli)
{
    m_qgPosMap[std::pair<uint32, bool>(guid, true)] = posHorde,
    m_qgPosMap[std::pair<uint32, bool>(guid, false)] = posAlli,
    m_questgivers[guid] = NULL;
    if (getDefenderTeam() == TEAM_ALLIANCE)
        sObjectMgr->MoveCreData(guid, 571, posAlli);
}

OPvPCapturePointWG *OutdoorPvPWG::GetWorkshop(uint32 lowguid) const
{
    if (OPvPCapturePoint *cp = GetCapturePoint(lowguid))
        return dynamic_cast<OPvPCapturePointWG*>(cp);
    return NULL;
}

OPvPCapturePointWG *OutdoorPvPWG::GetWorkshopByEngGuid(uint32 lowguid) const
{
    for (OutdoorPvP::OPvPCapturePointMap::const_iterator itr = m_capturePoints.begin(); itr != m_capturePoints.end(); ++itr)
        if (OPvPCapturePointWG *workshop = dynamic_cast<OPvPCapturePointWG*>(itr->second))
            if (workshop->m_engGuid == lowguid)
                return workshop;
    return NULL;
}

OPvPCapturePointWG *OutdoorPvPWG::GetWorkshopByGOGuid(uint32 lowguid) const
{
    for (OutdoorPvP::OPvPCapturePointMap::const_iterator itr = m_capturePoints.begin(); itr != m_capturePoints.end(); ++itr)
        if (OPvPCapturePointWG *workshop = dynamic_cast<OPvPCapturePointWG*>(itr->second))
            if (workshop->m_workshopGuid == lowguid)
                return workshop;
    return NULL;
}

/*********************************************************/
/***        COPYPASTE FROM BATTLEGROUND SYSTEM         ***/
/*********************************************************/
void OutdoorPvPWG::SendAreaSpiritHealerQueryOpcode(Player *pl, const uint64& guid)
{
    WorldPacket data(SMSG_AREA_SPIRIT_HEALER_TIME, 12);
    uint32 time_ = 30000 - GetLastResurrectTime();      // resurrect every 30 seconds
    if (time_ == uint32(-1))
        time_ = 0;
    data << guid << time_;
    pl->GetSession()->SendPacket(&data);
}

void OutdoorPvPWG::AddPlayerToResurrectQueue(uint64 npc_guid, uint64 player_guid)
{
    m_ReviveQueue[npc_guid].push_back(player_guid);

    Player *plr = ObjectAccessor::FindPlayer(player_guid);
    if (!plr)
        return;

    plr->CastSpell(plr, SPELL_WAITING_FOR_RESURRECT, true);
}

void OutdoorPvPWG::RemovePlayerFromResurrectQueue(uint64 player_guid)
{
    for (std::map<uint64, std::vector<uint64> >::iterator itr = m_ReviveQueue.begin(); itr != m_ReviveQueue.end(); ++itr)
    {
        for (std::vector<uint64>::iterator itr2 =(itr->second).begin(); itr2 != (itr->second).end(); ++itr2)
        {
            if (*itr2 == player_guid)
            {
                (itr->second).erase(itr2);

                Player *plr = ObjectAccessor::FindPlayer(player_guid);
                if (!plr)
                    return;

                plr->RemoveAurasDueToSpell(SPELL_WAITING_FOR_RESURRECT);

                return;
            }
        }
    }
}

void OutdoorPvPWG::RelocateAllianceDeadPlayers(Creature *cr)
{
    if (!cr || GetCreatureType(cr->GetEntry()) != CREATURE_SPIRIT_GUIDE)
        return;

    // Those who are waiting to resurrect at this node are taken to the closest own node's graveyard
    std::vector<uint64> ghost_list = m_ReviveQueue[cr->GetGUID()];
    if (!ghost_list.empty())
    {
        WorldSafeLocsEntry const *ClosestGrave = NULL;
        for (std::vector<uint64>::const_iterator itr = ghost_list.begin(); itr != ghost_list.end(); ++itr)
        {
            Player* plr = ObjectAccessor::FindPlayer(*itr);
            if (!plr)
                continue;

            if (plr->getFaction() == ALLIANCE)
            {
                if (ClosestGrave)
                    plr->TeleportTo(plr->GetMapId(), ClosestGrave->x, ClosestGrave->y, ClosestGrave->z, plr->GetOrientation());
                else
                    ClosestGrave = sObjectMgr->GetClosestGraveYard(plr->GetPositionX(), plr->GetPositionY(), plr->GetPositionZ(), plr->GetMapId(), plr->GetTeam());
            }
        }
    }
}

void OutdoorPvPWG::RelocateHordeDeadPlayers(Creature *cr)
{
    if (!cr || GetCreatureType(cr->GetEntry()) != CREATURE_SPIRIT_GUIDE)
        return;

    // Those who are waiting to resurrect at this node are taken to the closest own node's graveyard
    std::vector<uint64> ghost_list = m_ReviveQueue[cr->GetGUID()];
    if (!ghost_list.empty())
    {
        WorldSafeLocsEntry const *ClosestGrave = NULL;
        for (std::vector<uint64>::const_iterator itr = ghost_list.begin(); itr != ghost_list.end(); ++itr)
        {
            Player* plr = ObjectAccessor::FindPlayer(*itr);
            if (!plr)
                continue;
            if (plr->getFaction() == HORDE)
            {
                if (ClosestGrave)
                    plr->TeleportTo(plr->GetMapId(), ClosestGrave->x, ClosestGrave->y, ClosestGrave->z, plr->GetOrientation());
                else
                    ClosestGrave = sObjectMgr->GetClosestGraveYard(plr->GetPositionX(), plr->GetPositionY(), plr->GetPositionZ(), plr->GetMapId(), plr->GetTeam());
            }
        }
    }
}

/*######
##OPvPCapturePointWG
######*/

OPvPCapturePointWG::OPvPCapturePointWG(OutdoorPvPWG *opvp, BuildingState *state) : OPvPCapturePoint(opvp), m_buildingState(state), m_wintergrasp(opvp), m_engineer(NULL), m_engGuid(0), m_spiritguide(NULL), m_spiritguide_horde(NULL), m_spiritguide_alliance(NULL), m_spiGuid(0) { }

void OPvPCapturePointWG::SetTeamByBuildingState()
{
    if (m_buildingState->GetTeam() == TEAM_ALLIANCE)
    {
        m_value = m_maxValue;
        m_State = OBJECTIVESTATE_ALLIANCE;
    }
    else if (m_buildingState->GetTeam() == TEAM_HORDE)
    {
        m_value = -m_maxValue;
        m_State = OBJECTIVESTATE_HORDE;
    }
    else
    {
        m_value = 0;
        m_State = OBJECTIVESTATE_NEUTRAL;
    }

    if (m_team != m_buildingState->GetTeam())
    {
        TeamId oldTeam = m_team;
        m_team = m_buildingState->GetTeam();
        ChangeTeam(oldTeam);
    }

    SendChangePhase();
}

void OPvPCapturePointWG::ChangeTeam(TeamId oldTeam)
{
    uint32 entry = 0;
    uint32 guide_entry = 0;
	uint32 guide_entry_fortress_horde = 0;
    uint32 guide_entry_fortress_alliance = 0;

    if (oldTeam != TEAM_NEUTRAL)
        m_wintergrasp->ModifyWorkshopCount(oldTeam, false);

    if (m_team != TEAM_NEUTRAL)
    {
        entry = m_team == TEAM_ALLIANCE ? CRE_ENG_A : CRE_ENG_H;
        guide_entry = m_team == TEAM_ALLIANCE ? CRE_SPI_A : CRE_SPI_H;
        guide_entry_fortress_horde = m_team == TEAM_HORDE ? CRE_SPI_H : CRE_SPI_H;
        guide_entry_fortress_alliance = m_team == TEAM_ALLIANCE ? CRE_SPI_A : CRE_SPI_A;
        m_wintergrasp->ModifyWorkshopCount(m_team, true);
    }

    if (m_capturePoint)
        GameObject::SetGoArtKit(CapturePointArtKit[m_team], m_capturePoint, m_capturePointGUID);

    m_buildingState->SetTeam(m_team);
    // TODO: this may be sent twice
    m_wintergrasp->BroadcastStateChange(m_buildingState);

    if (m_buildingState->building)
        m_buildingState->building->SetUInt32Value(GAMEOBJECT_FACTION, WintergraspFaction[m_team]);

    if (entry)
    {
        if (m_engGuid)
        {
            *m_engEntry = entry;
            _RespawnCreatureIfNeeded(m_engineer, entry);
        }
        if (m_spiGuid)
        {
            if (m_wintergrasp->getAttackerTeam() == TEAM_ALLIANCE)
            {
                *m_spiEntry = guide_entry;
                _RespawnCreatureIfNeeded(m_spiritguide_horde, guide_entry_fortress_horde);
                m_wintergrasp->RelocateHordeDeadPlayers(m_spiritguide_horde); // Horde
                _RespawnCreatureIfNeeded(m_spiritguide, guide_entry);
                m_wintergrasp->RelocateAllianceDeadPlayers(m_spiritguide); // Alliance
            }
            else
            {
                *m_spiEntry = guide_entry;
                _RespawnCreatureIfNeeded(m_spiritguide_alliance, guide_entry_fortress_alliance);
                m_wintergrasp->RelocateAllianceDeadPlayers(m_spiritguide_alliance); // Alliance
                _RespawnCreatureIfNeeded(m_spiritguide, guide_entry);
                m_wintergrasp->RelocateHordeDeadPlayers(m_spiritguide); // Horde
            }
        }
    }
    else if (m_engineer)
        m_engineer->SetVisible(false);

    sLog->outDebug(LOG_FILTER_BATTLEGROUND, "Wintergrasp workshop now belongs to %u.", (uint32)m_buildingState->GetTeam());
}

//Method for check and kick afk player
void OutdoorPvPWG::KickAfk()
{
    for (uint32 team = 0; team < 2; ++team)
    {
        for (PlayerSet::const_iterator p_itr = m_players[team].begin(); p_itr != m_players[team].end(); ++p_itr)
        {
            if((*p_itr)->isAFK())
            {
                if(PlayerInWar[team].count((*p_itr)->GetGUID()))
                    (*p_itr)->CastSpell((*p_itr), SPELL_TELEPORT_DALARAN, true);
            }
        }
    }
}

//Method for Kick Player In Wait To Game
void OutdoorPvPWG::KickPlayerInWaitToGame()
{
    for (uint32 x = 0; x < 240; ++x)
    {
        for (uint32 y = 0; y < 2; ++y)
        {
            if(InviteToGameTemp[x][y] != 0 && InviteToGameTemp[x][y+1] < 20)
            {
                InviteToGameTemp[x][y+1] = InviteToGameTemp[x][y+1] + uint64(1);
                y = y+1;
            }
            else if(InviteToGameTemp[x][y] != 0 && InviteToGameTemp[x][y+1] >= 20)
            {
                Player* plr=sObjectAccessor->FindPlayer(uint64(InviteToGameTemp[x][y]));

                if(plr)
                {
                    if(plr->GetZoneId() == ZONE_WINTERGRASP)
                    {
                        PlayerLeaveQueue(plr);
                        plr->CastSpell(plr, SPELL_TELEPORT_DALARAN, true);
                    }
                    else
                        PlayerLeaveQueue(plr);					
                }

                // Cleanup
                InviteToGameTemp[x][y] = uint64(0);
                InviteToGameTemp[x][y+1] = uint64(0);
                y = y+1;
            }
            else
                y = y+1;
        }
    }
}

//*************************************************************
//*************** WINTERGRASP QUEUE SYSTEM ********************
//*************************************************************
void OutdoorPvPWG::InviteToGame(Player* plr)
{
    sLog->outDebug(LOG_FILTER_BATTLEGROUND, "WORLD: Sent SMSG_BATTLEFIELD_MGR_ENTRY_INVITE");

    if(PlayerInWar[plr->GetTeamId()].count(plr->GetGUID()))
        return;

    // TEAM_ALLIANCE MAX 120 PLAYERS
	if(plr->GetTeamId() == TEAM_ALLIANCE)
    {
        uint32 CountMaxAlliancePlayers = 0;

        for (PlayerSetGuid::const_iterator p_itr = PlayerInWait[TEAM_ALLIANCE].begin(); p_itr != PlayerInWait[TEAM_ALLIANCE].end(); ++p_itr)
            CountMaxAlliancePlayers = CountMaxAlliancePlayers + uint32(1);

        for (PlayerSetGuid::const_iterator p_itr = PlayerInWar[TEAM_ALLIANCE].begin(); p_itr != PlayerInWar[TEAM_ALLIANCE].end(); ++p_itr)
            CountMaxAlliancePlayers = CountMaxAlliancePlayers + uint32(1);

        if(CountMaxAlliancePlayers >= 120)
        {
            if(!(PlayerInWait[TEAM_ALLIANCE].count(plr->GetGUID())))
            {
                plr->GetSession()->SendNotification("Wintergrasp is Full");
                return;
            }
        }
    }

    // TEAM_HORDE MAX 120 PLAYERS
    if(plr->GetTeamId() == TEAM_HORDE)
    {
        uint32 CountMaxHordePlayers = 0;

        for (PlayerSetGuid::const_iterator p_itr = PlayerInWait[TEAM_HORDE].begin(); p_itr != PlayerInWait[TEAM_HORDE].end(); ++p_itr)
            CountMaxHordePlayers = CountMaxHordePlayers + uint32(1);

        for (PlayerSetGuid::const_iterator p_itr = PlayerInWar[TEAM_HORDE].begin(); p_itr != PlayerInWar[TEAM_HORDE].end(); ++p_itr)
            CountMaxHordePlayers = CountMaxHordePlayers + uint32(1);

        if(CountMaxHordePlayers >= 120)
        {
            if(!(PlayerInWait[TEAM_HORDE].count(plr->GetGUID())))
            {
                plr->GetSession()->SendNotification("Wintergrasp is Full");
                return;
            }
        }
    }

    WorldPacket data(SMSG_BATTLEFIELD_MGR_ENTRY_INVITE, 1+1+1+1+1+1+1+1+4);
    data << uint8(1);
    data << uint8(0);
    data << uint8(0);
    data << uint8(0);
    data << uint8(101);
    data << uint8(16);
    data << uint8(0);
    data << uint8(0);
    data << uint32(time(NULL)+20);
    plr->GetSession()->SendPacket(&data);

    // Set Players in Temp List
    OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
    pvpWG->PlayerInviteToGameTemp(plr);
}

void OutdoorPvPWG::InviteInQueue(Player* plr)
{
    sLog->outDebug(LOG_FILTER_BATTLEGROUND, "WORLD: Sent SMSG_BATTLEFIELD_MGR_QUEUE_INVITE");

    if(PlayerInWait[plr->GetTeamId()].count(plr->GetGUID()))
        return;

    // TEAM_ALLIANCE
    if(plr->GetTeamId() == TEAM_ALLIANCE)
    {
        uint32 CountMaxAlliancePlayers = 0;

        for (PlayerSetGuid::const_iterator p_itr = PlayerInWait[TEAM_ALLIANCE].begin(); p_itr != PlayerInWait[TEAM_ALLIANCE].end(); ++p_itr)
            CountMaxAlliancePlayers = CountMaxAlliancePlayers + uint32(1);

        if(CountMaxAlliancePlayers >= 120)
        {
            plr->GetSession()->SendNotification("Queue is Full");
            return;
        }
    }

    // TEAM_HORDE
    if(plr->GetTeamId() == TEAM_HORDE)
    {
        uint32 CountMaxHordePlayers = 0;

        for (PlayerSetGuid::const_iterator p_itr = PlayerInWait[TEAM_HORDE].begin(); p_itr != PlayerInWait[TEAM_HORDE].end(); ++p_itr)
            CountMaxHordePlayers = CountMaxHordePlayers + uint32(1);

        if(CountMaxHordePlayers >= 120)
        {
            plr->GetSession()->SendNotification("Queue is Full");
            return;
        }
    }

    WorldPacket data(SMSG_BATTLEFIELD_MGR_QUEUE_INVITE, 5);
    data << uint8(1);
	data << uint32(1);
    plr->GetSession()->SendPacket(&data);
}

void OutdoorPvPWG::PlayerAcceptInvite(Player* plr)
{
    sLog->outDebug(LOG_FILTER_BATTLEGROUND, "WORLD: Sent SMSG_BATTLEFIELD_MGR_QUEUE_REQUEST_RESPONSE");

    PlayerInWait[plr->GetTeamId()].insert(plr->GetGUID());

    WorldPacket data(SMSG_BATTLEFIELD_MGR_QUEUE_REQUEST_RESPONSE, 1+1+1+1+1+1+1+1+1+1+1);
    data << uint8(1);
    data << uint8(0);
    data << uint8(0);
    data << uint8(0);
    data << uint8(101);
    data << uint8(16);
    data << uint8(0);
    data << uint8(0);
    data << uint8(1);
    data << uint8(0);
    data << uint8(1);
    plr->GetSession()->SendPacket(&data);
}

void OutdoorPvPWG::PlayerAcceptInviteGame(Player* plr)
{
    if(!(plr))
        return;

    sLog->outDebug(LOG_FILTER_BATTLEGROUND, "WORLD: Sent SMSG_BATTLEFIELD_MGR_ENTERED");

    if(AddOrSetPlayerToCorrectBgGroup(plr))
	{
		if(PlayerInWait[plr->GetTeamId()].count(plr->GetGUID()))
			PlayerInWait[plr->GetTeamId()].erase(plr->GetGUID());

		PlayerInWar[plr->GetTeamId()].insert(plr->GetGUID());
		WorldPacket data(SMSG_BATTLEFIELD_MGR_ENTERED, 1+1+1+1+1+1+1);
		data << uint8(1);
		data << uint8(0);
		data << uint8(0);
		data << uint8(0);
		data << uint8(1);
		data << uint8(1);
		data << uint8(0);
		plr->GetSession()->SendPacket(&data);

		if(plr->isAFK())
			plr->ToggleAFK();

		if(plr->GetTeamId() == getDefenderTeam())
			plr->CastSpell(plr, SPELL_TELEPORT_FORTRESS, true);
		else
			plr->CastSpell(plr, SPELL_TELEPORT_BRIDGE, true);

		if (isWarTime())
		{
			if (plr->getLevel() < 75) 
			{
				plr->CastSpell(plr, SPELL_TELEPORT_DALARAN, true);
				PlayerInWar[plr->GetTeamId()].erase(plr->GetGUID());
				return;
			}
			if (plr->getLevel() >= 75)
			{
				if (!plr->HasAura(SPELL_RECRUIT) && !plr->HasAura(SPELL_CORPORAL)
				&& !plr->HasAura(SPELL_LIEUTENANT))
					plr->CastSpell(plr, SPELL_RECRUIT, true);
				if (plr->GetTeamId() == getAttackerTeam())
				{
					if (m_towerDestroyedCount[getAttackerTeam()] < 3)
						plr->SetAuraStack(SPELL_TOWER_CONTROL, plr, 3 - m_towerDestroyedCount[getAttackerTeam()]);
				}
				else
				{
					if (m_towerDestroyedCount[getAttackerTeam()])
						plr->SetAuraStack(SPELL_TOWER_CONTROL, plr, m_towerDestroyedCount[getAttackerTeam()]);
				}
			}
		}
	}
}

//*****************************************************
//*******************Group System**********************
//*****************************************************
Group *OutdoorPvPWG::GetFreeBgRaid(uint32 TeamId)
{
    if(!m_Groups[TeamId].empty())
    {
        //if found free group we return it
        for(GroupSet::const_iterator itr=m_Groups[TeamId].begin();itr!=m_Groups[TeamId].end();++itr)
        {
            if(!(*itr)->IsFull())
                return (*itr);
        }
    }
    //if dont found free group
    Group* g=new Group();
    m_Groups[TeamId].insert(g);
    return g;
}

bool OutdoorPvPWG::AddOrSetPlayerToCorrectBgGroup(Player *plr)
{
    if(!plr->IsInWorld())
        return false;

    if(Group* group = plr->GetGroup())
        group->RemoveMember(plr->GetGUID());

    Group* group = GetFreeBgRaid(plr->GetTeamId());
    if(!group)
    { 
        sLog->outError("Error:OutdoorPvPWG::AddOrSetPlayerToCorrectBgGroup can't get a group");
        return false;
    }
    else 
    {
        if (!group->IsCreated())
        {
            group->Create(plr);
            group->ConvertToRaid();
        }
        if (group->IsMember(plr->GetGUID()))
        {
            uint8 subgroup = group->GetMemberGroup(plr->GetGUID());
            plr->SetGroup(group, subgroup);
        }
        else
        {
            group->AddMember(plr);
            if (Group* originalGroup = plr->GetOriginalGroup())
                if (originalGroup->IsLeader(plr->GetGUID()))
                {
                    group->ChangeLeader(plr->GetGUID());
                    group->SendUpdate();
                }
        }
        return true;
    }
    return false;
}
//***************End of Group System*******************

void WorldSession::HandleQueueInviteResponse(WorldPacket &recv_data)
{
    sLog->outDebug(LOG_FILTER_BATTLEGROUND, "WORLD: Recvd CMSG_BATTLEFIELD_MGR_QUEUE_INVITE_RESPONSE");

    uint8 unk1;                                             
    uint32 unk2;             

    recv_data >> unk1 >> unk2;
    if(unk2)
    {
        OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
        if (pvpWG)
            pvpWG->PlayerAcceptInvite(_player);
    }
}

//need move this to OutdoorPvPHandler (if exist, else make this file)
void WorldSession::HandleBattleFieldInviteResponse(WorldPacket &recv_data)
{
    if(!(_player))
        return;

    sLog->outDebug(LOG_FILTER_BATTLEGROUND, "WORLD: Recvd CMSG_BATTLEFIELD_MGR_ENTRY_INVITE_RESPONSE");

    uint8 unk1;
    uint32 unk2;

    recv_data >> unk1 >> unk2;

    OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);

    // Cleanup InviteToGameTemp
    for (uint32 x = 0; x < 240; ++x)
    {
        for (uint32 y = 0; y < 2; ++y)
        {
            if(pvpWG->InviteToGameTemp[x][y] == _player->GetGUID())
            {
                pvpWG->InviteToGameTemp[x][y] = uint64(0);
                pvpWG->InviteToGameTemp[x][y+1] = uint64(0);
            }
            else
                y = y+1;
        }
    }

    if(unk2)
    {
        if (pvpWG)
            pvpWG->PlayerAcceptInviteGame(_player);		
    }
    else
    {
        if(_player->GetZoneId() == ZONE_WINTERGRASP)
        {
            pvpWG->PlayerLeaveQueue(_player);
            _player->CastSpell(_player, SPELL_TELEPORT_DALARAN, true);
        }
        else
        {
            if (pvpWG)
                pvpWG->PlayerLeaveQueue(_player);
        }
    }
}

void OutdoorPvPWG::SendLeaveMessage(Player* plr)
{
    sLog->outDebug(LOG_FILTER_BATTLEGROUND, "WORLD: Sent SMSG_BATTLEFIELD_MGR_EJECTED");

    WorldPacket data(SMSG_BATTLEFIELD_MGR_EJECTED, 1+1+1+1+1+1+1);
    data << uint8(1);
    data << uint8(0);
    data << uint8(0);
    data << uint8(0);
    data << uint8(8);
    data << uint8(2);
    data << uint8(0);
    plr->GetSession()->SendPacket(&data);
}

void OutdoorPvPWG::PlayerLeaveQueue(Player* plr)
{
    if(PlayerInWait[plr->GetTeamId()].count(plr->GetGUID()))
        PlayerInWait[plr->GetTeamId()].erase(plr->GetGUID());

    SendLeaveMessage(plr);
}

void WorldSession::HandleQueueExitRequest(WorldPacket &recv_data)
{
    sLog->outError("WORLD: Recvd CMSG_BATTLEFIELD_MGR_EXIT_REQUEST");

    uint8 unk1;
    uint8 unk2;
    uint8 unk3;
    uint8 unk4;

    recv_data >> unk1 >> unk2 >> unk3 >> unk4;

    OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
    if (pvpWG)
        pvpWG->PlayerLeaveQueue(_player);
}

void OutdoorPvPWG::PlayerInviteToGameTemp(Player* plr)
{
    // Cleanup InviteToGameTemp
    for (uint32 x = 0; x < 240; ++x)
    {
        for (uint32 y = 0; y < 2; ++y)
        {
            if(InviteToGameTemp[x][y] == plr->GetGUID())
            {
                InviteToGameTemp[x][y] = uint64(0);
                InviteToGameTemp[x][y+1] = uint64(0);
            }
            else
                y = y+1;
        }
    }

    // Temp Players Insert
    for (uint32 x = 0; x < 240; ++x)
    {
        for (uint32 y = 0; y < 2; ++y)
       {
            if(InviteToGameTemp[x][y] == 0)
            {
                InviteToGameTemp[x][y] = plr->GetGUID();
                InviteToGameTemp[x][y+1] = uint64(1);
                return;
            }
            else
                y = y+1;
        }
    }
}

class OutdoorPvP_wintergrasp : public OutdoorPvPScript
{
    public:

        OutdoorPvP_wintergrasp()
            : OutdoorPvPScript("outdoorpvp_wg")
        {
        }

        OutdoorPvP* GetOutdoorPvP() const
        {
            return new OutdoorPvPWG();
        }
};

void AddSC_outdoorpvp_wg()
{
    new OutdoorPvP_wintergrasp();
}