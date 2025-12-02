Create database BlogCMS;

use BlogCMS;

create table utilisateur (username varchar(50) PRIMARY KEY unique , nom varchar(50) unique, prenom  varchar(255), email  varchar(100) unique, mod_de_pass  varchar(50), date_inscription date, role varchar(50) , constraint role_check check (role in ('user','admin')));

create table categorie (id_categorie int primary key auto_increment, libelle varchar(50));

create table article (id_article int primary key auto_increment, nom_article varchar(50), contenu text, date_creation date, date_modification date, id_categorie int, username varchar(50) , foreign key (id_categorie) references categorie (id_categorie) , foreign key (username) references utilisateur (username) );

create table commentaire (id_commentaire int primary key auto_increment, contenu_commentaire text, date_commentaire date,username varchar(50) null, id_article int , foreign key (id_article) references article (id_article) , foreign key (username) references utilisateur (username));



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

INSERT INTO article (nom_article, contenu, date_creation, date_modification, id_categorie, username) VALUES 
('L''essor de l''IA au Maroc', 'Le Maroc connaît une croissance rapide dans le secteur de l''intelligence artificielle avec des startups à Casablanca et Rabat...', '2024-05-01', '2024-05-02', 1, 'admin_amine'),
('Le Secret du Couscous aux 7 légumes', 'Pour réussir un vrai couscous marocain, il faut d''abord bien choisir sa semoule et utiliser du smen beldi...', '2024-05-10', '2024-05-10', 2, 'fatima_dev'),
('Derby Casablanca : Wydad vs Raja', 'L''ambiance au complexe Mohammed V était électrique hier soir lors du grand derby...', '2024-05-15', '2024-05-15', 3, 'youssef_casa');

select * from article;

INSERT INTO commentaire (contenu_commentaire, date_commentaire, username, id_article) VALUES 
('Super article, merci pour l''info !', '2024-05-03', 'fatima_dev', 1),
('TBarkallah 3lik, ça donne faim.', '2024-05-11', 'youssef_casa', 2),
('Dima Raja !', '2024-05-16', 'leila_travel', 3),
('Est-ce qu''on peut utiliser de l''huile d''argan ?', '2024-05-12', NULL, 2), 
('Vive le football marocain.', '2024-05-17', NULL, 3); 

select * from commentaire;


ALTER TABLE utilisateur MODIFY COLUMN mod_de_pass VARCHAR(255);

ALTER table utilisateur drop constraint role_check ;

ALTER table utilisateur add constraint role_check check (role in ('admin','author'));


INSERT INTO utilisateur (username, nom, prenom, email, mod_de_pass, date_inscription, role) VALUES
('admin_blog', NULL, NULL, 'admin@blogcms.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-01-15', 'admin'),
('marie_dubois', NULL, NULL, 'marie.dubois@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-02-10', 'author'),
('pierre_leroy', NULL, NULL, 'pierre.leroy@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-02-15', 'author'),
('sophie_martin', NULL, NULL, 'sophie.martin@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-03-01', 'author'),
('jean_dupont', NULL, NULL, 'jean.dupont@yahoo.fr', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-03-10', 'author'),
('lucie_bernard', NULL, NULL, 'lucie.bernard@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-03-15', 'author'),
('thomas_petit', NULL, NULL, 'thomas.petit@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-03-20', 'author'),
('julie_roux', NULL, NULL, 'julie.roux@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-04-01', 'author'),
('marc_vincent', NULL, NULL, 'marc.vincent@yahoo.fr', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn9p36WQoeG6Lruj3vjPGga31lW', '2024-04-05', 'author'),
('isabelle_leroy', NULL, NULL, 'isabelle.leroy@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-04-10', 'author'),
('david_morel', NULL, NULL, 'david.morel@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-04-15', 'author'),
('caroline_duval', NULL, NULL, 'caroline.duval@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-05-02', 'author'),
('nicolas_lambert', NULL, NULL, 'nicolas.lambert@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-05-10', 'author'),
('elodie_garnier', NULL, NULL, 'elodie.garnier@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-05-20', 'author'),
('antoine_chevalier', NULL, NULL, 'antoine.chevalier@yahoo.fr', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-06-01', 'author'),
('clara_royer', NULL, NULL, 'clara.royer@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-06-10', 'author'),
('quentin_menard', NULL, NULL, 'quentin.menard@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-06-15', 'author'),
('amelie_colin', NULL, NULL, 'amelie.colin@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-07-03', 'author'),
('vincent_gauthier', NULL, NULL, 'vincent.gauthier@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-07-12', 'author'),
('marine_lebrun', NULL, NULL, 'marine.lebrun@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', '2024-07-20', 'author');
