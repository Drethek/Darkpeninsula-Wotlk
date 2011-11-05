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

#ifndef DEF_ULDUAR_H
#define DEF_ULDUAR_H

#include "ObjectMgr.h"
#define UlduarScriptName "instance_ulduar"

enum UlduarBosses
{
    MAX_ENCOUNTER            = 20,

    BOSS_LEVIATHAN           = 0,
    BOSS_IGNIS               = 1,
    BOSS_RAZORSCALE          = 2,
    BOSS_XT002               = 3,
    BOSS_ASSEMBLY_OF_IRON    = 4,
    BOSS_STEELBREAKER        = 5,
    BOSS_MOLGEIM             = 6,
    BOSS_BRUNDIR             = 7,
    BOSS_KOLOGARN            = 8,
    BOSS_AURIAYA             = 9,
    BOSS_MIMIRON             = 10,
    BOSS_HODIR               = 11,
    BOSS_THORIM              = 12,
    BOSS_FREYA               = 13,
    BOSS_BRIGHTLEAF          = 14,
    BOSS_IRONBRANCH          = 15,
    BOSS_STONEBARK           = 16,
    BOSS_VEZAX               = 17,
    BOSS_YOGGSARON           = 18,
    BOSS_ALGALON             = 19,
};

enum UlduarNPCs
{
    // General
    NPC_LEVIATHAN                = 33113,
    NPC_SALVAGED_DEMOLISHER      = 33109,
    NPC_SALVAGED_SIEGE_ENGINE    = 33060,
    NPC_IGNIS                    = 33118,
    NPC_RAZORSCALE               = 33186,
    NPC_RAZORSCALE_CONTROLLER    = 33233,
    NPC_STEELFORGED_DEFFENDER    = 33236,
    NPC_EXPEDITION_COMMANDER     = 33210,
    NPC_XT002                    = 33293,
    NPC_XT_TOY_PILE              = 33337,
    NPC_STEELBREAKER             = 32867,
    NPC_MOLGEIM                  = 32927,
    NPC_BRUNDIR                  = 32857,
    NPC_KOLOGARN                 = 32930,
    NPC_FOCUSED_EYEBEAM          = 33632,
    NPC_FOCUSED_EYEBEAM_RIGHT    = 33802,
    NPC_LEFT_ARM                 = 32933,
    NPC_RIGHT_ARM                = 32934,
    NPC_RUBBLE                   = 33768,
    NPC_AURIAYA                  = 33515,
    NPC_MIMIRON                  = 33350,
    NPC_HODIR                    = 32845,
    NPC_THORIM                   = 32865,
    NPC_FREYA                    = 32906,
    NPC_VEZAX                    = 33271,
    NPC_YOGGSARON                = 33288,
    NPC_ALGALON                  = 32871,

    // Mimiron
    NPC_LEVIATHAN_MKII           = 33432,
    NPC_VX_001                   = 33651,
    NPC_AERIAL_COMMAND_UNIT      = 33670,
    NPC_RUNIC_COLOSSUS           = 32872,
    NPC_RUNE_GIANT               = 32873,
    NPC_LEVIATHAN_MK_II          = 33432,
    NPC_AERIAL_UNIT              = 33670,
    NPC_MAGNETIC_CORE            = 34068,
    NPC_FREY_IMAGE               = 33241,
    NPC_THORIM_IMAGE             = 33242,
    NPC_MIMIRON_IMAGE            = 33244,
    NPC_HODIR_IMAGE              = 33213,
    NPC_SARA                     = 33134,
    NPC_YS_FREYA                 = 33410,
    NPC_YS_THORIM                = 33413,
    NPC_YS_MIMIRON               = 33412,
    NPC_YS_HODIR                 = 33411,
    NPC_YOGGSARON_BRAIN          = 33890,

    // Freya's Keepers
    NPC_IRONBRANCH               = 32913,
    NPC_BRIGHTLEAF               = 32915,
    NPC_STONEBARK                = 32914,

    // Hodir's Helper NPCs
    NPC_TOR_GREYCLOUD            = 32941,
    NPC_KAR_GREYCLOUD            = 33333,
    NPC_EIVI_NIGHTFEATHER        = 33325,
    NPC_ELLIE_NIGHTFEATHER       = 32901,
    NPC_SPIRITWALKER_TARA        = 33332,
    NPC_SPIRITWALKER_YONA        = 32950,
    NPC_ELEMENTALIST_MAHFUUN     = 33328,
    NPC_ELEMENTALIST_AVUUN       = 32900,
    NPC_AMIRA_BLAZEWEAVER        = 33331,
    NPC_VEESHA_BLAZEWEAVER       = 32946,
    NPC_MISSY_FLAMECUFFS         = 32893,
    NPC_SISSY_FLAMECUFFS         = 33327,
    NPC_BATTLE_PRIEST_ELIZA      = 32948,
    NPC_BATTLE_PRIEST_GINA       = 33330,
    NPC_FIELD_MEDIC_PENNY        = 32897,
    NPC_FIELD_MEDIC_JESSI        = 33326,

    // Freya's trash NPCs
    NPC_CORRUPTED_SERVITOR       = 33354,
    NPC_MISGUIDED_NYMPH          = 33355,
    NPC_GUARDIAN_LASHER          = 33430,
    NPC_FOREST_SWARMER           = 33431,
    NPC_MANGROVE_ENT             = 33525,
    NPC_IRONROOT_LASHER          = 33526,
    NPC_NATURES_BLADE            = 33527,
    NPC_GUARDIAN_OF_LIFE         = 33528,

