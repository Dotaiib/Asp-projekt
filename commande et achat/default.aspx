<%@ Page Language="C#" AutoEventWireup="true" maintainScrollPositionOnPostBack="true" CodeBehind="default.aspx.cs" Inherits="commande_et_achat._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" type="image/x-icon" href="/img/logo-dark.png" />
    <link href="/css/font-awesome.css" rel="stylesheet"/> 
    <link href="/css/style.css" rel="stylesheet"/>
    <title>Store</title>
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
        <div class="main-logo reduire" >
           <a href="default.aspx"><img src="/img/logo.png" /></a> 
        </div>
            <ul>
               <li><a href="default.aspx" class="reduire active"><i class="fa fa-home" aria-hidden="true"></i>Acceuil</a></li>
                <li><a href="contact.aspx" class="reduire"><i class="fa fa-envelope" aria-hidden="true"></i>Contact</a></li>
            </ul>
        </nav>
        <section class="section1">
            <div class="wrapper">
                <h1>APPAREILS ÉLECTRONIQUES</h1>
            </div>
        </section>
        <section class="section2">
            <form name="form1" runat="server">
        
            <div class="wrapper">
                <div class="box one">
                    <h1>PACK 10</h1>
                    <div class="img-container">
                        <img src="img/pack10.jpg" />
                    </div>
                    <div class="description">
                        <p>Achetez 10 produits au total.</p>
                        <asp:Button ID="Button1" CssClass="btn" runat="server" Text="acheter" OnClick="Button1_Click" />
                       </div>

                </div>
         
                <div class="box two">
                    <h1>PACK 20</h1>
                    <div class="img-container">
                        <img src="img/pack20.jpg" />
                    </div>
                    <div class="description">
                        <p>Achetez 20 produits au total.</p>
                        <asp:Button ID="Button2" CssClass="btn" runat="server" Text="acheter" OnClick="Button2_Click" />
                       </div>

                </div>
         
                <div class="box">
                    <h1>PACK 40</h1>
                    <div class="img-container">
                        <img src="img/pack40.jpg" />
                    </div>
                    <div class="description">
                        <p>Achetez 40 produits au total.</p>
                        <asp:Button ID="Button3" CssClass="btn" runat="server" Text="acheter" OnClick="Button3_Click" />
                       </div>

                </div>

                <div class="box">
                    <h1>PACK 50</h1>
                    <div class="img-container">
                        <img src="img/pack50.jpg" />
                    </div>
                    <div class="description">
                        <p>Achetez 50 produits au total.</p>
                        <asp:Button ID="Button4" CssClass="btn" runat="server" Text="acheter" OnClick="Button4_Click"/>
                       </div>

                </div>
            </div>
                
            </form>  
        </section>
        
    <section class="section3">
         <div class="wrapper">
                <h1>Ici vous trouverez toute sorte d'Appareils Électroniques</h1>
            </div>
    </section>

          <footer>
              <div>
                  <img src="img/logo.png"/>
                  <p>&copy; 2018</p>
              </div>
          </footer>
    <script src="/js/js.js"></script>
</body>
</html>
