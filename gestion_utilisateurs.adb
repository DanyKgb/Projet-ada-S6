WITH Ada.Text_Io, Ada.Integer_Text_Io, Outils, Ada.Characters.Handling;
USE Ada.Text_Io, Ada.Integer_Text_Io, Outils, Ada.Characters.Handling;

Package body Gestion_Utilisateurs is 

   function generer_log (pers : T_personne; log : out T_log) return T_log is 
   
      NOM, PRENOM : T_Mot:= (Others => ' ');

   begin

      log := (others => ' ');
      NOM := to_upper(pers.Nom);
      PRENOM := to_upper(pers.Prenom);
      log := NOM& "_"& PRENOM;
      return log;
   end generer_log;

procedure saisie_log (log : out T_log) is
   ok : Boolean := False;
begin
   loop
   log := (others => ' ');
      Put("Saisir le login : ");
      ok := true;
      for i in log'range loop
         case log(i) is
            when 'A' .. 'Z' => null;
            WHEN '-' => -- Doivent être précédé ou suivie d'une lettre
                  IF ((I = log'First) OR ELSE (I = log'Last)) OR ELSE ((log(I-1) = '-') OR ELSE (log(I+1) = '_')) THEN
                     OK := False;
                     EXIT;
                  END IF;
               WHEN OTHERS =>
                  OK := False;
                  EXIT;
         end case;
      end loop;
      exit when ok = true;
   end loop;
end saisie_log;



procedure saisie_mdp (mdp : out Taille_Mdp) is
   ok : Boolean := False;
   k : integer := 0;
begin
   loop
      Put("Saisir le mot de passe : ");
      --get_line
      ok := true;
      for i in mdp'range loop
         case mdp(i) is
            when 'A' .. 'Z'|'a'..'z'|'#'|'*'|'.'|'!'|'?'|'0'..'9' => null;
                                                                     k := k+1;
            WHEN OTHERS =>
               ok := false;
               exit;
         end case;
      end loop;
      exit when ok = true and then k = 10;
   end loop;

end saisie_mdp;

   --  function calcul_empreinte (empreinte : integer) return Integer is 

procedure saisie_user (user : out T_Utilisateur) is

begin
   Put_Line("Saisir le login : ");
   saisie_log(user.login);
   --user.k_login := length(user.login);
   Put_Line("Saisir l'empreinte : ");
   -- se calcule a partir du mdp
   --Get(user.empreinte);
   user.empreinte := user.empreinte;
end saisie_user;

end Gestion_Utilisateurs;