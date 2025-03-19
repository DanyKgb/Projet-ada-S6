WITH Ada.Text_Io, Ada.Integer_Text_Io;
USE Ada.Text_Io, Ada.Integer_Text_Io;

Package Gestion_Documents is
   Type Type_Document is (Ordonnances, Certificat, Compte_Rendu, Resultat_Examen);

   Type Document is record
      Identifiant : Integer;
      Titre : T_titre;
      K_titre : Integer;
      Nature : Type_Document;
      Medecin : T_personne;
      Lecture : Boolean;
      Date_Creation : T_date;
      Date_lecture : T_date;
      Date_Derniere_Modification : T_date;
   End record;

   Type T_docArchive is record
      Id : Integer;
      titre : T_titre;
      k_titre : Integer;
      nat : Type_Document;
      id_med : T_personne;
      id_patient : T_personne;
      Lecture : Boolean;
      Date_Creation : T_date;
      Date_lecture : T_date;
      Date_Derniere_Modification : T_date;
   End record;
End Gestion_Documents;