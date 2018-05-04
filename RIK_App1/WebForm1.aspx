<%@ Page Title="Participant details" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="RIK_App1.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--Title and image-->
    <div class="row  text-light mr-0 ml-0 mt-3 mb-3">
        <div class="col col-height col-sm-5 col-md-4 col-lg-3 col-xl-2 bg-blue">
            <p class="text-align-center h4 pt-3 pb-3">Osavõtja info</p>
        </div>
        <div class="col-12 col-sm pl-0 pr-0">
            <img class="img-full img-full-sm img-full-md img-full-lg img-full-xl" src="Content/libled.jpg" />
        </div>
    </div>
    <!--/.Title and image-->

    <!--User data configuration text boxes-->
    <asp:DataList ID="Dl" runat="server">
        <ItemTemplate>

        </ItemTemplate>
    </asp:DataList>
    <div class="container offset-md-3">
        <div class="row fg-blue">
            <label class="text-left col h5 mb-3">Osavõtja info</label>
        </div>
        <div class="form-group row">
            <label for="txtPersonFirstName" class="form-label col-3 col-md-2 col-xl-1 text-left">Eesnimi</label>
            <div class="col-12 col-sm-9 col-md-5">
                <asp:TextBox ID="txtPersonFirstName" runat="server" MaxLength="50" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
        </div>

        <div class="form-group row">
            <label for="txtPersonSurname" class="form-label col-3 col-md-2 col-xl-1 text-left">Perenimi</label>
            <div class="col-12 col-sm-9 col-md-5">
                <asp:TextBox ID="txtPersonSurname" runat="server" MaxLength="50" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
        </div>

        <div class="form-group row">
            <label for="txtPersonPersonalId" class="form-label col-3 col-md-2 col-xl-1 text-left">Isikukood</label>
            <div class="col-12 col-sm-9 col-md-5">
                <asp:TextBox ID="txtPersonPersonalId" runat="server" MaxLength="11" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
        </div>

        <div class="form-group row">
            <label for="txtPersonPayment" class="form-label col-3 col-md-2 col-xl-1 text-left">Maksmisviis</label>
            <div class="col-12 col-sm-9 col-md-5">
                <asp:DropDownList ID="DDLPersonPayment" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="Ülekanne">Ülekanne</asp:ListItem>
                    <asp:ListItem Value="Sularaha">Sularaha</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group row">
            <label for="txtPersonAdditionalInfo" class="form-label col-3 col-md-2 col-xl-1 text-left">Lisainfo</label>
            <div class="col-12 col-sm-9 col-md-5">
                <asp:TextBox ID="txtPersonAdditionalInfo" runat="server" MaxLength="1500" TextMode="MultiLine" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
        </div>
        <div class="form-group row mt-4">
            <div class="text-left col-12">
                <asp:Button ID="BtnBackToHome" runat="server" OnClick="BtnBackToHome_Click" CausesValidation="false" Text="Tagasi" BorderStyle="None" CssClass="btn pr-2 pl-2" />
                <asp:Button ID="BtnUpdatePerson" runat="server" OnClick="BtnUpdatePerson_Click" Text="Salvesta" BorderStyle="None" CssClass="btn bg-blue text-light pr-2 pl-2" />
            </div>
        </div>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorPersonId" runat="server" ErrorMessage="Palun sisesta korrektne isikukood!"></asp:RegularExpressionValidator>
    </div>
    <%-- </ItemTemplate>
    </asp:DataList>--%>
</asp:Content>

