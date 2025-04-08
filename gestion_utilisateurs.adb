WITH Ada.Text_Io, Ada.Integer_Text_Io, Outils, Ada.Characters.Handling;
USE Ada.Text_Io, Ada.Integer_Text_Io, Outils, Ada.Characters.Handling;

Package body Gestion_Utilisateurs is 

   procedure generer_log (pers : T_personne; log : out T_log) is 
   
      NOM, PRENOM : T_Mot:= (Others => ' ');

   begin

      log := (others => ' ');
      NOM := to_upper(pers.Nom(1..pers.k_nom));
      PRENOM := to_upper(pers.Prenom(1..pers.k_prenom));

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
   log := to_upper(log);
end saisie_log;


----------------- a refaire -------------------
procedure visu_log (log : in T_log) is
   pers : T_Personne;
begin
   Put("login : ");
   --generer_log (pers, log);
   Put_Line("Identifiant : " & pers.Nom(1..pers.k_nom) & "_" & pers.Prenom(1..pers.k_prenom)); ----- ça marche bien pour la generation de login

end visu_log;


-------------------------------------------------------------------------------

--  procedure saisie_mdp (mdp : out Taille_Mdp) is
--     ok : Boolean := False;
--     k : integer := 0;
--  begin

--     mdp := (others => ' ');

--     loop
--        Put("Saisir le mot de passe : ");
--        get_line(mdp, k);
--        ok := true;
--        for i in mdp'range loop
--           case mdp(i) is
--              when 'A' .. 'Z'|'a'..'z'|'#'|'*'|'.'|'!'|'?'|'0'..'9' => null;
--                                                                       k := k+1;
--              WHEN OTHERS =>
--                 ok := false;
--                 exit;
--           end case;
--        end loop;
--        exit when ok = true and then k = 10;
--     end loop;

--  end saisie_mdp;

function calcul_empreinte (mdp : Taille_Mdp) return Integer is
   cpt: integer:=0;
begin 
   for i in 1..10 loop
      cpt:= cpt+i*character'pos(mdp(i));
   end loop;
   put ("Votre empreinte est : ");
      return(cpt mod 2048);
end calcul_empreinte;  

procedure saisie_user (user : out T_Utilisateur) is

begin
   Put_Line("le login : ");
   saisie_log (user.login);
   --  user.k_login := length'(user.login); 

   Put_Line("Saisir l'empreinte : ");
   user.empreinte := calcul_empreinte(user.mdp);
   put("Saisir le mot de passe : ");
   saisie_mdp(user.mdp);
end saisie_user;

end Gestion_Utilisateurs;