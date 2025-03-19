WITH Ada.Text_Io, Ada.Integer_Text_Io;
USE Ada.Text_Io, Ada.Integer_Text_Io;

Package gestion_personnel is
   Type T_metier is (Medecin, Secrétaire, administrateur);

   Type T_personnel is record
      Id_personnel : T_personne;
      Nom_famille_mère : T_mot;
      k_nomMère : Integer;
      user : T_utilisateur;
      Metier : T_metier;
      new_mdp_Personnel : Boolean;
   End record;
End gestion_personnel;