Create database BlogCMS;

use BlogCMS;

create table utilisateur (username varchar(50) PRIMARY KEY unique , nom varchar(50) unique, prenom  varchar(255), email  varchar(100) unique, mod_de_pass  varchar(50), date_inscription date, role varchar(50) , constraint role_check check (role in ('user','admin')));

create table categorie (id_categorie int primary key auto_increment, libelle varchar(50));

create table article (id_article int primary key auto_increment, nom_article varchar(50), contenu text, date_creation date, date_modification date, id_categorie int, username varchar(50) , foreign key (id_categorie) references categorie (id_categorie) , foreign key (username) references utilisateur (username));

create table commentaire (id_commentaire int primary key auto_increment, contenu_commentaire text, date_commentaire date, username varchar(50) null, id_article int , foreign key (id_article) references article (id_article) , foreign key (username) references utilisateur (username));



INSERT INTO utilisateur (username, nom, prenom, email, mod_de_pass, date_inscription, role) VALUES 
('admin_amine', 'El Amrani', 'Amine', 'amine.elamrani@mail.ma', 'pass123secure', '2024-01-10', 'admin'),
('fatima_dev', 'Bennani', 'Fatima-Zahra', 'fatima.bennani@gmail.com', 'dev2024pass', '2024-02-15', 'user'),
('youssef_casa', 'Chraibi', 'Youssef', 'youssef.c@hotmail.fr', 'raja1949', '2024-03-20', 'user'),
('leila_travel', 'Tazi', 'Leila', 'leila.tazi@yahoo.com', 'travel2024', '2024-04-05', 'user');

select * from utilisateur;

INSERT INTO categorie (libelle) VALUES 
('Technologie'),
('Gastronomie'),
('Sport & Botola'),
('Tourisme Maroc');

select * from categorie;

