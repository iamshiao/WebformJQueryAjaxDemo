using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Newtonsoft.Json;

namespace CircleHsiao.JQueryAjax.Demo
{
    public partial class Default : System.Web.UI.Page
    {
        internal static readonly IEnumerable<string> _cats = new List<string>() { "American Shorthair", "Siamese", "Chinchilla" };
        internal static readonly IEnumerable<string> _dogs = new List<string>() { "Welsh Corgi", "Beagle", "Husky" };

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static string UpdateDropDownListSpecies(string family)
        {
            string json = "[]";
            if (family == "Cat")
            {
                json = JsonConvert.SerializeObject(_cats);
            }
            else if (family == "Dog")
            {
                json = JsonConvert.SerializeObject(_dogs);
            }

            return json;
        }

        protected void Button_submit_Click(object sender, EventArgs e)
        {
            Response.Write("Family: " + DropDownList_family.SelectedValue);
            Response.Write("<br />");
            Response.Write("Species: " + Request["DropDownList_species"]);
        }
    }
}