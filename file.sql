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

ALTER TABLE categorie ADD description text;

INSERT INTO categorie (id_categorie, libelle, description) VALUES
(1, 'Technologie', 'Actualités, tutoriels et analyses sur les nouvelles technologies'),
(2, 'Santé', 'Conseils santé, bien-être et médecine préventive'),
(3, 'Voyage', 'Récits de voyage, guides pratiques et conseils touristiques'),
(4, 'Cuisine', 'Recettes, techniques culinaires et astuces de cuisine'),
(5, 'Sport', 'Actualités sportives, conseils d\'entraînement et nutrition'),
(6, 'Éducation', 'Pédagogie, conseils d\'apprentissage et innovations éducatives'),
(7, 'Finance', 'Gestion budgétaire, investissements et actualités économiques'),
(8, 'Mode', 'Tendances, conseils style et actualités de la mode');


ALTER TABLE commentaire add email  varchar(100) unique;

ALTER TABLE commentaire add status varchar(50) check (status in ('approved','spam'));


CREATE TABLE commentaire (
    id_commentaire INT PRIMARY KEY AUTO_INCREMENT, 
    contenu_commentaire TEXT, 
    date_commentaire DATE,
    username VARCHAR(50) NULL, 
    id_article INT, 
    FOREIGN KEY (id_article) REFERENCES article (id_article), 
    FOREIGN KEY (username) REFERENCES utilisateur (username)
);


ALTER TABLE commentaire ADD email VARCHAR(100) UNIQUE;
ALTER TABLE commentaire ADD status VARCHAR(50) CHECK (status IN ('approved', 'spam', 'pending')); 


INSERT INTO commentaire (id_commentaire, contenu_commentaire, date_commentaire, username, id_article, email, status) VALUES
(1, 'Excellent article, très bien documenté !', '2024-02-21', NULL, 1, 'jean.martin@email.com', 'approved'),
(2, 'Je ne suis pas tout à fait d\'accord sur certains points.', '2024-02-22', NULL, 1, 'sophie.leroy@gmail.com', 'approved'),
(3, 'Cela m\'a beaucoup aidé, merci pour ces conseils.', '2024-02-25', NULL, 2, 'thomas.dubois@protonmail.com', 'approved'),
(4, 'Très bel article, les photos sont magnifiques !', '2024-02-26', NULL, 3, 'marie.petit@yahoo.fr', 'approved'),
(5, 'Je trouve que certains conseils sont dangereux.', '2024-02-27', NULL, 4, 'pierre.bernard@gmail.com', 'spam'),
(6, 'Parfait pour les débutants comme moi, merci !', '2024-02-28', NULL, 5, 'julie.vincent@email.com', 'approved'),
(7, 'Très détaillé, j\'ai appris beaucoup de choses.', '2024-02-29', NULL, 6, 'marc.roux@protonmail.com', 'approved'),
(8, 'C\'est exactement ce que je cherchais, merci !', '2024-03-01', NULL, 7, 'isabelle.morel@yahoo.fr', 'approved'),
(9, 'Je ne comprends pas la partie sur les investissements.', '2024-03-02', NULL, 8, 'david.colin@gmail.com', 'approved'),
(10, 'Super article, j\'ai hâte de lire la suite !', '2024-03-03', NULL, 9, 'caroline.lambert@email.com', 'approved'),
(11, 'Les tendances présentées sont déjà dépassées.', '2024-03-04', NULL, 10, 'nicolas.garnier@protonmail.com', 'spam'),
(12, 'Je vais essayer la recette ce week-end !', '2024-03-05', NULL, 11, 'elodie.chevalier@yahoo.fr', 'approved'),
(13, 'Bonnes astuces pour économiser, merci.', '2024-03-06', NULL, 12, 'antoine.royer@gmail.com', 'approved'),
(14, 'Le style minimaliste n\'est pas pour tout le monde.', '2024-03-07', NULL, 13, 'clara.menard@email.com', 'approved'),
(15, 'Très bon tutoriel sur l\'IA pour débutants.', '2024-03-08', NULL, 14, 'quentin.gauthier@protonmail.com', 'approved'),
(16, 'La méditation a changé ma vie, merci pour l\'article.', '2024-03-09', NULL, 15, 'amelie.lebrun@yahoo.fr', 'approved'),
(17, 'Voyager avec un petit budget c\'est possible !', '2024-03-10', NULL, 16, 'vincent.martin@gmail.com', 'approved'),
(18, 'Les plats marocains sont délicieux, merci.', '2024-03-11', NULL, 17, 'marine.dubois@email.com', 'approved'),
(19, 'Je me prépare pour le ski, merci pour les conseils.', '2024-03-12', NULL, 18, 'alexandre.leroy@protonmail.com', 'approved'),
(20, 'Quelles applications recommandez-vous pour les enfants ?', '2024-03-13', NULL, 19, 'sarah.petit@yahoo.fr', 'approved'),
(21, 'La bourse me fait peur, merci pour les explications.', '2024-03-14', NULL, 20, 'paul.bernard@gmail.com', 'approved'),
(22, 'Je cherche justement un style casual chic, merci !', '2024-03-15', NULL, 21, 'laura.vincent@email.com', 'approved'),
(23, 'Important de parler de sécurité informatique.', '2024-03-16', NULL, 22, 'mathieu.roux@protonmail.com', 'approved'),
(24, 'Je dors mal, merci pour ces conseils.', '2024-03-17', NULL, 23, 'emma.morel@yahoo.fr', 'approved'),
(25, 'J\'ai visité certains villages, ils sont magnifiques !', '2024-03-18', NULL, 24, 'hugo.colin@gmail.com', 'approved');


