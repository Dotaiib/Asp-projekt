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
    public partial class shop : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
      

                if (Session["packChoisie"].ToString() != "")
                {

                    string pack = Session["packChoisie"].ToString();
                    if (pack == "pack10")
                    {
                        Panel1.Visible = true;
                       
                    }
                    if (pack == "pack20")
                    {
                        Panel2.Visible = true;
                    }
                    if (pack == "pack40")
                    {
                        Panel3.Visible = true;
                       
                    }
                    if (pack == "pack50")
                    {
                        Panel4.Visible = true;
                    }

                }
                else
                {
                    Panel5.Visible = true;
                }


            if (!IsPostBack)
            {
                if(Panel1.Visible == true)
                {
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter("select * from Produit where quantite > 0", con);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ListView1.DataSource = dt;
                    ListView1.DataBind();
                    con.Close();
                }
                
                if(Panel2.Visible == true)
                {
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter("select * from Produit where quantite > 0", con);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ListView2.DataSource = dt;
                    ListView2.DataBind();
                    con.Close();
                }

                if(Panel3.Visible == true)
                {
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter("select * from Produit where quantite > 0", con);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ListView3.DataSource = dt;
                    ListView3.DataBind();
                    con.Close();
                }

                if (Panel4.Visible == true)
                {
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter("select * from Produit where quantite > 0", con);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ListView4.DataSource = dt;
                    ListView4.DataBind();
                    con.Close();
                }
                
            }
          
         }

        protected void ValiderPack50_Click(object sender, EventArgs e) /**pack 50*/
        {
            
                if (Page.IsValid)
                {
                    try
                    {
                        bool valide = true;
                        int[] test = new int[50];
                        int i = 0;
                        int[] quantites = new int[50];
                        int[] ids = new int[50];
                        foreach (ListViewItem item in ListView4.Items)
                        {
                            string lblId = ((Label)item.FindControl("lblid")).Text;
                            string txtQ = ((TextBox)item.FindControl("txtQuantiteSaisie")).Text;
                            int quantiteExiste = int.Parse(((Label)item.FindControl("stock")).Text);
                            if (txtQ != "0" && txtQ != string.Empty )
                            {
                                int q = int.Parse(txtQ);
                                if (q > quantiteExiste)
                                {
                                    valide = false;
                                 }
                                if (q > 0 )
                                {
                                    quantites[i] = int.Parse(txtQ);
                                    ids[i] = int.Parse(lblId);
                                    i++;
                                }
                                

                            }
                           
                        }
                        if (valide == true)
                        {


                            int totalQ = 0;
                            for (int k = 0; k < quantites.Length; k++)
                            {
                                totalQ += quantites[k];
                            }
                            if (totalQ == 50)
                            {
                                SqlConnection con = new SqlConnection(cs);
                                int idCommande;
                                SqlCommand cmdC = new SqlCommand("AjouterCommande", con);
                                cmdC.CommandType = CommandType.StoredProcedure;

                                cmdC.Parameters.Add("@Nom", SqlDbType.VarChar);
                                cmdC.Parameters["@Nom"].Value = txtNomPack50.Text;

                                cmdC.Parameters.Add("@Prenom", SqlDbType.VarChar);
                                cmdC.Parameters["@Prenom"].Value = txtPrenomPack50.Text;

                                cmdC.Parameters.Add("@idCommande", SqlDbType.Int);
                                cmdC.Parameters["@idCommande"].Direction = ParameterDirection.Output;
                                con.Open();
                                cmdC.ExecuteNonQuery();
                                con.Close();
                                idCommande = Convert.ToInt32(cmdC.Parameters["@idCommande"].Value);

                                con.Open();
                                for (int j = 0; j < quantites.Length; j++)/*Ajouter les produit commandées*/
                                {
                                    if (quantites[j] > 0)
                                    {
                                        SqlCommand cmdP = new SqlCommand("ProduitsCommande", con);
                                        cmdP.CommandType = CommandType.StoredProcedure;

                                        cmdP.Parameters.Add("@idC", SqlDbType.Int);
                                        cmdP.Parameters["@idC"].Value = idCommande;

                                        cmdP.Parameters.Add("@idP", SqlDbType.Int);
                                        cmdP.Parameters["@idP"].Value = ids[j];

                                        cmdP.Parameters.Add("@quan", SqlDbType.Int);
                                        cmdP.Parameters["@quan"].Value = quantites[j];
                                        cmdP.ExecuteNonQuery();

                                    }


                                }
                                Session["idDerniereCommande"] = idCommande;
                            Response.Redirect("facture.aspx");
                                con.Close();
                            }

                            else
                            {
                                statusPack50.Text = "Le total doit étre 50";
                                statusPack50.ForeColor = System.Drawing.Color.Red;
                            }
                    }
                    else
                    {
                        statusPack50.Text = "Quantité d'un produit doit étre inférieure a la quantité du stock.";
                        statusPack50.ForeColor = System.Drawing.Color.Red;
                    }
                    }
                    catch(Exception ex)
                    {
                        statusPack50.Text = "Erreur : "+ex.Message;
                        statusPack50.ForeColor = System.Drawing.Color.Red;
                    }
                }
           
        }

        protected void ValiderPack10_Click(object sender, EventArgs e)  /*pack 10*/
        {


            if (Page.IsValid)
            {
                try
                {
                    bool valide = true;
                    int[] test = new int[50];
                    int i = 0;
                    int[] quantites = new int[50];
                    int[] ids = new int[50];
                    foreach (ListViewItem item in ListView1.Items)
                    {
                        string lblId = ((Label)item.FindControl("lblid")).Text;
                        string txtQ = ((TextBox)item.FindControl("txtQuantiteSaisie")).Text;
                        int quantiteExiste = int.Parse(((Label)item.FindControl("stock")).Text);
                        if (txtQ != "0" && txtQ != string.Empty)
                        {
                            int q = int.Parse(txtQ);
                            if (q > quantiteExiste)
                            {
                                valide = false;
                            }
                            if (q > 0)
                            {
                                quantites[i] = int.Parse(txtQ);
                                ids[i] = int.Parse(lblId);
                                i++;
                            }


                        }

                    }
                    if (valide == true)
                    {


                        int totalQ = 0;
                        for (int k = 0; k < quantites.Length; k++)
                        {
                            totalQ += quantites[k];
                        }
                        if (totalQ == 10)
                        {
                            SqlConnection con = new SqlConnection(cs);
                            int idCommande;
                            SqlCommand cmdC = new SqlCommand("AjouterCommande", con);
                            cmdC.CommandType = CommandType.StoredProcedure;

                            cmdC.Parameters.Add("@Nom", SqlDbType.VarChar);
                            cmdC.Parameters["@Nom"].Value = txtNomPack10.Text;

                            cmdC.Parameters.Add("@Prenom", SqlDbType.VarChar);
                            cmdC.Parameters["@Prenom"].Value = txtPrenomPack10.Text;

                            cmdC.Parameters.Add("@idCommande", SqlDbType.Int);
                            cmdC.Parameters["@idCommande"].Direction = ParameterDirection.Output;
                            con.Open();
                            cmdC.ExecuteNonQuery();
                            con.Close();
                            idCommande = Convert.ToInt32(cmdC.Parameters["@idCommande"].Value);

                            con.Open();
                            for (int j = 0; j < quantites.Length; j++)/*Ajouter les produit commandées*/
                            {
                                if (quantites[j] > 0)
                                {
                                    SqlCommand cmdP = new SqlCommand("ProduitsCommande", con);
                                    cmdP.CommandType = CommandType.StoredProcedure;

                                    cmdP.Parameters.Add("@idC", SqlDbType.Int);
                                    cmdP.Parameters["@idC"].Value = idCommande;

                                    cmdP.Parameters.Add("@idP", SqlDbType.Int);
                                    cmdP.Parameters["@idP"].Value = ids[j];

                                    cmdP.Parameters.Add("@quan", SqlDbType.Int);
                                    cmdP.Parameters["@quan"].Value = quantites[j];
                                    cmdP.ExecuteNonQuery();

                                }


                            }
                            Session["idDerniereCommande"] = idCommande;
                            Response.Redirect("facture.aspx");
                            con.Close();
                        }

                        else
                        {
                            statusPack10.Text = "Le total doit étre 10";
                            statusPack10.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        statusPack10.Text = "Quantité d'un produit doit étre inférieure a la quantité du stock.";
                        statusPack10.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    statusPack10.Text = "Erreur : " + ex.Message;
                    statusPack10.ForeColor = System.Drawing.Color.Red;
                }
            }

        }

        protected void ValiderPack20_Click(object sender, EventArgs e) /*pack 20*/
        {


            if (Page.IsValid)
            {
                try
                {
                    bool valide = true;
                    int[] test = new int[50];
                    int i = 0;
                    int[] quantites = new int[50];
                    int[] ids = new int[50];
                    foreach (ListViewItem item in ListView2.Items)
                    {
                        string lblId = ((Label)item.FindControl("lblid")).Text;
                        string txtQ = ((TextBox)item.FindControl("txtQuantiteSaisie")).Text;
                        int quantiteExiste = int.Parse(((Label)item.FindControl("stock")).Text);
                        if (txtQ != "0" && txtQ != string.Empty)
                        {
                            int q = int.Parse(txtQ);
                            if (q > quantiteExiste)
                            {
                                valide = false;
                            }
                            if (q > 0)
                            {
                                quantites[i] = int.Parse(txtQ);
                                ids[i] = int.Parse(lblId);
                                i++;
                            }


                        }

                    }
                    if (valide == true)
                    {


                        int totalQ = 0;
                        for (int k = 0; k < quantites.Length; k++)
                        {
                            totalQ += quantites[k];
                        }
                        if (totalQ == 20)
                        {
                            SqlConnection con = new SqlConnection(cs);
                            int idCommande;
                            SqlCommand cmdC = new SqlCommand("AjouterCommande", con);
                            cmdC.CommandType = CommandType.StoredProcedure;

                            cmdC.Parameters.Add("@Nom", SqlDbType.VarChar);
                            cmdC.Parameters["@Nom"].Value = txtNomPack20.Text;

                            cmdC.Parameters.Add("@Prenom", SqlDbType.VarChar);
                            cmdC.Parameters["@Prenom"].Value = txtPrenomPack20.Text;

                            cmdC.Parameters.Add("@idCommande", SqlDbType.Int);
                            cmdC.Parameters["@idCommande"].Direction = ParameterDirection.Output;
                            con.Open();
                            cmdC.ExecuteNonQuery();
                            con.Close();
                            idCommande = Convert.ToInt32(cmdC.Parameters["@idCommande"].Value);

                            con.Open();
                            for (int j = 0; j < quantites.Length; j++)/*Ajouter les produit commandées*/
                            {
                                if (quantites[j] > 0)
                                {
                                    SqlCommand cmdP = new SqlCommand("ProduitsCommande", con);
                                    cmdP.CommandType = CommandType.StoredProcedure;

                                    cmdP.Parameters.Add("@idC", SqlDbType.Int);
                                    cmdP.Parameters["@idC"].Value = idCommande;

                                    cmdP.Parameters.Add("@idP", SqlDbType.Int);
                                    cmdP.Parameters["@idP"].Value = ids[j];

                                    cmdP.Parameters.Add("@quan", SqlDbType.Int);
                                    cmdP.Parameters["@quan"].Value = quantites[j];
                                    cmdP.ExecuteNonQuery();

                                }


                            }
                            Session["idDerniereCommande"] = idCommande;
                            Response.Redirect("facture.aspx");
                            con.Close();
                        }

                        else
                        {
                            statusPack20.Text = "Le total doit étre 20";
                            statusPack20.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        statusPack20.Text = "Quantité d'un produit doit étre inférieure a la quantité du stock.";
                        statusPack20.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    statusPack20.Text = "Erreur : " + ex.Message;
                    statusPack20.ForeColor = System.Drawing.Color.Red;
                }
            }

        }

        protected void ValiderPack40_Click(object sender, EventArgs e) /*pack 40*/
        {


            if (Page.IsValid)
            {
                try
                {
                    bool valide = true;
                    int[] test = new int[50];
                    int i = 0;
                    int[] quantites = new int[50];
                    int[] ids = new int[50];
                    foreach (ListViewItem item in ListView3.Items)
                    {
                        string lblId = ((Label)item.FindControl("lblid")).Text;
                        string txtQ = ((TextBox)item.FindControl("txtQuantiteSaisie")).Text;
                        int quantiteExiste = int.Parse(((Label)item.FindControl("stock")).Text);
                        if (txtQ != "0" && txtQ != string.Empty)
                        {
                            int q = int.Parse(txtQ);
                            if (q > quantiteExiste)
                            {
                                valide = false;
                            }
                            if (q > 0)
                            {
                                quantites[i] = int.Parse(txtQ);
                                ids[i] = int.Parse(lblId);
                                i++;
                            }


                        }

                    }
                    if (valide == true)
                    {


                        int totalQ = 0;
                        for (int k = 0; k < quantites.Length; k++)
                        {
                            totalQ += quantites[k];
                        }
                        if (totalQ == 40)
                        {
                            SqlConnection con = new SqlConnection(cs);
                            int idCommande;
                            SqlCommand cmdC = new SqlCommand("AjouterCommande", con);
                            cmdC.CommandType = CommandType.StoredProcedure;

                            cmdC.Parameters.Add("@Nom", SqlDbType.VarChar);
                            cmdC.Parameters["@Nom"].Value = txtNomPack40.Text;

                            cmdC.Parameters.Add("@Prenom", SqlDbType.VarChar);
                            cmdC.Parameters["@Prenom"].Value = txtPrenomPack40.Text;

                            cmdC.Parameters.Add("@idCommande", SqlDbType.Int);
                            cmdC.Parameters["@idCommande"].Direction = ParameterDirection.Output;
                            con.Open();
                            cmdC.ExecuteNonQuery();
                            con.Close();
                            idCommande = Convert.ToInt32(cmdC.Parameters["@idCommande"].Value);

                            con.Open();
                            for (int j = 0; j < quantites.Length; j++)/*Ajouter les produit commandées*/
                            {
                                if (quantites[j] > 0)
                                {
                                    SqlCommand cmdP = new SqlCommand("ProduitsCommande", con);
                                    cmdP.CommandType = CommandType.StoredProcedure;

                                    cmdP.Parameters.Add("@idC", SqlDbType.Int);
                                    cmdP.Parameters["@idC"].Value = idCommande;

                                    cmdP.Parameters.Add("@idP", SqlDbType.Int);
                                    cmdP.Parameters["@idP"].Value = ids[j];

                                    cmdP.Parameters.Add("@quan", SqlDbType.Int);
                                    cmdP.Parameters["@quan"].Value = quantites[j];
                                    cmdP.ExecuteNonQuery();

                                }


                            }
                            Session["idDerniereCommande"] = idCommande;
                            Response.Redirect("facture.aspx");
                            con.Close();
                        }

                        else
                        {
                            statusPack40.Text = "Le total doit étre 40";
                            statusPack40.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        statusPack40.Text = "Quantité d'un produit doit étre inférieure a la quantité du stock.";
                        statusPack40.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    statusPack40.Text = "Erreur : " + ex.Message;
                    statusPack40.ForeColor = System.Drawing.Color.Red;
                }
            }

        }
    }
}