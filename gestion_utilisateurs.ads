WITH Ada.Text_Io, Ada.Integer_Text_Io, Outils, Ada.Characters.Handling;
USE Ada.Text_Io, Ada.Integer_Text_Io, Outils, Ada.Characters.Handling;

Package Gestion_Utilisateurs is


   Type T_Utilisateur is record
      Login : T_log;
      K_login : Integer;
      empreinte : Integer;
      mdp : Taille_Mdp;
   End record;
   
   procedure generer_log (pers : T_personne; log : out T_log) ;
   procedure saisie_log (log : out T_log);
   procedure visu_log (log : in T_log);
   --  function calcul_empreinte (empreinte : integer) return Integer;
   --  procedure saisie_mdp (mdp :  out Taille_Mdp);
   --  procedure saisie_user (user : out T_Utilisateur);

End Gestion_Utilisateurs;