using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Test : System.Web.UI.Page
{
    private int levelquest;
            int allquest;
            int rightquest;
            int rating;    
            int maxQuestions = 6;
            int maxQuestionsOnComplexity = 2;
            int maxComplexity = 3;

    
    protected void Page_Load(object sender, EventArgs e)
    {
       
        
    }
    protected void CheckBtn_Click(object sender, EventArgs e)
    {
        if (((Label)FormView2.FindControl("LevelQuestLabl")).Text != "")
        {
            levelquest = Convert.ToInt32(((Label)FormView2.FindControl("LevelQuestLabl")).Text);
            allquest = Convert.ToInt32(((Label)FormView2.FindControl("AllQuestLabl")).Text);
            rightquest = Convert.ToInt32(((Label)FormView2.FindControl("RightQuestLabl")).Text);
            rating = Convert.ToInt32(((Label)FormView2.FindControl("RatingLabl")).Text);
        }
        else { levelquest = 0; allquest = 0; rightquest = 0; rating = 0; }
        

       int rightAns = Convert.ToInt32(((Label)FormView1.FindControl("RightAns")).Text);
       bool correct = false;
       if (((CheckBox)FormView1.FindControl("CheckBox" + rightAns)).Checked)
       {    // случай правильного ответа, проверяем выбраны ли какие-нибудь другие ответы
           correct = true;
           for (int i = 1; i <= 4; i++)
               if (((CheckBox)FormView1.FindControl("CheckBox" + i)).Checked)
                   if (rightAns != i) correct = false;
       }

       // определяем сложность задания
       int complexity = Convert.ToInt32(((Label)FormView1.FindControl("Complexity")).Text); ;
       rating += complexity;
       allquest++;

       if (correct)
       {
           rightquest += complexity;
           levelquest++;
           ((Label)FormView1.FindControl("Result")).Text = "Правильно!!!";
       }
       else ((Label)FormView1.FindControl("Result")).Text = "Неправильный ответ.";      
       if (FormView1.PageCount > FormView1.PageIndex + 1)
       {
           // случай наличия заданий текущей сложности
           if (correct)
           {    // при правильном ответе                              
               if (levelquest < complexity*maxQuestionsOnComplexity)
                   ((LinkButton)FormView1.FindControl("NextQuest")).Visible = true; // остаемся на текущей сложности 
               else
               {    // случай перехода на большую сложность
                   ((HyperLink)FormView1.FindControl("MoreComplexQuest")).NavigateUrl += Request.QueryString["IDResult"];
                   ((HyperLink)FormView1.FindControl("MoreComplexQuest")).Visible = true;
                   complexity++;
               }
           } // при неправильном ответе сложность не меняется
           else ((LinkButton)FormView1.FindControl("NextQuest")).Visible = true;
       }
       else
       {    // если заданий текущей сложности не осталось, переходим на более сложные задания
           ((HyperLink)FormView1.FindControl("MoreComplexQuest")).Visible = true;
           complexity++;
       }

        // сохраняем результаты    
        LevelQuestLbl.Text = Convert.ToString(levelquest);
        AllQuestLbl.Text = Convert.ToString(allquest);
        RightQuestLbl.Text = Convert.ToString(rightquest);
        RatingLbl.Text = Convert.ToString(rating);

       ((Button)FormView1.FindControl("CheckBtn")).Visible = false;
       if ((allquest >= maxQuestions) || (complexity > maxComplexity))
       {    // случай окончания тестирования, когда выполнены все задания или закончились вопросы
           ((HyperLink)FormView1.FindControl("ResultsLnk")).Visible = true;
           ((HyperLink)FormView1.FindControl("ResultsLnk")).NavigateUrl = "~/Results.aspx?IDResult="+Request.QueryString["IDResult"];
           ((LinkButton)FormView1.FindControl("NextQuest")).Visible = false;
           ((HyperLink)FormView1.FindControl("MoreComplexQuest")).Visible = false;
           ResultLbl.Text = Convert.ToString((int)(rightquest*100/rating));
       }

       SqlDataSource4.Update();
        
    }
    protected void NextQuest_Click(object sender, EventArgs e)
    {
        FormView1.PageIndex++;
    }

}
