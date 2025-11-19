<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeniuPrincipal.aspx.cs" Inherits="BDM_Bogdan.Meniu_Principal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Meniu Principal Proiect</title>
    <style>
        body {
            background-color: #CFFDFF; 
            margin: 0;
            padding: 40px; 
        }
        .container-meniu {
            max-width: 800px; 
            margin: 0 auto; 
            padding: 30px;
            background-color: #99CCFF; 
            border: 2px double #000099; 
            border-radius: 8px;
            text-align: center; 
        }
        .titlu-meniu {
            font-size: 24px;
            font-weight: bold;
            color: #000066; 
            margin-bottom: 30px;
        }
        .buton-meniu {
            display: block; 
            width: 80%; 
            margin: 15px auto; 
            background-color: #CFFDFF; 
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-meniu">
            <h1 class="titlu-meniu">MENIU PRINCIPAL</h1>
            <br />
            <asp:Button ID="bt_AdaugareImagine" runat="server" 
                Text="Inserare Imagine" 
                OnClick="bt_AdaugareImagine_Click" 
                CssClass="buton-meniu" />

            <asp:Button ID="bt_AdaugareVideo" runat="server" 
                Text="Adaugare Video" 
                OnClick="bt_AdaugareVideo_Click" 
                CssClass="buton-meniu" />

        </div>
    </form>
</body>
</html>