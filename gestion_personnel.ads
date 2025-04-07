WITH Ada.Text_Io, Ada.Integer_Text_Io, Outils, Gestion_Utilisateurs;
USE Ada.Text_Io, Ada.Integer_Text_Io, Outils, Gestion_Utilisateurs;

Package gestion_personnel is
   Type T_metier is (medecin,secretaire,administrateur);

   Type T_personnel is record
      Id_personnel : T_personne;
      Nom_famille_mere : T_mot;
      k_nomMere : Integer;
      user : T_utilisateur;
      Metier : T_metier;
      new_mdp_Personnel : Boolean;
   End record;
   procedure saisie_personnel (pers : out T_personnel);
   procedure visu_1_personnel (pers : in T_personnel);

End gestion_personnel;