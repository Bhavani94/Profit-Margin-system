<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="Test2.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Manager</title>
        <link rel="stylesheet" type="text/css" href="../Resources/Styles/normalise.css" />
		<link rel="stylesheet" type="text/css" href="../Resources/Styles/layout.css" />
		<link rel="stylesheet" type="text/css" href="../Resources/Styles/blocks.css" />
		<script src="../Resources/JS/modernizr.customBlock.js"></script>
        <script src="../Resources/JS/masonry.pkgd.min.js"></script>
		<script src="../Resources/JS/classie.js"></script>
		<script src="../Resources/JS/imagesloaded.pkgd.min.js"></script>
		<script src="../Resources/JS/colorfinder-1.1.js"></script>
		<script src="../Resources/JS/gridScrollFx.js"></script>
        <script src="../Resources/JS/jquery-1.4.1.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                //okok();
                //addExp();
                
               $("#update_Exp").click(function () {
                    expenseForm();
                });
                $("#show_Exp").click(function () {
                    expenseDisplay();
                });
                $("#view_Time").click(function () {
                    timeForm();
                });
                $("#obt_Pro").click(function () {
                    totalprofit();
                });
                $("#improve").click(function () {
                    improvepro();
                });
                
            });
            $(".input_columns").live("keyup",function() {
                if ($("#ExpenseReportID").val() != "" && $("#ProjectID").val() != "" && $("#AssociateID").val() != "" && $("#ExpenseType").val() != "" && $("#ExpenseDate").val() != "" && $("#Amount").val() != "" && $("#Currency").val() != "" && $("#Descr").val() != "") {
                    $(".add_button").removeAttr('disabled');
                }
                else {
                    $(".add_button").attr('disabled', 'disabled');
                }
            });
            $(".add_button").live("click", function () {
                addExp();
            });
            $("#expButton").live("click", function () {
                dispExp();
            });
            $("#timeButton").live("click", function () {
                viewTime();
            });
            function addExp()
            {
                $.ajax(
                    {
                        url:"../Handlers/addExpenses.ashx",
                        data: { "ProjectID": $("#ProjectID").val(), "AssociateID": $("#AssociateID").val(), "ExpenseType": $("#ExpenseType").val(), "ExpenseDate": $("#ExpenseDate").val(), "Amount": $("#Amount").val(), "Currency": $("#Currency").val(), "Descr": $("#Descr").val() },
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () { $(".input_columns").val(""); $(".add_button").attr('disabled', 'disabled'); $("#display_panel").html("");},
                        error: function (xhr, ajaxOptions, thrownError) { }
                    });
            }
            function expenseForm()
            {
                $("#display_panel").html("");
                $("#display_panel").prepend('<input type="text" placeholder="ProjectID" id="ProjectID" class="input_columns" /><input type="text" placeholder="AssociateID" id="AssociateID" class="input_columns" /><input type="text" placeholder="ExpenseType" id="ExpenseType" class="input_columns" /><input type="text" placeholder="ExpenseDate" id="ExpenseDate" class="input_columns" /><input type="text" placeholder="Amount" id="Amount" class="input_columns" /><input type="text" placeholder="Currency" id="Currency" class="input_columns" /><input type="text" placeholder="Description" id="Descr" class="input_columns" /><button class="add_button" disabled>Add Expenses</button></div>');
            }
            function expenseDisplay()
            {
                $("#display_panel").html("");
                $("#display_panel").prepend('<input type="text" placeholder="ProjectID" id="ProjectID1" class="displayExp_columns"><button id="expButton" class="expButton">Display Expenses</button>');
            }
            function dispExp()
            {
                $.ajax(
                    {
                        url: "../Handlers/getExpenses.ashx",
                        data: { "ProjectID1": $("#ProjectID1").val() },
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: totExp,
                        error: function (xhr, ajaxOptions, thrownError) { }
                    });
            }
            function totExp(res1) {
                $("#display_panel").html("");
                $.each(res1, function (i, data) {
                    $("#display_panel").prepend('<table class="expTable"><tr><th>Expense Type</th><th>Amount</th><th>Currency</th><th>Description</th></tr><tr><td>' + data.ExpenseType + '</td><td>' + data.Amount + '</td><td>' + data.Currency + '</td><td>' + data.Descr + '</td></tr></table>');
                });
                $("#display_panel").append('<asp:Chart ID="Chart1" runat="server" DataSourceID="EntityDataSource1"><Series><asp:Series Name="Series1" XValueMember="ExpenseType" YValueMembers="Amount"></asp:Series></Series><ChartAreas><asp:ChartArea Name="ChartArea1"></asp:ChartArea></ChartAreas></asp:Chart><asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ProfitProEntities" DefaultContainerName="ProfitProEntities" EnableFlattening="False" EntitySetName="Tbl_ExpenseReports" Select="it.[ExpenseType], it.[Amount]"></asp:EntityDataSource>');
                //totExp1(res2);
                //function totExp1(res2) {
                  //  $.each(res2, function (i, data) {
                    //    $("#display_panel").prepend('<div>' + data.ProjectID);
                    //});
            }
            function timeForm()
            {
                $("#display_panel").html("");
                $("#display_panel").prepend('<input type="text" placeholder="ProjectID" id="ProjectID2" class="displayTime_columns" value="1000000001"><button id="timeButton" class="timeButton">Display Timesheet</button>');
            }
            function viewTime()
            {
                $.ajax(
                    {
                        url: "../Handlers/viewTimesheet.ashx",
                        data: { "ProjectID2": $("#ProjectID2").val() },
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: dispTime,
                        error: function (xhr, ajaxOptions, thrownError) { }
                    });
            }
            function dispTime(res)
            {
                $("#display_panel").html("");
                $.each(res, function (i, data) {
                    $("#display_panel").prepend('<table class="timeTable"><tr><th>Timesheet ID</th><th>Activity</th><th>Date</th><th>Hours</th></tr><tr><td>' + data.TimesheetID + '</td><td>' + data.Activity + '</td><td>' + data.Datee + '</td><td>'+data.hourss+'</td></tr></table>');
                });
            }            
            function totalprofit()
            {
                $("#display_panel").html("");
                $("#display_panel").prepend('<input type="text" placeholder="ProjectID" id="ProjectID3" class="displayExp_columns" value="1000000001"><button id="profitButton" class="expButton">Calculate Total Profit</button>');
            }
            $("#profitButton").live("click", function () {
                dummy();
                dummy2();
            });
            function dummy() {
                $.ajax(
                     {
                         url: "../Handlers/totalexpenses.ashx",
                         data: { "ProjectID3": $("#ProjectID3").val() },
                         contentType: "application/json; charset=utf-8",
                         dataType: "text",
                         success: totpro,
                         error: function (xhr, ajaxOptions, thrownError) { }
                     });
            }
            function dummy2()
            {
                $.ajax(
                     {
                         url: "../Handlers/profitmargin.ashx",
                         data: { "ProjectID3": $("#ProjectID3").val() },
                         contentType: "application/json; charset=utf-8",
                         dataType: "text",
                         success: totpro1,
                         error: function (xhr, ajaxOptions, thrownError) { }
                     });

            }
            function totpro(res5)
            {
                $("#display_panel").html("");

                $("#display_panel").prepend('<div id="titles">Total profit: ' + res5+'</div>');
            }
            function totpro1(res6) {


                $("#display_panel").prepend('<div id="titles">profit margin' + res6+'</div>');

            }
            $("#impprofitButton").live("click", function () {
                improvedprofit();
            });

            function improvepro() {
                $("#display_panel").html("");

                $("#display_panel").prepend('<select class="displayExp_columns"><option value="salary">salary</option></select><input type="text" placeholder="enter salary reduction%" id="sal" class="displayExp_columns" value=""><button id="impprofitButton" class="expButton">calculate profit</button>');
            }

            function improvedprofit() {
                $.ajax(
                     {
                         url: "../Handlers/impbysalary.ashx",
                         data: { "sal": $("#sal").val() },
                         contentType: "application/json; charset=utf-8",
                         dataType: "text",
                         success: impr,
                         error: function (xhr, ajaxOptions, thrownError) { }
                     });

            }
            function impr(res7) {
                $("#display_panel").html("");
                $("#display_panel").prepend('<div id="titles"> Profit after salary reduction : '+res7+'</div>');
            }

        </script>
        <style type="text/css">
            .profitButton 
            {
                position:relative;
                float:left;
                left:10px;
                margin-top:15px;
                width:350px;
                height:40px;
                border-radius:5px;
                font-size:18px;
                cursor:pointer;
                outline:none;
                background-color:white;
            }
            .timeButton 
            {
                position:relative;
                float:left;
                left:10px;
                margin-top:15px;
                width:350px;
                height:40px;
                border-radius:5px;
                font-size:18px;
                cursor:pointer;
                outline:none;
                background-color:white;
            }
            th 
            {
                color:white;
                background-color:black;
            }
            td 
            {
                color: black;
                background-color: lightgray;
            }
            .timeTable 
            {
                background-color:aliceblue;
                font-family:'Segoe UI';
                width: 530px;
                border:1px solid black;
                /*height: 391px;*/
                /*border-radius:5px;*/
                font-size:18px;
                cursor:pointer;
            }
            .expTable 
            {
                background-color: wheat;
                font-family:'Segoe UI';
                width: 535px;
                border:1px solid black;
                /*height: 391px;*/
                /*border-radius:5px;*/
                font-size:18px;
                cursor:pointer;
            }
            .expButton 
            {
                position:relative;
                float:left;
                left:10px;
                margin-top:15px;
                width:350px;
                height:40px;
                border-radius:5px;
                font-size:18px;
                cursor:pointer;
                outline:none;
                background-color:white;
            }
            .add_button 
            {
                position:relative;
                float:left;
                left:10px;
                margin-top:15px;
                width:350px;
                height:40px;
                border-radius:5px;
                font-size:18px;
                cursor:pointer;
                outline:none;
                background-color:white;
            }
            .displayTime_columns 
            {
                position:relative;
                float:left;
                left:10px;
                margin-top:15px;
                width:350px;
                height:35px;
                border-style:solid;
                border-width:1px;
                //border-radius:5px;
                font-size:18px;
            }
            .displayExp_columns 
            {
                position:relative;
                float:left;
                left:10px;
                margin-top:15px;
                width:350px;
                height:35px;
                border-style:solid;
                border-width:1px;
                //border-radius:5px;
                font-size:18px;
            }
            .input_columns 
            {
                position:relative;
                float:left;
                left:10px;
                margin-top:15px;
                width:350px;
                height:35px;
                border-style:solid;
                border-width:1px;
                //border-radius:5px;
                font-size:18px;
            }
            .input_columns1 
            {
                position:relative;
                float:left;
                left:10px;
                margin-top:15px;
                width:350px;
                height:35px;
                border-style:solid;
                border-width:1px;
                //border-radius:5px;
                font-size:18px;
            }
             .position_absolute 
             {
                 position:absolute;
             }
             #logo_img 
             {
                 width:50px;
                 height:50px;
                 top:60px;
             }
             #Main_Continer 
             {
                 width:862px;
                 height:610px;
                 border-style:solid;
                 border-width:1px;
                 border-radius:5px;

             }
            #top_panel
            {
                left: 25px;
                top: 5px;
            }
            #control_panel 
            {
                top:165px;
                left:25px;
                width:350px;
                height:400px;
                background:#F2F2F2;
            }
            #titles 
            {
                font-family:'256 Bytes';
                font-size: 50px;
                width: 601px;
                left: 110px;
                top: 60px;
            }
            .control_Ele
            {
                position:relative;
                float:left;
                margin-top:15px;
                width:350px;
                height:40px;
                border-style:solid;
                border-width:1px;
                border-radius:5px;
                font-size:18px;
                font-family:'Segoe UI';
            }
            #display_panel 
            {
                left: 400px;
                top: 165px;
                width: 535px;
                height: 400px;
                /*border: dashed 4px;
                padding:20px;
                border-width: 1px;*/
                overflow-y: auto;
                background-color:#D8D8D8;
                overflow-x:hidden;
            }
            #uid 
            {
                position: relative;
                top:15px;
                left:850px;                
                font-family: 'Agency FB';
                font-size: 25px;
            }
            #logout
            {
                position:absolute;
                top:45px;
                left:850px;
                background: #e14d4d;
                border: 1px solid #391515;
                border-radius: 5px;
                color: #fff;
                font-weight: 200;
                /*line-height: 48px;*/
                text-align: center;
                text-transform: uppercase;
                width: 100px;

            }                 
        </style>
    </head>
    <body>
        
        <div id="Main_Container" class="position_absolute">          
            <div id="uid"><%=Session["uid"] %></div>
            <form runat="server"><asp:Button Text="Logout" ID="logout" OnClick="Button1_Click" runat="server" /></form><div id="top_panel" class="position_absolute">
                <img id="logo_img" src="../Resources/Images/coins.png" class="position_absolute" alt="ProfitPro" />
                <label id="titles" class="position_absolute">ProfitPro</label><br /><h3>Welcome&nbsp;<%=Session["name"] %>,&nbsp;<%=Session["designation"] %></h3>
                
            </div>
            <div id="control_panel" class="position_absolute">
                <section class="grid-wrap">
                    <ul class="grid swipe-right" id="grid">
                        <li><img src="../Resources/Images/exp.png" class="icons" id="update_Exp"/><h3>Update Expenses</h3></li>
                        <li><img src="../Resources/Images/expdsp.png" class="icons" id="show_Exp"/><h3>Show Expenses</h3></li>  
                        <li><img src="../Resources/Images/pro.jpg" class="icons" id="obt_Pro"/><h3>Obtain Profit</h3></li>
                        <li><img src="../Resources/Images/time.png" class="icons" id="view_Time"/><h3>View Timesheet</h3></li>
                        <li><img src="../Resources/Images/pro.jpg" class="icons" id="improve"/><h3>Improve Profit</h3></li>
                    </ul>
                </section>
            </div>
            <div id="display_panel" class="position_absolute">

            </div>
            <script>
                new GridScrollFx(document.getElementById('grid'), {
                    viewportFactor: 0.4
                });

            </script>      
        </div>
        
		


    </body>
</html>
