using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace commande_et_achat
{
    public partial class facture : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                try
                {

                    int idcomm = int.Parse(Session["idDerniereCommande"].ToString());
                    DataTable dt = new DataTable();
                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "select * from Commande where id = @idcomm";
                    cmd.Connection = con;
                    cmd.Parameters.Add("@idcomm", SqlDbType.Int);
                    cmd.Parameters["@idcomm"].Value = idcomm;
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        LabelNumFacture.Text = "Facture N° : " + dt.Rows[0]["id"].ToString();

                        DateTime date = new DateTime();
                        date = Convert.ToDateTime(dt.Rows[0]["dateC"].ToString());

                        LabelDate.Text = "Date : " +date.ToShortDateString();
                        LabelNom.Text = "Nom : " + dt.Rows[0]["clientNom"].ToString();
                        LabelPrenom.Text = "Prenom : " + dt.Rows[0]["clientPrenom"].ToString();
                    }
                    con.Close();

                    /**/
                    int totalQ = 0;
                    float totalP = 0;
                    DataTable dt2 = new DataTable();
                    SqlCommand cmdP = new SqlCommand("ListerProduitsCommandes", con);
                    cmdP.CommandType = CommandType.StoredProcedure;

                    cmdP.Parameters.Add("@idC", SqlDbType.Int);
                    cmdP.Parameters["@idC"].Value = idcomm;
                    con.Open();
                    SqlDataAdapter da2 = new SqlDataAdapter(cmdP);
                    da2.Fill(dt2);
                    ListView1.DataSource = dt2;
                    ListView1.DataBind();

                    for (int i = 0; i < dt2.Rows.Count; i++)
                    {
                        totalQ += int.Parse(dt2.Rows[i]["quantite"].ToString());
                        totalP += float.Parse(dt2.Rows[i]["prix"].ToString());
                    }

                    Label lblQ = (Label)ListView1.FindControl("LabelTotalQ");
                    lblQ.Text = totalQ.ToString();

                    Label lblP = (Label)ListView1.FindControl("LabelTotalP");
                    lblP.Text = totalP.ToString()+" DH";

                    con.Close();
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(typeof(Page), "closePage", "<script type='text/JavaScript'>window.close();</script>");
                }

            }
        }
    }
}