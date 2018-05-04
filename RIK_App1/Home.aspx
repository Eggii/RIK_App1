<%@ Page Title="Avaleht" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RIK_App1.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        //Navbar buttons color change
        $(document).ready(function () {

            var NavLinkAddUserEvent = $('#NavLinkAddUserEvent');
            var NavLinkAvaleht = $('#NavLinkAvaleht');

            NavLinkAvaleht.css('background-color', '#005AA1');
            NavLinkAvaleht.addClass('text-light');
            NavLinkAddUserEvent.addClass('text-dark');
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row text-light mr-0 ml-0 mt-3">
        <div class="col col-md-6 bg-blue">
            <p class="text-align-center">
                Sed nec vestibulub, <b>tincidunt orci</b> et, sagittis ex. 
                    Vestibulum rutrum <b>neque suscipit</b> ante mattis maximus non sapien <b>viverra,
                    lobortis lorem non</b>
                accumasn metus.
            </p>
        </div>
        <div class="col-12 col-md pl-0 pr-0">
            <img class="img-full-1 img-full-sm-1 img-full-md-1 img-full-lg-1 img-full-xl-1" src="Content/pilt.jpg" />
        </div>
    </div>

    <!-- upcoming events -->
    <div class="row ml-0 pt-3 mr-0 pb-5">
        <div class="col-12 col-sm-12 col-md-6 bg-white pl-0 pr-0">
            <h5 class="bg-blue text-light text-center pt-2 pb-2">Tulevased üritused</h5>
            <asp:GridView ID="GvComingEvents" DataKeyNames="ID" DataSourceID="SqlDComingEvent" AutoGenerateColumns="False" runat="server" ShowFooter="True" GridLines="None" Width="100%" RowStyle-CssClass="text-left item-hover" CssClass="mb-5 text-center">
                <Columns>
                    <asp:TemplateField ItemStyle-CssClass="pl-3">
                        <ItemTemplate>
                            <div class="row ml-1 mr-1 mr-lg-0">
                                <%# Container.DataItemIndex + 1 %>.
                                <div class="col col-lg text-left">
                                    <%# Eval("Name") %>
                                </div>
                                <div class="col col-sm-4 col-md-6 col-lg-4 text-left">
                                    <%# Eval("Date") %>
                                </div>
                                <div class="col-12 col-sm-4 col-md-12 col-lg-4 mb-2">
                                    <asp:LinkButton ID="BtnMoveToParticipants" OnClick="BtnMoveToParticipants_Click" CommandArgument='<%#Eval("ID") %>' Text="Osavõtjad" runat="server" ForeColor="#6c757d" Font-Bold="true" CssClass="ml-3 ml-sm-0 ml-md-3"></asp:LinkButton>
                                    <asp:ImageButton ID="LinkButton1" OnClientClick="return confirm('Kustuta üritus jäädavalt?');" CommandName="Delete" CausesValidation="false" runat="server" ImageUrl="Content/remove.svg" ForeColor="#6c757d" Font-Bold="true" Height="15px"></asp:ImageButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:LinkButton ID="BtnMoveToAddUserEvent" runat="server" Text="Lisa üritus" CommandArgument='<%#Eval("ID") %>' ForeColor="#6c757d" Font-Bold="true" OnClick="BtnMoveToAddUserEvent_Click" CssClass="m-4"></asp:LinkButton>
            <asp:SqlDataSource ID="SqlDComingEvent" runat="server" ConnectionString='<%$ ConnectionStrings:DB_EventsConnectionString %>' DeleteCommand="spDelete_Event" DeleteCommandType="StoredProcedure" SelectCommand="spSelect_UpcomingEvent" SelectCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>

        <!--Past events-->
        <div class="col bg-white pr-0 pl-0 mt-3 mt-md-0 ml-md-3">
            <h5 class="bg-blue text-light text-center pt-2 pb-2">Toimunud üritused</h5>
            <asp:GridView ID="GvPastEvents" DataKeyNames="ID" DataSourceID="SqlDSPastEvents" AutoGenerateColumns="False" runat="server" GridLines="None" Width="100%" RowStyle-CssClass="item-hover" CssClass="ml-3">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="row ml-1 mr-1">
                                <%# Container.DataItemIndex + 1 %>.
                                <div class="col col-lg-3 text-left">
                                    <%# Eval("Name") %>
                                </div>
                                <div class="col col-sm-4 col-md col-lg-5 text-left text-md-right">
                                    <%# Eval("Date") %>
                                </div>
                                <div class="col-12 col-sm-3 col-md-12 col-lg mb-2">
                                    <asp:LinkButton ID="LinkButton1" OnClick="BtnMoveToParticipants_Click" CommandArgument='<%#Eval("ID") %>' Text="Osavõtjad" runat="server" ForeColor="#6c757d" Font-Bold="true" CssClass="ml-3 ml-sm-0 ml-md-3"></asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDSPastEvents" DeleteCommand="spDelete_Event" DeleteCommandType="StoredProcedure" SelectCommand="spSelect_PastEvent" SelectCommandType="StoredProcedure" ConnectionString='<%$ ConnectionStrings:DB_EventsConnectionString %>' runat="server">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

