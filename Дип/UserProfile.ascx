<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserProfile.ascx.cs" Inherits="MB.Computers.UI.Controls.UserProfile"%>
<p></p>
<div class="sectionsubtitle">Персональная информация</div>
<p></p>
<table cellpadding="2">
   <tr>
      <td style="width: 110px;" class="fieldname"><asp:Label runat="server" ID="lblLastName" AssociatedControlID="txtLastName" Text="Фамилия:" /></td>
      <td style="width: 400px;"><asp:TextBox ID="txtLastName" runat="server" Width="99%"></asp:TextBox></td>
   </tr>
   <tr>
      <td class="fieldname"><asp:Label runat="server" ID="lblFirstName" AssociatedControlID="txtFirstName" Text="Имя:" /></td>
      <td><asp:TextBox ID="txtFirstName" runat="server" Width="99%"></asp:TextBox></td>
   </tr>

   <tr>
     <td class="fieldname"><asp:Label runat="server" ID="lblMiddleName" AssociatedControlID="txtMiddleName" Text="Отчество:" /></td>
      <td><asp:TextBox ID="txtMiddleName" runat="server" Width="99%"></asp:TextBox></td>
   </tr>
   <tr>
     <td class="fieldname"><asp:Label runat="server" ID="lblGroup" AssociatedControlID="txtGroup" Text="Группа:" /></td>
      <td><asp:TextBox ID="txtGroup" runat="server" Width="99%"></asp:TextBox></td>
   </tr>  
</table>
<p></p>

