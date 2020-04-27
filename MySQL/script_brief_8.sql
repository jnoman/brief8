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

insert into Avion values (100,'Nice','AIRBUS','A320',300);
insert into Avion values (101,'Paris','BOIENG','B707',250);
insert into Avion values (102,'Toulous','AIRBUS','A320',300);
insert into Avion values (103,'Toulous','CARAVELLE','CARAVELLE',200);
insert into Avion values (104,'Paris','BOIENG','B747',400);
insert into Avion values (105,'Grenoble','AIRBUS','A320',300);
insert into Avion values (106,'Paris','ATR','ATR42',50);
insert into Avion values (107,'Lyon','BOIENG','B727',300);
insert into Avion values (108,'Nantes','BOIENG','B727',300);
insert into Avion values (109,'Bastia','AIRBUS','A340',350);

select * from Avion;

/*==============================================================*/
/* ajouter les Pilotes                                          */
/*==============================================================*/

insert into Pilote values (1,'SERGE','Nice');
insert into Pilote values (2,'JEAN','Paris');
insert into Pilote values (3,'CLAUDE','Grenoble');
insert into Pilote values (4,'ROBERT','Nantes');
insert into Pilote values (5,'MICHEL','Paris');
insert into Pilote values (6,'LUCIEN','Toulous');
insert into Pilote values (7,'BRTRAND','Lyon');
insert into Pilote values (8,'HERVE','Bastia');
insert into Pilote values (9,'LUC','Paris');

select * from Pilote;

/*==============================================================*/
/* ajouter les Pilotes                                          */
/*==============================================================*/

insert into Vol values (1,1,100,'Nice','Paris','2020-04-20 07:00:00','2020-04-20 09:00:00');
insert into Vol values (2,2,100,'Paris','Toulous','2020-04-20 11:00:00','2020-04-20 12:00:00');
insert into Vol values (3,1,101,'Paris','Nice','2020-04-20 12:00:00','2020-04-20 14:00:00');
insert into Vol values (4,3,105,'Grenoble','Toulous','2020-04-20 14:00:00','2020-04-20 16:00:00');
insert into Vol values (5,3,105,'Toulous','Grenoble','2020-04-20 17:00:00','19:00:00');
insert into Vol values (6,7,107,'Lyon','Paris','2020-04-20 20:00:00','2020-04-20 21:00:00');
insert into Vol values (7,8,109,'Bastia','Paris','2020-04-20 21:00:00','2020-04-21 00:00:00');
insert into Vol values (8,9,106,'Paris','Brive','2020-04-21 07:00:00','2020-04-21 08:00:00');
insert into Vol values (9,2,102,'Toulous','Paris','2020-04-21 15:00:00','2020-04-21 16:00:00');
insert into Vol values (10,4,101,'Nice','Nantes','2020-04-21 17:00:00','2020-04-21 19:00:00');
insert into Vol values (11,7,107,'Paris','Lyon','2020-04-21 18:00:00','2020-04-21 19:00:00');
insert into Vol values (12,9,106,'Brive','Paris','2020-04-21 19:00:00','2020-04-21 20:00:00');

select * from Vol;

/*==============================================================*/
/* modufier l'adresse de Pilote                                 */
/*==============================================================*/

update Pilote set Adresse='Nice' where NumPil=9;

/*==============================================================*/
/* supprimer une vol                                            */
/*==============================================================*/

delete from Vol where NumVol=12