WITH Ada.Text_Io, Ada.Integer_Text_Io;
USE Ada.Text_Io, Ada.Integer_Text_Io;

Package Outils is
   Subtype T_Mot is String (1 .. 20);
   Subtype T_titre is String (1 .. 50);
   Subtype Taille_Mdp is Integer range 1 .. 10;
   Subtype T_log is String (1 .. 50);

   Type T_Personne is record
      Nom, Prenom : T_Mot := (Others => ' ');
      k_nom, k_prenom : Integer;
   End record;
End Outils;