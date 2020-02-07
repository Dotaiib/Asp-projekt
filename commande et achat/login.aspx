<%@ Page Language="C#" maintainScrollPositionOnPostBack="true" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="commande_et_achat.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" type="image/x-icon" href="/img/logo-dark.png" />
    <link href="/css/font-awesome.css" rel="stylesheet"/> 
    <link href="/css/style.css" rel="stylesheet"/>
    <title>Login</title>
     
</head>
<body>
   
     <div class="menu" id="menu">
           <i class="fa fa-bars" aria-hidden="true"></i>
         <div class="submenu">
             <a href="default.aspx"><i class="fa fa-home" aria-hidden="true"></i>Acceuil</a>
            <a href="contact.aspx" class="reduire"><i class="fa fa-envelope" aria-hidden="true"></i>Contact</a>
         </div>
            
        </div>
      
    <nav class="nav reduire">
        <div class="main-logo reduire">
            <a href="default.aspx">
                <img src="/img/logo.png" /></a>
        </div>
        <ul>
            <li><a href="default.aspx" class="reduire"><i class="fa fa-home" aria-hidden="true"></i>Acceuil</a></li>
            <li><a href="contact.aspx" class="reduire"><i class="fa fa-envelope" aria-hidden="true"></i>Contact</a></li>
        </ul>
    </nav>
     
        <div class="form-container">
            <div class="dark">
            <form name="form1" runat="server">
            <div class="login-form">
                <h1>log in</h1>
                <p>
                    <i class="fa fa-envelope" aria-hidden="true"></i>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                </p>
                 <p>
                     <i class="fa fa-key" aria-hidden="true"></i>
                    <asp:TextBox ID="txtPass" runat="server" placeholder="Mot de passe" TextMode="Password"></asp:TextBox>
                </p>
                <asp:Button ID="btnLogin" runat="server" Text="Log in" OnClick="btnLogin_Click" />
                <asp:Label ID="status" runat="server"></asp:Label>
            </div>
            </form>
                </div>
               </div>
             
          <footer>
              <div>
                  <img src="img/logo.png"/>
                  <p>&copy; 2018</p>
              </div>
          </footer>
     <script src="/js/js.js"></script>
</body>
</html>
