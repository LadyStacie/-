<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Materials.aspx.cs" 
    Inherits="Materials" Title="Электронная обучающая система" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    UpdateCommand="UPDATE Chapters SET Title=@Title Where Number=@Number"        
    InsertCommand="INSERT INTO Chapters (Number,Title) VALUES (@Number,@Title)"
    SelectCommand="SELECT [Number], [Title] FROM [Chapters] WHERE ([Number] = @Number)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Number" QueryStringField="Chapter" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"                       
        
    SelectCommand="SELECT [Text], [Formula] FROM [Materials] WHERE (([Chapter] = @Chapter) AND ([Theme] = @Theme))">
        <SelectParameters>
            <asp:QueryStringParameter Name="Chapter" QueryStringField="Chapter" 
                Type="Int32" />
            <asp:QueryStringParameter Name="Theme" QueryStringField="Theme" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"                 
        SelectCommand="SELECT * FROM [Themes] WHERE (([Chapter] = @Chapter)) AND ([Number] = @Number)"
        UpdateCommand="UPDATE Themes SET Chapter=@Chapter, Title=@Title WHERE (Number=@Number)"
        InsertCommand="INSERT INTO Themes (Number,Title,Chapter) VALUES (@Number, @Title, @Chapter)"
         >
        <SelectParameters>
            <asp:QueryStringParameter Name="Chapter" QueryStringField="Chapter" 
                Type="Int32" />
            <asp:QueryStringParameter DefaultValue="1" Name="Number" 
                QueryStringField="Theme" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:FormView ID="FormView3" runat="server" DataKeyNames="Number" 
        DataSourceID="SqlDataSource1" >
            <EditItemTemplate>
                Глава №
                <asp:Label ID="NumberLabel1" runat="server" Text='<%# Eval("Number") %>' />
                <br />
                Название главы&nbsp;<asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Сохранить" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Отменить" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Глава №&nbsp;&nbsp;
                <asp:TextBox ID="NumberTextBox" runat="server" Text='<%# Bind("Number") %>' 
                    Height="22px" Width="62px" />
                <br />
                Название главы:
                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' 
                    Height="26px" Width="215px" />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Добавить" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Отмена" />
            </InsertItemTemplate>
            <ItemTemplate>
                <div class="sectiontitle">
                    Глава
                    <asp:Label ID="ChapterLabel" runat="server" Text='<%# Eval("Number") %>' />
                    .
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' /><br />
               </div>
               <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" 
                    Visible = '<%# Roles.IsUserInRole("Administrators") || Roles.IsUserInRole("Teachers") %>' >
                    Редактировать
               </asp:LinkButton>
               &nbsp;&nbsp;
               <asp:LinkButton ID="LinkButton3" runat="server" CommandName="New"
                    Visible = '<%# Roles.IsUserInRole("Administrators") || Roles.IsUserInRole("Teachers") %>' >
                    Добавить
                </asp:LinkButton>
            </ItemTemplate>
    </asp:FormView>
        <asp:FormView ID="FormView4" runat="server" DataKeyNames="Number" 
        DataSourceID="SqlDataSource3">
            <EditItemTemplate>
                Глава
                <asp:TextBox ID="ChapterTextBox" runat="server" Text='<%# Bind("Chapter") %>' />
                <br />
                Тема
                <asp:Label ID="NumberLabel1" runat="server" Text='<%# Eval("Number") %>' />
                <br />
                Название:
                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Обновить" />
                &nbsp;&nbsp;
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                    CommandName="Cancel" Text="Отмена" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Глава №
                <asp:TextBox ID="ChapterTextBox" runat="server" Text='<%# Bind("Chapter") %>' />
                <br />
                Тема №
                <asp:TextBox ID="NumberTextBox" runat="server" Text='<%# Bind("Number") %>' />
                <br />
                Название
                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="New" Text="Добавить" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Отмена" />
            </InsertItemTemplate>
            <ItemTemplate>
                <div class="sectionsubtitle">
                    &nbsp;<asp:Label ID="NumberLabel" runat="server" Text='<%# Eval("Number") %>' />
                    &nbsp;<asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' />
                </div>                    
                <asp:LinkButton ID="LinkButton4" runat="server" CommandName="New"
                    Visible = '<%# Roles.IsUserInRole("Administrators") || Roles.IsUserInRole("Teachers") %>'>
                    Добавить
                </asp:LinkButton>
                &nbsp;
                <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Edit" 
                    Visible = '<%# Roles.IsUserInRole("Administrators") || Roles.IsUserInRole("Teachers") %>'>
                    Редактировать
                </asp:LinkButton>
            </ItemTemplate>
    </asp:FormView>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                <asp:Label ID="TextLabel" CssClass="text" runat="server" Text='<%# Eval("Text") %>' />
                <asp:Image ID="FormulaLabel"  runat="server"  ImageAlign="Middle" ImageUrl='<%# Eval("Formula") %>' />
            </ItemTemplate>                   
        </asp:Repeater>                 
   <br />   
</asp:Content>

