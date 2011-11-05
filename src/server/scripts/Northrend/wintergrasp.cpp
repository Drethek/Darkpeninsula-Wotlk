/*
 * Copyright (C) 2008-2010 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

/* ScriptData
SDName: Wintergrasp
SD%Complete: 100%
SDComment: Scripts for Wintergrasp PvP Event
SDCategory: Wintegrasp PvP Event
EndScriptData */

/* ContentData
npc_demolisher_engineerer
npc_wg_misc
npc_magister_surdiel_horde_battle_mage
npc_horde_battle_mage
npc_arcanist_braedin_alliance_battle_mage
npc_alliance_battle_mage
npc_marshal_magruder
npc_champion_ros_slai
EndContentData */

#include "ScriptPCH.h"
#include "../OutdoorPvP/OutdoorPvPWG.h"
#include "OutdoorPvPMgr.h"
#include "Group.h"

#define GOSSIP_HELLO_DEMO1  "Build catapult."
#define GOSSIP_HELLO_DEMO2  "Build demolisher."
#define GOSSIP_HELLO_DEMO3  "Build siege engine."
#define GOSSIP_HELLO_DEMO4  "I cannot build more!"

#define ENTRY_MAGISTER_SURDIEL 32170
#define PORTAL_TO_WINTERGRASP 193772

/*######
## npc_demolisher_engineerer
######*/
class npc_demolisher_engineerer : public CreatureScript
{
public:
    npc_demolisher_engineerer() : CreatureScript("npc_demolisher_engineerer") { }

	bool OnGossipHello(Player* pPlayer, Creature* pCreature)
	{
		if (pCreature->isQuestGiver())
			pPlayer->PrepareQuestMenu(pCreature->GetGUID());

		if(pPlayer->isGameMaster() || pCreature->GetZoneScript() && pCreature->GetZoneScript()->GetData(pCreature->GetDBTableGUIDLow()))
		{
			if (pPlayer->HasAura(SPELL_CORPORAL))
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_DEMO1, GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF);
			else if (pPlayer->HasAura(SPELL_LIEUTENANT))
			{
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_DEMO1, GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF);
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_DEMO2, GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF+1);
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_DEMO3, GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF+2);
			}
		}
		else
			pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_DEMO4, GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF+9);

		pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
	{
		pPlayer->CLOSE_GOSSIP_MENU();
		if(pPlayer->isGameMaster() || pCreature->GetZoneScript() && pCreature->GetZoneScript()->GetData(pCreature->GetDBTableGUIDLow()))
		{
			switch(uiAction - GOSSIP_ACTION_INFO_DEF)
			{
				case 0: pPlayer->CastSpell(pPlayer, 56663, false, NULL, NULL, pCreature->GetGUID()); break;
				case 1: pPlayer->CastSpell(pPlayer, 56575, false, NULL, NULL, pCreature->GetGUID()); break;
				case 2: pPlayer->CastSpell(pPlayer, pPlayer->GetTeamId() ? 61408 : 56661, false, NULL, NULL, pCreature->GetGUID()); break;
			}
		}

		return true;
	}

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_demolisher_engineererAI (pCreature);
    }

    struct npc_demolisher_engineererAI : public ScriptedAI
    {
        npc_demolisher_engineererAI(Creature* pCreature) : ScriptedAI(pCreature){}

        void Reset()
        {
			me->SetReactState(REACT_PASSIVE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetHomePosition(me->GetPositionX(),me->GetPositionY(),me->GetPositionZ(),me->GetOrientation());
        }

        void UpdateAI(const uint32 diff)
        {
            if (UpdateVictim())
            {
                EnterEvadeMode();
                me->GetMotionMaster()->MovePoint(1,me->GetHomePosition());
                return;
            }
        }
    };
};

