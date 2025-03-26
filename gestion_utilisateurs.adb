WITH Ada.Text_Io, Ada.Integer_Text_Io, Outils, Ada.Characters.Handling;
USE Ada.Text_Io, Ada.Integer_Text_Io, Outils, Ada.Characters.Handling;

Package body Gestion_Utilisateurs is 

   function generer_log (pers : T_personne; log : out T_log) return T_log is 
   
      NOM, PRENOM : T_Mot:= (Others => ' ');

   begin

      log := (others => ' ');
      NOM := to_upper(pers.Nom,pers.k_nom);
      PRENOM := to_upper(pers.Prenom,pers.k_prenom);
      log := NOM & "_" & PRENOM;
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
            when '_' => if i /= log'first and then i/= log'last then 
                           if log(i)= '_' then 
                              log(i-1) := 'A'..'Z';
                              log(i+1) := 'A'..'Z';
                           end if;
                           ok:=true;
                        else
                           ok:=false;
                        end if;
                        
            when others => ok := false;
         end case;
end saisie_log;

end Gestion_Utilisateurs;