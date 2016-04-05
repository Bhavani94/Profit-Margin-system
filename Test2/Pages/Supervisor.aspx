<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supervisor.aspx.cs" Inherits="Test2.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Supervisor</title>
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
                $("#view_Time").click(function () {
                    timeForm();
                });
                $("#view_Project").click(function () {
                    projectForm();
                });

            });
            $("#projButton").live("click", function () {
                viewProject();
            });
            $("#timeButton").live("click", function () {
                viewTime();
            });

            function timeForm() {
                $("#display_panel").html("");
                $("#display_panel").prepend('<input type="text" placeholder="ProjectID" id="ProjectID2" class="displayTime_columns" value="1000000001"><button id="timeButton" class="timeButton">Display Timesheet</button>');
            }
            function viewTime() {
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
            function dispTime(res) {
                $("#display_panel").html("");
                $.each(res, function (i, data) {
                    $("#display_panel").prepend('<table class="timeTable"><tr><th>Timesheet ID</th><th>Activity</th><th>Date</th><th>Hours</th></tr><tr><td>' + data.TimesheetID + '</td><td>' + data.Activity + '</td><td>' + data.Datee + '</td><td>' + data.hourss + '</td></tr></table>');
                });
            }
            function projectForm() {
                $("#display_panel").html("");
                $("#display_panel").prepend('<input type="text" placeholder="ProjectID" id="ProjectID3" class="displayTime_columns" value="1000000001"><button id="projButton" class="projButton">Display Project</button>');
            }
            function viewProject() {
                $.ajax(
                    {
                        url: "../Handlers/viewProject.ashx",
                        data: { "ProjectID3": $("#ProjectID3").val() },
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: dispProject,
                        error: function (xhr, ajaxOptions, thrownError) { }
                    });
            }
            function dispProject(res) {
                $("#display_panel").html("");
                $.each(res, function (i, data) {
                    $("#display_panel").prepend('<table class="timeTable"><tr><th>Contract ID</th><th>Project Description</th><th>Start Date</th><th>End Date</th><th>Technology</th></tr><tr><td>' + data.ContractID + '</td><td>' + data.ProjectDescr + '</td><td>' + data.ProjectStartDate + '</td><td>' + data.ProjectEndDate + '</td><td>'+ data.Technology+ '</td></tr></table>');
                });
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
            .projButton
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
            /*#update_Exp:hover 
            {
                background-color:black;
                color:white;
            }
            #show_Exp:hover 
            {
                background-color:black;
                color:white;
            }
            #view_Project:hover 
            {
                background-color:black;
                color:white;
            }
            #view_Time:hover 
            {
                background-color:black;
                color:white;
            }*/
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
            <form id="Form1" runat="server"><asp:Button Text="Logout" ID="logout" OnClick="Button1_Click" runat="server" /></form>
            <div id="top_panel" class="position_absolute">
                <img id="logo_img" src="../Resources/Images/coins.png" class="position_absolute" alt="ProfitPro" />
                <label id="titles" class="position_absolute">ProfitPro</label><br /><h3>Welcome&nbsp;<%=Session["name"] %>,&nbsp;<%=Session["designation"] %></h3>
            </div>
            <div id="control_panel" class="position_absolute">
                <%--<button class="control_Ele" id="view_Project">View Projects</button>
                <button class="control_Ele" id="view_Time">View Timesheet</button>--%>
                <section class="grid-wrap">
                    <ul class="grid swipe-right" id="grid">
                        <li><img src="../Resources/Images/project.png" class="icons" id="view_Project"/><h3>View Project</h3></li>
                        <li><img src="../Resources/Images/time_check.png" class="icons" id="view_Time"/><h3>View Timesheet</h3></li>  
                        
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