/*######
## npc_wg_misc
######*/
enum NPC_WG_MISC_SPELLS
{
    SPELL_STRIKE                = 11976,    // WG_CREATURE_GUARD + WG_CREATURE_CHAMPION
    SPELL_SLEEPING_SLEEP        = 42648,    // WG_CREATURE_CHAMPION
    SPELL_ARCANE_MISSILES       = 31743,    // WG_CREATURE_ENHANCEMENT_A
    SPELL_SLOW                  = 31741,    // WG_CREATURE_ENHANCEMENT_A
    SPELL_HEALING_WAVE          = 11986,    // WG_CREATURE_ENHANCEMENT_H
    SPELL_LIGHTNING_BOLT        = 9532,     // WG_CREATURE_ENHANCEMENT_H
    SPELL_QUICK_FLAME_WARD      = 4979,     // WG_CREATURE_ENHANCEMENT_H
    SPELL_MORTAL_STRIKE         = 15708,    // WG_CREATURE_QUESTGIVER_1 + WG_CREATURE_QUESTGIVER_2 + WG_CREATURE_QUESTGIVER_3 + WG_CREATURE_QUESTGIVER_4
    SPELL_HEAL                  = 34945,    // WG_CREATURE_QUESTGIVER_5_A
    SPELL_HOLY_NOVA             = 34944,    // WG_CREATURE_QUESTGIVER_5_A
    SPELL_POWER_WORD_SHIELD     = 17139,    // WG_CREATURE_QUESTGIVER_5_A
    SPELL_CLEAVE                = 15284     // WG_CREATURE_QUESTGIVER_5_H + WG_CREATURE_QUESTGIVER_6
};

enum NPC_WG_MISC_EVENTS
{
    EVENT_STRIKE = 1,
    EVENT_ARCANE_MISSILES,
    EVENT_SLOW,
    EVENT_HEALING_WAVE,
    EVENT_LIGHTNING_BOLT,
    EVENT_QUICK_FLAME_WARD,
    EVENT_MORTAL_STRIKE,
    EVENT_HEAL,
    EVENT_HOLY_NOVA,
    EVENT_CLEAVE
 };

