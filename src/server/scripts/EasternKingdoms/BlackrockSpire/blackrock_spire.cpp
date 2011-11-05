/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
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

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "blackrock_spire.h"

enum Creatures
{
    NPC_ROOKERY_WHELP = 10161
};

class npc_rookey_whelp : public CreatureScript
{
public:
    npc_rookey_whelp() : CreatureScript("npc_rookey_whelp") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_rookey_whelpAI(creature);
    }

    struct npc_rookey_whelpAI : public ScriptedAI
    {
        npc_rookey_whelpAI(Creature* c) : ScriptedAI(c)
        {
            pInstance = c->GetInstanceScript();
        }

        InstanceScript* pInstance;

        void Reset() {}
    
        void JustDied(Unit *who)
        {
            if (pInstance)
                pInstance->SetData(DATA_WHELP_DEATH_COUNT, pInstance->GetData(DATA_WHELP_DEATH_COUNT)+1);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }
    };
};

/*######
+## go_rookey_egg
+######*/


void AddSC_blackrock_spire()
{
    new npc_rookey_whelp();
}
