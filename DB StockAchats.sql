Create Database StockAchats
Go
use StockAchats


create table Produit(
	id int identity(1,1) primary key,
	titre varchar(100), 
	descrip varchar(max),
	prix float ,
	img varbinary(max),
	quantite int
)

create table Commande(
	id int identity(1,1) primary key,
	clientNom varchar(30),
	clientPrenom varchar(30),
	dateC date,
)

create table Produit_Commandes(
	idCommande int foreign key references Commande(id),
	idProduit int foreign key references Produit(id) ON DELETE CASCADE,
	quantite int 
)

drop table Produit_Commandes

create table Administrateur(
	nom nvarchar(100),
	prenom nvarchar(100),
	email nvarchar(200),
	motDePasse nvarchar(100)
)

/***********
Ajouter un produit
***********/
Create procedure AjouterProduit
@titre varchar(100), 
@descrip varchar(250),
@prix float ,
@img varbinary(max),
@quantite int
as 
begin
	insert into Produit
	values(@titre,@descrip,@prix,@img,@quantite)
End



/***********
Modifier un produit
***********/
Create procedure ModifierProduit
@id int,
@titre varchar(100), 
@descrip varchar(250),
@prix float ,
@img varbinary(max),
@quantite int
as 
begin
	UPDATE Produit SET 
	titre = @titre , 
	descrip = @descrip ,
	prix = @prix ,
	img = @img , 
	quantite = @quantite 
	WHERE id = @id
End



/***********
Supprimer un produit
***********/

create procedure SupprimerProduit
@id int
AS
BEGIN
	DELETE FROM Produit WHERE id = @id
END



/*****************
Ajouter une commande
**********/
create procedure AjouterCommande
@Nom varchar(30),
@Prenom varchar(30),
@idCommande int output
as 
begin
	insert into Commande values(@Nom,@Prenom,getdate())
	select @idCommande = scope_identity()
end



--dbcc checkident('Commande',reseed,0); pour renitialiser identity

/********************
modifier la quantité dun produit apres une commande
****************************/

create trigger modifierQuantite on Produit_Commandes
after insert
as
begin
	declare @id int
	declare @q int
	set @id =(select idProduit from inserted)
	set @q = (select quantite from inserted)

	update Produit set
	quantite = quantite - @q
	 where id = @id
end

/*****************
ajouter a chaque produit commandé id de la commande
***************/
create procedure ProduitsCommande
@idC int ,
@idP int,
@quan int
as
begin
	insert into Produit_Commandes values(@idC,@idP,@quan)
end

/**************************
recuperer les produit commandes avec lid de la commande
******/
create procedure ListerProduitsCommandes
@idC int
as
begin
	select PC.idProduit , P.titre, P.prix , PC.quantite
		 from Produit_Commandes PC , Produit P 
		 where (PC.idCommande = @idC and P.id=PC.idProduit) 
end