ALTER TABLE article add COLUMN status varchar(50);
ALTER TABLE article add constraint article_status_check check (status in ('published','draft'));

ALTER TABLE article ADD COLUMN image_url VARCHAR(255);


ALTER TABLE article ADD COLUMN view_count INT NOT NULL DEFAULT 0;

INSERT INTO article (id_article, nom_article, contenu, date_creation, date_modification, id_categorie, username, image_url, status, view_count) VALUES
(1, 'Les Nouvelles Tensions Technologiques en 2024', 'Explorez les technologies émergentes qui vont transformer notre quotidien cette année...', '2024-02-20', '2024-02-21', 1, 'pierre_leroy', 'tech1.jpg', 'published', 1245),
(2, 'Comment Maintenir une Bonne Santé au Travail', 'Des conseils pratiques pour préserver votre santé physique et mentale...', '2024-02-25', '2024-02-25', 2, 'sophie_martin', 'sante1.jpg', 'published', 876),
(3, 'Les 10 Destinations à Visiter Absolument en 2024', 'Découvrez les destinations qui vont marquer l\'année 2024...', '2024-03-05', '2024-03-06', 3, 'jean_dupont', 'voyage1.jpg', 'draft', 0),
(4, 'Recette du Gâteau au Chocolat Fondant', 'Une recette simple et rapide pour un gâteau au chocolat irrésistible...', '2024-03-10', '2024-03-11', 4, 'lucie_bernard', 'cuisine1.jpg', 'published', 2345),
(5, 'Préparation Marathon : Guide Complet du Débutant', 'Tout ce qu\'il faut savoir pour préparer son premier marathon...', '2024-03-15', '2024-03-16', 5, 'marc_vincent', 'sport1.jpg', 'published', 1567),
(6, 'Apprendre à Coder en 6 Mois : Mon Parcours', 'Comment j\'ai appris la programmation web en moins de 6 mois...', '2024-03-20', '2024-03-21', 6, 'david_morel', 'education1.jpg', 'published', 3210),
(7, 'Investir dans la Cryptomonnaie en 2024', 'Guide pour débutants sur les opportunités et risques...', '2024-04-01', '2024-04-02', 7, 'nicolas_lambert', 'finance1.jpg', 'published', 1890),
(8, 'Les Tendances Mode Printemps-Été 2024', 'Découvrez les must-have de la saison prochaine...', '2024-04-05', '2024-04-06', 8, 'antoine_chevalier', 'mode1.jpg', 'published', 943),
(9, 'Les Avantages du Télétravail pour la Productivité', 'Comment le travail à distance peut booster vos performances...', '2024-04-10', '2024-04-11', 1, 'amelie_colin', 'tech2.jpg', 'published', 1123),
(10, 'Les Superaliments pour Renforcer l\'Immunitée', '10 aliments à intégrer dans votre alimentation pour être en forme...', '2024-04-15', '2024-04-16', 2, 'clara_royer', 'sante2.jpg', 'published', 765),
(11, 'Voyager en Solo : Mes Conseils Sécurité', 'Guide pratique pour voyager seul en toute sécurité...', '2024-04-20', '2024-04-21', 3, 'vincent_gauthier', 'voyage2.jpg', 'published', 890),
(12, 'Les Bases de la Pâtisserie Française', 'Apprenez les techniques fondamentales de la pâtisserie...', '2024-05-02', '2024-05-03', 4, 'marine_lebrun', 'cuisine2.jpg', 'draft', 0),
(13, 'Yoga pour Débutants : Programme sur 30 Jours', 'Un programme progressif pour découvrir le yoga...', '2024-05-10', '2024-05-11', 5, 'jean_dupont', 'sport2.jpg', 'published', 654),
(14, 'Les Méthodes d\'Apprentissage des Langues Efficaces', 'Comparatif des différentes approches pour apprendre une langue...', '2024-05-20', '2024-05-21', 6, 'lucie_bernard', 'education2.jpg', 'published', 432),
(15, 'Économiser pour Son Premier Achat Immobilier', 'Stratégies pour constituer son apport personnel...', '2024-06-01', '2024-06-02', 7, 'marc_vincent', 'finance2.jpg', 'published', 987),
(16, 'Le Style Minimaliste : Less is More', 'Comment adopter une garde-robe minimaliste et élégante...', '2024-06-10', '2024-06-11', 8, 'david_morel', 'mode2.jpg', 'published', 543),
(17, 'Introduction à l\'Intelligence Artificielle', 'Comprendre les bases de l\'IA et ses applications...', '2024-06-15', '2024-06-16', 1, 'nicolas_lambert', 'tech3.jpg', 'published', 1876),
(18, 'La Méditation pour Réduire le Stress', 'Techniques de méditation accessibles à tous...', '2024-07-03', '2024-07-04', 2, 'antoine_chevalier', 'sante3.jpg', 'draft', 0),
(19, 'Voyager avec un Petit Budget', 'Astuces pour voyager sans se ruiner...', '2024-07-12', '2024-07-13', 3, 'clara_royer', 'voyage3.jpg', 'published', 765),
(20, 'Les Plats Typiques de la Cuisine Marocaine', 'Découverte des saveurs et traditions culinaires du Maroc...', '2024-07-20', '2024-07-21', 4, 'amelie_colin', 'cuisine3.jpg', 'published', 1098),
(21, 'Préparation Physique pour le Ski', 'Conseils pour se préparer avant la saison de ski...', '2024-08-01', '2024-08-02', 5, 'vincent_gauthier', 'sport3.jpg', 'draft', 0),
(22, 'Les Outils Numériques pour l\'Éducation', 'Les meilleures applications pour apprendre et enseigner...', '2024-08-10', '2024-08-11', 6, 'marine_lebrun', 'education3.jpg', 'published', 876),
(23, 'Comprendre les Marchés Boursiers', 'Guide pour débutants en bourse...', '2024-08-20', '2024-08-21', 7, 'pierre_leroy', 'finance3.jpg', 'published', 654),
(24, 'Le Style Casual Chic au Bureau', 'Comment être élégant tout en restant confortable...', '2024-09-01', '2024-09-02', 8, 'sophie_martin', 'mode3.jpg', 'published', 432),
(25, 'La Sécurité Informatique pour les Particuliers', 'Protégez vos données et votre vie privée en ligne...', '2024-09-10', '2024-09-11', 1, 'jean_dupont', 'tech4.jpg', 'published', 1567),
(26, 'L\'Importance du Sommeil pour la Santé', 'Comment améliorer la qualité de son sommeil...', '2024-09-20', '2024-09-21', 2, 'lucie_bernard', 'sante4.jpg', 'published', 765),
(27, 'Les Plus Beaux Villages de France', 'Découverte des villages classés parmi les plus beaux de France...', '2024-10-01', '2024-10-02', 3, 'marc_vincent', 'voyage4.jpg', 'published', 987),
(28, 'Les Techniques de Cuisson Santé', 'Cuire ses aliments tout en préservant les nutriments...', '2024-10-10', '2024-10-11', 4, 'david_morel', 'cuisine4.jpg', 'published', 543),
(29, 'Le CrossFit : Avantages et Risques', 'Analyse complète de cette discipline sportive...', '2024-10-20', '2024-10-21', 5, 'nicolas_lambert', 'sport4.jpg', 'published', 876),
(30, 'Apprendre par le Jeu : La Ludopédagogie', 'Utiliser le jeu comme outil d\'apprentissage...', '2024-11-01', '2024-11-02', 6, 'antoine_chevalier', 'education4.jpg', 'published', 654);