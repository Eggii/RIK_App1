using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RIK_App1.Models
{
    public class Person
    {
        public int ID { get; set; }
        public string FirstName { get; set; }
        public string Surname { get; set; }
        public string PersonalId { get; set; }
        public string Payment { get; set; }
        public string AdditionalInfo { get; set; }
    }
}