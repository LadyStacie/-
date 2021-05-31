<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Results.aspx.cs" 
    Inherits="Results" Title="Результаты тестирования" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"        
        SelectCommand="SELECT * FROM [Rezults] WHERE (([Name] = @Name) AND (ID = @IDResult))">
        <SelectParameters>
            <asp:ProfileParameter Name="Name" PropertyName="UserName" Type="String" />
            <asp:QueryStringParameter Name="IDResult" QueryStringField="IDResult" />
        </SelectParameters>
    </asp:SqlDataSource>
        
    <asp:DataList ID="DataList5" runat="server" DataSourceID="SqlDataSource3">
        <ItemTemplate>
            <div class="sectionsubtitle"> Результаты тестирования. </div>
            Глава
            <asp:Label ID="ChapterLabel" runat="server" Text='<%# Eval("Chapter") %>' />
            . Результат = <asp:Label ID="ResultLabel" runat="server" 
                Text='<%# Eval("Result") %>' /> баллов <br /> из максимально возможных 100 баллов <br />            
            Правильных ответов: <asp:Label ID="RightAns" runat="server" Text='<%# Eval("LevelQuest") %>' /><br />
            Общая сложность правильно выполненных заданий: <asp:Label ID="Complex" runat="server" Text='<%# Eval("RightQuest") %>' /> <br />
            Общая сложность заданий: <asp:Label ID="MaxComplex" runat="server" Text='<%# Eval("Rating") %>' /><br />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"        
        SelectCommand="SELECT * FROM [Rezults] WHERE ([Name] = @Name) ORDER BY ID DESC">
        <SelectParameters>
            <asp:ProfileParameter Name="Name" PropertyName="UserName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
        
    <div class="sectionsubtitle"> Предыдущие результаты тестирования: </div>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>           
            Глава
            <asp:Label ID="ChapterLabel" runat="server" Text='<%# Eval("Chapter") %>' />
            . Результат = <asp:Label ID="ResultLabel" runat="server" 
                Text='<%# Eval("Result") %>' /> баллов <br /> из максимально возможных 100 баллов <br />            
            Правильных ответов: <asp:Label ID="RightAns" runat="server" Text='<%# Eval("LevelQuest") %>' /><br />
            Общая сложность правильно выполненных заданий: <asp:Label ID="Complex" runat="server" Text='<%# Eval("RightQuest") %>' /> <br />
            Общая сложность заданий: <asp:Label ID="MaxComplex" runat="server" Text='<%# Eval("Rating") %>' /><br />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

