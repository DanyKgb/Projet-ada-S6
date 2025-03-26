WITH Ada.Text_Io, Ada.Integer_Text_Io, gestion_personnel, Outils, Gestion_Utilisateurs;
USE Ada.Text_Io, Ada.Integer_Text_Io, gestion_personnel, Outils, Gestion_Utilisateurs;

Package Gestion_Liste_Personnel is
   Type T_cell_personnel;
   Type T_pteur_personnel is Access T_cell_personnel;

   Type T_cell_personnel is record
      perso : T_personnel;
      Suiv : T_pteur_personnel;
   End record;

   procedure Ajout_liste (tete : in out T_pteur_personnel; pers : in T_personnel);
   procedure visu_liste (tete : in T_pteur_personnel);
End Gestion_Liste_Personnel;