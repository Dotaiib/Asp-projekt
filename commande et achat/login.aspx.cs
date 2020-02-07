using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace commande_et_achat
{
    public partial class login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString; 

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnLogin_Click(object sender , EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select * from Administrateur where email = @email and motDePasse = @motDePasse";
                cmd.Connection = con;

                cmd.Parameters.Add("@email", SqlDbType.NVarChar);
                cmd.Parameters["@email"].Value = txtEmail.Text;

                cmd.Parameters.Add("@motDePasse", SqlDbType.NVarChar);
                cmd.Parameters["@motDePasse"].Value = txtPass.Text;


                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Session["admin"] = dt.Rows[0][0].ToString();
                    Response.Redirect("adminPage.aspx");
                }
                else
                {
                    status.Text = "Email ou Mot de passe incorrecte !";
                    status.ForeColor = System.Drawing.Color.Red;
                }
               
                
            }
            catch(Exception ex)
            {
                status.Text = "Une erreur inconnu !";
                status.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}