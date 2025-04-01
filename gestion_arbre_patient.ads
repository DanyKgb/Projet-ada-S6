    WITH Ada.Text_Io, Ada.Integer_Text_Io, gestion_patient, Outils;
USE Ada.Text_Io, Ada.Integer_Text_Io, gestion_patient, Outils;

Package gestion_arbre_patient is
   Type T_Noeuds_Patients;
   Type T_Arbre_Patients is Access T_Noeuds_Patients;

   Type T_Noeuds_Patients is record
      Patient : T_patients;
      fg, fd : T_Arbre_Patients;
   End record;
End gestion_arbre_patient;