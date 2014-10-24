using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;

namespace TestJson
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
        https://www.cognalys.com/api/v1/otp/?app_id=41c57d60c4214985b7bde31&access_token=f9cc52e023abb8c956e794108ef109a8470ac15a
            string url = "https://www.cognalys.com/api/v1/otp/confirm/?app_id=" + Session["ap_id"] + "&access_token=" + Session["ap_pass"] + "&keymatch=" + Session["key"] + "&otp=" + TextBox4.Text;
            //string url = txtUrl.Text;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Proxy = null;
            request.Credentials = CredentialCache.DefaultCredentials;

            //allows for validation of SSL certificates 
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);
            string responseFromServer = reader.ReadToEnd();

            JObject results = JObject.Parse(responseFromServer);

            Label6.Text = (string)results["status"];

            if (Label6.Text == "success")
            {
                JObject result1 = JObject.Parse(responseFromServer);

                Label8.Text = (string)result1["message"];
            }
            else
            {
                Label7.Visible = false;
            }
        }
    }
}