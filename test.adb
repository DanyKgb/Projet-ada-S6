with ada.Text_IO, ada.integer_Text_IO, Ada.Characters.Handling, Outils, gestion_arbre_patient, gestion_connexion, gestion_dates, gestion_files_connexion, gestion_patient, gestion_personnel, Gestion_Archivage_Documents, Gestion_Documents, Gestion_Liste_Documents, Gestion_Liste_Personnel, Gestion_Utilisateurs;
use ada.Text_IO, ada.integer_Text_IO, Ada.Characters.Handling, Outils, gestion_arbre_patient, gestion_connexion, gestion_dates, gestion_files_connexion, gestion_patient, gestion_personnel, Gestion_Archivage_Documents, Gestion_Documents, Gestion_Liste_Documents, Gestion_Liste_Personnel, Gestion_Utilisateurs;

procedure test is 
   personnel : T_personnel;
   utilisateur : T_Utilisateur;
   tete_pers : T_pteur_personnel;
begin
   put_line("Test de la procédure saisie_personnel");
   saisie_personnel (personnel);
end test;