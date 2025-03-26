WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling;


PACKAGE BODY Outils IS


   -------------------------------- Saisie du nom et du prénom -------------------------------

   PROCEDURE Saisie_Mot (
         P :    OUT T_Mot;
         K  : Integer) IS
      OK : Boolean;      

   BEGIN
      LOOP
         P := (OTHERS => ' ');
         New_Line;
         OK := True;
         FOR I IN P'RANGE LOOP
            CASE P(I) IS
               WHEN 'A'..'Z' =>
                  NULL;
               WHEN 'a'..'z' =>
                  NULL;
               WHEN '-'|''' => -- Doivent être précédé ou suivie d'une lettre
                  IF ((I = P'First) OR ELSE (I = P'Last)) OR ELSE ((P(I-1) = '-') OR ELSE (P(I+1) = ' ')) OR ELSE (P(I-1) = ''') OR ELSE (P(I+1) = ' ') THEN
                     OK := False;
                     EXIT;
                  END IF;
               WHEN OTHERS =>
                  OK := False;
                  EXIT;
            END CASE;
         END LOOP;
         EXIT WHEN OK = True;
         Put_Line("Erreur de saisie, recommencez");
      END LOOP;
   END Saisie_Mot;

   PROCEDURE Saisie_Identite (personne : OUT T_Personne) IS
      BEGIN
         Put_Line("Entrez le nom : ");
         Saisie_Mot(personne.Nom, personne.k_nom);
         Put_Line("Entrez le prenom : ");
         Saisie_Mot(Personne.Prenom, personne.k_prenom);
   END Saisie_Identite;

   --procedure saisie_mdp (mdp : out T) is

END Outils;