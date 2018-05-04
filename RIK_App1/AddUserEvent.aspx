<%@ Page Title="Ürituse lisamine" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddUserEvent.aspx.cs" Inherits="RIK_App1.AddUserEvent" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        //Navbar buttons color change
        $(document).ready(function () {

            var NavLinkAddUserEvent = $('#NavLinkAddUserEvent');
            var NavLinkAvaleht = $('#NavLinkAvaleht');

            NavLinkAddUserEvent.css('background-color', '#005AA1');
            NavLinkAddUserEvent.addClass('text-light');
            NavLinkAvaleht.addClass('text-dark');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--Datetime picker scripts-->
    <link href="Content/jquery.datetimepicker.css" rel="stylesheet" />
    <script src="Scripts/jquery.datetimepicker.full.min.js"></script>
    <!--/.Datetime picker scripts-->

    <!--/.Title and image-->
    <div class="row  text-light mr-0 ml-0 mt-3 mb-3">
        <div class="col col-sm-6 col-md-4 col-xl-3 bg-blue">
            <p class="text-align-center h4 pt-3 pb-3">Ürituse lisamine</p>
        </div>
        <div class="col-12 col-sm-6 col-md pl-0 pr-0">
            <img class="img-full img-full-sm img-full-md img-full-lg img-full-xl" src="Content/libled.jpg" />
        </div>
    </div>

    <!--Label Ürituse lisamine-->
    <div class="container offset-md-3">
        <div class="row fg-blue">
            <label class="text-left col h5 mb-3">Ürituse lisamine</label>
        </div>
        <!--Label Ürituse lisamine-->

        <!--Event data inputs-->
        <!--Event Name-->
        <div class="form-group row">
            <label for="TxtEventName" class="form-label col-sm-3 col-md-3 col-lg-2 text-left">Ürituse nimi:</label>
            <div class="col-11 col-sm-8 col-md-5">
                <asp:TextBox ID="TxtEventName" runat="server" MaxLength="50" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEventName"
                ControlToValidate="TxtEventName"
                ValidationGroup="EventValidation"
                ErrorMessage="*"
                runat="Server"
                ForeColor="Red"
                Font-Bold="true">
            </asp:RequiredFieldValidator>
        </div>
        <!--/.Event Name-->

        <!--Date & Time-->
        <div class="form-group row">
            <label for="TxtEventDateTime" class="form-label col-sm-3 col-md-3 col-lg-2 text-left">Toimumisaeg:</label>
            <div class="col-11 col-sm-8 col-md-5">
                <asp:TextBox ID="TxtEventDateTime" runat="server" ClientIDMode="static" MaxLength="50" Text="pp.kk.aaaa hh:mm" ForeColor="GrayText" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldEventDateTime"
                ControlToValidate="TxtEventDateTime"
                ValidationGroup="EventValidation"
                ErrorMessage="*"
                runat="Server"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
        <!--/.Date & Time-->

        <!--Location-->
        <div class="form-group row">
            <label for="TxtEventLocation" class="form-label col-sm-3 col-md-3 col-lg-2 text-left">Koht:</label>
            <div class="col-11 col-sm-8 col-md-5">
                <asp:TextBox ID="TxtEventLocation" runat="server" MaxLength="11" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEventLocation"
                ControlToValidate="TxtEventLocation"
                ValidationGroup="EventValidation"
                ErrorMessage="*"
                runat="Server"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
        <!--/.Location-->

        <!--Additional info-->
        <div class="form-group row">
            <label for="TxtEventAdditionalInfo" class="form-label col-sm-3 col-md-3 col-lg-2 text-left">Lisainfo:</label>
            <div class="col-11 col-sm-8 col-md-5">
                <asp:TextBox ID="TxtEventAdditionalInfo" runat="server" MaxLength="1000" TextMode="MultiLine" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEventAdditionalInfo"
                ControlToValidate="TxtEventAdditionalInfo"
                ValidationGroup="EventValidation"
                ErrorMessage="*"
                runat="Server"
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
        <!--/.Additional info-->
    </div>
    <!--/.Event data inputs-->

    <!--Message for user//-->
    <asp:Label ID="lblMessage" runat="server" CssClass="col offset-md-3 mt-3 mt-3"></asp:Label>

    <!--Action buttons-->
    <div class="col offset-md-3 mt-3">

        <!--Home.aspx//-->
        <asp:Button ID="BtnBackToHome" runat="server" Text="Tagasi" BorderStyle="None" CssClass="btn pr-2 pl-2 mr-2" OnClick="BtnBackToHome_Click" />

        <!--Add data control//-->
        <asp:Button ID="BtnSave" runat="server" OnClick="BtnSave_Click" Text="Lisa" CausesValidation="true" ValidationGroup="EventValidation" BorderStyle="None" CssClass="btn bg-blue text-light pr-2 pl-2" />
    </div>
    <!--/.Action buttons-->

    <!--Datepicker conf script//-->
    <script src="Content/DateTimePickerConf.js"></script>

</asp:Content>
