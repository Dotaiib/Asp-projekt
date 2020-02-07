<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="facture.aspx.cs" Inherits="commande_et_achat.facture" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" type="image/x-icon" href="/img/logo-dark.png" />
   <link href="/css/style.css" rel="stylesheet"/>
    <link href="/css/font-awesome.css" rel="stylesheet"/>
    <title>Facture</title>
 
</head>
<body class="facture-body">
    <nav class="nav reduire">
        <div class="main-logo reduire" >
           <a href="default.aspx"><img src="/img/logo.png" /></a> 
        </div>
            <ul>
               <li><a href="#" class="reduire" onclick="imprimer()"><i class="fa fa-print" aria-hidden="true"></i>Imprimer</a></li>
            </ul>
        </nav>
    <form id="form1" runat="server">
    
    <page size="A4" class="facture" id="facture">
        
        <header>
            <div class="logo-container">
                <img src="/img/logo-dark.png" />
            </div>
            <div class="adress">
                <p>
                     N° 17 Avenu hassan II<br /> Agadir 80020<br /> Maroc
                </p>
            </div>
            
        </header>
        <div class="infoFacture">
                <asp:Label ID="LabelNumFacture" text="" runat="server"></asp:Label>
            <br />
             <asp:Label ID="LabelDate" text="" runat="server"></asp:Label>
            <br />
             <asp:Label ID="LabelNom" text="" runat="server"></asp:Label>
            <br />
             <asp:Label ID="LabelPrenom" text="" runat="server"></asp:Label>
          </div>

        <div class="produits">
           <h2>produits commandés</h2>
            <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="PlaceHolder1">
                <LayoutTemplate>
                <table>
                     <thead>
                        <tr>
                            <th>ID</th>
                            <th>Titre</th>
                            <th>Quantité</th>
                            <th>Prix</th>
                        </tr>
                    </thead>
                         <asp:PlaceHolder ID="PlaceHolder1" runat="server" />    
                    <tfoot>
                        <tr>
                            <td colspan="2"><strong>TOTAL :</strong></td>
                            <td><asp:Label ID="LabelTotalQ" runat="server" Text=""></asp:Label></td>
                            <td><asp:Label ID="LabelTotalP" runat="server" Text=""></asp:Label></td>
                      </tr>

                </tfoot>
                   
                </table>
                   
                </LayoutTemplate>
          
                <ItemTemplate>
                   <tr>
                        <td>
                            <asp:Label ID="LabelId" runat="server" Text='<%#Eval("idProduit") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelTitre" runat="server" Text='<%#Eval("titre") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelQuantite" runat="server" Text='<%#Eval("quantite") %>'></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="LabelPrix" runat="server" Text='<%#Eval("prix") %>'></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
                          
            </asp:ListView>
        </div>
 
    </page>
        
    </form>
    <script src="/js/js.js"></script>
</body>
</html>
