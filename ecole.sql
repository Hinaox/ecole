CREATE ROLE ecl LOGIN PASSWORD '1234';
create database ecole;

alter database ecole owner to ecl;
\c ecole

create sequence inc_classe;
create sequence inc_etudiant;
create sequence inc_matiere;
create sequence inc_exam;
create sequence inc_etudiant_classe;

create table Classe(
	id int primary key default nextval('inc_classe'),
	nom varchar(250),
	ecolage float
);

create table Etudiant(
	id int primary key default nextval('inc_etudiant'),
	nom varchar(250),
	prenom varchar(250),
	photo varchar(50),
	naissance date,
	addresse varchar(250),
);

create table Matiere(
	id int primary key default nextval('inc_matiere'),
	nom varchar(250),
);
create table Examen(
	id int primary key default nextval('inc_exam'),
	nom varchar(50),
	idBulletin varchar(10) references Etudiant_Classe(id)
);

create table Notes(
	idexamen varchar(10),
	idMatiere varchar(10),
	note float,
	date date,
	foreign key(idExamen) references Examen(id),
	foreign key(idMatiere) references Matiere(id)
);

create table Etudiant_Classe(
	id int primary key default nextval('inc_etudiant_classe'),
	idEtudiant varchar(250),
	idClasse varchar(250),
	debut date,
	fin date,
	ecolage float
);

create table Payement(
	idDossier varchar(10) references Etudiant_Classe(id),
	montant float,
	date date
);
