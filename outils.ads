WITH Ada.Text_Io, Ada.Integer_Text_Io, Ada.Characters.Handling;
USE Ada.Text_Io, Ada.Integer_Text_Io, Ada.Characters.Handling;

Package Outils is
   Subtype T_Mot is String (1 .. 20);
   Subtype T_titre is String (1 .. 50);
   Subtype Taille_Mdp is string (1 .. 10);
   Subtype T_log is String (1 .. 50);

   Type T_Personne is record
      Nom, Prenom : T_Mot := (Others => ' ');
      k_nom, k_prenom : Integer;
   End record;

   procedure Saisie_Mot (P : out T_Mot; K : Integer);
   procedure Saisie_Identite (personne : OUT T_Personne);
   FUNCTION Verif_Mdp (Mdp : Taille_Mdp) RETURN Boolean;
   PROCEDURE Saisie_Mdp (Mdp :IN OUT taille_Mdp);
End Outils;