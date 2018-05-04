using RIK_App1.Interfaces.SqlInsert;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IdentityModel.Protocols.WSTrust;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RIK_App1
{
    public partial class Participants : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        public string storedProcedure;
        SqlConnection connection;
        SqlDataAdapter dataAdapter;
        SqlCommand command;
        DataSet dataset;

        /// <summary>
        /// Main Method for Participants.aspx
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //If query string is null, broken view
                if (Request.QueryString["ID"] == null)
                {
                    Response.Redirect("Home.aspx");

                    
                    
                }
                DlEventsDataBind();
                GvParticipantsDataBind();

                foreach (Control control in Page.Controls)
                {
                    if (control is TextBox txt)
                    {
                        txt.Text = "";
                    }
                }

                
            }
        }
        private void DlEventsDataBind()
        {

            using (connection = new SqlConnection())
            {
                storedProcedure = "spSelect_EventByID";
                dataAdapter = new SqlDataAdapter(storedProcedure, connectionString);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.AddWithValue("@ID", Request.QueryString["ID"]);
                DataSet dataset = new DataSet();
                dataAdapter.Fill(dataset);
                DlEvents.DataSource = dataset;
                DlEvents.DataBind();
            }
        }



        private void GvParticipantsDataBind()
        {

            using (connection = new SqlConnection())
            {
                storedProcedure = "spSelect_AllParticipantsInEvent";
                dataAdapter = new SqlDataAdapter(storedProcedure, connectionString);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.AddWithValue("@IdEvent", Request.QueryString["ID"]);
                dataset = new DataSet();
                dataAdapter.Fill(dataset);
                GvParticipants.DataSource = dataset;
                GvParticipants.DataBind();
            }
        }

        /// <summary>
        /// Insert new participant to database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnInsertParticipant_Click(object sender, EventArgs e)
        {
            //Check validation and participant type(person / company)
            if (Page.IsValid)
            {
                if (RblParticipantsType.SelectedValue == "1")
                {
                    InsertPerson();
                }

                if (RblParticipantsType.SelectedValue == "2")
                {
                    InsertCompany();
                }
                GvParticipantsDataBind();
            }

            //Check if all required fields are filled 
            if (!Page.IsValid)
            {
                lblValidationMessageForUser.Text = "Palun sisesta andmed tärniga tähistatud väljadesse.";
            }
        }

        /// <summary>
        /// Insert new person into tblPerson and tblPersonParticipaiding 
        /// </summary>
        private void InsertPerson()
        {
            using (connection = new SqlConnection(connectionString))
            {
                command = new SqlCommand
                {
                    Connection = connection,
                    CommandText = "spInsert_Into_tblPerson"
                };

                connection.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@FirstName", TxtPersonFirstName.Text);
                command.Parameters.AddWithValue("@Surname", TxtPersonSurname.Text);
                command.Parameters.AddWithValue("@PersonalId", TxtPersonPersonalID.Text);
                command.Parameters.AddWithValue("@PersonPayment", DdlPersonPayment.SelectedItem.Text);
                command.Parameters.AddWithValue("@PersonAdditionalInfo", TxtPersonAdditionalInfo.Text);
                command.Parameters.AddWithValue("@IdEvent", Request.QueryString["ID"]);
                command.ExecuteNonQuery();
            }
           
        }

        private void DeletePerson()
        {
            //int CategoryID = (int)GvParticipants.DataKeys[e.RowIndex].Value;
            using (connection = new SqlConnection(connectionString))
            {
                command = new SqlCommand
                {
                    Connection = connection,
                    CommandText = "spDelete_Person"
                };

                connection.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@IdEvent", 24);
                command.Parameters.AddWithValue("@IdParticipant", 12);
                command.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// Insert new company into tblCompany and tblCompanyParticipating
        /// </summary>
        private void InsertCompany()
        {
            using (connection = new SqlConnection(connectionString))
            {
                command = new SqlCommand
                {
                    Connection = connection,
                    CommandText = "spInsert_IntotblCompany"
                };

                connection.Open();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@CompanyName", TxtCompanyName.Text);
                command.Parameters.AddWithValue("@RegistryNumber", TxtCompanyParticipants.Text);
                command.Parameters.AddWithValue("@CompanyParticipants", TxtCompanyRegistryNumber.Text);
                command.Parameters.AddWithValue("@CompanyPayment", DdlCompanyPayment.SelectedItem.Text);
                command.Parameters.AddWithValue("@CompanyAdditionalInfo", TxtCompanyAdditionalInfo.Text);
                command.Parameters.AddWithValue("@IdEvent", Request.QueryString["ID"]);
                command.ExecuteNonQuery();
            }
        }


        protected void BtnBackToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                GvParticipants.EditIndex = rowIndex;
                GvParticipantsDataBind();
            }
            if (e.CommandName == "DeleteRow")
            {
                DeletePerson();
                
                GvParticipantsDataBind();
            }
            
           
            
        }
    }
}