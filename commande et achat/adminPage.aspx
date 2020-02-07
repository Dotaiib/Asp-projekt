<%@ Page Language="C#" AutoEventWireup="true" maintainScrollPositionOnPostBack="true" CodeBehind="adminPage.aspx.cs" Inherits="commande_et_achat.adminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="/css/font-awesome.css" rel="stylesheet"/> 
    <link href="/css/style.css" rel="stylesheet"/>
    <title>Admin Page</title>
</head>
<body>
   
     <div class="menu" id="menu">
           <i class="fa fa-bars" aria-hidden="true"></i>
         <div class="submenu">
             <a href="default.aspx"><i class="fa fa-home" aria-hidden="true"></i>Acceuil</a>
             <a href="adminPage.aspx"><i class="fa fa-sign-in" aria-hidden="true"></i>Admin</a>
         </div>
            
        </div>
      
    <nav class="nav reduire">
        <div class="main-logo reduire">
            <a href="default.aspx">
                <img src="/img/logo.png" /></a>
        </div>
        <ul>
            <li><a href="default.aspx" class="reduire"><i class="fa fa-home" aria-hidden="true"></i>Acceuil</a></li>
            <li><a href="adminPage.aspx" class="reduire active"><i class="fa fa-sign-in" aria-hidden="true"></i>Admin</a></li>
        </ul>
    </nav>
   <form name="form1" runat="server">
 
        <div class="gestion-container">
            <div class="gestion-box">
                <h1>Gestion de stocks</h1>
                <p>
                    <asp:TextBox ID="txtRechercher" runat="server" placeholder="Rechercher par ID" TextMode="Number" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="supp" runat="server" Text="*" ControlToValidate="txtRechercher" ForeColor="#FF3300" Font-Size="22px" Display="Dynamic"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <label for="txtTitre">Titre</label>
                    <asp:TextBox ID="txtTitre" runat="server" CssClass="champs"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="ajouterModifier" runat="server" Text="*" ControlToValidate="txtTitre" ForeColor="#FF3300" Font-Size="22px" Display="Dynamic"></asp:RequiredFieldValidator>
                </p>
                 <p>
                    <label for="txtDescription">Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="champs" TextMode="MultiLine" Rows="5"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="ajouterModifier" runat="server" Text="*" ControlToValidate="txtDescription" ForeColor="#FF3300" Font-Size="22px" Display="Dynamic"></asp:RequiredFieldValidator>
                </p>
                 <p>
                    <label for="txtPrix">Prix(Dh)</label>
                    <asp:TextBox ID="txtPrix" runat="server" CssClass="champs" TextMode="Number"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="ajouterModifier" runat="server" Text="*" ControlToValidate="txtPrix" ForeColor="#FF3300" Font-Size="22px" Display="Dynamic"></asp:RequiredFieldValidator>
                </p>
                 <p>
                    <label for="FileUpload1">Image</label>
                     <asp:FileUpload ID="FileUpload1" runat="server" CssClass="champs"/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="ajouterModifier" runat="server" Text="*" ControlToValidate="FileUpload1" ForeColor="#FF3300" Font-Size="22px" Display="Dynamic"></asp:RequiredFieldValidator>
                </p>
                 <p>
                    <label for="txtQuantite">Quantité</label>
                    <asp:TextBox ID="txtQuantite" runat="server" CssClass="champs" TextMode="Number"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="ajouterModifier" runat="server" Text="*" ControlToValidate="txtQuantite" ForeColor="#FF3300" Font-Size="22px" Display="Dynamic"></asp:RequiredFieldValidator>
                </p>
                <asp:Label ID="Label1" runat="server" ></asp:Label>
                <asp:Button ID="Ajouter" runat="server" Text="Ajouter" OnClick="Ajouter_Click" ValidationGroup="ajouterModifier"/>
                <asp:Button ID="Modifier" runat="server" Text="Modifier" OnClick="Modifier_Click" ValidationGroup="ajouterModifier"/>
                <asp:Button ID="Supprimer" runat="server" Text="Supprimer" OnClick="Supprimer_Click" ValidationGroup="supp"/>
                
            </div>
           <div class="gestion-grid">
               <h1>Liste des Produits</h1>
               <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowPaging="True" ForeColor="Black">
                   <Columns>
                       <asp:TemplateField ShowHeader="False">
                          
                           <ItemTemplate>     
                               <asp:LinkButton CssClass="btn" ID="LinkButton2" runat="server" CausesValidation="True" CommandName="Delete" Text="Supprimer" BackColor="#ff5252"></asp:LinkButton>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                       <asp:TemplateField HeaderText="Titre" SortExpression="titre" HeaderStyle-CssClass="grid-header">
                           
                           <ItemTemplate>
                               <asp:Label ID="Label1" runat="server" Text='<%# Bind("titre") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Description" SortExpression="descrip" HeaderStyle-CssClass="grid-header">
                           
                           <ItemTemplate>
                               <asp:Label ID="Label2" runat="server" Text='<%# Bind("descrip") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Prix" SortExpression="prix" HeaderStyle-CssClass="grid-header">
                          
                           <ItemTemplate>
                               <asp:Label ID="Label3" runat="server" Text='<%# Bind("prix") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Image" HeaderStyle-CssClass="grid-header">
                           <ItemTemplate>
                                <asp:Image ID="Image1" CssClass="img" runat="server" Width="100px" Height="100px"
                                    ImageUrl='<%#"data:image;base64," + Convert.ToBase64String((byte[])Eval("img"))%>'/>
                           </ItemTemplate>
                          
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Quantite" SortExpression="quantite" HeaderStyle-CssClass="grid-header">
                           
                           <ItemTemplate>
                               <asp:Label ID="Label4" runat="server" Text='<%# Bind("quantite") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                   </Columns>
                   <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                   <HeaderStyle BackColor="#263238" Font-Bold="True" ForeColor="White"/>
                   <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                   <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                   <SortedAscendingCellStyle BackColor="#F7F7F7" />
                   <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                   <SortedDescendingCellStyle BackColor="#E5E5E5" />
                   <SortedDescendingHeaderStyle BackColor="#242121" />
               </asp:GridView>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockAchatsConnectionString %>" DeleteCommand="DELETE FROM [Produit] WHERE [id] = @id" InsertCommand="INSERT INTO [Produit] ([titre], [descrip], [prix], [img], [quantite]) VALUES (@titre, @descrip, @prix, @img, @quantite)" SelectCommand="SELECT * FROM [Produit]" UpdateCommand="UPDATE [Produit] SET [titre] = @titre, [descrip] = @descrip, [prix] = @prix, [img] = @img, [quantite] = @quantite WHERE [id] = @id">
                   <DeleteParameters>
                       <asp:Parameter Name="id" Type="Int32" />
                   </DeleteParameters>
                   <InsertParameters>
                       <asp:Parameter Name="titre" Type="String" />
                       <asp:Parameter Name="descrip" Type="String" />
                       <asp:Parameter Name="prix" Type="Double" />
                       <asp:Parameter Name="img" Type="Object" />
                       <asp:Parameter Name="quantite" Type="Int32" />
                   </InsertParameters>
                   <UpdateParameters>
                       <asp:Parameter Name="titre" Type="String" />
                       <asp:Parameter Name="descrip" Type="String" />
                       <asp:Parameter Name="prix" Type="Double" />
                       <asp:Parameter Name="img" Type="Object" />
                       <asp:Parameter Name="quantite" Type="Int32" />
                       <asp:Parameter Name="id" Type="Int32" />
                   </UpdateParameters>
               </asp:SqlDataSource>

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
