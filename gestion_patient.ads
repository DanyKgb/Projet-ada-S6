WITH Ada.Text_Io, Ada.Integer_Text_Io, Outils, Gestion_Utilisateurs, Gestion_Liste_Documents;
USE Ada.Text_Io, Ada.Integer_Text_Io, Outils, Gestion_Utilisateurs, Gestion_Liste_Documents;

Package gestion_patient is
   Type T_patients is record
      Id_patient : T_personne;
      Nom_famille_Mere : T_mot;
      user_Patient : T_utilisateur;
      P_DocumentPatient : T_pteur_doc;
      new_mdp_Patient : Boolean;
   End record;

 FUNCTION Initialiser_Patient (
         Id_Patient        : T_Personne;
         Nom_Famille_Mere  : T_Mot;
         User_Patient      : T_Utilisateur;
         P_DocumentPatient : T_Pteur_Doc   := NULL;
         New_Mdp_Patient   : Boolean       := False)
     RETURN T_Patients;

   PROCEDURE Ajouter_Document (
         Patient     : IN OUT T_Patients;
         Nouveau_Doc : IN     T_Pteur_Doc);

   PROCEDURE Afficher_Documents (
         Patient : IN     T_Patients);

   FUNCTION Possede_Document (
         Patient : T_Patients;
         Id_Doc  : Integer)
     RETURN Boolean;

End gestion_patient;