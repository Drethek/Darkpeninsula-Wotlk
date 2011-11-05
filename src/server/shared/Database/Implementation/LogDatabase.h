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

#ifndef _LOGDATABASE_H
#define _LOGDATABASE_H

#include "DatabaseWorkerPool.h"
#include "MySQLConnection.h"

class LogDatabaseConnection : public MySQLConnection
{
    public:
        //- Constructors for sync and async connections
        LogDatabaseConnection(MySQLConnectionInfo& connInfo) : MySQLConnection(connInfo) {}
        LogDatabaseConnection(ACE_Activation_Queue* q, MySQLConnectionInfo& connInfo) : MySQLConnection(q, connInfo) {}

        //- Loads databasetype specific prepared statements
        void DoPrepareStatements(bool m_prepare);
};

typedef DatabaseWorkerPool<LogDatabaseConnection> LogDatabaseWorkerPool;

enum LogDatabaseStatements
{
    /*  Naming standard for defines:
        {DB}_{SET/DEL/ADD/REP}_{Summary of data changed}
        When updating more than one field, consider looking at the calling function
        name for a suiting suffix.
    */

    LOGS_ADD_ITEM,
    LOGS_KILL_CREATURE,
    LOGS_KILL_CREATURE_GROUP,
    MAX_LOGDATABASE_STATEMENTS,
};

#endif
