<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrelucrariVideo.aspx.cs" Inherits="BDM_Bogdan.GestiuneVideo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestiune Video (Trailer)</title>
    <style>
        body, html, form { margin: 0; padding: 0; width: 100%; background-color: #CFFDFF; font-family: Tahoma, sans-serif; }
        .titlu-introducere { background-color: #99CCFF; border: 2px double #000099; font-weight: bold; font-size: larger; color: #333333; padding: 10px; text-align: center; width: 98%; margin: 10px auto 30px auto; display: block; }
        .tabel { width: 100%; border-spacing: 10px; }
        .introducere-labels { background-color: #99CCFF; border: 2px double #000099; font-weight: bold; font-size: medium; color: #000066; height: 25px; width: 95%; text-align: center; display: inline-block; padding: 2px; }
        .introducere-tb { background-color: #99CCFF; border: 1px solid #000099; height: 25px; width: 95%; padding: 5px; }
        .col-eticheta { width: 30%; text-align: right; } 
        .col-input { width: 70%; }
        .buton-meniu { display: block; width: 20%; margin: 15px auto; background-color: #99CCFF; border: 2px outset #000099; color: #000066; font-size: 16px; font-weight: bold; padding: 12px; cursor: pointer; }
        .buton-meniu:hover { background-color: #FFFFFF; }
        .buton-formular { background-color: #99CCFF; border: 2px outset #000099; color: #000066; font-size: 14px; font-weight: bold; padding: 8px 16px; cursor: pointer;}
        .buton-formular:hover { background-color: #FFFFFF; }
        
        .container-video { width: 90%; margin: 0 auto; padding: 20px; border: 1px solid #000099; border-radius: 8px; background-color: white; }
    </style>
</head>
<body style="height: 469px;">
    <form id="form1" runat="server">
        
        <asp:Button ID="bt_InapoiLaMeniu" runat="server" Text="Întoarcere la Meniu" OnClick="bt_InapoiLaMeniu_Click" CssClass="buton-meniu" />

    </form>
</body>
</html>