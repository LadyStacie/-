<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccessDenied.aspx.cs" Inherits="AccessDenied" Title="Untitled Page" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:Label runat="server" ID="lblLoginRequired" Font-Bold="true">
    <p></p>
    К этой странице доступ могут получать только зарегистрированные пользователи.
    Если у вас уже есть учетная запись, введите свое имя пользователя и пароль в поле в правом верхнем углу.
    В противном случае <a href="Register.aspx">щелкните здесь</a>, чтобы зарегистрироваться прямо сейчас.
</asp:Label>
<asp:Label runat="server" ID="lblInsufficientPermissions" Font-Bold="true">
    Извините, но у вашей учетной записи нет прав, необходимых для доступа к этой странице.
</asp:Label>
<asp:Label runat="server" ID="lblInvalidCredentials" Font-Bold="true">
    Неправильное имя пользователя или пароль. Пожалуйста, проверьте, правильно ли вы ввели имя пользователя и пароль,
    и попробуйте ввести их снова. 
    </asp:Label>
</asp:Content>

