WITH Ada.Text_Io, Ada.Integer_Text_Io, ada.characters.Handling, Outils, Gestion_Utilisateurs;
USE Ada.Text_Io, Ada.Integer_Text_Io, ada.characters.Handling, Outils, Gestion_Utilisateurs;

package body gestion_personnel is 

   procedure saisie_personnel (pers : out T_personnel) is

      s: String(1..15);
      k: Integer;
      rep : Character;

   begin 

      put_line("saissisez l'identifiant du personnel : ");
      Saisie_Identite(pers.Id_personnel);
      put_line("saisissez le nom de famille de la mère : ");
      Saisie_Mot(pers.Nom_famille_mere);
      put_line("saisissez ses donnees d'utilisateur : ");
      saisie_user (pers.user);
      
      loop
         begin 
            put_line("saisissez le métier du personnel : ");
            get_line (s,k);
            pers.Metier := T_metier'Value(s(1..k));
            exit;
         exception
            when constraint_error => 
               put_line("erreur de saisie");
         end;
      end loop;

      put_line("avez vous saisie un nouveau mot de passe? ");
      loop
         Put_Line (("repondez par oui (O) ou non (N)"));
         get (rep);
         if To_Upper(rep) = 'O' then 
            pers.new_mdp_Personnel := True;
         elsif To_Upper(rep) = 'N' then 
            pers.new_mdp_Personnel := False;
         else
            put_line("erreur de saisie");
         end if;
      end loop;
   
   end saisie_personnel;
   
   procedure visu_1_personnel (pers : in T_personnel) is

   begin 

      visu_id (pers.Id_personnel);

      put("nom de famille de la mère : ");
      Put_line(pers.Nom_famille_mere(1..pers.k_nomMere));

      put("login : ");
      put_line(pers.user.login(1..pers.user.k_login));
      put("empreinte : ");
      Put(pers.user.empreinte); new_line;

      put("mot de passe");
      put_line(pers.user.mdp);

      put("metier : ");
      Put(T_metier'image(pers.Metier));
   end visu_1_personnel;

end gestion_personnel;
