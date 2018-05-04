using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RIK_App1.Interfaces.SqlInsert
{
    interface ISqlCommands
    {
        void Sqlcommand(string procedure, params string[] @params);
    }
}