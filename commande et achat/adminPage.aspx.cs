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
    public partial class adminPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        byte[] image;
        protected void Page_Load(object sender, EventArgs e)
        {
            foreach(Control c in this.Controls)
            {
                if(c is TextBox)
                {
                    TextBox t = c as TextBox;
                    t.Text = string.Empty;
                }
            }
            if (!IsPostBack)
            {
                if (Session["admin"] == null)
                {
                    Response.Redirect("login.aspx");
                }
         
            }

        }



        protected void Modifier_Click(object sender, EventArgs e)/********Modifier********/
        {
            SqlConnection con = new SqlConnection(cs);
            try
            {
                
               
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select * from Produit where id = @id";
                cmd.Connection = con;

                cmd.Parameters.Add("@id", SqlDbType.Int);
                cmd.Parameters["@id"].Value = int.Parse(txtRechercher.Text);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count > 0)
                {   int id = int.Parse(dt.Rows[0][0].ToString());
                    try
                    {
                            SqlCommand cmdModifier = new SqlCommand("ModifierProduit", con);
                        cmdModifier.CommandType = CommandType.StoredProcedure;
                        if (Page.IsValid)
                        {
                            /*inserer l'image*/
                            HttpPostedFile postedFile = FileUpload1.PostedFile;
                            string imageExtension = Path.GetExtension(postedFile.FileName);


                            if (imageExtension.ToLower() == ".jpg" ||
                                imageExtension.ToLower() == ".jpeg" ||
                                imageExtension.ToLower() == ".png")
                            {
                                Stream stream = postedFile.InputStream;
                                BinaryReader binaryReader = new BinaryReader(stream);
                                byte[] imageM = binaryReader.ReadBytes((int)stream.Length);

                                cmdModifier.Parameters.Add("@id",SqlDbType.Int);
                                cmdModifier.Parameters["@id"].Value = id;

                                cmdModifier.Parameters.Add("@titre", SqlDbType.VarChar);
                                cmdModifier.Parameters["@titre"].Value = txtTitre.Text;

                                cmdModifier.Parameters.Add("@descrip", SqlDbType.VarChar);
                                cmdModifier.Parameters["@descrip"].Value = txtDescription.Text;

                                cmdModifier.Parameters.Add("@prix", SqlDbType.Float);
                                cmdModifier.Parameters["@prix"].Value = float.Parse(txtPrix.Text);

                                cmdModifier.Parameters.Add("@img", SqlDbType.VarBinary);
                                cmdModifier.Parameters["@img"].Value = imageM;

                                cmdModifier.Parameters.Add("@quantite", SqlDbType.Int);
                                cmdModifier.Parameters["@quantite"].Value = int.Parse(txtQuantite.Text);

                                if (con.State == ConnectionState.Closed) { con.Open(); }

                                cmdModifier.ExecuteNonQuery();
                                con.Close();
                                Label1.Text = "Le produit a bien été modifié.";
                                Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#00c853");


                            }
                            else
                            {
                                Label1.Text = "Format d'image incorrect.";
                                Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#d50000");
                            }
                        }

                    }
                    catch (Exception ex)
                    {
                        Label1.Text = "Une erreur inconnu !";
                        Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#d50000");
                    }

                }
                else
                {
                    Label1.Text = "Ce Produit n'existe pas !";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }


            }
            catch (Exception ex)
            {
                Label1.Text = "Une erreur inconnu !";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
         
        }

        protected void Ajouter_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    /*inserer l'image*/
                    HttpPostedFile postedFile = FileUpload1.PostedFile;
                    string imageExtension = Path.GetExtension(postedFile.FileName);


                    if (imageExtension.ToLower() == ".jpg" ||
                        imageExtension.ToLower() == ".jpeg" ||
                        imageExtension.ToLower() == ".png")
                    {
                        Stream stream = postedFile.InputStream;
                        BinaryReader binaryReader = new BinaryReader(stream);
                        image = binaryReader.ReadBytes((int)stream.Length);

                        SqlConnection con = new SqlConnection(cs);
                        SqlCommand cmd = new SqlCommand("AjouterProduit", con);

                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@titre", SqlDbType.VarChar, 200);
                        cmd.Parameters["@titre"].Value = txtTitre.Text;

                        cmd.Parameters.Add("@descrip", SqlDbType.VarChar);
                        cmd.Parameters["@descrip"].Value = txtDescription.Text;

                        cmd.Parameters.Add("@prix", SqlDbType.Float);
                        cmd.Parameters["@prix"].Value = float.Parse(txtPrix.Text);

                        cmd.Parameters.Add("@img", SqlDbType.VarBinary);
                        cmd.Parameters["@img"].Value = image;

                        cmd.Parameters.Add("@quantite", SqlDbType.Int);
                        cmd.Parameters["@quantite"].Value = int.Parse(txtQuantite.Text);

                        if (con.State == ConnectionState.Closed) { con.Open(); }

                        cmd.ExecuteNonQuery();
                        con.Close();
                        Label1.Text = "Le produit a bien été ajouté.";
                        Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#00c853");


                    }
                    else
                    {
                        Label1.Text = "Format d'image incorrect.";
                        Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#d50000");
                    }
                }

            }catch(Exception ex)
            {
                Label1.Text = ex.ToString();
                Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#d50000");
            }

        }

        protected void Supprimer_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(cs);
            try
            {


                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select * from Produit where id = @id";
                cmd.Connection = con;

                cmd.Parameters.Add("@id", SqlDbType.Int);
                cmd.Parameters["@id"].Value = int.Parse(txtRechercher.Text);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    int id = int.Parse(dt.Rows[0][0].ToString());
                    try
                    {

                        SqlCommand cmdSupp = new SqlCommand("SupprimerProduit", con);
                        cmdSupp.CommandType = CommandType.StoredProcedure;
                        if (Page.IsValid)
                        {
                            cmdSupp.Parameters.Add("@id", SqlDbType.Int);
                            cmdSupp.Parameters["@id"].Value = id;

                            if (con.State == ConnectionState.Closed) { con.Open(); }

                            cmdSupp.ExecuteNonQuery();
                            con.Close();
                            Label1.Text = "Le produit a bien été supprimé.";
                            Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#00c853");

                        }

                    }
                    catch (Exception ex)
                    {
                        Label1.Text = "Une erreur inconnu !";
                        Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#d50000");
                    }

                }
                else
                {
                    Label1.Text = "Ce Produit n'existe pas !";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }


            }
            catch (Exception ex)
            {
                Label1.Text = "Une erreur inconnu !";
                Label1.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}