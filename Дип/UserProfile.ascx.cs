using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


namespace MB.Computers.UI.Controls
{
    public partial class UserProfile : System.Web.UI.UserControl
    {
        private string _userName = "";
        public string UserName
        {
            get { return _userName; }
            set { _userName = value; }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            this.Page.RegisterRequiresControlState(this);
        }

        protected override void LoadControlState(object savedState)
        {
            object[] ctlState = (object[])savedState;
            base.LoadControlState(ctlState[0]);
            this.UserName = (string)ctlState[1];
        }

        protected override object SaveControlState()
        {
            object[] ctlState = new object[2];
            ctlState[0] = base.SaveControlState();
            ctlState[1] = this.UserName;
            return ctlState;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                // if the UserName property contains an emtpy string, retrieve the profile
                // for the current user, otherwise for the specified user
                ProfileCommon profile = this.Profile;
                if (this.UserName.Length > 0)
                    profile = this.Profile.GetProfile(this.UserName);
                txtLastName.Text = profile.LastName;
                txtFirstName.Text = profile.FirstName;
                txtMiddleName.Text = profile.MiddleName;
                txtGroup.Text = profile.Group;                              
            }
        }

        public void SaveProfile()
        {
            // if the UserName property contains an emtpy string, save the current user's profile,
            // othwerwise save the profile for the specified user
            ProfileCommon profile = this.Profile;
            if (this.UserName.Length > 0)
                profile = this.Profile.GetProfile(this.UserName);
            profile.LastName = txtLastName.Text;
            profile.FirstName = txtFirstName.Text;
            profile.MiddleName = txtMiddleName.Text;
            profile.Group = txtGroup.Text;
            profile.Save();
        }
    }
}