/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de creation :  23/04/2020 13:55:02                      */
/*==============================================================*/

create schema brief8;

use brief8;

drop table if exists Avion;

drop table if exists Pilote;

drop table if exists Vol;

/*==============================================================*/
/* Table : Avion                                                */
/*==============================================================*/
create table Avion
(
   NumAvion             numeric(8,0) not null,
   Localisation         text,
   Marque               text,
   TypeAvion            text,
   Capacite             numeric(4,0),
   primary key (NumAvion)
);

/*==============================================================*/
/* Table : Pilote                                               */
/*==============================================================*/
create table Pilote
(
   NumPil               numeric(8,0) not null,
   NomPil               text,
   Adresse              text,
   primary key (NumPil)
);

/*==============================================================*/
/* Table : Vol                                                  */
/*==============================================================*/
create table Vol
(
   NumVol               numeric(8,0) not null,
   NumPil               numeric(8,0) not null,
   NumAvion             numeric(8,0) not null,
   Ville_depart         text,
   Ville_arrive         text,
   date_depart          datetime,
   date_arrive          datetime,
   primary key (NumVol)
);

alter table Vol add constraint FK_administrer foreign key (NumPil)
      references Pilote (NumPil) on delete restrict on update restrict;

alter table Vol add constraint FK_effectier foreign key (NumAvion)
      references Avion (NumAvion) on delete restrict on update restrict;
      
/*==============================================================*/
/* ajouter les Avion                                            */
/*==============================================================*/

insert into Avion values (100,'Nice','AIRBUS','A320',300),(101,'Paris','BOIENG','B707',250),
(102,'Toulous','AIRBUS','A320',300),(103,'Toulous','CARAVELLE','CARAVELLE',200),
(104,'Paris','BOIENG','B747',400),(105,'Grenoble','AIRBUS','A320',300),
(106,'Paris','ATR','ATR42',50),(107,'Lyon','BOIENG','B727',300),
(108,'Nantes','BOIENG','B727',300),(109,'Bastia','AIRBUS','A340',350);
select * from Avion;

/*==============================================================*/
/* ajouter les Pilotes                                          */
/*==============================================================*/

insert into Pilote values (1,'SERGE','Nice'),(2,'JEAN','Paris'),(3,'CLAUDE','Grenoble'),
(4,'ROBERT','Nantes'),(5,'MICHEL','Paris'),(6,'LUCIEN','Toulous'),
(7,'BRTRAND','Lyon'),(8,'HERVE','Bastia'),(9,'LUC','Paris');

select * from Pilote;

/*==============================================================*/
/* ajouter les Pilotes                                          */
/*==============================================================*/

insert into Vol values (1,1,100,'Nice','Paris','2020-04-20 07:00:00','2020-04-20 09:00:00'),
(2,2,100,'Paris','Toulous','2020-04-20 11:00:00','2020-04-20 12:00:00'),
(3,1,101,'Paris','Nice','2020-04-20 12:00:00','2020-04-20 14:00:00'),
(4,3,105,'Grenoble','Toulous','2020-04-20 14:00:00','2020-04-20 16:00:00'),
(5,3,105,'Toulous','Grenoble','2020-04-20 17:00:00','19:00:00'),
(6,7,107,'Lyon','Paris','2020-04-20 20:00:00','2020-04-20 21:00:00'),
(7,8,109,'Bastia','Paris','2020-04-20 21:00:00','2020-04-21 00:00:00'),
(8,9,106,'Paris','Brive','2020-04-21 07:00:00','2020-04-21 08:00:00'),
(9,2,102,'Toulous','Paris','2020-04-21 15:00:00','2020-04-21 16:00:00'),
(10,4,101,'Nice','Nantes','2020-04-21 17:00:00','2020-04-21 19:00:00'),
(11,7,107,'Paris','Lyon','2020-04-21 18:00:00','2020-04-21 19:00:00'),
(12,9,106,'Brive','Paris','2020-04-21 19:00:00','2020-04-21 20:00:00');

select * from Vol;

/*==============================================================*/
/* modufier l'adresse de Pilote                                 */
/*==============================================================*/

update Pilote set Adresse='Nice' where NumPil=9;

/*==============================================================*/
/* supprimer une vol                                            */
/*==============================================================*/

delete from Vol where NumVol=12;


/*==============================================================*/
/* créer user                                                   */
/*==============================================================*/

create user 'noman'@'localhost' identified by '1111';

/*==============================================================*/
/* des droits spécifiés.                                        */
/*==============================================================*/

grant all privileges on brief8.* to 'noman'@'localhost';

/*==============================================================*/
/* suprimer user                                                */
/*==============================================================*/

DROP USER 'jamal'@'127.0.0.1'