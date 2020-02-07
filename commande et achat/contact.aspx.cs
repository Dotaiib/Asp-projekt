using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace commande_et_achat
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void envoyer_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {

                    MailMessage mailMessage = new MailMessage();
                    mailMessage.From = new MailAddress("xxx@gmail.com");
                    mailMessage.To.Add("marouane_richy@live.fr");
                    mailMessage.Subject = objettxt.Text;
                    mailMessage.Body = "<b>Nom : </b>" + nomtxt.Text + "</br>" +
                        "<b>Prénom : </b>" + prenomtxt.Text + "</br>" +
                        "<b>Email : </b>" + emailtxt.Text + "</br>" +
                        "<b>Message : </b> </br>" + messagetxt.Text;


                    mailMessage.IsBodyHtml = true;

                    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    smtp.EnableSsl = true;

                    smtp.Credentials = new System.Net.NetworkCredential("xxxxxx@gmail.com", "xxxxxxxx");

                    smtp.Send(mailMessage);

                    statut.Text = "Votre message a bien été envoyé, Merci!";
                    statut.ForeColor = System.Drawing.ColorTranslator.FromHtml("#00c853");
                    statut.Style.Add("margin-bottom", "10px");
                    nomtxt.Text = "";
                    prenomtxt.Text = "";
                    emailtxt.Text = "";
                    objettxt.Text = "";
                    messagetxt.Text = "";

                }
            }
            catch (Exception ex)
            {
                statut.Text = "Votre message n'a pas été envoyé. ";
                statut.Style.Add("margin-bottom", "10px");
                statut.ForeColor = System.Drawing.Color.Red;
            }





        }
    }
}