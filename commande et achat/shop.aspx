<%@ Page Language="C#" AutoEventWireup="true" maintainScrollPositionOnPostBack="true" CodeBehind="shop.aspx.cs" Inherits="commande_et_achat.shop" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" type="image/x-icon" href="/img/logo-dark.png" />
    <link href="/css/font-awesome.css" rel="stylesheet"/> 
    <link href="/css/style.css" rel="stylesheet"/>
    <title>Shop</title>
     
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
    <form runat="server">
        <div class="shop-container">
            <asp:Panel ID="Panel1" runat="server">
                <h1><i class="fa fa-archive" aria-hidden="true"></i><br />Pack 10 produits</h1>
                <div class="produits">
                    <asp:ListView ID="ListView1" runat="server">
                        <ItemTemplate>
                            <div class="produit-box">
                            <div class="image-container">
                               <asp:Image ID="Image1" CssClass="img" runat="server"
                                    ImageUrl='<%#"data:image;base64," + Convert.ToBase64String((byte[])Eval("img"))%>'/>
                            </div>
                            <div class="text">
                                <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>' Visible="false"/>
                                <h2><%#Eval("titre") %></h2>
                                <p><%#Eval("descrip") %></p>
                                <p><strong>Prix : </strong><%#Eval("prix") %> DH</p>
                                <p><strong>Quantité : </strong>  <asp:Label ID="stock" runat="server" Text='<%#Eval("quantite") %>'></asp:Label></p>
                                    <label for="txtQuantiteSaisie">Choissisez votre quantité</label>
                                 <asp:TextBox ID="txtQuantiteSaisie" CssClass="txtQuantite" runat="server" TextMode="Number"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" Text="*" ControlToValidate="txtQuantiteSaisie"
                                    ForeColor="Red" Type="Integer" MinimumValue="0" MaximumValue="50" Display="Dynamic"></asp:RangeValidator>
                            </div>
                         
                                </div>
                        </ItemTemplate>
                    </asp:ListView>
                    
                </div>
                 <div class="nomPrenom">
                         <p>
                         <label for="txtNomPack10">Nom :</label>
                         <asp:TextBox ID="txtNomPack10" CssClass="infoClient" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="*"
                               ControlToValidate="txtNomPack10" Display="Dynamic" ForeColor="Red" Font-Size="18px"></asp:RequiredFieldValidator>
                         
                         </p>
                         <p>
                         <label for="txtPrenomPack10">Prenom :</label>
                         <asp:TextBox ID="txtPrenomPack10" CssClass="infoClient" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="*"
                               ControlToValidate="txtPrenomPack10" Display="Dynamic" ForeColor="Red" Font-Size="18px"></asp:RequiredFieldValidator>
                         
                        </p>
                     </div>
                <asp:Label ID="statusPack10" runat="server" CssClass="statusValider"></asp:Label>
                <asp:Button ID="ValiderPack10" runat="server" Text="Valider" CssClass="btnValider" OnClick="ValiderPack10_Click" />
            </asp:Panel>

                 <asp:Panel ID="Panel2" runat="server">
                <h1><i class="fa fa-archive" aria-hidden="true"></i><br />Pack 20 produits</h1>
                      <div class="produits">
                    <asp:ListView ID="ListView2" runat="server">
                        <ItemTemplate>
                            <div class="produit-box">
                            <div class="image-container">
                               <asp:Image ID="Image1" CssClass="img" runat="server" 
                                    ImageUrl='<%#"data:image;base64," + Convert.ToBase64String((byte[])Eval("img"))%>'/>
                            </div>
                            <div class="text">
                                <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>' Visible="false"/>
                                <h2><%#Eval("titre") %></h2>
                                <p><%#Eval("descrip") %></p>
                                <p><strong>Prix : </strong><%#Eval("prix") %></p>
                                <p><strong>Quantité : </strong>  <asp:Label ID="stock" runat="server" Text='<%#Eval("quantite") %>'></asp:Label></p>
                                    <label for="txtQuantiteSaisie">Choissisez votre quantité</label>
                                 <asp:TextBox ID="txtQuantiteSaisie" CssClass="txtQuantite" runat="server" TextMode="Number"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" Text="*" ControlToValidate="txtQuantiteSaisie" 
                                    ForeColor="Red" Type="Integer" MinimumValue="0" MaximumValue="50" Display="Dynamic"></asp:RangeValidator>
                            </div>
                         
                                </div>
                        </ItemTemplate>
                    </asp:ListView>
                         
                </div>
                      <div class="nomPrenom">
                         <p>
                         <label for="txtNom">Nom :</label>
                         <asp:TextBox ID="txtNomPack20" CssClass="infoClient" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Text="*"
                               ControlToValidate="txtNomPack20" Display="Dynamic" ForeColor="Red" Font-Size="18px"></asp:RequiredFieldValidator>
                         
                         </p>
                         <p>
                         <label for="txtPrenom">Prenom :</label>
                         <asp:TextBox ID="txtPrenomPack20" CssClass="infoClient" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Text="*"
                               ControlToValidate="txtPrenomPack20" Display="Dynamic" ForeColor="Red" Font-Size="18px"></asp:RequiredFieldValidator>
                         
                        </p>
                     </div>
                     <asp:Label ID="statusPack20" runat="server" CssClass="statusValider"></asp:Label>
                      <asp:Button ID="ValiderPack20" runat="server" Text="Valider" CssClass="btnValider" OnClick="ValiderPack20_Click" />
            </asp:Panel>
                 <asp:Panel ID="Panel3" runat="server">
                <h1><i class="fa fa-archive" aria-hidden="true"></i><br />Pack 40 produits</h1>
                      <div class="produits">
                    <asp:ListView ID="ListView3" runat="server">
                        <ItemTemplate>
                            <div class="produit-box">
                            <div class="image-container">
                               <asp:Image ID="Image1" CssClass="img" runat="server" Width="200px" Height="200px"
                                    ImageUrl='<%#"data:image;base64," + Convert.ToBase64String((byte[])Eval("img"))%>'/>
                            </div>
                            <div class="text">
                                <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>' Visible="false"/>
                                <h2><%#Eval("titre") %></h2>
                                <p><%#Eval("descrip") %></p>
                                <p><strong>Prix : </strong><%#Eval("prix") %></p>
                                <p><strong>Quantité : </strong>  <asp:Label ID="stock" runat="server" Text='<%#Eval("quantite") %>'></asp:Label></p>
                                    <label for="txtQuantiteSaisie">Choissisez votre quantité</label>
                                 <asp:TextBox ID="txtQuantiteSaisie" CssClass="txtQuantite" runat="server" TextMode="Number"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" Text="*" ControlToValidate="txtQuantiteSaisie" 
                                    ForeColor="Red" Type="Integer" MinimumValue="0" MaximumValue="50" Display="Dynamic"></asp:RangeValidator>
                            </div>
                         
                                </div>
                        </ItemTemplate>
                    </asp:ListView>
                        
                </div>
                     <div class="nomPrenom">
                         <p>
                         <label for="txtNom">Nom :</label>
                         <asp:TextBox ID="txtNomPack40" CssClass="infoClient" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Text="*"
                               ControlToValidate="txtNomPack40" Display="Dynamic" ForeColor="Red" Font-Size="18px"></asp:RequiredFieldValidator>
                         
                         </p>
                         <p>
                         <label for="txtPrenom">Prenom :</label>
                         <asp:TextBox ID="txtPrenomPack40" CssClass="infoClient" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Text="*"
                               ControlToValidate="txtPrenomPack40" Display="Dynamic" ForeColor="Red" Font-Size="18px"></asp:RequiredFieldValidator>
                         
                        </p>
                     </div>
                     <asp:Label ID="statusPack40" runat="server" CssClass="statusValider"></asp:Label>
                       <asp:Button ID="ValiderPack40" runat="server" Text="Valider" CssClass="btnValider" OnClick="ValiderPack40_Click" />
            </asp:Panel>
                 <asp:Panel ID="Panel4" runat="server">
                <h1><i class="fa fa-archive" aria-hidden="true"></i><br />Pack 50 produits</h1>
                      <div class="produits">
                    <asp:ListView ID="ListView4" runat="server">
                        <ItemTemplate>
                            <div class="produit-box">
                            <div class="image-container">
                               <asp:Image ID="Image1" CssClass="img" runat="server" Width="200px" Height="200px"
                                    ImageUrl='<%#"data:image;base64," + Convert.ToBase64String((byte[])Eval("img"))%>'/>
                            </div>
                            <div class="text">
                                <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>' Visible="false" />
                                <h2><%#Eval("titre") %></h2>
                                <p><%#Eval("descrip") %></p>
                                <p><strong>Prix : </strong><%#Eval("prix") %> DH</p>
                                <p><strong>Quantité : </strong>
                                    <asp:Label ID="stock" runat="server" Text='<%#Eval("quantite") %>'></asp:Label></p>
                                    <label for="txtQuantiteSaisie">Choissisez votre quantité</label>
                                 <asp:TextBox ID="txtQuantiteSaisie" CssClass="txtQuantite" runat="server"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" Text="*" ControlToValidate="txtQuantiteSaisie" 
                                    ForeColor="Red" Type="Integer" MinimumValue="0" MaximumValue="50" Display="Dynamic"></asp:RangeValidator>
                            </div>
                         
                                </div>
                        </ItemTemplate>
                    </asp:ListView>
                          
                </div>
                      <div class="nomPrenom">
                         <p>
                         <label for="txtNom">Nom :</label>
                         <asp:TextBox ID="txtNomPack50" CssClass="infoClient" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*"
                               ControlToValidate="txtNomPack50" Display="Dynamic" ForeColor="Red" Font-Size="18px"></asp:RequiredFieldValidator>
                         </p>
                         <p>
                         <label for="txtPrenom">Prenom :</label>
                         <asp:TextBox ID="txtPrenomPack50" CssClass="infoClient" runat="server"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*"
                               ControlToValidate="txtPrenomPack50" Display="Dynamic" ForeColor="Red" Font-Size="18px"></asp:RequiredFieldValidator>
                        </p>
                     </div>
                     <asp:Label ID="statusPack50" runat="server" CssClass="statusValider"></asp:Label>
                     <asp:Button ID="ValiderPack50" runat="server" Text="Valider" CssClass="btnValider" OnClick="ValiderPack50_Click" />
            </asp:Panel>

                 <asp:Panel ID="Panel5" runat="server">
                <h1><i class="fa fa-exclamation-triangle fa-4x" aria-hidden="true"></i><br />choisissez un pack!</h1>
            </asp:Panel>
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
