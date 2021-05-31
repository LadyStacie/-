using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        IDLbl.Text = Convert.ToString(FormView2.PageCount + 1);
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string chapter = ((Label)((LinkButton)sender).FindControl("ChapterLbl")).Text;
        ((LinkButton)sender).PostBackUrl = "~/Test.aspx?Chapter=" + chapter + "&Complexity=1&ID=0&IDResult="+IDLbl.Text;        
        SqlDataSource4.Insert();
        
        
    }
}
