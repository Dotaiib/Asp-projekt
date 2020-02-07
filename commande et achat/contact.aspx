<%@ Page Language="C#" maintainScrollPositionOnPostBack="true" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="commande_et_achat.contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" type="image/x-icon" href="/img/logo-dark.png" />
    <link href="/css/font-awesome.css" rel="stylesheet"/> 
    <link href="/css/style.css" rel="stylesheet"/>
    <title>Contact</title>
    <style>
        body {
            background-image: url("/img/dark-bg-img.jpg");
    background-attachment: fixed;
    background-repeat: no-repeat;
    background-size: cover;
    height: 100vh;
    position:relative;
        }
    </style>
</head>
<body>
    
     <div class="menu" id="menu">
           <i class="fa fa-bars" aria-hidden="true"></i>
         <div class="submenu">
             <a href="default.aspx"><i class="fa fa-home" aria-hidden="true"></i>Acceuil</a>
             <a href="contact.aspx"><i class="fa fa-envelope" aria-hidden="true"></i>Contact</a>
         </div>
            
        </div>
      
    <nav class="nav reduire">
        <div class="main-logo reduire">
            <a href="default.aspx">
                <img src="/img/logo.png" /></a>
        </div>
        <ul>
            <li><a href="default.aspx" class="reduire"><i class="fa fa-home" aria-hidden="true"></i>Acceuil</a></li>
            <li><a href="contact.aspx" class="reduire active"><i class="fa fa-envelope" aria-hidden="true"></i>Contact</a></li>
        </ul>
    </nav>

     <form id="form1" runat="server">

     <div class="box contact">
         <h1><i class="fa fa-envelope" aria-hidden="true"></i> contact</h1>
         <div class="contact-container">
        <p>
           <label for="nomtxt">Nom</label> 
            <asp:TextBox ID="nomtxt" runat="server" CssClass="input"></asp:TextBox>
         </p>
          <p>
           <label for="prenomtxt">Prénom</label>
            <asp:TextBox ID="prenomtxt" runat="server" CssClass="input"></asp:TextBox>
          </p>
              <p>
           <label for="email">Adresse e-mail</label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="*" Display="Dynamic" ForeColor="red" ErrorMessage="' Adresse e-mail ' est obligatoire." ControlToValidate="emailtxt"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailtxt" Display="Dynamic" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
           <asp:TextBox ID="emailtxt" runat="server" CssClass="input" TextMode="Email"></asp:TextBox>
          </p>
              <p>
           <label for="objet">Objet</label>
            <asp:TextBox ID="objettxt" runat="server" CssClass="input"></asp:TextBox>
             
        </p>
          <p class="full">
           <label for="messagetxt">Message</label>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Text="*" ForeColor="red" ControlToValidate="messagetxt"></asp:RequiredFieldValidator>
             <asp:TextBox ID="messagetxt" runat="server" CssClass="textarea" TextMode="MultiLine" Height="150"></asp:TextBox>
               
        </p>
            
              
           <p class="full statut">
               <asp:Label ID="statut" runat="server" Text="" ></asp:Label>
               <asp:Button ID="envoyer" runat="server" Text="Envoyer votre message" OnClick="envoyer_Click" />
               
           </p>
   </div>
   </div>
         </form> 
      <footer>
              <div>
                  <img src="img/logo.png"/>
                  <p>&copy; 2018</p>
              </div>
          </footer>
     <script src="/js/js.js"></script>
</body>
</html>
