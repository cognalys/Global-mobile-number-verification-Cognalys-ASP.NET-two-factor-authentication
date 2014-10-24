<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="TestJson.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
    <div>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Mobile No"></asp:Label>
&nbsp;
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Validate" />
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Status  :-  "></asp:Label>
        <asp:Label ID="Label6" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="message  :-  "></asp:Label>
        <asp:Label ID="Label8" runat="server"></asp:Label>
        <br />
        <br />
        <br />
    </div>
    </form>
</body>
</html>
