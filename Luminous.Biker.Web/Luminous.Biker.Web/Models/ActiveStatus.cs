using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Luminous.Biker.Web.Models
{
    public class ActiveStatus
    {
        public int Id { get; set; }
        public string StatusValue { get; set; }

        public static IEnumerable<ActiveStatus> GetIEStatus()
        {
            return new List<ActiveStatus> 
            {
                new ActiveStatus{ Id = 1, StatusValue = "Active"},
                new ActiveStatus{ Id = 1, StatusValue = "Inactive"},
                new ActiveStatus{ Id = 1, StatusValue = "Blocked"}
            };
        }
    }
}