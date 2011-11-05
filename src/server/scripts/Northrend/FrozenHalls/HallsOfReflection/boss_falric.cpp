/* Copyright (C) 2008 - 2010 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006 - 2010 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

 /* ScriptData
 SDName: boss_falric
 SD%Complete: 0%
 SDComment: new script for tc implementation.
 SDCategory: Halls of Reflection
 EndScriptData */

#include "ScriptPCH.h"
#include "halls_of_reflection.h"

enum Spells
{
    SAY_FALRIC_AGGRO                        = -1668050,
    SAY_FALRIC_DEATH                        = -1668053,
    SAY_FALRIC_SLAY01                       = -1668051,
    SAY_FALRIC_SLAY02                       = -1668052,
    SAY_FALRIC_SP01                         = -1668054,
    SAY_FALRIC_SP02                         = -1668055,

    SPELL_HOPELESSNESS_N                    = 72395,
    SPELL_HOPELESSNESS_H                    = 72390,
    SPELL_IMPENDING_DESPAIR                 = 72426,
    SPELL_DEFILING_HORROR_N                 = 72435,
    SPELL_DEFILING_HORROR_H                 = 72452,
    SPELL_QUIVERING_STRIKE_N                = 72422,
    SPELL_QUIVERING_STRIKE_H                = 72453,

    SPELL_BERSERK                           = 47008
};

class boss_falric : public CreatureScript
{
public:
    boss_falric() : CreatureScript("boss_falric") { }

    struct boss_falricAI : public ScriptedAI
    {
        boss_falricAI(Creature *creature) : ScriptedAI(creature)
        {
            m_pInstance = (InstanceScript*)creature->GetInstanceScript();
            Regular = creature->GetMap()->IsRegularDifficulty();
            Reset();
        }

        InstanceScript* m_pInstance;
        bool Regular;
        bool m_bIsCall;
        bool m_bIsWipe;
        bool m_AreaTrigger;

        //FUNCTIONS
        uint8 SummonCount;
        uint32 m_uiBerserkTimer;
        uint32 m_uiGrowlTimer;
        uint32 m_uiHorrorTimer;
        uint32 m_uiStrikeTimer;
        uint32 m_uiSummonTimer;
        uint32 m_uiLocNo;
        uint32 m_uiCheckSummon;
        uint64 m_uiSummonGUID[16];
        uint64 summon;

        void Reset()
        {
            m_uiBerserkTimer = 180000;
            SummonCount = 1;
            m_bIsCall = false;
            m_bIsWipe = false;
            m_AreaTrigger = false;
            m_uiGrowlTimer = 20000;
            m_uiHorrorTimer = urand(14000,20000);
            m_uiStrikeTimer = 2000;
            m_uiSummonTimer = 11000;
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            if(m_pInstance->GetData(TYPE_FALRIC) == IN_PROGRESS)
            {
                m_pInstance->SetData(TYPE_FALRIC, SPECIAL);
                me->SetVisible(true);
            }
            else
                me->SetVisible(false);
        }

        void EnterCombat(Unit* victim)
        {
            DoScriptText(SAY_FALRIC_AGGRO, me);
            DoCast(me, DUNGEON_MODE(SPELL_HOPELESSNESS_N, SPELL_HOPELESSNESS_H));
        }

        void KilledUnit(Unit* victim)
        {
            switch(urand(0,1))
            {
                case 0: DoScriptText(SAY_FALRIC_SLAY01, me); break;
                case 1: DoScriptText(SAY_FALRIC_SLAY02, me); break;
            }
        }

        void JustDied(Unit* killer)
        {
            if(!m_pInstance)
                return;
            else 
            {
                m_pInstance->SetData(TYPE_FALRIC, DONE);
                m_pInstance->SetData(TYPE_MARWYN, SPECIAL);

                if (Creature* marwyn = ObjectAccessor::GetCreature(*me, m_pInstance->GetData64(NPC_MARWYN)))
                    marwyn->AI()->DoAction(0);
            }
            DoScriptText(SAY_FALRIC_DEATH, me);
        }

        void DoAction(const int32 actionId)
        {
            switch(actionId)
            {
                case 0:
                    m_AreaTrigger = true;
                    break;
                default:
                    break;
            }
        }

        void AttackStart(Unit* who) 
        { 
            if(!m_pInstance)
                return;

            if(m_pInstance->GetData(TYPE_FALRIC) != IN_PROGRESS)
                return; 

            ScriptedAI::AttackStart(who);
        }

        void Summon()
        {
            m_uiLocNo = 0;

            for(uint8 i = 0; i < 14; i++)
            {
                switch(urand(0,3))
                {
                    case 0:
                        switch(urand(1, 3))
                        {
                            case 1: summon = NPC_DARK_1; break;
                            case 2: summon = NPC_DARK_3; break;
                            case 3: summon = NPC_DARK_6; break;
                        }
                        break;
                    case 1: 
                        switch(urand(1, 3))
                        {
                            case 1: summon = NPC_DARK_2; break;
                            case 2: summon = NPC_DARK_3; break;
                            case 3: summon = NPC_DARK_4; break;
                        }
                        break;
                    case 2: 
                        switch(urand(1, 3))
                        {
                            case 1: summon = NPC_DARK_2; break;
                            case 2: summon = NPC_DARK_5; break;
                            case 3: summon = NPC_DARK_6; break;
                        }
                        break;
                    case 3: 
                        switch(urand(1, 3))
                        {
                            case 1: summon = NPC_DARK_1; break;
                            case 2: summon = NPC_DARK_5; break;
                            case 3: summon = NPC_DARK_4; break;
                        }
                        break;
                }

                m_uiCheckSummon = 0;

                if(Creature* Summon = me->SummonCreature(summon, SpawnLoc[m_uiLocNo].x, SpawnLoc[m_uiLocNo].y, SpawnLoc[m_uiLocNo].z, SpawnLoc[m_uiLocNo].o, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000))
                {
                    m_uiSummonGUID[i] = Summon->GetGUID();
                    Summon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    Summon->setFaction(974);
                    Summon->SetReactState(REACT_PASSIVE); 
                }
                m_uiLocNo++;
            }
        }

