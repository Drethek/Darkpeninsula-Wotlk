/* Copyright (C) 2006 - 2008 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SD%Complete: 100
SDName: Premium
SDComment: script utili per dpr
SDCategory: Script DPRCore
EndScriptData */

#include "ScriptPCH.h"
#include <cstring>

#define PREMIUM_NONE            0
#define PREMIUM_ITEM            1
#define PREMIUM_LEVEL           2
#define PREMIUM_GOLD            3
#define PREMIUM_HONOR           4
#define PREMIUM_ARENA           5
#define PREMIUM_CUSTOMIZE       6
#define PREMIUM_CHANGE_RACE     7
#define PREMIUM_CHANGE_FACTION  8

class npc_premium : public CreatureScript
{
public:
    npc_premium() : CreatureScript("npc_premium") { }

    uint32 GetRightEntry(Unit* player, uint32 temp_item)
	{
		for (std::map<uint32, uint32>::const_iterator it = sObjectMgr->factionchange_items.begin(); it != sObjectMgr->factionchange_items.end(); ++it)
		{
			uint32 item_alliance = it->first;
			uint32 item_horde = it->second;
			
			if(temp_item == item_alliance || temp_item == item_horde)
				return player->ToPlayer()->GetTeam() == ALLIANCE ? item_alliance : item_horde;
		}
		
		return temp_item;
	}

