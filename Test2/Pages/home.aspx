<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="profitpro.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>

      <script src="../Resources/JS/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        
    </script>
    <style type="text/css">
        @charset "utf-8";
/* CSS Document */

/* ---------- FONTAWESOME ---------- */
/* ---------- http://fortawesome.github.com/Font-Awesome/ ---------- */
/* ---------- http://weloveiconfonts.com/ ---------- */

@import url(http://weloveiconfonts.com/api/?family=fontawesome);

/* ---------- ERIC MEYER'S RESET CSS ---------- */
/* ---------- http://meyerweb.com/eric/tools/css/reset/ ---------- */

@import url(http://meyerweb.com/eric/tools/css/reset/reset.css);

/* ---------- FONTAWESOME ---------- */

[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}

/* ---------- GENERAL ---------- */



input {
	font-size: inherit;
	margin: 0;
	padding: 0;
	-webkit-appearance: none;
}

/* ---------- LOGIN ---------- */

        #bg 
        {
            position:absolute;
            top:200px;
            left:320px;
            margin:10px auto;
            width:400px;
            height:300px;
            border:4px dashed black;
            background-color:#fff;
        }
#login {
	margin: 50px auto;
	width: 242px;
    /*background-color:azure;*/
}

#login span {
	color: #676767;
	display: block;
	height: 48px;
	line-height: 48px;
	position: absolute;
	text-align: center;
	width: 36px;
}

#login input {
	border: none;
	height: 48px;
	outline: none;
}

#login input[type="text"] {
	background: #dedede;
	border-top: 1px solid #000;
	border-right: 1px solid #000;
	border-left: 1px solid #000;
	border-radius: 5px 5px 0 0;
	color: #363636;
	padding-left: 36px;
	width: 204px;
}

#login input[type="password"] {
	background-color: #dedede;
	border-top: 1px solid #828282;
	border-right: 1px solid #000;
	border-bottom: 1px solid #000;
	border-left: 1px solid #000;
	border-radius: 0 0 5px 5px;
	color: #363636;
	margin-bottom: 20px;
	padding-left: 36px;
	width: 204px;
}

#login input[type="submit"] {
	background: #e14d4d;
	border: 1px solid #391515;
	border-radius: 5px;
	color: #fff;
	font-weight: bold;
	line-height: 48px;
	text-align: center;
	text-transform: uppercase;
	width: 240px;
}

#login input[type="submit"]:hover {
	background: #f15958;
}
        #logo {
            height: 250px;
            width: 800px;
        }
        #ok 
        {
            position:absolute;
            bottom:49px;
            width:286px;
            left: 28px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <img src="../Resources/Images/Logo_Cognizant.png" id="logo"/>
        <div id="bg">
        <div id="login">
             <span class="fontawesome-user"></span><asp:TextBox ID="TextBox1" placeholder="username" runat="server"></asp:TextBox>
        <span class="fontawesome-lock"></span><asp:TextBox ID="TextBox2" placeholder="password" runat="server" TextMode="Password"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="login" OnClick="Button1_Click" />
    </div>
    <div id="ok">
        <asp:Label ID="Label1" placeholder="Label1" runat="server" Text=""></asp:Label>
           </div>
        
            </div>
    </form>
</body>
</html>