class npc_wg_misc : public CreatureScript
{
public:
    npc_wg_misc() : CreatureScript("npc_wg_misc") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_wg_miscAI(pCreature);
    }

    struct npc_wg_miscAI : public ScriptedAI
    {
        npc_wg_miscAI(Creature* pCreature) : ScriptedAI(pCreature) {}

        EventMap events;
        OutdoorPvPWG *pvpWG;

        void Reset()
        {
            events.Reset();
            pvpWG = (OutdoorPvPWG*) sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);

            switch(me->GetEntry())
            {
                case WG_CREATURE_ENHANCEMENT_A:
                case WG_CREATURE_ENHANCEMENT_H:
                case WG_CREATURE_QUESTGIVER_5_A:
                    me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                    return;
            }

            switch(me->GetEntry())
            {
                case WG_CREATURE_CHAMPION_A:
                case WG_CREATURE_CHAMPION_H:
                    if (pvpWG && !pvpWG->isWarTime())
						me->SetVisible(false);
					else
						me->SetVisible(true);
                    break;
            }
        }

        void EnterCombat(Unit *who)
        {
            events.ScheduleEvent(EVENT_STRIKE, 5000);
            events.ScheduleEvent(EVENT_ARCANE_MISSILES, 500);
            events.ScheduleEvent(EVENT_SLOW, 100);
            events.ScheduleEvent(EVENT_HEALING_WAVE, 5000);
            events.ScheduleEvent(EVENT_LIGHTNING_BOLT, 500);
            events.ScheduleEvent(EVENT_QUICK_FLAME_WARD, 100);
            events.ScheduleEvent(EVENT_MORTAL_STRIKE, 5000);
            events.ScheduleEvent(EVENT_HEAL, 5000);
            events.ScheduleEvent(EVENT_HOLY_NOVA, 4000);
            events.ScheduleEvent(EVENT_CLEAVE, 5000);

            switch(me->GetEntry())
            {
                case WG_CREATURE_QUESTGIVER_5_A:
                    DoCast(me, SPELL_POWER_WORD_SHIELD);
                    break;
            }
        }

        void UpdateAI(const uint32 uiDiff)
        {
			switch(me->GetEntry())
            {
                case WG_CREATURE_CHAMPION_A:
                case WG_CREATURE_CHAMPION_H:
                    if (pvpWG && !pvpWG->isWarTime())
						me->SetVisible(false);
					else
						me->SetVisible(true);
                    break;
            }

            if (!UpdateVictim())
                return;

            events.Update(uiDiff);

            if (me->HasUnitState(UNIT_STAT_CASTING))
                return;

            while(uint32 eventId = events.ExecuteEvent())
            {
                switch(eventId)
                {
                    case EVENT_STRIKE:
                        switch(me->GetEntry())
                        {
                            case WG_CREATURE_GUARD_A:
                            case WG_CREATURE_GUARD_H:
                            case WG_CREATURE_CHAMPION_A:
                            case WG_CREATURE_CHAMPION_H:
                                DoCast(me->getVictim(), SPELL_STRIKE);
                                events.ScheduleEvent(EVENT_STRIKE, 5000);
                                return;
                        }
                    case EVENT_ARCANE_MISSILES:
                        switch(me->GetEntry())
                        {
                            case WG_CREATURE_ENHANCEMENT_A:
                                DoCast(me->getVictim(), SPELL_ARCANE_MISSILES);
                                events.ScheduleEvent(EVENT_ARCANE_MISSILES, 5000);
                                return;
                        }
                    case EVENT_SLOW:
                        switch(me->GetEntry())
                        {
                            case WG_CREATURE_ENHANCEMENT_A:
                                DoCast(me->getVictim(), SPELL_SLOW);
                                events.ScheduleEvent(EVENT_SLOW, 15000);
                                return;
                        }
                    case EVENT_HEALING_WAVE:
                        switch(me->GetEntry())
                        {
                            case WG_CREATURE_ENHANCEMENT_H:
                                if (HealthBelowPct(50))
                                    DoCast(me, SPELL_HEALING_WAVE);
                                events.ScheduleEvent(EVENT_HEALING_WAVE, 3000);
                                return;
                        }
                    case EVENT_LIGHTNING_BOLT:
                        switch(me->GetEntry())
                        {
                            case WG_CREATURE_ENHANCEMENT_H:
                                DoCast(me->getVictim(), SPELL_LIGHTNING_BOLT);
                                events.ScheduleEvent(EVENT_LIGHTNING_BOLT, 5000);
                                return;
                        }
                    case EVENT_QUICK_FLAME_WARD:
                        switch(me->GetEntry())
                        {
                            case WG_CREATURE_ENHANCEMENT_H:
                                DoCast(me, SPELL_QUICK_FLAME_WARD);
                                events.ScheduleEvent(EVENT_QUICK_FLAME_WARD, 10000);
                                return;
                        }
                    case EVENT_MORTAL_STRIKE:
                       switch(me->GetEntry())
                        {
                            case WG_CREATURE_QUESTGIVER_1_A:
                            case WG_CREATURE_QUESTGIVER_1_H:
                            case WG_CREATURE_QUESTGIVER_2_A:
                            case WG_CREATURE_QUESTGIVER_2_H:
                            case WG_CREATURE_QUESTGIVER_3_A:
                            case WG_CREATURE_QUESTGIVER_3_H:
                            case WG_CREATURE_QUESTGIVER_4_A:
                            case WG_CREATURE_QUESTGIVER_4_H:
                                DoCast(me->getVictim(), SPELL_MORTAL_STRIKE);
                                events.ScheduleEvent(EVENT_MORTAL_STRIKE, 10000);
                                return;
                        }
                    case EVENT_HEAL:
                        switch(me->GetEntry())
                        {
                            case WG_CREATURE_QUESTGIVER_5_A:
                                if (HealthBelowPct(50))
                                    DoCast(me, SPELL_HEAL);
                                events.ScheduleEvent(EVENT_HEAL, 5000);
                                return;
                        }
                    case EVENT_HOLY_NOVA:
                        switch(me->GetEntry())
                        {
                            case WG_CREATURE_QUESTGIVER_5_A:
                                DoCast(me, SPELL_HOLY_NOVA);
                                events.ScheduleEvent(EVENT_HOLY_NOVA, 8000);
                                return;
                        }
                    case EVENT_CLEAVE:
                        switch(me->GetEntry())
                        {
                            case WG_CREATURE_QUESTGIVER_5_H:
                            case WG_CREATURE_QUESTGIVER_6_A:
                            case WG_CREATURE_QUESTGIVER_6_H:
                                DoCast(me->getVictim(), SPELL_CLEAVE);
                                events.ScheduleEvent(EVENT_CLEAVE, 10000);
                                return;
                        }
                }
            }

            switch(me->GetEntry())
            {
                case WG_CREATURE_ENHANCEMENT_A:
                case WG_CREATURE_ENHANCEMENT_H:
                case WG_CREATURE_QUESTGIVER_5_A:
                    return;
                default:
                    DoMeleeAttackIfReady();
                    return;
            }
        }
    };
};

