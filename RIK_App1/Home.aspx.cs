using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using RIK_App1.Interfaces.SqlInsert;
using System.Globalization;
using System.Text;
using System.Web.Services;

namespace RIK_App1
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        }

        /// <summary>
        /// Redirect Participants.aspx
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnMoveToParticipants_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Participants.aspx?ID=" + ((LinkButton)sender).Text);
            string Id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Participants.aspx?ID=" + Id);
        }

        /// <summary>
        /// Redirect AddUserEvent.aspx
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        protected void BtnMoveToAddUserEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddUserEvent.aspx");
            BtnMoveToAddUserEvent.BackColor = System.Drawing.Color.Red;

        }

        //protected void GvComingEvents_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        ImageButton lb = (ImageButton)e.Row.FindControl("BtnDeleteEvent");
        //        lb.Attributes.Add("onclick", "return confirm('Are you sure to delete record with ID);");
        //    }
        //    //if (e.Row.RowType == DataControlRowType.DataRow)
        //    //{

        //    //    Control control = e.Row.Cells[0].Controls[4];
        //    //    if (control is LinkButton)
        //    //    {
        //    //        ((LinkButton)control).OnClientClick = "return confirm('Kas oled kindel, et kustutada sissekanne?')";
        //    //    }
        //    //}
        //}
    }
}