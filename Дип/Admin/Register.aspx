<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" Title="Untitled Page" %>
<%@ Register Src="~/UserProfile.ascx" TagName="UserProfile" TagPrefix="mb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" AutoGeneratePassword="false"
        ContinueDestinationPageUrl="~/Admin/Default.aspx" FinishDestinationPageUrl="~/Admin/Default.aspx"
        OnFinishButtonClick="CreateUserWizard1_FinishButtonClick" 
        oncreateduser="CreateUserWizard1_CreatedUser"> 
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" >
                <ContentTemplate> <div class="sectiontitle"> Создание новой учетной записи </div>
                <p></p>
                <table cellpadding="2">
                    <tr>
                        <td width="120" class="fieldname">Логин:</td>
                        <td width="300"><asp:TextBox runat="server" ID="Username" Width="100%" /></td>
                        <td><asp:RequiredFieldValidator ID="valRequireUserName" runat="server"
                                ControlToValidate="UserName" SetFocusOnError="true" Display="Dynamic" 
                                ErrorMessage="Не введен логин." ValidationGroup="CreateUserWizard1">*
                            </asp:RequiredFieldValidator> </td>
                    </tr>
                    <tr>
                        <td class="fieldname">Пароль:</td>
                        <td><asp:TextBox runat="server" ID="Password" TextMode="Password" Width="100%" /></td>
                        <td><asp:RequiredFieldValidator ID="valRequirePassword" runat="server"
                                ControlToValidate="Password" SetFocusOnError="true" Display="Dynamic" 
                                ErrorMessage="Не введен пароль." ValidationGroup="CreateUserWizard1">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="valPasswordLength"
                                runat="server" ControlToValidate="Password" SetFocusOnError="true" 
                                Display="Dynamic" ValidationExpression="\w{5,}"
                                ErrorMessage="Пароль должен содержать как минимум 5 симвлолов."
                                ValidationGroup="CreateUserWizard1">*</asp:RegularExpressionValidator>
                        </td>     
                    </tr>
                    <tr>
                        <td class="fieldname">Подтвердите пароль:</td>
                        <td><asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" Width="100%" /></td>
                        <td><asp:RequiredFieldValidator ID="valRequireConfirmPassword" runat="server"
                                ControlToValidate="ConfirmPassword" SetFocusOnError="true" Display="Dynamic" 
                                ErrorMessage="Отсутствует подтверждение пароля." ValidationGroup="CreateUserWizard1">
                            </asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="valComparePasswords"
                                runat="server" ControlToValidate="ConfirmPassword" SetFocusOnError="true" 
                                Display="Dynamic" ControlToCompare="Password"
                                ErrorMessage="Пароль и Подтверждение пароля должны совпадать."
                                ValidationGroup="CreateUserWizard1" >*</asp:CompareValidator>
                        </td>     
                    </tr>
                    <tr>
                        <td class="fieldname">e-mail:</td>
                        <td><asp:TextBox runat="server" ID="Email" Width="100%" /></td>
                        <td><asp:RequiredFieldValidator ID="valRequireEmail" runat="server"
                                ControlToValidate="Email" SetFocusOnError="true" Display="Dynamic" 
                                ErrorMessage="Не введен e-mail." ValidationGroup="CreateUserWizard1">*
                            </asp:RequiredFieldValidator>
                    </tr>
                    <tr>
                        <td colspan="3" align="right">
                            <asp:Label ID="ErrorMessage" SkinID="FeedbackKO" runat="server"
                                EnableViewState="false" />
                        </td>
                    </tr>
                </table>
                <asp:ValidationSummary ValidationGroup="CreateUserWizard1" ID="ValidationSummary1" runat="server"
                ShowMessageBox="true" ShowSummary="false" />
                </ContentTemplate>
            </asp:CreateUserWizardStep>
            <asp:WizardStep runat="server" Title="Персональные данные">
                <p></p>
                <mb:UserProfile ID="UserProfile1" runat="server" />
            </asp:WizardStep>
            <asp:CompleteWizardStep runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContent" Runat="Server">
</asp:Content>