/*######
## Magister_Surdiel_Horde_Battle_Mage
######*/
class npc_magister_surdiel_horde_battle_mage : public CreatureScript
{
public:
    npc_magister_surdiel_horde_battle_mage() : CreatureScript("npc_magister_surdiel_horde_battle_mage") { }

    bool OnGossipHello(Player *player, Creature *_Creature)
    {

        if( (sWorld->GetWintergrapsState() == 1) && (sWorld->GetWintergrapsTimerToJoin() == 0) )
        {
            player->SendInitWorldStates(4197, 4197);
            player->SEND_GOSSIP_MENU(14775, _Creature->GetGUID());
        }

        if( (sWorld->GetWintergrapsState() == 1) && (sWorld->GetWintergrapsTimerToJoin() == 1) )
        {
            player->SendInitWorldStates(4197, 4197);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Queue for Wintergrasp", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->SEND_GOSSIP_MENU(14790, _Creature->GetGUID());
        }

        if(sWorld->GetWintergrapsState() == 0)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Queue for Wintergrasp", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
            player->SEND_GOSSIP_MENU(14777, _Creature->GetGUID());
        }

        return true;
    }

    bool OnGossipSelect(Player *player, Creature *_Creature, uint32 sender, uint32 action )
    {
        if(action == GOSSIP_ACTION_INFO_DEF+1)
        {
            player->CLOSE_GOSSIP_MENU();

            if (player->getLevel() > 74)
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                Group *pGroup = player->GetGroup();

                if(pGroup)
                {
                    for (GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
                    {
                        Player* Member = itr->getSource();
                        pvpWG->InviteInQueue(Member);
                    }
                }
                else
                    pvpWG->InviteInQueue(player);
            }
        }

        if(action == GOSSIP_ACTION_INFO_DEF+2)
        {
            player->CLOSE_GOSSIP_MENU();

            if (player->getLevel() > 74)
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                Group *pGroup = player->GetGroup();

                if(pGroup)
                {
                    for (GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
                    {
                        Player* Member = itr->getSource();
                        pvpWG->InviteToGame(Member);
                    }
                }
                else
                    pvpWG->InviteToGame(player);
            }
        }

        return true;
    }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new Magister_Surdiel_Horde_Battle_MageAI(pCreature);
    }

    struct Magister_Surdiel_Horde_Battle_MageAI : public ScriptedAI
    {
        Magister_Surdiel_Horde_Battle_MageAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            summoned = false;
            PortalGUID = 0;
        }

        uint64 PortalGUID;
        bool summoned;

        void Reset()
        {
            UnsummonPortal();
        }

        void UnsummonPortal()
        {
            if (summoned)
            {
                GameObject *PortalToWintergrasp = GameObject::GetGameObject(*me, PortalGUID);
                if (!PortalToWintergrasp)
                    PortalToWintergrasp = me->FindNearestGameObject(PORTAL_TO_WINTERGRASP, 10);
                if (PortalToWintergrasp)
                {
                    PortalToWintergrasp->Delete();
                    PortalGUID = 0;
                }
                summoned = false;
            }
       }

       void SummonPortal()
        {
            if (!summoned)
            {
                if(GameObject *PortalToWintergrasp = me->SummonGameObject(PORTAL_TO_WINTERGRASP, 5955.59f, 568.779f, 660.487f, 0, 0, 0, 0, 0, 0))
                {
                    PortalGUID = PortalToWintergrasp->GetGUID();
                    //Set Horde Faction
                    PortalToWintergrasp->SetUInt32Value(GAMEOBJECT_FACTION, 1801);
                }
                summoned = true;
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if(!(summoned))
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                if((pvpWG->getDefenderTeam() == TEAM_HORDE) && (sWorld->GetWintergrapsState() == 1))
                    SummonPortal();
                else
                    return;
            }

            if( (summoned) && (sWorld->GetWintergrapsState() == 1) )
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                if((pvpWG->getDefenderTeam() != TEAM_HORDE))
                    UnsummonPortal();
                else
                    return;
            }

            if((summoned) && (sWorld->GetWintergrapsState() == 0))
                UnsummonPortal();
        }
    };
};