    // Algalon
    NPC_AZEROTH                  = 34246,
};

enum UlduarGameObjects
{
    GO_KOLOGARN_CHEST_HERO                = 195047,
    GO_KOLOGARN_CHEST                     = 195046,
    GO_KOLOGARN_BRIDGE                    = 194232,
    GO_KOLOGARN_DOOR                      = 194553,
    GO_THORIM_CHEST_HERO                  = 194315,
    GO_THORIM_CHEST                       = 194314,
    GO_HODIR_RARE_CACHE_OF_WINTER         = 194200,
    GO_HODIR_RARE_CACHE_OF_WINTER_HERO    = 194201,
    GO_HODIR_CHEST_HERO                   = 194308,
    GO_HODIR_CHEST                        = 194307,
    GO_LEVIATHAN_DOOR                     = 194905,
    GO_LEVIATHAN_GATE                     = 194630,
    GO_XT_002_DOOR                        = 194631,
    GO_VEZAX_DOOR                         = 194750,
    GO_MOLE_MACHINE                       = 194316,
    GO_RAZOR_HARPOON_1                    = 194542,
    GO_RAZOR_HARPOON_2                    = 194541,
    GO_RAZOR_HARPOON_3                    = 194543,
    GO_RAZOR_HARPOON_4                    = 194519,
    GO_RAZOR_BROKEN_HARPOON               = 194565,
    GO_HODIR_DOOR                         = 194634,
    GO_HODIR_ICE_DOOR                     = 194441,
    GO_ARCHIVUM_DOOR                      = 194556,
    GO_RUNIC_DOOR                         = 194557,
    GO_STONE_DOOR                         = 194558,
    GO_MIMIRON_TRAM                       = 194675,
    GO_MIMIRON_ELEVATOR                   = 194749,
    GO_ALGALON_DOOR                       = 194767,
    GO_UNIVERSE_GLOBE                     = 194148,
    GO_UNIVERSE_FLOOR_1                   = 194716,
    GO_UNIVERSE_FLOOR_2                   = 194715,
    GO_ALGALON_WALL_ACCESS                = 185301,
};

enum LeviathanData
{
    EVENT_TOWER_OF_STORM_DESTROYED      = 21031,
    EVENT_TOWER_OF_FROST_DESTROYED      = 21032,
    EVENT_TOWER_OF_FLAMES_DESTROYED     = 21033,
    EVENT_TOWER_OF_LIFE_DESTROYED       = 21030,
    ACTION_TOWER_OF_STORM_DESTROYED     = 1,
    ACTION_TOWER_OF_FROST_DESTROYED     = 2,
    ACTION_TOWER_OF_FLAMES_DESTROYED    = 3,
    ACTION_TOWER_OF_LIFE_DESTROYED      = 4,
    ACTION_MOVE_TO_CENTER_POSITION      = 10,
};

enum UlduarAchievementCriteriaIds
{
    CRITERIA_CON_SPEED_ATORY    = 21597,
    CRITERIA_DISARMED           = 21687,
};

enum UlduarData
{
    // Collosus (Leviathan)
    DATA_COLOSSUS                = 20,

    // Razorscale
    DATA_EXPEDITION_COMMANDER,
    DATA_RAZORSCALE_CONTROL,

    // XT-002
    DATA_TOY_PILE_0,
    DATA_TOY_PILE_1,
    DATA_TOY_PILE_2,
    DATA_TOY_PILE_3,

    // Hodir
    DATA_HODIR_RARE_CACHE,

    // Auriaya
    DATA_AURIAYA,

    // Freya
    DATA_FREYA,
    DATA_BRIGHTLEAF,
    DATA_IRONBRANCH,
    DATA_STONEBARK,

    // Thorim
    DATA_THORIM,
    DATA_RUNIC_COLOSSUS,
    DATA_RUNE_GIANT,
    DATA_RUNIC_DOOR,
    DATA_STONE_DOOR,

    // Mirmion
    DATA_MIMIRON,
    DATA_MIMIRON_ELEVATOR,
    DATA_LEVIATHAN_MK_II,
    DATA_VX_001,
    DATA_AERIAL_UNIT,
    DATA_MAGNETIC_CORE,

    // Tram
    DATA_CALL_TRAM,

    // yoggsaron
    DATA_YS_FREYA,
    DATA_YS_THORIM,
    DATA_YS_MIMIRON,
    DATA_YS_HODIR,
    DATA_YOGGSARON_BRAIN,
    DATA_YOGGSARON,

    // Algalon
    DATA_ALGALON,
    DATA_UNIVERSE_GLOBE,	
    DATA_UNIVERSE_FLOOR_1,
    DATA_UNIVERSE_FLOOR_2,	
};

enum UlduarAchievementData
{
    // FL Achievement boolean
    DATA_UNBROKEN = 29052906, // 2905, 2906 are achievement IDs,
};

template<class AI>
CreatureAI* GetUlduarAI(Creature* creature)
{
    if (InstanceMap* instance = creature->GetMap()->ToInstanceMap())
        if (instance->GetInstanceScript())
            if (instance->GetScriptId() == sObjectMgr->GetScriptId(UlduarScriptName))
                return new AI(creature);

    return NULL;
}

class PlayerOrPetCheck
{
    public:
        bool operator() (Unit* unit)
        {
            if (unit->GetTypeId() != TYPEID_PLAYER)
                if (!unit->ToCreature()->isPet())
                    return true;

            return false;
        }
};

#endif
