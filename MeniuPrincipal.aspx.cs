using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BDM_Bogdan
{
    public partial class Meniu_Principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void bt_AdaugareImagine_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PrelucrariImagini.aspx");
        }
        protected void bt_AdaugareVideo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PrelucrariVideo.aspx");
        }
    }
}