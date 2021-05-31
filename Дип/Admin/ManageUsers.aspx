<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="ManageUsers" Title="Computers - Управление профилями" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" Runat="Server">
   <div class="sectiontitle">Управление профайлами пользователей</div>
   <p></p>
   <b>- Все зарегистрированные пользователи: <asp:Literal runat="server" ID="lblTotUsers" /><br />
   - Пользователи он-лайн: <asp:Literal runat="server" ID="lblOnlineUsers" /></b>
   <p></p>
   Кликните на одной из следующих ссылок для отображения всех пользователей, чье имя начинается с буквы:
   <p></p>
   <asp:Repeater runat="server" ID="rptAlphabet" OnItemCommand="rptAlphabet_ItemCommand">
      <ItemTemplate><asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Container.DataItem %>'
         CommandArgument='<%# Container.DataItem %>' />&nbsp;&nbsp;
      </ItemTemplate>
   </asp:Repeater>
   <p></p>
   В противном случае используйте следующие элементы для поиска пользователей по их имени или электронной почте:
   <p></p>
   <asp:DropDownList runat="server" ID="ddlSearchTypes">
      <asp:ListItem Text="UserName" Selected="true" />
      <asp:ListItem Text="E-mail" />
   </asp:DropDownList> 
   содержит 
   <asp:TextBox runat="server" ID="txtSearchText" /> 
   <asp:Button runat="server" ID="btnSearch" Text="Search" OnClick="btnSearch_Click" />
   <p></p>
   <asp:GridView ID="gvwUsers" runat="server" AutoGenerateColumns="false" DataKeyNames="UserName"
      OnRowCreated="gvwUsers_RowCreated" OnRowDeleting="gvwUsers_RowDeleting">
      <Columns>
         <asp:BoundField HeaderText="Логин" DataField="UserName" />
         <asp:HyperLinkField HeaderText="E-mail" DataTextField="Email" DataNavigateUrlFormatString="mailto:{0}" DataNavigateUrlFields="Email" />
         <asp:BoundField HeaderText="Создан" DataField="CreationDate" DataFormatString="{0:MM/dd/yy h:mm tt}" />
         <asp:BoundField HeaderText="Последний вход" DataField="LastActivityDate" DataFormatString="{0:dd/MM/yy h:mm tt}" />
         <asp:CheckBoxField HeaderText="Approved" DataField="IsApproved" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
         <asp:HyperLinkField Text="<img src='../images/edit.gif' border='0' />" DataNavigateUrlFormatString="EditUser.aspx?UserName={0}" DataNavigateUrlFields="UserName" />
         <asp:ButtonField CommandName="Delete" ButtonType="Image" ImageUrl="~/images/delete.gif" />
      </Columns>
      <EmptyDataTemplate><b>Ни один пользователь не подходит под данное описание </b></EmptyDataTemplate>
   </asp:GridView>
</asp:Content>



