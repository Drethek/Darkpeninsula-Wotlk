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

#include "LogDatabase.h"

void LogDatabaseConnection::DoPrepareStatements(bool m_prepare = false)
{
    if (!m_reconnecting)
        m_stmts.resize(MAX_LOGDATABASE_STATEMENTS);

    /*
        ##################################
        LOAD YOUR PREPARED STATEMENTS HERE
        ##################################
    */
	
    PREPARE_STATEMENT(LOGS_ADD_ITEM, "INSERT INTO `Players_Items` (`guid`, `item`, `count`, `received`, `created`, `date`) VALUES ('?', '?', '?', '?', '?', CURRENT_TIMESTAMP())", CONNECTION_ASYNC)
    PREPARE_STATEMENT(LOGS_KILL_CREATURE, "INSERT INTO `Players_Kills` (`entry`, `killer`, `raid`, `date`) VALUES ('?', '?', '?', '?', CURRENT_TIMESTAMP())", CONNECTION_ASYNC)
    PREPARE_STATEMENT(LOGS_KILL_CREATURE_GROUP, "INSERT INTO `Players_Groups` (`raid`, `player`) VALUES ('?', '?')", CONNECTION_ASYNC)
}