    bool Reward(Player *player, Creature *_Creature, const char* sCode)
    {
		if(!player)
			return false;

    int32 R_Type = 0;
    int32 R_Item = 0;
    int R_Count = 0;
    int32 R_Rewaded = 0;
    bool check = false;

    QueryResult pResult = ExtraDatabase.PQuery("SELECT `type`,`item`,`count`,`rewarded` FROM `Coupons` WHERE `coupon` = '%s'", sCode);

    if (pResult)
    {
        Field* pFields = pResult->Fetch();
        R_Type = pFields[0].GetInt32();
        R_Item = pFields[1].GetInt32();
        R_Count = pFields[2].GetInt32();
        R_Rewaded = pFields[3].GetInt32();

        if(R_Rewaded == 0)
        {
            if(R_Type <= PREMIUM_NONE)
                check = false;

            if(R_Type == PREMIUM_ITEM)
            {
				uint32 RightItem = GetRightEntry(player, R_Item);
                if(player->AddItem(RightItem, R_Count))
                {
                    check = true;
                }
                else
                {
                    _Creature->MonsterWhisper("Non puoi comprare questo oggetto.", player->GetGUID());
                }
            }

            if(R_Type == PREMIUM_LEVEL)
            {
                int livellicorrenti = player->getLevel();
                uint32 valore = abs(R_Count);
                int livellifinali = livellicorrenti + valore;

                if(livellifinali>80)
                {
                    _Creature->MonsterWhisper("Non puoi superare il livello 80.",player->GetGUID());
                    check = false;
                }
                else
                {
                    player->GiveLevel(uint8(livellifinali));
                    player->InitTalentForLevel();
                    player->SetUInt32Value(PLAYER_XP,0);
                    check = true;
                }
            }

            if(R_Type == PREMIUM_GOLD)
            {
                uint32 valore = abs(R_Count);
                if(player->GetMoney()+valore>2000000000)
                {
                    _Creature->MonsterWhisper("Hai troppi gold.",player->GetGUID());
                    check = false;
                }
                else if(valore)
                {
                    player->ModifyMoney(valore);
                    check = true;
                }
            }

            if(R_Type == PREMIUM_HONOR)
            {
                uint32 valore = abs(R_Count);
                if((player->GetHonorPoints()+valore)>75000)
                {
                    _Creature->MonsterWhisper("Hai troppo honor.",player->GetGUID());
                    check = false;
                }
                else if(valore)
                {
                    player->ModifyHonorPoints(valore);
                    check = true;
                }
            }

            if(R_Type == PREMIUM_ARENA)
            {
                uint32 valore = abs(R_Count);
                if((player->GetArenaPoints()+valore)>5000)
                {
                    _Creature->MonsterWhisper("Hai troppi punti arena.",player->GetGUID());
                    check = false;
                }
                else if(valore)
                {
                    player->ModifyArenaPoints(valore);
                    check = true;
                }
            }

            if(R_Type == PREMIUM_CUSTOMIZE)
            {
                player->SetAtLoginFlag(AT_LOGIN_CUSTOMIZE);
                SQLTransaction trans = CharacterDatabase.BeginTransaction();
                trans->PAppend("UPDATE characters SET at_login = at_login | '8' WHERE guid = '%u'", player->GetGUIDLow());
                CharacterDatabase.CommitTransaction(trans);
                _Creature->MonsterWhisper(LANG_CUSTOMIZE_PLAYER,player->GetGUID());
                check = true;
            }

            if(R_Type == PREMIUM_CHANGE_RACE)
            {
                player->SetAtLoginFlag(AT_LOGIN_CHANGE_RACE);
                SQLTransaction trans = CharacterDatabase.BeginTransaction();
                trans->PAppend("UPDATE characters SET at_login = at_login | '128' WHERE guid = %u", player->GetGUIDLow());
                CharacterDatabase.CommitTransaction(trans);
                _Creature->MonsterWhisper(LANG_CUSTOMIZE_PLAYER,player->GetGUID());
                check = true;
            }

            if(R_Type == PREMIUM_CHANGE_FACTION)
            {
                player->SetAtLoginFlag(AT_LOGIN_CHANGE_FACTION);
                SQLTransaction trans = CharacterDatabase.BeginTransaction();
                trans->PAppend("UPDATE characters SET at_login = at_login | '64' WHERE guid = %u", player->GetGUIDLow());
                CharacterDatabase.CommitTransaction(trans);
                _Creature->MonsterWhisper(LANG_CUSTOMIZE_PLAYER,player->GetGUID());
                check = true;
            }
        }
        else
        {
            _Creature->MonsterWhisper("Codice gia' utilizzato." ,player->GetGUID());
        }
    }
    else
    {
        _Creature->MonsterWhisper("Codice sbagliato. Perfavore immetti il codice giusto.",player->GetGUID());
    }
    return check;
}

bool OnGossipHello(Player *player, Creature *_Creature)
{
    uint32 idvendor = _Creature->GetEntry();
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Inserisci codice regalo", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1, "", 0, true);
	//player->ADD_GOSSIP_ITEM(0, "Goblin Al Momento Disabilitato", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
    player->ADD_GOSSIP_ITEM(0, "Esci", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);
    player->PlayerTalkClass->SendGossipMenu(idvendor,_Creature->GetGUID());
    return true;
}

bool OnGossipSelect(Player *player, Creature *_Creature, uint32 sender, uint32 action )
{
    if(action == GOSSIP_ACTION_INFO_DEF+2)
    {
        _Creature->MonsterWhisper("Arrivederci.",player->GetGUID());
        player->CLOSE_GOSSIP_MENU();
    }
    return true;
}

bool OnGossipSelectCode( Player *player, Creature *_Creature, uint32 sender, uint32 action, const char* sCode )
{
    if(sender == GOSSIP_SENDER_MAIN)
    {
        if(action == GOSSIP_ACTION_INFO_DEF+1)
        {
            if(Reward(player, _Creature, sCode))
            {
                SQLTransaction trans = ExtraDatabase.BeginTransaction();
                trans->PAppend("UPDATE `Coupons` SET `rewarded` = '1', `account` = '%u', `character` = '%u' WHERE `coupon` = '%s'", player->GetSession()->GetAccountId(), player->GetGUIDLow(),sCode);
                ExtraDatabase.CommitTransaction(trans);

                player->SaveToDB();
                _Creature->MonsterWhisper("Ecco il tuo regalo!",player->GetGUID());
                player->CLOSE_GOSSIP_MENU();
                return true;
            }
        }
    }
    player->CLOSE_GOSSIP_MENU();
    return true;
}
};

void AddSC_premium()
{
    new npc_premium;
}