/*######
## Horde_Battle_Mage
######*/
class npc_horde_battle_mage : public CreatureScript
{
public:
    npc_horde_battle_mage() : CreatureScript("npc_horde_battle_mage") { }

    bool OnGossipHello(Player *player, Creature *_Creature)
    {

        if( (sWorld->GetWintergrapsState() == 1) && (sWorld->GetWintergrapsTimerToJoin() == 0) )
        {
            player->SendInitWorldStates(4197, 4197);
            player->SEND_GOSSIP_MENU(14775, _Creature->GetGUID());
        }

        if( (sWorld->GetWintergrapsState() == 1) && (sWorld->GetWintergrapsTimerToJoin() == 1) )
        {
            player->SendInitWorldStates(4197, 4197);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Queue for Wintergrasp", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->SEND_GOSSIP_MENU(14790, _Creature->GetGUID());
        }

        if(sWorld->GetWintergrapsState() == 0)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Queue for Wintergrasp", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
            player->SEND_GOSSIP_MENU(14777, _Creature->GetGUID());
        }

        return true;
    }

    bool OnGossipSelect(Player *player, Creature *_Creature, uint32 sender, uint32 action )
    {
        if(action == GOSSIP_ACTION_INFO_DEF+1)
        {
            player->CLOSE_GOSSIP_MENU();

            if (player->getLevel() > 74)
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                Group *pGroup = player->GetGroup();

                if(pGroup)
                {
                    for (GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
                    {
                        Player* Member = itr->getSource();
                        pvpWG->InviteInQueue(Member);
                    }
                }
                else
                    pvpWG->InviteInQueue(player);
            }
        }

        if(action == GOSSIP_ACTION_INFO_DEF+2)
        {
            player->CLOSE_GOSSIP_MENU();

            if (player->getLevel() > 74)
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                Group *pGroup = player->GetGroup();

                if(pGroup)
                {
                    for (GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
                    {
                        Player* Member = itr->getSource();
                        pvpWG->InviteToGame(Member);
                    }
                }
                else
                    pvpWG->InviteToGame(player);
            }
        }

        return true;
    }
};

/*######
## Arcanist_Braedin_Alliance_Battle_Mage
######*/
class npc_arcanist_braedin_alliance_battle_mage : public CreatureScript
{
public:
    npc_arcanist_braedin_alliance_battle_mage() : CreatureScript("npc_arcanist_braedin_alliance_battle_mage") { }

    bool OnGossipHello(Player *player, Creature *_Creature)
    {

        if( (sWorld->GetWintergrapsState() == 1) && (sWorld->GetWintergrapsTimerToJoin() == 0) )
        {
            player->SendInitWorldStates(4197, 4197);
            player->SEND_GOSSIP_MENU(14782, _Creature->GetGUID());
        }

        if( (sWorld->GetWintergrapsState() == 1) && (sWorld->GetWintergrapsTimerToJoin() == 1) )
        {
            player->SendInitWorldStates(4197, 4197);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Queue for Wintergrasp", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->SEND_GOSSIP_MENU(14791, _Creature->GetGUID());
        }

        if(sWorld->GetWintergrapsState() == 0)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Queue for Wintergrasp", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
            player->SEND_GOSSIP_MENU(14781, _Creature->GetGUID());
        }

