WITH Ada.Text_Io, Ada.Integer_Text_Io, Outils, Ada.Characters.Handling;
USE Ada.Text_Io, Ada.Integer_Text_Io, Outils, Ada.Characters.Handling;

Package body Gestion_Utilisateurs is 

   function generer_log (pers : T_personne; log : out T_log) return T_log is 
   
      NOM, PRENOM : T_Mot:= (Others => ' ');

   begin

      log := (others => ' ');
      NOM := to_upper(pers.Nom);
      PRENOM := to_upper(pers.Prenom);
      log := NOM& "_" & PRENOM;
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

end Gestion_Utilisateurs;