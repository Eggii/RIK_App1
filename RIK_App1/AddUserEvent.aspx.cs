using RIK_App1.Interfaces.SqlInsert;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RIK_App1
{
    public partial class AddUserEvent : System.Web.UI.Page
    {
        SqlCommand command;
        SqlConnection connection;
        string connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Insert user event to database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (connection = new SqlConnection(connectionString))
            {
                //Create insert command.
                command = new SqlCommand
                {
                    CommandText = "spInsert_Into_tblEvent",
                    CommandType = CommandType.StoredProcedure,
                    Connection = connection
                };

                // Add parameters for the insert command.
                
                command.Parameters.AddWithValue("@EventName", TxtEventName.Text);
                command.Parameters.AddWithValue("@DateTime",Convert.ToDateTime(TxtEventDateTime.Text).ToString("dd.MM.yy HH:mm"));
                command.Parameters.AddWithValue("@Location", TxtEventLocation.Text);
                command.Parameters.AddWithValue("@EventAdditionalInfo", TxtEventAdditionalInfo.Text);

                command.Connection.Open();
                command.ExecuteNonQuery();

                //Message for user if execute was successful
                lblMessage.Text = "Teie andmed on sisestatud.";
                lblMessage.ForeColor = ColorTranslator.FromHtml("#005AA1");
            }
        }
       
        /// <summary>
        /// Method for Redirecting ~/Home.aspx
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnBackToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}