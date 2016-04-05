<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Associate.aspx.cs" Inherits="Test2.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Manager Sample</title>
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
                $("#update_Time").click(function () {
                    timeForm();
                });

            });
            $(".input_columns").live("keyup", function () {
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
            $(".add_button1").live("click", function () {
                addTim();
            });

            function addExp() {
                $.ajax(
                    {
                        url: "../Handlers/addExpenses.ashx",
                        data: { "ProjectID": $("#ProjectID").val(), "AssociateID": $("#AssociateID").val(), "ExpenseType": $("#ExpenseType").val(), "ExpenseDate": $("#ExpenseDate").val(), "Amount": $("#Amount").val(), "Currency": $("#Currency").val(), "Descr": $("#Descr").val() },
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () { $(".input_columns").val(""); $(".add_button").attr('disabled', 'disabled'); $("#display_panel").html(""); },
                        error: function (xhr, ajaxOptions, thrownError) { }
                    });
            }
            function expenseForm() {
                $("#display_panel").html("");
                $("#display_panel").prepend('<input type="text" placeholder="ProjectID" id="ProjectID" class="input_columns" /><input type="text" placeholder="AssociateID" id="AssociateID" class="input_columns" /><input type="text" placeholder="ExpenseType" id="ExpenseType" class="input_columns" /><input type="text" placeholder="ExpenseDate" id="ExpenseDate" class="input_columns" /><input type="text" placeholder="Amount" id="Amount" class="input_columns" /><input type="text" placeholder="Currency" id="Currency" class="input_columns" /><input type="text" placeholder="Description" id="Descr" class="input_columns" /><button class="add_button" disabled>Add Expenses</button></div>');
            }
            function addTim() {
                $.ajax(
                    {
                        url: "../Handlers/addTime.ashx",
                        data: { "TimesheetID": $("#TimesheetID_txt").val(), "ProjectID": $("#ProjectID_txt").val(), "Activity": $("#Activity_txt").val(), "Datee": $("#Datee_txt").val(), "hourss": $("#hourss_txt").val(), "description": $("#desc_txt").val(), "rating": "0" },
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () { $(".input_columns").val(""); },
                        error: function (xhr, ajaxOptions, thrownError) { }
                    });
            }
            function timeForm() {
                $("#display_panel").html("");
                $("#display_panel").prepend('<input type="text" placeholder="TimesheetID" id="TimesheetID_txt" class="input_columns" /><input type="text" placeholder="ProjectID" id="ProjectID_txt" class="input_columns" /><input type="text" placeholder="Activity" id="Activity_txt" class="input_columns" /><input type="text" placeholder="Date" id="Datee_txt" class="input_columns" /><input type="text" placeholder="Hours" id="hourss_txt" class="input_columns" /><button class="add_button1" disabled>Add Timesheet Data</button></div>');
            }


        </script>
        <style type="text/css">
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
            }
            th 
            {
                color:white;
                background-color:black;
            }
            td 
            {
                color: black;
                background-color: lightgray';
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
            }
            .add_button1 
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
                 width:962px;
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
                top:150px;
                left:25px;
                width:350px;
                height:450px;
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
                height: 391px;
                border-style: solid;
                border-width: 1px;
                overflow-y: auto;
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
            <form runat="server"><asp:Button Text="Logout" ID="logout" OnClick="Button1_Click" runat="server" /></form>
            <div id="top_panel" class="position_absolute">
                <img id="logo_img" src="../Resources/Images/coins.png" class="position_absolute" alt="ProfitPro" />
                <label id="titles" class="position_absolute">ProfitPro</label><br /><h3>Welcome&nbsp;<%=Session["name"] %>,&nbsp;<%=Session["designation"] %></h3>
            </div>
            <div id="control_panel" class="position_absolute">
                <!--<button class="control_Ele" id="update_Exp">Update Expenses</button>
                <button class="control_Ele" id="update_Time">Update Timesheet</button>-->
                <section class="grid-wrap">
                    <ul class="grid swipe-right" id="grid">
                        <li><img src="../Resources/Images/exp.png" class="icons" id="update_Exp"/><h3>Update Expenses</h3></li>
                        <li><img src="../Resources/Images/time.png" class="icons" id="update_Time"/><h3>Update Timesheet</h3></li>  
                        
                    </ul>
                </section>
            </div>
            <div id="display_panel" class="position_absolute">

            </div>
        </div>
        <script>
            new GridScrollFx(document.getElementById('grid'), {
                viewportFactor: 0.4
            });

            </script>
    </body>
</html>
