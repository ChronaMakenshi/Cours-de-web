#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Date
#------------------------------------------------------------

CREATE TABLE Date(
        JJMMAAAA Date NOT NULL
	,CONSTRAINT Date_PK PRIMARY KEY (JJMMAAAA)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Role
#------------------------------------------------------------

CREATE TABLE Role(
        code_type_role Int  Auto_increment  NOT NULL ,
        libelle_role   Varchar (50) NOT NULL
	,CONSTRAINT Role_PK PRIMARY KEY (code_type_role)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Type film
#------------------------------------------------------------

CREATE TABLE Type_film(
        code_type_film    Varchar (3) NOT NULL ,
        libelle_type_film Varchar (50) NOT NULL
	,CONSTRAINT Type_film_PK PRIMARY KEY (code_type_film)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Star
#------------------------------------------------------------

CREATE TABLE Star(
        code_star   Int  Auto_increment  NOT NULL ,
        nom_star    Varchar (50) NOT NULL ,
        prenom_star Varchar (50)
	,CONSTRAINT Star_PK PRIMARY KEY (code_star)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Film
#------------------------------------------------------------

CREATE TABLE Film(
        code_film      Varchar (6) NOT NULL ,
        titre_film     Varchar (100) NOT NULL ,
        annee_film     Int ,
        ref_image      Varchar (50) NOT NULL ,
        resume         Text NOT NULL ,
        code_type_film Varchar (3) NOT NULL ,
        code_star      Int NOT NULL
	,CONSTRAINT Film_PK PRIMARY KEY (code_film)

	,CONSTRAINT Film_Type_film_FK FOREIGN KEY (code_type_film) REFERENCES Type_film(code_type_film)
	,CONSTRAINT Film_Star0_FK FOREIGN KEY (code_star) REFERENCES Star(code_star)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Fournisseur
#------------------------------------------------------------

CREATE TABLE Fournisseur(
        fournissueurid          Int  Auto_increment  NOT NULL ,
        nom_fournisseur         Varchar (50) NOT NULL ,
        adresse_fournisseur     Varchar (100) NOT NULL ,
        adresse2_fournisseur    Varchar (100) NOT NULL ,
        code_postal_fournisseur Int NOT NULL ,
        ville_fournisseur       Varchar (30) NOT NULL ,
        telephone_fournisseur   Varchar (10) NOT NULL
	,CONSTRAINT Fournisseur_PK PRIMARY KEY (fournissueurid)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Etat
#------------------------------------------------------------

CREATE TABLE Etat(
        code_etat Char(1) NOT NULL,
        libelle_etat Varchar (50) NOT NULL
	,CONSTRAINT Etat_PK PRIMARY KEY (code_etat)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Type PI
#------------------------------------------------------------

CREATE TABLE Type_PI(
        code_pi    Int  Auto_increment  NOT NULL ,
        libelle_pi Varchar (50) NOT NULL
	,CONSTRAINT Type_PI_PK PRIMARY KEY (code_pi)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Adherant
#------------------------------------------------------------

CREATE TABLE Adherant(
        numero_adherent            Int  Auto_increment  NOT NULL ,
        nom_adherent               Varchar (50) NOT NULL ,
        prenom_adherent            Varchar (50) NOT NULL ,
        adresse_adherent           Varchar (50) ,
        adresse2_adherent          Varchar (50) ,
        code_postal_adherent       Varchar (5) ,
        ville_adherent             Varchar (30) ,
        telephone_adherent         Varchar (10) ,
        references_pieces_identite Varchar (50) NOT NULL ,
        code_pi                    Int NOT NULL
	,CONSTRAINT Adherant_PK PRIMARY KEY (numero_adherent)

	,CONSTRAINT Adherant_Type_PI_FK FOREIGN KEY (code_pi) REFERENCES Type_PI(code_pi)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: support
#------------------------------------------------------------

CREATE TABLE support(
        code_support    Int  Auto_increment  NOT NULL ,
        libelle_support Varchar (50) NOT NULL
	,CONSTRAINT support_PK PRIMARY KEY (code_support)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Exemplaire
#------------------------------------------------------------

CREATE TABLE Exemplaire(
        exemplaire   Int NOT NULL ,
        defectueux   Varchar (50) NOT NULL ,
        date_achat   Date ,
        code_etat    Char (1) NOT NULL ,
        code_film    Varchar (6) NOT NULL ,
        code_support Int NOT NULL
	,CONSTRAINT Exemplaire_PK PRIMARY KEY (exemplaire)

	,CONSTRAINT Exemplaire_Etat_FK FOREIGN KEY (code_etat) REFERENCES Etat(code_etat)
	,CONSTRAINT Exemplaire_Film0_FK FOREIGN KEY (code_film) REFERENCES Film(code_film)
	,CONSTRAINT Exemplaire_support1_FK FOREIGN KEY (code_support) REFERENCES support(code_support)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: louer
#------------------------------------------------------------

CREATE TABLE louer(
        exemplaire      Int NOT NULL ,
        JJMMAAAA        Date NOT NULL ,
        numero_adherent Int NOT NULL ,
        date_rendu      Date NOT NULL ,
        prix_applique   Int NOT NULL ,
        prix_reel       Int NOT NULL
	,CONSTRAINT louer_PK PRIMARY KEY (exemplaire,JJMMAAAA,numero_adherent)

	,CONSTRAINT louer_Exemplaire_FK FOREIGN KEY (exemplaire) REFERENCES Exemplaire(exemplaire)
	,CONSTRAINT louer_Date0_FK FOREIGN KEY (JJMMAAAA) REFERENCES Date(JJMMAAAA)
	,CONSTRAINT louer_Adherant1_FK FOREIGN KEY (numero_adherent) REFERENCES Adherant(numero_adherent)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: participer
#------------------------------------------------------------

CREATE TABLE participer(
        code_type_role Int NOT NULL ,
        code_film      Varchar (6) NOT NULL ,
        code_star      Int NOT NULL ,
        rang           Int NOT NULL
	,CONSTRAINT participer_PK PRIMARY KEY (code_type_role,code_film,code_star)

	,CONSTRAINT participer_Role_FK FOREIGN KEY (code_type_role) REFERENCES Role(code_type_role)
	,CONSTRAINT participer_Film0_FK FOREIGN KEY (code_film) REFERENCES Film(code_film)
	,CONSTRAINT participer_Star1_FK FOREIGN KEY (code_star) REFERENCES Star(code_star)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tarifer
#------------------------------------------------------------

CREATE TABLE tarifer(
        code_type_film Varchar (3) NOT NULL ,
        code_support   Int NOT NULL ,
        tarif          Int NOT NULL
	,CONSTRAINT tarifer_PK PRIMARY KEY (code_type_film,code_support)

	,CONSTRAINT tarifer_Type_film_FK FOREIGN KEY (code_type_film) REFERENCES Type_film(code_type_film)
	,CONSTRAINT tarifer_support0_FK FOREIGN KEY (code_support) REFERENCES support(code_support)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: fournir
#------------------------------------------------------------

CREATE TABLE fournir(
        code_film      Varchar (6) NOT NULL ,
        fournissueurid Int NOT NULL ,
        note           Int NOT NULL
	,CONSTRAINT fournir_PK PRIMARY KEY (code_film,fournissueurid)

	,CONSTRAINT fournir_Film_FK FOREIGN KEY (code_film) REFERENCES Film(code_film)
	,CONSTRAINT fournir_Fournisseur0_FK FOREIGN KEY (fournissueurid) REFERENCES Fournisseur(fournissueurid)
)ENGINE=InnoDB;

