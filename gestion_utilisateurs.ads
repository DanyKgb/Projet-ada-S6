WITH Ada.Text_Io, Ada.Integer_Text_Io, Outils, Ada.Characters.Handling;
USE Ada.Text_Io, Ada.Integer_Text_Io, Outils, Ada.Characters.Handling;

Package Gestion_Utilisateurs is


   Type T_Utilisateur is record
      Login : T_log;
      K_login : Integer;
      empreinte : Integer;
   End record;
   
   function generer_log (pers : T_personne; log : out T_log) return T_log;
End Gestion_Utilisateurs;