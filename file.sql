Create database BlogCMS;

use BlogCMS;

create table utilisateur (username varchar(50) PRIMARY KEY unique , nom varchar(50) unique, prenom  varchar(50), email  varchar(100) unique, mod_de_pass  varchar(50), date_inscription date, role varchar(50) , constraint role_check check (role in ('user','admin')));

