
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Net;
using System.IO;
using System.Text;

public partial class PayPalTest_PDT_Test : System.Web.UI.Page
{

    //filename: Default.aspx.cs
    //language: C#
    // This code represents the C# codebehind file for a "Default.aspx" page that
    // would be your PDT handler.

    /// <summary>
    /// Summary description for _Default.

        String sKey, sValue, fname, lname, mc_gross, itemName, Pmtcurrency;
        String item_name1;
        String authToken, txToken, query;
        String strResponse;


        private void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here

            /*
             * set this to the value of the PDT token for your account
             * see http://paypaltech.com/PDTGen/PDTtokenhelp.htm for help with this
            */
            authToken = "dn3Gqw_aC5F14Fk-feMd4CFvSA89PrPe7CeTKHCPBH8TO0p6fcPJip7lil0";

            //read in txn token from querystring
            txToken = Request.QueryString.Get("tx");


            //:::sanity check
            //Response.Write(txToken);

            query = "cmd=_notify-synch&tx=" + txToken +
            "&at=" + authToken;


            // Create the request back
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create("https://www.sandbox.paypal.com/cgi-bin/webscr");

            // Set values for the request back
            req.Method = "POST";
            req.ContentType = "application/x-www-form-urlencoded";
            req.ContentLength = query.Length;

            // Write the request back IPN strings
            StreamWriter stOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
            stOut.Write(query);
            stOut.Close();

            // Do the request to PayPal and get the response
            StreamReader stIn = new StreamReader(req.GetResponse().GetResponseStream());
            strResponse = stIn.ReadToEnd();
            stIn.Close();

            //:::sanity check:::
            //Response.Write("PDT returned: " + strResponse + "<p></p>");


            // If response was SUCCESS, parse response string and
            //output details
            if (strResponse.Substring(0, 7) == "SUCCESS")
            {
                //split response into string array using whitespace
                //as delimiter
                String[] StringArray = strResponse.Split();


                // NOTE:
                /*
                * loop is set to start at 1 rather than 0 because first
                string in array will be single word SUCCESS or FAIL
                and there is no splitting of this...so we will skip the
                first string and go to the next.
                */

                // use split to split array we already have
                // using "=" as delimiter
                int i;
                for (i = 1; i < StringArray.Length - 1; i++)
                {
                    String[] StringArray1 = StringArray[i].Split('=');

                    sKey = StringArray1[0];
                    sValue = StringArray1[1];


                    // set string vars to hold variable names using a switch
                    switch (sKey)
                    {
                        case "first_name":
                            fname = sValue;
                            break;

                        case "last_name":
                            lname = sValue;
                            break;

                        case "mc_gross":
                            mc_gross = sValue;
                            break;

                        case "item_name":
                            itemName = sValue;
                            break;

                        //for shopping cart payments the
                        //item_name vars are numbered to reflect
                        //a multi-item purchase.
                        case "item_name1":
                            item_name1 = sValue;
                            break;

                        case "mc_currency":
                            Pmtcurrency = sValue;
                            break;
                    }
                }


                // ------- OUTPUT PAGE RESULTS -----------
                Response.Write("<p><h3>Your order has been received.</h3></p>");
                Response.Write("<b>Details</b><br>");

                Response.Write("<li>Name: " + fname + " " + lname + "</li>");
                Response.Write("<li>Description: " + itemName + "</li>");
                Response.Write("<li>Amount: " + Pmtcurrency + " " + mc_gross + "</li>");
                Response.Write("<hr>");

            }

            else if (strResponse.Substring(0, 4) == "FAIL")
            {
                // if response is FAIL, print it to screen
                Response.Write(strResponse);
            }

            else
            {
                // some unexpected response??? -  log it
                // for investigation later.

            }

        }

        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.Load += new System.EventHandler(this.Page_Load);
        }
        #endregion
    }


