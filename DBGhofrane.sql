/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  02/05/2024 20:53:11                      */
/*==============================================================*/


/*==============================================================*/
/* Table : Admin                                                */
/*==============================================================*/
create table Admin
(
   nomAdmin             varchar(254)
);

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   nomClient            varchar(254),
   adresse              varchar(254),
   infoCarteBancaire    varchar(254),
   infoLivraison        varchar(254),
   soldeCompte          float
);

/*==============================================================*/
/* Table : Commande                                             */
/*==============================================================*/
create table Commande
(
   numCmd               int,
   dateCreation         datetime,
   dateEnvoi            datetime,
   nomClient            varchar(254),
   numClient            int,
   statut               varchar(254),
   numEnvoi             int
);

/*==============================================================*/
/* Table : DetailsDeLaCommande                                  */
/*==============================================================*/
create table DetailsDeLaCommande
(
   numCmd               int,
   numProd              int,
   nomProd              varchar(254),
   quantite             int,
   prixUnitaire         float,
   sousTotal            float
);

/*==============================================================*/
/* Table : InformationsDeLivraison                              */
/*==============================================================*/
create table InformationsDeLivraison
(
   numEnvoi             int,
   typeLivraison        varchar(254),
   prixLivraison        float,
   numRegionDest        int
);

/*==============================================================*/
/* Table : Observer                                             */
/*==============================================================*/
create table Observer
(
   id                   int
);

/*==============================================================*/
/* Table : Panier                                               */
/*==============================================================*/
create table Panier
(
   numPanier            int,
   numProd              int,
   quantite             int,
   dateAjout            datetime,
   CONSTRAINT CHK_QuantitePositive CHECK (quantite > 0)

);

/*==============================================================*/
/* Table : Produit                                              */
/*==============================================================*/
create table Produit
(
   numProd              int,
   nomProd              varchar(254),
   description          varchar(254)
);

/*==============================================================*/
/* Table : Utilisateur                                          */
/*==============================================================*/
create table Utilisateur
(
   numUtilisateur       varchar(254),
   email                varchar(254),
   motDePasse           varchar(254),
   statutConnexion      varchar(254),
   dateInscrip          datetime
);

/*==============================================================*/
/* Table : association2                                         */
/*==============================================================*/
create table association2
(
   numProd              int not null,
   numPanier            int not null,
   primary key (numProd, numPanier)
);

/*==============================================================*/
/* Table : association7                                         */
/*==============================================================*/
create table association7
(
   numCmd               int not null,
   numProd              int not null,
   primary key (numCmd, numProd)
);

alter table Admin add constraint FK_Admin_etend_CreateurUtilisateur foreign key (nomAdmin)
      references Utilisateur (numUtilisateur) on delete cascade on update cascade;

alter table Client add constraint FK_Client_etend_CreateurUtilisateur foreign key (nomClient)
      references Utilisateur (numUtilisateur) on delete cascade on update cascade;

alter table Commande add constraint FK_Generalisation_6 foreign key (numCmd)
      references Observer (id) on delete cascade on update cascade;

alter table Commande add constraint FK_association5 foreign key (numCmd)
      references InformationsDeLivraison (numEnvoi) on delete cascade on update cascade;

alter table Commande add constraint FK_association6 foreign key (numCmd)
      references DetailsDeLaCommande (numCmd) on delete cascade on update cascade;

alter table Commande add constraint FK_passer foreign key (numCmd)
      references Client (nomClient) on delete cascade on update cascade;

alter table DetailsDeLaCommande add constraint FK_association6 foreign key (numCmd)
      references Commande (numCmd) on delete cascade on update cascade;

alter table InformationsDeLivraison add constraint FK_association5 foreign key (numEnvoi)
      references Commande (numCmd) on delete cascade on update cascade;

alter table association2 add constraint FK_association2 foreign key (numPanier)
      references Panier (numPanier) on delete cascade on update cascade;

alter table association2 add constraint FK_association2 foreign key (numProd)
      references Produit (numProd) on delete cascade on update cascade;

alter table association7 add constraint FK_association7 foreign key (numCmd)
      references Commande (numCmd) on delete cascade on update cascade;

alter table association7 add constraint FK_association7 foreign key (numProd)
      references Produit (numProd) on delete cascade on update cascade;

