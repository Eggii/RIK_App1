using RIK_App1.Interfaces.SqlInsert;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RIK_App1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public SqlConnection connection;
        public SqlDataAdapter dataAdapter;
        public DataSet dataSet;
        public SqlCommand command;

        private string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //if DetailView.aspx have no querystring, then broken Detail view
                if (Request.QueryString["ID"] == null)
                {
                    Response.Redirect("Home.aspx");
                    
                }
                GetPersonData();
            }

            //Check if inserted Personal ID is correct format
            RegularExpressionValidatorPersonId.ValidationExpression = @"[0-9]{11}";
            RegularExpressionValidatorPersonId.ControlToValidate = "txtPersonPersonalId";
        }

        /// <summary>
        /// Get person data from tblPerson.
        /// </summary>
        void GetPersonData()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (connection = new SqlConnection(connectionString))
            {
                command = new SqlCommand
                {
                    CommandText = "spSelect_Person",
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure
                };

                command.Parameters.AddWithValue("@ID", Request.QueryString["ID"].ToString());
                connection.Open();
                SqlDataReader rdr = command.ExecuteReader();
                while (rdr.Read())
                {
                    txtPersonFirstName.Text = rdr.GetValue(1).ToString();
                    txtPersonSurname.Text = rdr.GetValue(2).ToString();
                    txtPersonPersonalId.Text = rdr.GetValue(3).ToString();
                    DDLPersonPayment.SelectedValue = rdr.GetValue(4).ToString();
                    txtPersonAdditionalInfo.Text = rdr.GetValue(5).ToString();
                }
            }
        }

        /// <summary>
        /// Update person, person participating in tblPerson
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnUpdatePerson_Click(object sender, EventArgs e)
        {
            using (connection = new SqlConnection(connectionString))
            {
                command = new SqlCommand
                {
                    Connection = connection,
                    CommandText = "spUpdate_Person"
                };

                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);
                command.Parameters.AddWithValue("@FirstName", txtPersonFirstName.Text);
                command.Parameters.AddWithValue("@Surname", txtPersonSurname.Text);
                command.Parameters.AddWithValue("@PersonalId", txtPersonPersonalId.Text);
                command.Parameters.AddWithValue("@Payment", DDLPersonPayment.SelectedItem.Text);
                command.Parameters.AddWithValue("@AdditionalInfo", txtPersonAdditionalInfo.Text);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// Redirect to Home.aspx
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnBackToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}