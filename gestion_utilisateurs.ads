WITH Ada.Text_Io, Ada.Integer_Text_Io, Outils;
USE Ada.Text_Io, Ada.Integer_Text_Io, Outils;

Package Gestion_Utilisateurs is


   Type T_Utilisateur is record
      Login : T_log;
      K_login : Integer;
      empreinte : Integer;
   End record;
End Gestion_Utilisateurs;