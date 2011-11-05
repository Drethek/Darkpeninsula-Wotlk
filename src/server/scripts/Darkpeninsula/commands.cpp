/*
 * Copyright (C) 2008-2010 TrinityCore <http://www.trinitycore.org/>
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
Name: dpr_commandscript
%Complete: 100
Comment: Remove Dual Spec
Category: commandscripts
EndScriptData */

#include "ScriptMgr.h"
#include "ObjectMgr.h"
#include "Chat.h"

#define SPELL_DUAL_SPEC 63651

class dpr_commandscript : public CommandScript
{
    public:
        dpr_commandscript() : CommandScript("dpr_commandscript") { }

        ChatCommand* GetCommands() const
        {
            static ChatCommand commandDarkpeninsulaTable[] =
            {
                { "rds",    SEC_MODERATOR,       false, &HandleRemoveDualSpecCommand,       "", NULL },
                { NULL,                  0,      false, NULL,                               "", NULL }
            };
            return commandDarkpeninsulaTable;
        }

        static bool HandleRemoveDualSpecCommand(ChatHandler* handler, const char* args)
        {
            std::string name;
            Player *player;
            char *TargetName = strtok((char*)args, " ");
            if (!TargetName)
            {
                player = handler->getSelectedPlayer();
                if (player)
                {
                    name = player->GetName();
                    normalizePlayerName(name);
                }
            }
            else
            {
                name = TargetName;
                normalizePlayerName(name);
                player = sObjectAccessor->FindPlayerByName(name.c_str());
            }
            
            if (!player)
            {
                handler->SendSysMessage(LANG_NO_CHAR_SELECTED);
                return false;
            }
            
            if (player)
            {
                player->ActivateSpec(1);
                player->resetTalents(true);
                player->SendTalentsInfoData(false);
                player->ActivateSpec(0);
                player->CastSpell(player, SPELL_DUAL_SPEC, true);
                handler->PSendSysMessage(LANG_RESET_TALENTS);
            }
            return true;
        }
};

void AddSC_dpr_commandscript()
{
    new dpr_commandscript();
}
