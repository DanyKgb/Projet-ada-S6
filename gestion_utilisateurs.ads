WITH Ada.Text_Io, Ada.Integer_Text_Io;
USE Ada.Text_Io, Ada.Integer_Text_Io;

Package Gestion_Utilisateurs is


   Type Utilisateur is record
      Login : T_log;
      K_login : Integer;
      empreinte : Integer;
   End record;
End Gestion_Utilisateurs;