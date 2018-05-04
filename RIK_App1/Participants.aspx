<%@ Page Title="Osavõtjad" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Participants.aspx.cs" Inherits="RIK_App1.Participants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--Display person or company input form depending on the radio button list RblParticipantsType value--%>
    <script type='text/javascript'>

        function GetRadioButtonListSelectedValue(radioButtonList) {

            var InsertPerson = $('div#InsertPerson');
            var InsertCompany = $('div#InsertCompany');

            if (radioButtonList.rows[0].cells[0].firstChild.checked) {
                InsertPerson.css('display', 'inherit');
                InsertCompany.css('display', 'none');
                Page_IsValid = true;
            }

            if (radioButtonList.rows[0].cells[1].firstChild.checked) {
                InsertPerson.css('display', 'none');
                InsertCompany.css('display', 'inherit');
            }
        }

    </script>
    <script>
        $(document).ready(function () {
            $('div#InsertCompany').css('display', 'none');
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--Title and image-->
    <div class="row text-light mr-0 ml-0 mt-3 mb-3">
        <div class="col col-sm-4 col-md-3 col-lg-2 bg-blue">
            <p class="text-align-center h4 pt-3 pb-3">Osavõtjad</p>
        </div>
        <div class="col-12 col-sm pl-0 pr-0">
            <img class="img-full img-full-sm img-full-md img-full-lg img-full-xl" src="Content/libled.jpg" />
        </div>
    </div>

    <!--/.Title and image-->
    <!--container-->
    <!--title//-->
    <div class="container p-0 offset-sm-2">
        <h5 class="fg-blue">Osavõtjad</h5>

        <!--Event-->
        <asp:DataList ID="DlEvents" runat="server">
            <ItemTemplate>
                <div class="row">
                    <div class="col-5">
                        Ürituse nimi:
                    </div>
                    <div class="col text-muted">
                        <%# Eval("Name") %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-5">
                        Toimumisaeg:
                    </div>
                    <div class="col text-muted">
                        <%# Eval("DateTime") %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-5">
                        Koht:
                    </div>
                    <div class="col-6 text-muted bg-blue">
                        <%# Eval("Location") %>
                    </div>
            </ItemTemplate>
        </asp:DataList>

        <!--/.Event-->

        <!--Participants-->
        <asp:GridView ID="GvParticipants" DataKeyNames="IdParticipant" runat="server">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("IdParticipant") %>' CommandName="DeleteRow" ForeColor="#8C4510" runat="server" CausesValidation="false">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <!--/.Participants-->

        <!--Participants adding-->
        <!--Person-->
        <h5 class="fg-blue">Osavõtjate lisamine</h5>

        <asp:RadioButtonList RepeatLayout="Table" ID="RblParticipantsType" ClientIDMode="static" onchange="GetRadioButtonListSelectedValue(this)" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" CssClass="RadioButtonWidth col-1">
            <asp:ListItem Value="1" Selected="true">Eraisik</asp:ListItem>
            <asp:ListItem Value="2">Ettevõte</asp:ListItem>
        </asp:RadioButtonList>

        <div id="InsertPerson" class="container">
            <div class="form-group row">
                <label for="TxtPersonFirstName" class="form-label text-left col">Eesnimi</label>
                <div class="col-11">
                    <asp:TextBox ID="TxtPersonFirstName" runat="server" MaxLength="50" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RfvPersonFirstName" ControlToValidate="TxtPersonFirstName" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ValidationGroup="Person" CssClass="col-1 p-0">*</asp:RequiredFieldValidator>
            </div>
            <div class="form-group row">
                <label for="TxtPersonSurname" class="form-label text-left col">Perenimi</label>
                <div class="col-11">
                    <asp:TextBox ID="TxtPersonSurname" runat="server" MaxLength="50" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RfvPersonSurname" ControlToValidate="TxtPersonSurname" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ValidationGroup="Person" CssClass="col-1 p-0"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group row">
                <label for="TxtPersonPersonalID" class="form-label text-left">Isikukood</label>

                <div class="col-11">
                    <asp:TextBox ID="TxtPersonPersonalID" runat="server" MaxLength="11" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                <asp:RegularExpressionValidator ID="RfvPersonPersonalID" ControlToValidate="TxtPersonPersonalID" ValidationExpression="[0-9]{11}" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ValidationGroup="Person" CssClass="col-1 p-0"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group row ">
                <label for="DdlCompanyPayment" class="form-label  text-left">Maksmisviis:</label>
                <div class="col-11">
                    <asp:DropDownList ID="DdlPersonPayment" runat="server" CssClass="form-control form-control-sm">
                        <asp:ListItem Value="Ülekanne">Ülekanne</asp:ListItem>
                        <asp:ListItem Value="Sularaha">Sularaha</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group row">
                <label for="TxtPersonAdditionalInfo" class="form-label text-left">Lisainfo</label>
                <div class="col-11">
                    <asp:TextBox ID="TxtPersonAdditionalInfo" runat="server" MaxLength="1500" TextMode="MultiLine" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
            </div>
        </div>


        <!--Company-->
        <div id="InsertCompany" class="container">

            <div class="form-group row">
                <label for="TxtCompanyName" class="form-label text-left">Nimi:</label>
                <div class=" ">
                    <asp:TextBox ID="TxtCompanyName" runat="server" MaxLength="50" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="TxtCompanyRegistryNumber" class="form-labe text-left">Registrinumber:</label>
                <div class="">
                    <asp:TextBox ID="TxtCompanyRegistryNumber" runat="server" MaxLength="50" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="TxtCompanyParticipants" class="form-label text-left">Osalejatearv:</label>
                <div class="">
                    <asp:TextBox ID="TxtCompanyParticipants" runat="server" MaxLength="50" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="DdlCompanyPayment" class="form-label text-left">Maksmisviis:</label>
                <div class="">
                    <asp:DropDownList ID="DdlCompanyPayment" runat="server" CssClass="form-control form-control-sm">
                        <asp:ListItem Value="Ülekanne">Ülekanne</asp:ListItem>
                        <asp:ListItem Value="Sularaha">Sularaha</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group row">
                <label for="TxtCompanyAdditionalInfo" class="form-label text-left">Lisainfo:</label>
                <div class="">
                    <asp:TextBox ID="TxtCompanyAdditionalInfo" runat="server" MaxLength="1500" TextMode="MultiLine" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
            </div>
            <!--/.Company-->
        </div>
        <div class="form-group">
            <div class="text-left">
                <asp:Label ID="lblValidationMessageForUser" runat="server"></asp:Label>
                <asp:Button ID="BtnBackToHome" OnClick="BtnBackToHome_Click" runat="server" CausesValidation="false" Text="Tagasi" BorderStyle="None" CssClass="btn" />
                <asp:Button ID="BtnPersonInfo" OnClick="BtnInsertParticipant_Click" runat="server" ValidationGroup="Person" Text="Salvesta" BorderStyle="None" CssClass="btn bg-blue text-light" />
            </div>
        </div>
    </div>
</asp:Content>
