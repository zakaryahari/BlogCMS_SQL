utilisateur (nom , prenom , email , [**username**](#) , mod\_de\_pass , date\_inscription , role);



categorie ([**id\_categorie**](#) , libelle , nom\_categorie);



article ([**id\_article**](#) , nom\_article , contenu , date\_création , date\_modification , [**#id\_categorie**](#) , #[**username**](#));



commentaire ([**id\_commentaire**](#) , contenu\_commentaire , date\_commentaire , [**#id\_utilisateur**](#) , [**#id\_article**](#));

