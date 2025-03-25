WITH Ada.Text_Io, Ada.Integer_Text_Io, gestion_connexion;
USE Ada.Text_Io, Ada.Integer_Text_Io, gestion_connexion;

Package gestion_files_connexion is
   Type T_Cell_connex;
   Type T_pteur_connex is Access T_Cell_connex;

   Type T_Cell_connex is record
      Connex : T_connexion;
      Suiv : T_pteur_connex;
   End record;

   Type T_files_connex is record
      Deb, fin : T_pteur_connex;
   End record;
End gestion_files_connexion;