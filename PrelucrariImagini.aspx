<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrelucrariImagini.aspx.cs" Inherits="BDM_Bogdan.WebForm1" Theme="" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestiune Postere</title>
    <style>
        body, html, form {
            margin: 0;
            padding: 0;
            width: 100%;
            background-color: #CFFDFF; 
        }
        .titlu-introducere {
            background-color: #99CCFF;
            border: 2px double #000099;
            font-weight: bold;
            font-size: larger;
            color: #333333;
            padding: 10px;
            text-align: center;
            width: 98%;       
            margin: 10px auto 30px auto; 
            display: block;
        }
        .tabel {
            width: 100%;
            border-spacing: 10px;
        }
        .introducere-labels {
            background-color: #99CCFF;
            border: 2px double #000099;
            font-weight: bold;
            font-size: medium;
            color: #000066;
            width: 95%; 
            text-align: center;
            display: inline-block;
            padding: 2px;
            margin-left: 0px;
        }
        .introducere-tb {
            background-color: #99CCFF;
            border: 1px solid #000099;
            height: 25px;
            width: 95%; 
            padding: 5px;
        }
        .col-eticheta {
            width: 15%;
            text-align: right;
        }
        .col-input {
            width: 35%;
        }
        .dropdown-valori {
            background-color: #99CCFF;  
            border: 1px solid #000099; 
            width: 97%;         
            padding: 4px; 
            height: 30px;
        }
        .buton-meniu {
            display: block; 
            width: 20%;  
            margin: 15px auto; 
            background-color: #99CCFF; 
            border: 2px outset #000099; 
            color: #000066; 
            font-size: 16px;
            font-weight: bold;
            padding: 12px; 
            cursor: pointer; 
        }
        .buton-meniu:hover {
            background-color: #FFFFFF; 
        }
        .buton-recunoastere {
             background-color: #99CCFF; border: 2px outset #000099; 
             color: #000066; font-size: 14px; font-weight: bold;
             padding: 8px 16px; cursor: pointer;
        }
        .buton-recunoastere:hover { 
            background-color: #FFFFFF; 
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:Label ID="IntroducereDate" runat="server" CssClass="titlu-introducere" Text="INTRODUCEREA INFORMAȚIILOR PRIVIND POSTERUL" Font-Bold="True"></asp:Label>
        <table class="tabel">
            <tr>
                <td class="col-eticheta"><asp:Label ID="lb_titlu" runat="server" CssClass="introducere-labels" Text="Titlu Film:" Font-Bold="True"></asp:Label></td>
                <td class="col-input"><asp:TextBox ID="tb_titlu" runat="server" CssClass="introducere-tb"></asp:TextBox></td>
                <td class="col-eticheta"><asp:Label ID="lb_actori" runat="server" CssClass="introducere-labels" Text="Actori Principali:" Font-Bold="True"></asp:Label></td>
                <td class="col-input"><asp:TextBox ID="tb_actori" runat="server" CssClass="introducere-tb"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="col-eticheta"><asp:Label ID="lb_descriere" runat="server" CssClass="introducere-labels" Text="Descriere Film:" Font-Bold="True"></asp:Label></td>
                <td class="col-input"><asp:TextBox ID="tb_descriere" runat="server" CssClass="introducere-tb" TextMode="MultiLine" Rows="3"></asp:TextBox></td>
                <td class="col-eticheta"><asp:Label ID="lb_an" runat="server" CssClass="introducere-labels" Text="An Apariție:" Font-Bold="True"></asp:Label></td>
                <td class="col-input"><asp:TextBox ID="tb_an" runat="server" CssClass="introducere-tb"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="col-eticheta"><asp:Label ID="lb_gen" runat="server" CssClass="introducere-labels" Text="Gen Film:" Font-Bold="True"></asp:Label></td>
                <td class="col-input"><asp:DropDownList ID="tb_gen" runat="server" CssClass="dropdown-valori">
                    <asp:ListItem Value="">-- Selectați un gen --</asp:ListItem>
                    <asp:ListItem Value="Actiune">Acțiune</asp:ListItem>
                    <asp:ListItem Value="Comedie">Comedie</asp:ListItem>
                    <asp:ListItem Value="Drama">Dramă</asp:ListItem>
                    <asp:ListItem Value="Horror">Horror</asp:ListItem>
                    <asp:ListItem Value="Sci-Fi">Sci-Fi</asp:ListItem>
                    <asp:ListItem Value="Romantic">Romantic</asp:ListItem>
                    <asp:ListItem Value="Thriller">Thriller</asp:ListItem>
                    </asp:DropDownList></td>
                <td class="col-eticheta"><asp:Label ID="lb_rating" runat="server" CssClass="introducere-labels" Text="Rating Film:" Font-Bold="True"></asp:Label></td>
                <td class="col-input"><asp:TextBox ID="tb_rating" runat="server" CssClass="introducere-tb"></asp:TextBox></td>
            </tr>
        </table>
        
        <p style="text-align: center; margin-top: 20px;">
            <asp:Label ID="lb_introducere_imagine" runat="server" CssClass="introducere-labels" Text="Introduceți Imaginea:" Width="181px" Font-Bold="True"></asp:Label>
            &nbsp;<asp:FileUpload ID="fu_InserareImagine" runat="server" BackColor="#99CCFF" BorderColor="Blue" BorderStyle="Solid" Font-Bold="True" ForeColor="#000066" Height="25px" />
        </p>
        
        <p style="text-align: center; margin-top: 20px;">
            <asp:Button ID="bt_AdaugaImaginea" runat="server" Text="Confirmă Adăugarea Imaginii" OnClick="bt_AdaugaImaginea_Click" CssClass="buton-meniu" />
        </p>
        
        <div style="width: 98%; margin: 0 auto;">
            <br /><br />
            <asp:Label ID="Notificari" runat="server" Width="100%" Height="58px" BackColor="White" BorderStyle="Inset" BorderColor="Gray" Font-Bold="True"> STATUS PROCEDURĂ:
            </asp:Label>
        </div>
        
        <asp:Label ID="TitluAfisare" runat="server" CssClass="titlu-introducere" Text="AFIȘARE POSTER DUPĂ ID" Font-Bold="True"></asp:Label>
        
        <div style="margin-top: 20px; text-align: center;"> 
            <asp:Label ID="lb_TitluAfisare" runat="server" CssClass="introducere-labels" Text="Introduceți ID-ul:" Width="180px" Font-Bold="True"></asp:Label>
            <asp:TextBox ID="tb_IDAfisare" runat="server" CssClass="introducere-tb" Width="181px"></asp:TextBox>
            <asp:Button ID="bt_AfiseazaImaginea" runat="server" Text="Afișează Poster" OnClick="bt_AfiseazaImaginea_Click" CssClass="buton-meniu" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        
        <br /><br />
        
        <asp:Image ID="ImagineAfisata" runat="server" 
            BorderStyle="Double" 
            BorderColor="#000099" 
            BackColor="White" 
            Height="400px" 
            Width="300px" 
            style="display: block; margin: 0 auto;" /> 
        
        <div style="width: 98%; margin: 0 auto;">
            <br />
            <asp:Label ID="Notificari2" runat="server" Width="100%" Height="58px" BackColor="White" BorderStyle="Inset" BorderColor="Gray" Font-Bold="True"> STATUS PROCEDURĂ: 
            </asp:Label>
        </div>
        
        <hr style="width: 98%; margin: 20px auto;" />

        <asp:Label ID="TitluRecunoastere" runat="server" CssClass="titlu-introducere" Text="RECUNOAȘTERE POSTER DUPĂ CONȚINUT" Font-Bold="True"></asp:Label>
        
        <div style="width: 90%; margin: 0 auto; text-align: center; background-color: white; padding: 20px; border: 1px solid #000099; border-radius: 8px;">

            <p style="margin: 20px;">
                <asp:Label ID="lb_upload" runat="server" CssClass="introducere-labels" Text="Încărcați imaginea de test:" Width="200px" Font-Bold="True"></asp:Label>
                &nbsp;<asp:FileUpload ID="fu_InserareImagineRecunoastere" runat="server" BackColor="#99CCFF" BorderColor="Blue" BorderStyle="Solid" Font-Bold="True" ForeColor="#000066" Height="25px" />
            </p>

            <table class="tabel" style="width: 100%; margin-bottom: 20px;">
                <tr>
                    <td class="col-eticheta">
                        <asp:Label ID="lb_culoare" runat="server" CssClass="introducere-labels" Text="Coeficient Culoare:"></asp:Label>
                    </td>
                    <td class="col-input">
                        <asp:TextBox ID="tb_culoare" runat="server" CssClass="introducere-tb"></asp:TextBox>
                    </td>
                    <td class="col-eticheta">
                        <asp:Label ID="lb_textura" runat="server" CssClass="introducere-labels" Text="Coeficient Textură:"></asp:Label>
                    </td>
                    <td class="col-input">
                        <asp:TextBox ID="tb_textura" runat="server" CssClass="introducere-tb"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col-eticheta">
                        <asp:Label ID="lb_forma" runat="server" CssClass="introducere-labels" Text="Coeficient Formă:"></asp:Label>
                    </td>
                    <td class="col-input">
                        <asp:TextBox ID="tb_forma" runat="server" CssClass="introducere-tb"></asp:TextBox>
                    </td>
                    <td class="col-eticheta">
                        <asp:Label ID="lb_locatie" runat="server" CssClass="introducere-labels" Text="Coeficient Locație:"></asp:Label>
                    </td>
                    <td class="col-input">
                        <asp:TextBox ID="tb_locatie" runat="server" CssClass="introducere-tb"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <p style="margin-top: 30px; margin-bottom: 0px;">
                <asp:Button ID="bt_GenereazaSemnaturi" runat="server" Text="Generează Toate Semnăturile" 
                    OnClick="bt_GenereazaSemnaturi_Click" 
                    CssClass="buton-recunoastere" Font-Size="Large" />
            </p>
            
            <p style="margin-top: 15px; margin-bottom: 30px;">
                <asp:Button ID="bt_Recunoastere" runat="server" Text="Recunoaște Imaginea" OnClick="bt_Recunoastere_Click" CssClass="buton-recunoastere" Font-Size="Large" />
            </p>

        </div>
        
        <hr style="width: 98%; margin: 20px auto;" />

        <div style="width: 98%; margin: 0 auto; text-align: center;">
            <asp:Label ID="Label1" runat="server" CssClass="titlu-introducere" 
                Text="CEL MAI BUN REZULTAT GĂSIT" Font-Bold="True"></asp:Label>
            
            <asp:Image ID="ImagineAfisataRecunoastere" runat="server" 
                BorderStyle="Double" 
                BorderColor="#000099" 
                BackColor="White" 
                Height="400px" 
                Width="300px" 
                style="display: block; margin: 20px auto;" /> 
                <asp:TextBox ID="tb_idrezultat" runat="server" ReadOnly="True" CssClass="introducere-labels" style="margin-left: 0px" Width="125px"></asp:TextBox>
            <br />
        </div>

        <div style="width: 98%; margin: 0 auto;">
            <asp:Label ID="Notificari3" runat="server" Width="100%" Height="58px" BackColor="White" BorderStyle="Inset" BorderColor="Gray" Font-Bold="True"> STATUS PROCEDURĂ:
            </asp:Label>
        </div>

        <asp:Button ID="bt_InapoiLaMeniu" runat="server" Text="Întoarcere la Meniu" OnClick="bt_InapoiLaMeniu_Click" CssClass="buton-meniu" />
        
    </form>
</body>
</html>