WITH Ada.Text_Io, Ada.Integer_Text_Io, gestion_personnel, Outils, Gestion_Utilisateurs;
USE Ada.Text_Io, Ada.Integer_Text_Io, gestion_personnel, Outils, Gestion_Utilisateurs;

package body Gestion_Liste_Personnel is 

   procedure Ajout_liste (tete : in out T_pteur_personnel; pers : in T_personnel) is 
      Ptr : T_pteur_personnel;
   begin

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

   procedure ajout_tete_liste (tete : in out T_pteur_personnel; pers : in T_personnel) is

   begin 
      if tete = null then 
         tete:= new T_cell_personnel'(pers,null);
      else 
         tete:= new T_cell_personnel'(pers,tete);
      end if;
   end ajout_tete_liste;


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

   procedure initialiser_liste (tete : in out T_pteur_personnel) is
   begin 
      if tete = null then 
         tete.perso.Id_personnel.Nom(1..8) := "Lovelace";
         tete.perso.Id_personnel.k_nom := 8;
         tete.perso.Id_personnel.Prenom := "Ada";
         tete.perso.Id_personnel.k_prenom := 3;
         tete.perso.Nom_famille_mere := "byron";
         tete.perso.k_nomMere := 6;
         tete.perso.user.login := "LOVELACE_ADA";
         tete.perso.user.k_login := 15;
         tete.perso.user.empreinte := 123456;
         tete.perso.Metier := T_metier'Value("medecin");
         tete.perso.new_mdp_Personnel := False;
         tete:= new T_cell_personnel'(tete.perso,null);

         tete.perso.Id_personnel.Nom := "Eyre";
         tete.perso.Id_personnel.k_nom := 4;
         tete.perso.Id_personnel.Prenom := "Jane";
         tete.perso.Id_personnel.k_prenom := 4;
         tete.perso.Nom_famille_mere := "Bronte";
         tete.perso.k_nomMere := 6;
         tete.perso.user.login := "EYRE_JANE";
         tete.perso.user.k_login := 9;
         tete.perso.user.empreinte := 789012;
         tete.perso.Metier := T_metier'Value("secretaire");
         tete.perso.new_mdp_Personnel := False;
         tete := new T_cell_personnel'(tete.perso, tete);

         tete.perso.Id_personnel.Nom := "Sylvestre";
         tete.perso.Id_personnel.k_nom := 8;
         tete.perso.Id_personnel.Prenom := "Pierre";
         tete.perso.Id_personnel.k_prenom := 6;
         tete.perso.Nom_famille_mere := "Raynal";
         tete.perso.k_nomMere := 6;
         tete.perso.user.login := "SYLVESTRE_PIERRE";
         tete.perso.user.k_login := 15;
         tete.perso.user.empreinte := 345678;
         tete.perso.Metier := T_metier'Value("medecin");
         tete.perso.new_mdp_Personnel := True;
         tete := new T_cell_personnel'(tete.perso, tete);

         tete.perso.Id_personnel.Nom := "Lampion";
         tete.perso.Id_personnel.k_nom := 7;
         tete.perso.Id_personnel.Prenom := "Seraphin";
         tete.perso.Id_personnel.k_prenom := 8;
         tete.perso.Nom_famille_mere := "Herge";
         tete.perso.k_nomMere := 5;
         tete.perso.user.login := "LAMPION_SERAPHIN";
         tete.perso.user.k_login := 15;
         tete.perso.user.empreinte := 901234;
         tete.perso.Metier := T_metier'Value("secretaire");
         tete.perso.new_mdp_Personnel := False;
         tete := new T_cell_personnel'(tete.perso, tete);

         tete.perso.Id_personnel.Nom := "Bovary";
         tete.perso.Id_personnel.k_nom := 6;
         tete.perso.Id_personnel.Prenom := "Emma";
         tete.perso.Id_personnel.k_prenom := 4;
         tete.perso.Nom_famille_mere := "Flaubert";
         tete.perso.k_nomMere := 8;
         tete.perso.user.login := "BOVARY_EMMA";
         tete.perso.user.k_login := 10;
         tete.perso.user.empreinte := 567890;
         tete.perso.Metier := T_metier'Value("medecin");
         tete.perso.new_mdp_Personnel := True;
         tete := new T_cell_personnel'(tete.perso, tete);

         tete.perso.Id_personnel.Nom := "LADMIN";
         tete.perso.Id_personnel.k_nom := 6;
         tete.perso.Id_personnel.Prenom := "Lucien";
         tete.perso.Id_personnel.k_prenom := 6;
         tete.perso.Nom_famille_mere := "Mum";
         tete.perso.k_nomMere := 3;
         tete.perso.user.login := "LADMIN_LUCIEN";
         tete.perso.user.k_login := 12;
         tete.perso.user.empreinte := 123456;
         tete.perso.Metier := T_metier'Value("administrateur");
         tete.perso.new_mdp_Personnel := False;
         tete := new T_cell_personnel'(tete.perso, tete);
      
      end if;

   end initialiser_liste;
      
end Gestion_Liste_Personnel;