        return true;
    }

    bool OnGossipSelect(Player *player, Creature *_Creature, uint32 sender, uint32 action )
    {
        if(action == GOSSIP_ACTION_INFO_DEF+1)
        {
            player->CLOSE_GOSSIP_MENU();

            if (player->getLevel() > 74)
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                Group *pGroup = player->GetGroup();

                if(pGroup)
                {
                    for (GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
                    {
                        Player* Member = itr->getSource();
                        pvpWG->InviteInQueue(Member);
                    }
                }
                else
                    pvpWG->InviteInQueue(player);
            }
        }

        if(action == GOSSIP_ACTION_INFO_DEF+2)
        {
            player->CLOSE_GOSSIP_MENU();

            if (player->getLevel() > 74)
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                Group *pGroup = player->GetGroup();

                if(pGroup)
                {
                    for (GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
                    {
                        Player* Member = itr->getSource();
                        pvpWG->InviteToGame(Member);
                    }
                }
                else
                    pvpWG->InviteToGame(player);
            }
        }

        return true;
    }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new Arcanist_Braedin_Alliance_Battle_MageAI(pCreature);
    }

    struct Arcanist_Braedin_Alliance_Battle_MageAI : public ScriptedAI
    {
        Arcanist_Braedin_Alliance_Battle_MageAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            summoned = false;
            PortalGUID = 0;
        }

        uint64 PortalGUID;
        bool summoned;

        void Reset()
        {
            UnsummonPortal();
        }

        void UnsummonPortal()
        {
            if (summoned)
            {
                GameObject *PortalToWintergrasp = GameObject::GetGameObject(*me, PortalGUID);
                if (!PortalToWintergrasp)
                    PortalToWintergrasp = me->FindNearestGameObject(PORTAL_TO_WINTERGRASP, 10);
                if (PortalToWintergrasp)
                {
                    PortalToWintergrasp->Delete();
                    PortalGUID = 0;
                }
                summoned = false;
            }
        }

        void SummonPortal()
        {
            if (!summoned)
            {
                if(GameObject *PortalToWintergrasp = me->SummonGameObject(PORTAL_TO_WINTERGRASP, 5686.8f, 773.175f, 647.752f, 0, 0, 0, 0, 0, 0))
                {
                    PortalGUID = PortalToWintergrasp->GetGUID();
                    // Set Alliance Faction
                    PortalToWintergrasp->SetUInt32Value(GAMEOBJECT_FACTION, 1802);
                }
                summoned = true;
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if(!(summoned))
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                if((pvpWG->getDefenderTeam() == TEAM_ALLIANCE) && (sWorld->GetWintergrapsState() == 1))
                    SummonPortal();
                else
                    return;
            }

            if( (summoned) && (sWorld->GetWintergrapsState() == 1) )
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                if((pvpWG->getDefenderTeam() != TEAM_ALLIANCE))
                    UnsummonPortal();
                else
                    return;
            }

            if((summoned) && (sWorld->GetWintergrapsState() == 0))
                UnsummonPortal();
        }
    };
};

/*######
## Alliance_Battle_Mage
######*/
class npc_alliance_battle_mage : public CreatureScript
{
public:
    npc_alliance_battle_mage() : CreatureScript("npc_alliance_battle_mage") { }

    bool OnGossipHello(Player *player, Creature *_Creature)
    {

        if( (sWorld->GetWintergrapsState() == 1) && (sWorld->GetWintergrapsTimerToJoin() == 0) )
        {
            player->SendInitWorldStates(4197, 4197);
            player->SEND_GOSSIP_MENU(14782, _Creature->GetGUID());
        }

        if( (sWorld->GetWintergrapsState() == 1) && (sWorld->GetWintergrapsTimerToJoin() == 1) )
        {
            player->SendInitWorldStates(4197, 4197);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Queue for Wintergrasp", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->SEND_GOSSIP_MENU(14791, _Creature->GetGUID());
        }

        if(sWorld->GetWintergrapsState() == 0)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Queue for Wintergrasp", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
            player->SEND_GOSSIP_MENU(14781, _Creature->GetGUID());
        }

        return true;
    }

    bool OnGossipSelect(Player *player, Creature *_Creature, uint32 sender, uint32 action )
    {
        if(action == GOSSIP_ACTION_INFO_DEF+1)
        {
            player->CLOSE_GOSSIP_MENU();

            if (player->getLevel() > 74)
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                Group *pGroup = player->GetGroup();

                if(pGroup)
                {
                    for (GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
                    {
                        Player* Member = itr->getSource();
                        pvpWG->InviteInQueue(Member);
                    }
                }
                else
                    pvpWG->InviteInQueue(player);
            }
        }

        if(action == GOSSIP_ACTION_INFO_DEF+2)
        {
            player->CLOSE_GOSSIP_MENU();

            if (player->getLevel() > 74)
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                Group *pGroup = player->GetGroup();

                if(pGroup)
                {
                    for (GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
                    {
                        Player* Member = itr->getSource();
                        pvpWG->InviteToGame(Member);
                    }
                }
                else
                    pvpWG->InviteToGame(player);
            }
        }

        return true;
    }
};

