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


   procedure visu_liste (tete : in out T_pteur_personnel) is 
      
   begin 

      if tete /= null then 
         visu_1_personnel (tete.perso);
         New_Line; new_line; new_line;
         visu_liste (tete.suiv);
      end if;
      
   end visu_liste;

   procedure initialiser_liste (tete : out T_pteur_personnel; perso : out T_personnel) is
   begin 
         perso.Id_personnel.Nom(1..8) := "Lovelace";
         perso.Id_personnel.k_nom := 8;
         perso.Id_personnel.Prenom(1..3) := "Ada";
         perso.Id_personnel.k_prenom := 3;
         perso.Nom_famille_mere(1..5) := "byron";
         perso.k_nomMere := 5;
         perso.user.login(1..12) := "LOVELACE_ADA";
         perso.user.k_login := 12;
         perso.user.empreinte := 123456;
         perso.Metier := T_metier'Value("medecin");
         perso.new_mdp_Personnel := False;
         tete:= new T_cell_personnel'(perso,null);

         perso.Id_personnel.Nom(1..4) := "Eyre";
         perso.Id_personnel.k_nom := 4;
         perso.Id_personnel.Prenom(1..4) := "Jane";
         perso.Id_personnel.k_prenom := 4;
         perso.Nom_famille_mere(1..6) := "Bronte";
         perso.k_nomMere := 6;
         perso.user.login(1..9) := "EYRE_JANE";
         perso.user.k_login := 9;
         perso.user.empreinte := 789012;
         perso.Metier := T_metier'Value("secretaire");
         perso.new_mdp_Personnel := False;
         tete.suiv := new T_cell_personnel'(perso, null);

         perso.Id_personnel.Nom(1..9) := "Sylvestre";
         perso.Id_personnel.k_nom := 9;
         perso.Id_personnel.Prenom(1..6) := "Pierre";
         perso.Id_personnel.k_prenom := 6;
         perso.Nom_famille_mere(1..6) := "Raynal";
         perso.k_nomMere := 6;
         perso.user.login(1..16) := "SYLVESTRE_PIERRE";
         perso.user.k_login := 16;
         perso.user.empreinte := 345678;
         perso.Metier := T_metier'Value("medecin");
         perso.new_mdp_Personnel := True;
         tete.suiv.suiv:= new T_cell_personnel'(perso, null);

         perso.Id_personnel.Nom(1..7) := "Lampion";
         perso.Id_personnel.k_nom := 7;
         perso.Id_personnel.Prenom(1..8) := "Seraphin";
         perso.Id_personnel.k_prenom := 8;
         perso.Nom_famille_mere(1..5) := "Herge";
         perso.k_nomMere := 5;
         perso.user.login(1..16) := "LAMPION_SERAPHIN";
         perso.user.k_login := 16;
         perso.user.empreinte := 901234;
         perso.Metier := T_metier'Value("secretaire");
         perso.new_mdp_Personnel := False;
         tete.suiv.suiv.suiv := new T_cell_personnel'(perso, null);

         perso.Id_personnel.Nom(1..6) := "Bovary";
         perso.Id_personnel.k_nom := 6;
         perso.Id_personnel.Prenom(1..4) := "Emma";
         perso.Id_personnel.k_prenom := 4;
         perso.Nom_famille_mere(1..8) := "Flaubert";
         perso.k_nomMere := 8;
         perso.user.login(1..11) := "BOVARY_EMMA";
         perso.user.k_login := 11;
         perso.user.empreinte := 567890;
         perso.Metier := T_metier'Value("medecin");
         perso.new_mdp_Personnel := True;
         tete.suiv.suiv.suiv.suiv := new T_cell_personnel'(perso, null);

         perso.Id_personnel.Nom(1..6) := "LADMIN";
         perso.Id_personnel.k_nom := 6;
         perso.Id_personnel.Prenom(1..6) := "Lucien";
         perso.Id_personnel.k_prenom := 6;
         perso.Nom_famille_mere(1..3) := "Mum";
         perso.k_nomMere := 3;
         perso.user.login(1..13) := "LADMIN_LUCIEN";
         perso.user.k_login := 13;
         perso.user.empreinte := 123456;
         perso.Metier := T_metier'Value("administrateur");
         perso.new_mdp_Personnel := False;
         tete.suiv.suiv.suiv.suiv.suiv := new T_cell_personnel'(perso, null);
      
   end initialiser_liste;


end Gestion_Liste_Personnel;