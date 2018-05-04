using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RIK_App1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        /// <summary>
        /// Main Method
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Navbar button NavLinkAddUserEvent, redirect method to AddUserEvent.aspx
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void NavLinkAddUserEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddUserEvent.aspx");
            NavLinkAddUserEvent.BackColor = System.Drawing.ColorTranslator.FromHtml("#6610f2");
        }

        /// <summary>
        /// Navbar button NavLinkAvaleht, redirect method to Home.aspx
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void NavLinkAvaleht_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        /// <summary>
        /// Navbar button BtnLogo, redirect method to Home.aspx 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnLogo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}