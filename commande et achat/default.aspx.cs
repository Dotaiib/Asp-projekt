using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace commande_et_achat
{
    public partial class _default : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["packChoisie"] = "";
        }
        /* pack choisie*/
 
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["packChoisie"] = "pack10";
            Response.Redirect("shop.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["packChoisie"] = "pack20";
            Response.Redirect("shop.aspx");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["packChoisie"] = "pack40";
            Response.Redirect("shop.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Session["packChoisie"] = "pack50";
            Response.Redirect("shop.aspx");
        }




    }
}