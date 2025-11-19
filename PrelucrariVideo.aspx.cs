using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using System;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

namespace BDM_Bogdan
{
    public partial class GestiuneVideo : System.Web.UI.Page
    {
        OracleConnection con;
        private string stringConexiune = "User ID=STUD_TUTAM; Password=student; Data Source=(DESCRIPTION=" +
            "(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=37.120.249.41)(PORT=1521)))" +
            "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcls)));";
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new OracleConnection(stringConexiune);
        }
        protected void bt_InapoiLaMeniu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MeniuPrincipal.aspx");
        }
    }
}