        void CallFallSoldier()
        {
            for(uint8 i = 0; i < 4; i++)
            {
                if(Creature* Summon = m_pInstance->instance->GetCreature(m_uiSummonGUID[m_uiCheckSummon]))
                {
                    Summon->setFaction(14);
                    Summon->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    Summon->SetReactState(REACT_AGGRESSIVE);
                    Summon->SetInCombatWithZone();
                }

                m_uiCheckSummon++;
            }
        }

        bool isPlayersAlive()
        {
            Map::PlayerList const &players = m_pInstance->instance->GetPlayers();
            if (!players.isEmpty())
                if (Player* player = players.begin()->getSource())
                    if(player->isAlive())
                        return true;
            return false;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if(!m_pInstance) return;

            if (m_pInstance->GetData(TYPE_FALRIC) == SPECIAL) 
            {
                if(!m_bIsCall) 
                {
                   m_bIsCall = true;
                   Summon();
                }

                if(m_bIsCall && !m_bIsWipe && !isPlayersAlive())
                {
                    if(m_pInstance)
                        m_pInstance->SetData(TYPE_WIPE_INTRO, 0);

                    m_AreaTrigger = false;
                    m_bIsWipe = true;
                }

                if(m_bIsWipe)
                {
                    SummonCount = 0;
                    for(uint8 i = 0; i < 14; i++)
                        if(Creature* Sum = m_pInstance->instance->GetCreature(m_uiSummonGUID[i]))
                            Sum->DespawnOrUnsummon();
                    m_uiSummonTimer = 11000;
                    m_bIsWipe = false;
                }

                if (m_uiSummonTimer < uiDiff) 
                {
                    if(m_AreaTrigger)
                    {
                        if(SummonCount == 0)
                        {
                            ++SummonCount;
                            for(uint8 i = 0; i < 14; i++)
                                if(Creature* Sum = m_pInstance->instance->GetCreature(m_uiSummonGUID[i]))
                                    continue;
                                else
                                    Summon();
                                m_pInstance->SetData(TYPE_WIPE_INTRO, 1);
                        }

                        ++SummonCount;
                        if(SummonCount > 5) 
                        {
                            m_pInstance->SetData(TYPE_FALRIC, IN_PROGRESS);
                            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            me->SetInCombatWithZone();
                        }
                        else
                            CallFallSoldier();

                        m_uiSummonTimer = 60000;
                    }
                    else
                        m_uiSummonTimer = 11000;
                } else m_uiSummonTimer -= uiDiff;
            }

            if (!UpdateVictim())
                return;

            if(m_uiStrikeTimer < uiDiff)
            {
                DoCast(me->getVictim(), Regular ? SPELL_QUIVERING_STRIKE_N : SPELL_QUIVERING_STRIKE_H);
                m_uiStrikeTimer = (urand(7000, 14000));
            }
            else m_uiStrikeTimer -= uiDiff;

            if(m_uiHorrorTimer < uiDiff)
            {
                DoScriptText(SAY_FALRIC_SP01, me);
                if(Unit *target = SelectTarget(SELECT_TARGET_RANDOM))
                   DoCast(target, SPELL_IMPENDING_DESPAIR);
                m_uiHorrorTimer = (urand(15000, 25000));
            }
            else m_uiHorrorTimer -= uiDiff;

            if(m_uiGrowlTimer < uiDiff)
            {
                DoScriptText(SAY_FALRIC_SP02, me);
                DoCast(me->getVictim(), Regular ? SPELL_DEFILING_HORROR_N : SPELL_DEFILING_HORROR_H);
                m_uiGrowlTimer = (urand(25000, 30000));
            }
            else m_uiGrowlTimer -= uiDiff;

            if (m_uiBerserkTimer < uiDiff)
            {
                DoCast(me, SPELL_BERSERK);
                m_uiBerserkTimer = 180000;
            } else  m_uiBerserkTimer -= uiDiff;

            DoMeleeAttackIfReady();  

            return;
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_falricAI(creature);
    }
 
};
 
class at_falric_event_starter : public AreaTriggerScript
{
    public:
        at_falric_event_starter() : AreaTriggerScript("at_falric_event_starter") { }
 
        bool OnTrigger(Player* player, const AreaTriggerEntry* /*at*/)
        {
            InstanceScript* instance = player->GetInstanceScript();
            if (player->isGameMaster() || !instance)
                return false;
 
            if (Creature* falric = ObjectAccessor::GetCreature(*player, instance->GetData64(NPC_FALRIC)))
            {
                if(falric->isAlive())
                {
                    falric->AI()->DoAction(0);
                    return true;
                }
            }
 
            if (Creature* marwyn = ObjectAccessor::GetCreature(*player, instance->GetData64(NPC_MARWYN)))
            {
                if(marwyn->isAlive())
                {
                    marwyn->AI()->DoAction(0);
                    return true;
                }
            }
            return false;
        }
 
};

void AddSC_boss_falric()
{
    new boss_falric();
    new at_falric_event_starter();
}