#define NPC_MARSHAL_MAGRUDER 39172

/*######
## npc_marshal_magruder
######*/
class npc_marshal_magruder : public CreatureScript
{
public:
    npc_marshal_magruder() : CreatureScript("npc_marshal_magruder") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_marshal_magruderAI(pCreature);
    }

    struct npc_marshal_magruderAI : public ScriptedAI
    {
        npc_marshal_magruderAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            summoned = false;
            MarshalMagruderGUID = 0;
        }

        uint64 MarshalMagruderGUID;
        bool summoned;

        void Reset()
        {
            UnsummonNPC();
        }

        void UnsummonNPC()
        {
            if (summoned)
            {
                Creature* MarshalMagruder = Unit::GetCreature((*me), MarshalMagruderGUID);
                if (MarshalMagruder)
                {
                    MarshalMagruder->ForcedDespawn();
                    MarshalMagruderGUID = 0;
                }
                summoned = false;
            }
       }

       void SummonNPC()
        {
            if (!summoned)
            {
                if(Creature *MarshalMagruder = me->SummonCreature(NPC_MARSHAL_MAGRUDER, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN, 9000000))
                {
                    MarshalMagruderGUID = MarshalMagruder->GetGUID();
                }
                summoned = true;
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if(!(summoned))
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                if((pvpWG->getDefenderTeam() == TEAM_ALLIANCE) && (sWorld->GetWintergrapsState() == 1))
                    SummonNPC();
                else
                    return;
            }

            if( (summoned) && (sWorld->GetWintergrapsState() == 1) )
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                if((pvpWG->getDefenderTeam() != TEAM_ALLIANCE))
                    UnsummonNPC();
                else
                    return;
            }

            if((summoned) && (sWorld->GetWintergrapsState() == 0))
                UnsummonNPC();
        }
    };
};

#define NPC_CHAMPION_ROSSLAI 39173

/*######
## npc_champion_ros_slai
######*/
class npc_champion_ros_slai : public CreatureScript
{
public:
    npc_champion_ros_slai() : CreatureScript("npc_champion_ros_slai") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_champion_ros_slaiAI(pCreature);
    }

    struct npc_champion_ros_slaiAI : public ScriptedAI
    {
        npc_champion_ros_slaiAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            summoned = false;
            ChampionRosSlaiGUID = 0;
        }

        uint64 ChampionRosSlaiGUID;
        bool summoned;

        void Reset()
        {
            UnsummonNPC();
        }

        void UnsummonNPC()
        {
            if (summoned)
            {
                Creature* ChampionRosSlai = Unit::GetCreature((*me), ChampionRosSlaiGUID);
                if (ChampionRosSlai)
                {
                    ChampionRosSlai->ForcedDespawn();
                    ChampionRosSlaiGUID = 0;
                }
                summoned = false;
            }
       }

        void SummonNPC()
        {
            if (!summoned)
            {
                if(Creature *ChampionRosSlai = me->SummonCreature(NPC_CHAMPION_ROSSLAI, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN, 9000000))
                {
                    ChampionRosSlaiGUID = ChampionRosSlai->GetGUID();
                }
                summoned = true;
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if(!(summoned))
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                if((pvpWG->getDefenderTeam() == TEAM_HORDE) && (sWorld->GetWintergrapsState() == 1))
                    SummonNPC();
                else
                    return;
            }

            if( (summoned) && (sWorld->GetWintergrapsState() == 1) )
            {
                OutdoorPvPWG *pvpWG = (OutdoorPvPWG*)sOutdoorPvPMgr->GetOutdoorPvPToZoneId(4197);
                if((pvpWG->getDefenderTeam() != TEAM_HORDE))
                    UnsummonNPC();
                else
                    return;
            }

            if((summoned) && (sWorld->GetWintergrapsState() == 0))
                UnsummonNPC();
        }
    };
};

void AddSC_wintergrasp()
{
    new npc_demolisher_engineerer();
    new npc_wg_misc();
    new npc_magister_surdiel_horde_battle_mage();
    new npc_horde_battle_mage();
    new npc_arcanist_braedin_alliance_battle_mage();
    new npc_alliance_battle_mage();
    new npc_marshal_magruder();
    new npc_champion_ros_slai();
}