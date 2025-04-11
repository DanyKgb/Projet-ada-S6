WITH Ada.Text_Io, Ada.Integer_Text_Io, gestion_patient, Outils;
USE Ada.Text_Io, Ada.Integer_Text_Io, gestion_patient, Outils;

PACKAGE BODY Gestion_Arbre_Patient IS

   -- Fonction de création d'un arbre vide
   FUNCTION Creer_Arbre RETURN T_Arbre_Patients IS
   BEGIN
      RETURN NULL;
   END Creer_Arbre;

   -- Procédure d'insertion d'un patient dans l'arbre
   PROCEDURE Inserer ( Arbre : IN OUT T_Arbre_Patients; Patient : T_Patients) IS
   BEGIN
      IF Arbre = NULL THEN
         -- Crée un nouveau noeud
         Arbre := NEW T_Noeuds_Patients'(
            Patient => Patient,
            Fg      => NULL,
            Fd      => NULL);
      ELSE
         -- Comparaison pour placement dans l'arbre
         IF Patient.Id_Patient.Nom < Arbre.Patient.Id_Patient.Nom OR
               (Patient.Id_Patient.Nom = Arbre.Patient.Id_Patient.Nom AND Patient.Id_Patient.Prenom < Arbre.Patient.Id_Patient.Prenom) THEN
            Inserer(Arbre.Fg, Patient);
         ELSIF Patient.Id_Patient.Nom > Arbre.Patient.Id_Patient.Nom OR
               (Patient.Id_Patient.Nom = Arbre.Patient.Id_Patient.Nom AND Patient.Id_Patient.Prenom > Arbre.Patient.Id_Patient.Prenom) THEN
            Inserer(Arbre.Fd, Patient);
         ELSE
            -- Doublon détecté
            Put_Line("Patient déjà existant.");
         END IF;
      END IF;
   END Inserer;

   -- Fonction pour trouver le min d'un sous-arbre (utile pour la suppression)
   FUNCTION Min_Node (Arbre : T_Arbre_Patients);
     RETURN T_Arbre_Patients IS
      Courant : T_Arbre_Patients := Arbre;
   BEGIN
      WHILE Courant.Fg /= NULL LOOP
         Courant := Courant.Fg;
      END LOOP;
      RETURN Courant;
   END Min_Node;

   -- Procédure de suppression d'un patient
   PROCEDURE Supprimer (Arbre: IN OUT T_Arbre_Patients; Nom,Prenom :T_Mot) IS
   BEGIN
      IF Arbre = NULL THEN
         Put_Line("Patient non trouvé.");
      ELSIF Nom < Arbre.Patient.Id_Patient.Nom OR
            (Nom = Arbre.Patient.Id_Patient.Nom AND Prenom < Arbre.Patient.Id_Patient.Prenom) THEN
         Supprimer(Arbre.Fg, Nom, Prenom);
      ELSIF Nom > Arbre.Patient.Id_Patient.Nom OR
            (Nom = Arbre.Patient.Id_Patient.Nom AND Prenom > Arbre.Patient.Id_Patient.Prenom) THEN
         Supprimer(Arbre.Fd, Nom, Prenom);
      ELSE
         -- Patient trouvé
         IF Arbre.Fg = NULL THEN
            Arbre := Arbre.Fd;
         ELSIF Arbre.Fd = NULL THEN
            Arbre := Arbre.Fg;
         ELSE
            -- Deux fils : on remplace par le minimum du sous-arbre droit
            DECLARE
               Min_Droit : T_Arbre_Patients := Min_Node (Arbre.Fd);
            BEGIN
               Arbre.Patient := Min_Droit.Patient;
               Supprimer(Arbre.Fd, Min_Droit.Patient.Id_Patient.Nom, Min_Droit.Patient.Id_Patient.Prenom);
            END;
         END IF;
      END IF;
   END Supprimer;

   -- Procédure d'affichage de l'arbre (parcours infixe)
   PROCEDURE Afficher_Arbre ( Arbre : T_Arbre_Patients) IS
   BEGIN
      IF Arbre /= NULL THEN
         Afficher_Arbre(Arbre.Fg);
         Put_Line("Nom : " & Arbre.Patient.Id_Patient.Nom & ", Prenom : " & Arbre.Patient.Id_Patient.Prenom);
         Afficher_Arbre(Arbre.Fd);
      END IF;
   END Afficher_Arbre;

END Gestion_Arbre_Patient;