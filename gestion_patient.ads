WITH Ada.Text_Io, Ada.Integer_Text_Io;
USE Ada.Text_Io, Ada.Integer_Text_Io;

Package gestion_patient is
   Type T_patients is record
      Id_patient : T_personne;
      Nom_famille_Mère : T_mot;
      user_Patient : T_utilisateur;
      P_DocumentPatient : T_pteur_doc;
      new_mdp_Patient : Boolean;
   End record;
End gestion_patient;