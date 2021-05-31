<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" 
Inherits="Test" Title="Тестирование" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [Tasks] WHERE (([Chapter] = @Chapter) AND ([Complexity] = @Complexity) AND ([ID]  > @ID))">
        <SelectParameters>
            <asp:QueryStringParameter Name="Chapter" QueryStringField="Chapter" 
                Type="Int32" />
            <asp:QueryStringParameter Name="Complexity" QueryStringField="Complexity" 
                Type="Int16" />
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource3">
        <ItemTemplate>
            <div class="sectiontitle"> Тест по главе
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Chapter") %>' /> <br />
            </div>
            <div style="text-align:right">Сложность вопроса 
                <asp:Label ID="Complexity" Text='<%# Bind("Complexity") %>' runat="server"/><br />
            </div>
            <div class="text">
                <asp:Label ID="QuestionLabel" runat="server" Text='<%# Bind("Question") %>' />
                <br />
                <asp:CheckBox ID="CheckBox1" runat="server" />
                <asp:Label ID="Answer1Label" runat="server" Text='<%# Bind("Answer1") %>' />
                <br />
                <asp:CheckBox ID="CheckBox2" runat="server" />
                <asp:Label ID="Answer2Label" runat="server" Text='<%# Bind("Answer2") %>' />
                <br />
                <asp:CheckBox ID="CheckBox3" runat="server" />
                <asp:Label ID="Answer3Label" runat="server" Text='<%# Bind("Answer3") %>' />
                <br />
                <asp:CheckBox ID="CheckBox4" runat="server" />
                <asp:Label ID="Answer4Label" runat="server" Text='<%# Bind("Answer4") %>' />
                <br />
                <asp:Label ID="RightAns" runat="server" Text='<%# Bind("RightAnswer") %>' Visible="false" Enabled = "true" />
                <asp:Label ID="Result" runat="server" Visible="true" />
                <div style="text-align:right">
                    <asp:Button ID="CheckBtn" runat="server" onclick="CheckBtn_Click"  
                        Text="Проверить" />
                        <br />
                    <asp:LinkButton ID="NextQuest" runat="server" Visible="false" onclick="NextQuest_Click" >
                        Следующий вопрос
                    </asp:LinkButton>
                    <asp:HyperLink ID="MoreComplexQuest" runat="server" Visible="false"
                        NavigateUrl='<%# "~/Test.aspx?Chapter=" + Eval("Chapter")+"&Complexity="+(Convert.ToInt32(Eval("Complexity"))+1)+"&ID=0&IDResult=" %>' >
                        Следующий вопрос
                    </asp:HyperLink>
                    <asp:HyperLink ID="ResultsLnk" runat="server" Visible="false"
                        NavigateUrl="~/Results.aspx" >
                        Просмотреть результаты тестирования
                    </asp:HyperLink>
                </div> 
            </div>
            
        </ItemTemplate>
    </asp:FormView>
    <asp:Label ID="RatingLbl" runat="server" Visible="false" Text="0"/><br />
    <asp:Label ID="RightQuestLbl" runat="server" Visible="false" Text="0" /><br />
    <asp:Label ID="LevelQuestLbl" runat="server" Visible="false" Text="0" /> <br />
    <asp:Label ID="AllQuestLbl" runat="server" Visible="false" Text="0"/><br />
    <asp:Label ID="ResultLbl" runat="server" Visible="false" Text="0"/>
    
     <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT ID, Name, Chapter, Result, Rating, AllQuest, RightQuest, LevelQuest FROM Rezults WHERE (ID = @IDResult)"                          
        UpdateCommand="UPDATE Rezults set Chapter=@Chapter,Result=@Result,Rating=@Rating,AllQuest=@AllQuest,RightQuest=@RightQuest,LevelQuest=@LevelQuest WHERE ID=@IDResult  ">
        <SelectParameters> 
            <asp:QueryStringParameter Name="IDResult" QueryStringField="IDResult" />
        </SelectParameters>
         <InsertParameters>
             <asp:QueryStringParameter Name="IDResult" QueryStringField="IDResult" />
             <asp:ProfileParameter Name="Name" PropertyName="UserName" />
             <asp:QueryStringParameter Name="Chapter" QueryStringField="Chapter"/>
             <asp:ControlParameter Name="Result" ControlID="ResultLbl" />
         </InsertParameters>
         <UpdateParameters>
            <asp:ControlParameter Name="Rating" ControlID="RatingLbl" />
            <asp:ControlParameter Name="AllQuest" ControlID="AllQuestLbl" />
            <asp:ControlParameter Name="RightQuest" ControlID="RightQuestLbl" />
            <asp:ControlParameter Name="LevelQuest" ControlID="LevelQuestLbl" />
            <asp:ControlParameter Name="Result" ControlID="ResultLbl" />
            <asp:QueryStringParameter Name="IDResult" QueryStringField="IDResult" />
            <asp:QueryStringParameter Name="Chapter" QueryStringField="Chapter" />
         </UpdateParameters>
        </asp:SqlDataSource>
     <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource4" Visible="true"
        DataKeyNames="ID">         
         <InsertItemTemplate>
             Result: <asp:TextBox ID="ResultTextBox" runat="server" Text='<%# Bind("Result") %>' visible = "false"/> <br />
             Rating: <asp:TextBox ID="RatingTextBox" runat="server" Text='<%# Bind("Rating") %>'  visible = "false" /> <br />
             AllQuest: <asp:TextBox ID="AllQuestTextBox" runat="server" Text='<%# Bind("AllQuest") %>'  visible = "false" /> <br />
             RightQuest: <asp:TextBox ID="RightQuestTextBox" runat="server" Text='<%# Bind("RightQuest") %>'  visible = "false" /> <br />
             LevelQuest: <asp:TextBox ID="LevelQuestTextBox" runat="server" Text='<%# Bind("LevelQuest") %>'  visible = "false" /> <br />
             
         </InsertItemTemplate>
        <ItemTemplate>   
            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>'  visible = "false"/><br />
            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>'  visible = "false" /><br />
            <asp:Label ID="ChapterLabel" runat="server" 
                Text='<%# Bind("Chapter") %>'  visible = "false" /> <br />
            <asp:Label ID="ResultaLabl" runat="server" Text='<%# Bind("Result") %>'  visible = "false" /><br />
            <asp:Label ID="RatingLabl" runat="server" Text='<%# Bind("Rating") %>'  visible = "false" />
            <br />
            <asp:Label ID="AllQuestLabl" runat="server" Text='<%# Bind("AllQuest") %>'  visible = "false" />
            <br />
            <asp:Label ID="RightQuestLabl" runat="server"  visible = "false"
                Text='<%# Bind("RightQuest") %>' />
            <br />
            <asp:Label ID="LevelQuestLabl" runat="server"  visible = "false"
                Text='<%# Bind("LevelQuest") %>' />
            <br />
         </ItemTemplate>
         <EmptyDataTemplate>
            
         </EmptyDataTemplate>
     </asp:FormView>
 </asp:Content>


