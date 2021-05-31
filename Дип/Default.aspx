<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
    Inherits="_Default" Title="Электронная обучающая система" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="sectiontitle">    Добро пожаловать в ЭЛЕКТРОННУЮ ОБУЧАЮЩУЮ СИСТЕМУ ПО ДИСКРЕТНОЙ МАТЕМАТИКЕ! </div> <br /> 
<br />
<div class="sectionsubtitle"> Выберете интересующий вас раздел: </div>
 <br />
 
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:DiscreteConnectionString %>" 
    SelectCommand="SELECT * FROM [Chapters]"></asp:SqlDataSource>
    <br />
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Number" 
        DataSourceID="SqlDataSource1">
        <ItemTemplate>
           <asp:HyperLink ID="ChapterLnk" runat="server" NavigateUrl='<%# "~/Materials.aspx?Chapter="+Eval("Number")+"&Theme="+Eval("Number")+".1" %>' > 
            Глава
                <asp:Label ID="NumberLabel" runat="server" Text='<%# Eval("Number") %>' />
                .
                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
            </asp:HyperLink>
            <br />
            &nbsp;&nbsp;&nbsp;
            <br />
            
        </ItemTemplate>      
    </asp:DataList>
    <br />                 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContent" Runat="Server">
</asp:Content>

