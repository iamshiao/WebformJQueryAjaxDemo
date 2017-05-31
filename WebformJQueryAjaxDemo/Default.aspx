<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CircleHsiao.JQueryAjax.Demo.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        select {
            font-size: large;
            margin: 0 5px 0 5px;
        }
    </style>
</head>
<body>
    <h2>ASP.NET Webform JQuery Ajax Demo - Cascading DropDownList update as example</h2>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList runat="server" ID="DropDownList_family">
                <asp:ListItem>Cat</asp:ListItem>
                <asp:ListItem>Dog</asp:ListItem>
            </asp:DropDownList>
            <select id="DropDownList_species" name="DropDownList_species"></select>
            <asp:Button ID="Button_submit" runat="server" Text="Submit" OnClick="Button_submit_Click" />
        </div>
    </form>
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/json2.min.js"></script>
    <script type="text/javascript">
        function UpdateDropDownListSpecies(family) {
            $.ajax({
                type: "POST",
                url: "Default.aspx/UpdateDropDownListSpecies",
                data: "{'family':'" + family + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    $("#DropDownList_species").empty();
                    $.each(JSON.parse(data.d), function (i, value) {
                        $("#DropDownList_species").append($("<option>").text(value).attr("value", value));
                    });
                },
                error: function (data) {
                }
            });
        }

        $(function () {
            $("#DropDownList_family").on("change", function () {
                UpdateDropDownListSpecies(this.value);
            });
            UpdateDropDownListSpecies($("#DropDownList_family").val());

        });
    </script>
</body>
</html>
