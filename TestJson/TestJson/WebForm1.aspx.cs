using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.Web.Script.Serialization;
using System.Text;
using Newtonsoft.Json.Linq;

namespace TestJson
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        //for testing purpose only, accept any dodgy certificate... 
        public static bool ValidateServerCertificate(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
        {
            return true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string url = "https://www.cognalys.com/api/v1/otp/?app_id="+TextBox1.Text+"&access_token="+TextBox2.Text+"&mobile="+TextBox3.Text;
            //string url = txtUrl.Text;
            Session["ap_id"] = TextBox1.Text;
            Session["ap_pass"] = TextBox2.Text;

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Proxy = null;
            request.Credentials = CredentialCache.DefaultCredentials;

            //allows for validation of SSL certificates 

            ServicePointManager.ServerCertificateValidationCallback += new System.Net.Security.RemoteCertificateValidationCallback(ValidateServerCertificate);

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);
            string responseFromServer = reader.ReadToEnd();

            JObject results = JObject.Parse(responseFromServer);

            lblOtp.Text = (string)results["otp_start"];

            JObject result1 = JObject.Parse(responseFromServer);

            key.Text = (string)result1["keymatch"];
            Session["key"] = key.Text;

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm2.aspx");
        }
    }
}