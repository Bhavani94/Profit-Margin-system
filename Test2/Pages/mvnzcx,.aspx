<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mvnzcx,.aspx.cs" Inherits="Test2.Pages.mvnzcx_" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="EntityDataSource1"><Series><asp:Series Name="Series1" XValueMember="ExpenseType" YValueMembers="Amount" ChartType="Pie"></asp:Series></Series><ChartAreas><asp:ChartArea Name="ChartArea1"></asp:ChartArea></ChartAreas></asp:Chart><asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ProfitProEntities" DefaultContainerName="ProfitProEntities" EnableFlattening="False" EntitySetName="Tbl_ExpenseReports" Select="it.[ExpenseType], it.[Amount]"></asp:EntityDataSource>
    </div>
    </form>
</body>
</html>
