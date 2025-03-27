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

   FUNCTION Verif_Mdp (Mdp : Taille_Mdp) RETURN Boolean IS
      Saisie_Mdp:Boolean;
   BEGIN
      FOR I IN mdp' range LOOP -- on regarde pour chaque  si elle est valide --
         CASE Mdp(I) IS
            WHEN 'a'..'z'|'A'..'Z'|'#'|'*'|'.'|'!'|'?'|'0'..'9' => Saisie_Mdp:=True;
            When others => Saisie_Mdp:=False;
            Exit; 
         end case;
      End Loop; 
      RETURN (Saisie_Mdp);
   END Verif_Mdp;


PROCEDURE Saisie_Mdp (Mdp :IN OUT Taille_Mdp) IS
      Saisie:boolean;
      k:integer;
   BEGIN
      LOOP
         BEGIN
         Mdp :=("          ");
            Put_Line("Saisir le mot de passe. En utilisant des Letres majuscules, minuscules,des chiffres et les caractères suivants : #,*,.,!,?, Le mot de passe doit Faire 10 caractères");
            Get_Line(Mdp,K);
            Exit when k=10;
            saisie:=Verif_Mdp(Mdp);
            EXIT WHEN Saisie=True;
         EXCEPTION
            WHEN Constraint_Error => Put_Line("/!\ Mauvaise saisie /!\");
            WHEN Data_Error => Put_Line("/!\ Veuillez utiliser les caractères autorisés /!\");
         end;

      
      End Loop;


   END Saisie_Mdp;


END Outils;