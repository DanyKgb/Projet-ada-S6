WITH Ada.Text_Io, Ada.Integer_Text_Io, Outils;
USE Ada.Text_Io, Ada.Integer_Text_Io, Outils;

Package gestion_connexion is
   Type T_fonction is (personnel, patient);

   Type T_connexion is record
      Pers : T_personne;
      Nom_mere : T_mot;
      K_nm : Integer;
      Fonction : T_fonction;
   End record;
End gestion_connexion;