WITH Ada.Text_Io, Ada.Integer_Text_Io, gestion_personnel, Outils, Gestion_Utilisateurs;
USE Ada.Text_Io, Ada.Integer_Text_Io, gestion_personnel, Outils, Gestion_Utilisateurs;

package body Gestion_Liste_Personnel is 

   procedure Ajout_liste (tete : in out T_pteur_personnel; pers : in T_personnel) is 
      Ptr : T_pteur_personnel;
   begin

      saisie_personnel (pers);
      if tete = null then 
         tete:= new T_cell_personnel'(pers,null);
      else -- ajouter le perso en fin de liste 
         Ptr:= tete;
         while Ptr.Suiv /= null loop
            Ptr:= Ptr.Suiv;
         end loop;
         Ptr.Suiv:= new T_cell_personnel'(pers,null);
      end if;
   end Ajout_liste;

   procedure visu_liste (tete : in T_pteur_personnel) is 
      
   begin 

      if tete /= null then 
         Put_Line("identifiant : ");
         Put(tete.perso.Id_personnel.Nom,tete.perso.Id_personnel.k_nom);
         Put(tete.perso.Id_personnel.Prenom,tete.perso.Id_personnel.k_prenom);
         Put_Line("nom de famille de la mère : ");
         Put(tete.perso.Nom_famille_mere,tete.perso.k_nomMere);
         Put_Line("metier : ");
         Put(T_metier'image(tete.perso.Metier));
      end if;
      visu_liste ((tete.suiv));
   end visu_liste;
end Gestion_Liste_Personnel;