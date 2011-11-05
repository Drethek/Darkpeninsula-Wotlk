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
SDName: Darkpeninsula Misc
SD%Complete: 100
SDComment: Reward System Require Extra Database Patch
SDCategory: Darkpeninsula Scripts
EndScriptData */

#include "ScriptPCH.h"
#include "ScriptMgr.h"

enum eRewardType
{
    REWARD_ACHIEVEMENT     = 1,
    REWARD_ITEM            = 2,
    REWARD_LEVEL           = 3,
    REWARD_HONOR           = 4,
    REWARD_ARENA           = 5,
    REWARD_GOLD            = 6,
    REWARD_CUSTOMIZE       = 7,
    REWARD_CHANGE_RACE     = 8,
    REWARD_CHANGE_FACTION  = 9

};

class DarkpeninsulaRewardSystem : public PlayerScript
{
    public:

        DarkpeninsulaRewardSystem() : PlayerScript("Darkpeninsula_Reward_System")
        {
        }

        void OnLogin(Player* player)
        {
            if(!player)
                return;
            
            QueryResult pResult = ExtraDatabase.PQuery("SELECT `id`,`type`,`entry`,`count` FROM `Rewards` WHERE `player` = '%u' AND `status` = '0';", player->GetGUIDLow());
            
            if (pResult)
            {
                do
                {
                    Field *fields3 = pResult->Fetch();

                    uint32 R_ID     = fields3[0].GetUInt32();
                    uint32 R_Type   = fields3[1].GetUInt32();
                    uint32 R_Entry  = fields3[2].GetUInt32();
                    int R_Count  = fields3[3].GetUInt32();


                    if(R_Type == REWARD_ACHIEVEMENT)
                    {
                        if (AchievementEntry const* pAE = GetAchievementStore()->LookupEntry(R_Entry))
                        {
                            player->CompletedAchievement(pAE);
                            SQLTransaction trans = ExtraDatabase.BeginTransaction();
                            trans->PAppend("UPDATE `Rewards` SET `status` = '1' WHERE `id` = '%u'", R_ID);
                            ExtraDatabase.CommitTransaction(trans);
                            player->SaveToDB();
                        }
                    }                   
                    
                    if(R_Type == REWARD_ITEM)
                    {
                        if(player->AddItem(R_Entry, R_Count))
                        {
                            SQLTransaction trans = ExtraDatabase.BeginTransaction();
                            trans->PAppend("UPDATE `Rewards` SET `status` = '1' WHERE `id` = '%u'", R_ID);
                            ExtraDatabase.CommitTransaction(trans);
                            player->SaveToDB();
                        }
                    }
                    
                    if(R_Type == REWARD_LEVEL)
                    {
                        int livellicorrenti = player->getLevel();
                        uint32 valore = abs(R_Count);
                        int livellifinali = livellicorrenti + valore;
                        
                        if(livellifinali < 81)
                        {
                            player->GiveLevel(uint8(livellifinali));
                            player->InitTalentForLevel();
                            player->SetUInt32Value(PLAYER_XP,0);

                            SQLTransaction trans = ExtraDatabase.BeginTransaction();
                            trans->PAppend("UPDATE `Rewards` SET `status` = '1' WHERE `id` = '%u'", R_ID);
                            ExtraDatabase.CommitTransaction(trans);
                            player->SaveToDB();
                        }
                    }
                    
                    if(R_Type == REWARD_GOLD)
                    {
                        uint32 valore = abs(R_Count);
                        if(player->GetMoney()+valore < 2000000000)
                        {
                            player->ModifyMoney(valore);

                            SQLTransaction trans = ExtraDatabase.BeginTransaction();
                            trans->PAppend("UPDATE `Rewards` SET `status` = '1' WHERE `id` = '%u'", R_ID);
                            ExtraDatabase.CommitTransaction(trans);
                            player->SaveToDB();
                        }
                    }
                    
                    if(R_Type == REWARD_HONOR)
                    {
                        uint32 valore = abs(R_Count);
                        if((player->GetHonorPoints()+valore) < 75000)
                        {
                            player->ModifyHonorPoints(valore);

                            SQLTransaction trans = ExtraDatabase.BeginTransaction();
                            trans->PAppend("UPDATE `Rewards` SET `status` = '1' WHERE `id` = '%u'", R_ID);
                            ExtraDatabase.CommitTransaction(trans);
                            player->SaveToDB();
                        }
                    }
                    
                    if(R_Type == REWARD_ARENA)
                    {
                        uint32 valore = abs(R_Count);
                        if((player->GetArenaPoints()+valore) < 5000)
                        {
                            player->ModifyArenaPoints(valore);

                            SQLTransaction trans = ExtraDatabase.BeginTransaction();
                            trans->PAppend("UPDATE `Rewards` SET `status` = '1' WHERE `id` = '%u'", R_ID);
                            ExtraDatabase.CommitTransaction(trans);
                            player->SaveToDB();
                        }
                    }
                    
                    if(R_Type == REWARD_CUSTOMIZE)
                    {
                        player->SetAtLoginFlag(AT_LOGIN_CUSTOMIZE);
                        SQLTransaction trans = CharacterDatabase.BeginTransaction();
                        trans->PAppend("UPDATE characters SET at_login = at_login | '8' WHERE guid = '%u'", player->GetGUIDLow());
                        CharacterDatabase.CommitTransaction(trans);
                        
                        SQLTransaction trans2 = ExtraDatabase.BeginTransaction();
                        trans2->PAppend("UPDATE `Rewards` SET `status` = '1' WHERE `id` = '%u'", R_ID);
                        ExtraDatabase.CommitTransaction(trans2);
                        player->SaveToDB();
                    }
                    
                    if(R_Type == REWARD_CHANGE_RACE)
                    {
                        player->SetAtLoginFlag(AT_LOGIN_CHANGE_RACE);
                        SQLTransaction trans = CharacterDatabase.BeginTransaction();
                        trans->PAppend("UPDATE characters SET at_login = at_login | '128' WHERE guid = %u", player->GetGUIDLow());
                        CharacterDatabase.CommitTransaction(trans);
                        
                        SQLTransaction trans2 = ExtraDatabase.BeginTransaction();
                        trans2->PAppend("UPDATE `Rewards` SET `status` = '1' WHERE `id` = '%u'", R_ID);
                        ExtraDatabase.CommitTransaction(trans2);
                        player->SaveToDB();
                    }
                    
                    if(R_Type == REWARD_CHANGE_FACTION)
                    {
                        player->SetAtLoginFlag(AT_LOGIN_CHANGE_FACTION);
                        SQLTransaction trans = CharacterDatabase.BeginTransaction();
                        trans->PAppend("UPDATE characters SET at_login = at_login | '64' WHERE guid = %u", player->GetGUIDLow());
                        CharacterDatabase.CommitTransaction(trans);

                        SQLTransaction trans2 = ExtraDatabase.BeginTransaction();
                        trans2->PAppend("UPDATE `Rewards` SET `status` = '1' WHERE `id` = '%u'", R_ID);
                        ExtraDatabase.CommitTransaction(trans2);
                        player->SaveToDB();
                    }
                    
                } while (pResult->NextRow());
            }
            return;
        }
};

void AddSC_darkpeninsula_misc()
{
    new DarkpeninsulaRewardSystem();
}
