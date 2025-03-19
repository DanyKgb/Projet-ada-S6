WITH Ada.Text_Io, Ada.Integer_Text_Io;
USE Ada.Text_Io, Ada.Integer_Text_Io;

Package Gestion_Liste_Personnel is
   Type T_cell_personnel;
   Type T_pteur_personnel is Access T_cell_personnel;

   Type T_cell_personnel is record
      perso : T_personnel;
      Suiv : T_pteur_personnel;
   End record;
End Gestion_Liste_Personnel;