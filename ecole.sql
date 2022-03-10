CREATE ROLE ecl LOGIN PASSWORD '1234';
create database ecole;

alter database ecole owner to ecl;
\c ecole

create sequence inc_secretaire;
create sequence inc_admin;
create sequence inc_promo;
create sequence inc_niveau;
create sequence inc_etudiant;
create sequence inc_ecolage;
create sequence inc_matiere;
create sequence inc_note;
create sequence inc_notevalid;
create sequence inc_professeur;
create sequence inc_classement;
create sequence inc_etatecolage;

create table Secretaire (
	id int primary key default nextval('inc_secretaire'),
	nom varchar(250),
	numSecretaire varchar(250),
	mdp varchar(250)
);

create table Admin(
	id int primary key default nextval('inc_admin'),
	nom varchar(250),
	numAdmin varchar(250),
	mdp varchar(250)
);

create table Promotion(
	id int primary key default nextval('inc_promo'),
	nom varchar(250),
	actuel int
);

create table Niveau(
	id int primary key default nextval('inc_niveau'),
	nom varchar(250),
	ecolage float
);

create table Etudiant(
	id int primary key default nextval('inc_etudiant'),
	nom varchar(250),
	idProm int,
	idNiveau int, 
	date_naissance date,
	numETU varchar(250),
	dateinscription date,
	sexe int,
	addresse varchar(250),
	FOREIGN KEY(idProm) references Promotion(id),
	FOREIGN KEY(idNiveau) references Niveau(id)
);

create table Ecolage(
	id int primary key default nextval('inc_ecolage'),
	idEtudiant int,
	montant float,
	mois int,
	annee int,
	date date,
	idNiveau int,
	foreign key(idEtudiant) references Etudiant(id)
);

create table Professeur(
	id int primary key default nextval('inc_professeur'),
	nom varchar(250),
	numProf varchar(250),
	mdp varchar(250)
);

create table Matiere(
	id int primary key default nextval('inc_matiere'),
	nom varchar(250),
	coeff int,
	idNiveau int ,
	idProf int ,
	nombreExamen int,
	foreign key(idNiveau) references Niveau(id),
	foreign key(idProf) references Professeur(id)
);

create table Notes(
	id int primary key default nextval('inc_note'),
	idEtudiant int ,
	idMatiere int ,
	note float,
	date date,
	numeroExam int,
	foreign key(idEtudiant) references Etudiant(id),
	foreign key(idMatiere) references Matiere(id)
);

create table NotesValid(
	id int primary key default nextval('inc_notevalid'),
	idNote int ,
	foreign key(idNote) references Notes(id) 
);


create table Classement(
	id int primary key default nextval('inc_classement'),
	nom varchar(250),
	numETU varchar(250),
	moyenne float,
	merite varchar(250),
	prom varchar(250),
	niveau varchar(250)
);

create table EtatPayementEcolage(
	id int primary key default nextval('inc_etatecolage'),
	niveau varchar(250),
	paye real,
	reste real,
	ecolage real
);

create or replace view DetailEtudiant as(
select n.id as idNiv,n.nom as NomNiv,n.ecolage,p.id as idProm,p.nom as prom,e.id,e.nom,
e.date_naissance,e.numETU,e.dateinscription,e.sexe,e.addresse from Etudiant as e
join Niveau as n on n.id=e.idNiveau
join Promotion as p on p.id=e.idProm
);

create or replace view EcolageEtudiant as(
select n.id as idNiv,n.nom as NomNiv,(n.ecolage*6) as ecolageNiv,p.id as idProm,p.nom as promActuel,
e.id,e.nom,e.date_naissance,e.numETU,e.dateinscription,e.sexe,e.addresse,sum(ec.montant) as somme,ec.Date
from Etudiant as e
join Promotion as p on p.id=idProm
Left join Ecolage as ec on ec.idEtudiant=e.id
join Niveau as n on n.id=ec.idNiveau 
group by e.id,e.nom,e.date_naissance,e.numETU,e.dateinscription,
e.sexe,e.addresse,n.nom,p.nom,p.actuel,ec.date
);

create or replace view NotenonValide as(
select n.id as idNiv,n.nom as NomNiv,p.id as idProm,p.nom as prom,e.id,e.nom,e.numETU,m.id as idMat,
m.nom as nomMat,m.coeff,nt.id as idNote,nt.note,nt.date from Notes as nt
join Etudiant as e on e.id=nt.idEtudiant
join Matiere as m on m.id=nt.idMatiere
join Promotion as p on p.id=e.idProm
join Niveau as n on n.id=m.idNiveau
where nt.id not in (select idNote from NotesValid)
);

create or replace view NoteValidMatiere as(
select n.id as idNiv,n.nom as NomNiv,p.id as idProm,p.nom as prom,e.id,e.nom,e.numETU,e.sexe,e.addresse,
m.id as idMat,m.nom as nomMat,m.coeff,nt.id as idNote,sum(nt.note)/m.nombreExamen as Total,nt.date,
nv.id as idNv from NotesValid as nv
join Notes as nt on nt.id=nv.IdNote
join Matiere as m on nt.idMatiere=m.id
join Etudiant as e on e.id=nt.idEtudiant
join Promotion as p on p.id=e.idProm
join Niveau as n on n.id=m.idNiveau
group by e.id,e.nom,e.numETU,e.sexe,e.addresse,n.id,n.nom,p.id,p.nom,m.id,m.nom,m.coeff,nt.id,nt.date,nv.id 
);
