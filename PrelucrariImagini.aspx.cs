using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using System;
using System.Collections.Generic;
using System.Data;
using System.EnterpriseServices;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BDM_Bogdan
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        OracleConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cons = "User ID=ID; Password=parolaTa; Data Source=(DESCRIPTION=" +
            "(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=ip)(PORT=port)))" +
            "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=orcls)));";
            con = new OracleConnection(cons);
        }

        protected void bt_AdaugaImaginea_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
            }
            catch (OracleException ex)
            {
                Notificari.Text = "STATUS: Nu s-a putut realiza conexiunea la baza de date Oracle! Eroarea: " + ex.Message;
            }

            if (fu_InserareImagine.HasFile)
            {
                fu_InserareImagine.SaveAs(@"C:\Users\Bogdan\Desktop\Proiect_BDM\Postere_Salvate\" + fu_InserareImagine.FileName);
                using (var img = File.OpenRead(@"C:\Users\Bogdan\Desktop\Proiect_BDM\Postere_Salvate\" + fu_InserareImagine.FileName))
                {
                    var imageBytes = new byte[img.Length];
                    img.Read(imageBytes, 0, (int)img.Length);
                    Notificari.Text = "STATUS PROCEDURĂ: Fișierul '" + fu_InserareImagine.FileName + "' a fost introdus în baza de date cu succes! " + "Dimensiunea fișierului este de: '" + img.Length.ToString() + "' bytes.";
                    OracleCommand cmd = new OracleCommand("psInserarePoster", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("v_titlu", OracleDbType.Varchar2);
                    cmd.Parameters.Add("v_descriere", OracleDbType.Varchar2);
                    cmd.Parameters.Add("v_gen", OracleDbType.Varchar2);
                    cmd.Parameters.Add("v_actori", OracleDbType.Varchar2);
                    cmd.Parameters.Add("v_an", OracleDbType.Int32);
                    cmd.Parameters.Add("v_rating", OracleDbType.Decimal);
                    cmd.Parameters.Add("v_fis", OracleDbType.Blob);
                    cmd.Parameters[0].Value = tb_titlu.Text;
                    cmd.Parameters[1].Value = tb_descriere.Text;
                    cmd.Parameters[2].Value = tb_gen.Text;
                    cmd.Parameters[3].Value = tb_actori.Text;
                    cmd.Parameters[4].Value = Convert.ToInt32(tb_an.Text);
                    cmd.Parameters[5].Value = Convert.ToDecimal(tb_rating.Text);
                    cmd.Parameters[6].Value = imageBytes;
                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch (OracleException ex)
                    {
                        Notificari.Text = "STATUS PROCEDURĂ: " + ex.Message;
                    }
                    con.Close();
                }
            }
            else
            {
                Notificari.Text = "STATUS PROCEDURĂ: Fișierul de tip imagine nu a fost introdus de către utilizator, încercați iar!";
            }
        }

        protected void bt_AfiseazaImaginea_Click(object sender, EventArgs e)
        {
            ImagineAfisata.ImageUrl = "";
            try
            {
                con.Open();
            }
            catch (OracleException ex)
            {
                Notificari2.Text = "STATUS: Nu s-a putut realiza conexiunea la baza de date Oracle! Eroarea: " + ex.Message;
            }
            OracleCommand cmd = new OracleCommand("psCitestePoster", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("vid", OracleDbType.Int32);
            cmd.Parameters.Add("flux", OracleDbType.Blob);
            cmd.Parameters[0].Direction = ParameterDirection.Input;
            cmd.Parameters[1].Direction = ParameterDirection.Output;
            cmd.Parameters[0].Value = Convert.ToInt32(tb_IDAfisare.Text);
            try
            {
                cmd.ExecuteScalar();
                Notificari2.Text = "STATUS PROCEDURĂ: Imaginea furnizată cu ID-ul '" + tb_IDAfisare.Text + "' a fost afișată cu succes pe ecran!";
            }
            catch (OracleException ex)
            {
                Notificari2.Text = "STATUS PROCEDURĂ: " + ex.Message;
            }
            
            Byte[] blob = new Byte[((OracleBlob)cmd.Parameters[1].Value).Length];
            ((OracleBlob)cmd.Parameters[1].Value).Read(blob, 0, blob.Length);

            string myimg = Convert.ToBase64String(blob);
            ImagineAfisata.ImageUrl = "data:image/gif;base64," + myimg;
            con.Close();
        }

        protected void bt_GenereazaSemnaturi_Click(object sender, EventArgs e)
        {
            Notificari3.Text = "";
            try
            {
                con.Open();
            }
            catch (OracleException ex)
            {
                Notificari3.Text = ex.Message;
            }
            OracleCommand cmd = new OracleCommand("psGenereazaSemnatura", con);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.ExecuteNonQuery();
                Notificari3.Text += "Semnaturile au fost generate cu succes!";
            }
            catch (OracleException ex)
            {
                Notificari3.Text += ex;
            }
            con.Close();
        }

        protected void bt_Recunoastere_Click(object sender, EventArgs e)
        {
            string cale = @"C:\Users\Bogdan\Desktop\Proiect_BDM\Postere_Salvate\";
            Directory.CreateDirectory(cale);
            string numeFisier = Path.GetFileName(fu_InserareImagineRecunoastere.FileName);
            string numeCale = Path.Combine(cale, numeFisier);
            fu_InserareImagineRecunoastere.SaveAs(numeCale);

            byte[] qBytes = File.ReadAllBytes(numeCale);
            Notificari3.Text = "";
            try
            {
                con.Open();
            }
            catch (OracleException ex)
            {
                Notificari3.Text = ex.Message;
            }

            using (var cmd = new OracleCommand("PSRECUNOASTERE", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("fis", OracleDbType.Blob).Value = qBytes;
                cmd.Parameters.Add("cculoare", OracleDbType.Decimal).Value = Convert.ToDecimal(tb_culoare.Text, CultureInfo.InvariantCulture);
                cmd.Parameters.Add("ctextura", OracleDbType.Decimal).Value = Convert.ToDecimal(tb_textura.Text, CultureInfo.InvariantCulture);
                cmd.Parameters.Add("cforma", OracleDbType.Decimal).Value = Convert.ToDecimal(tb_forma.Text, CultureInfo.InvariantCulture);
                cmd.Parameters.Add("clocatie", OracleDbType.Decimal).Value = Convert.ToDecimal(tb_locatie.Text, CultureInfo.InvariantCulture);
                var p_id = cmd.Parameters.Add("idrez", OracleDbType.Int32);
                p_id.Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                int idRez = Convert.ToInt32(p_id.Value.ToString());
                tb_idrezultat.Text = idRez.ToString();

                using (var cmd2 = new OracleCommand("psCitestePoster", con))
                {
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.Add("vid", OracleDbType.Int32).Value = idRez;
                    var pBlob = cmd2.Parameters.Add("flux", OracleDbType.Blob);
                    pBlob.Direction = ParameterDirection.Output;

                    cmd2.ExecuteScalar();

                    var oblob = (OracleBlob)pBlob.Value;
                    byte[] blob = new byte[oblob.Length];
                    oblob.Read(blob, 0, blob.Length);

                    ImagineAfisataRecunoastere.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String(blob);
                    con.Close();
                }
            }
        }
        protected void bt_InapoiLaMeniu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MeniuPrincipal.aspx");
        }
    }
}