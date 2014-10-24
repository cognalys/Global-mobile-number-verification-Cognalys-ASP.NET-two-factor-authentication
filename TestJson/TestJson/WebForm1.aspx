<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TestJson.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //after button is clicked we download the data
            $('.button').click(function () {
                //start ajax request
                $.ajax({
                    type: "GET",
                    //remove url when site is not blocked
                    //url: "https://www.cognalys.com/api/v1/otp/?app_id=41c57d60c4214985b7bde31&access_token=f9cc52e023abb8c956e794108ef109a8470ac15a&mobile=+918108879283",
                    dataType: "text",
                    success: function (data) {

                        //uncomment when using live url
                        var jsonT = $(".json").text();
                        var json = $.parseJSON(jsonT);

                        //comment below when using live url
                        //var json = { "status": "success", "keymatch": "4b1f6fd8b0f149918cb54da", "mobile": "+918108879283", "otp_start": "+177424" };

                        $('.results').html('<br/>Mobile: ' + json.mobile);
                        $('.otp').html('<br />Otp Start: ' + json.otp_start);
                    },
                    failure: function (data) {
                        $('.results').text("Error : Unable to parse");
                    }
                });
                return false;
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <center>
        <table width="40%">
    
        </table>
    </center>
    <div>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="App Id  :-"></asp:Label>
&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="App Token  :-"></asp:Label>
&nbsp;
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Mobile No  :-"></asp:Label>
&nbsp;
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="btnUrl" runat="server" onclick="Button1_Click" Text="Submit" />
        &nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
            Text="Confirm" />
        <br />
        <asp:Label ID="lblOtp" class="otp" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="key" runat="server"></asp:Label>
        <br />
        <br />
    </div>
    </form>
</body>
</html>
