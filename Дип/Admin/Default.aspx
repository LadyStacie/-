<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="sectiontitle">Администрирование</div>
<p></p>

<asp:Panel runat="server" ID="panAdmin">
<div class="sectionsubtitle">Возможные действия для администраторов</div>
<ul style="list-style-type: square">
    <li><a href="Register.aspx">Создание пользователей</a>: создание учетных записей пользователей</li>
   <li><a href="ManageUsers.aspx">Управление пользователями</a>: поиск пользователей по имени, просмотр и изменений их профилей, ролей, и подтверждение статуса.</li>
</ul>
</asp:Panel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContent" Runat="Server">
</asp:Content>

