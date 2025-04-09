with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Outils; use Outils;
with Gestion_Utilisateurs; use Gestion_Utilisateurs;
with Gestion_Liste_Documents; use Gestion_Liste_Documents;

package body Gestion_Patient is

   -- Initialiser un patient
   function Initialiser_Patient (
      Id_Patient       : T_Personne;
      Nom_Famille_Mere : T_Mot;
      User_Patient     : T_Utilisateur;
      P_DocumentPatient: T_Pteur_Doc := null;
      New_Mdp_Patient  : Boolean := False
   ) return T_Patients is
      Patient : T_Patients;
   begin
      Patient.Id_Patient        := Id_Patient;
      Patient.Nom_Famille_Mere  := Nom_Famille_Mere;
      Patient.User_Patient      := User_Patient;
      Patient.P_DocumentPatient := P_DocumentPatient;
      Patient.New_Mdp_Patient   := New_Mdp_Patient;
      return Patient;
   end Initialiser_Patient;

   -- Ajouter un document à un patient
   procedure Ajouter_Document (
      Patient     : in out T_Patients;
      Nouveau_Doc : in     T_Pteur_Doc
   ) is
   begin
      if Nouveau_Doc /= null then
         Nouveau_Doc.Suivant := Patient.P_DocumentPatient;
         Patient.P_DocumentPatient := Nouveau_Doc;
      end if;
   end Ajouter_Document;

   -- Supprimer un document d'un patient (par ID)
   procedure Supprimer_Document (
      Patient : in out T_Patients;
      Id_Doc  : in     Integer;
      Success : out    Boolean
   ) is
      Courant, Precedent : T_Pteur_Doc;
   begin
      Courant := Patient.P_DocumentPatient;
      Precedent := null;
      Success := False;

      while Courant /= null loop
         if Courant.Id = Id_Doc then
            if Precedent = null then
               Patient.P_DocumentPatient := Courant.Suivant;
            else
               Precedent.Suivant := Courant.Suivant;
            end if;
            Free(Courant); -- Libérer la mémoire (si disponible)
            Success := True;
            exit;
         end if;
         Precedent := Courant;
         Courant := Courant.Suivant;
      end loop;
   end Supprimer_Document;

   -- Afficher les documents d'un patient
   procedure Afficher_Documents (Patient : in T_Patients) is
      Courant : T_Pteur_Doc;
   begin
      Put_Line("Documents du patient " & Patient.Id_Patient.Nom & ":");
      Courant := Patient.P_DocumentPatient;
      while Courant /= null loop
         Put_Line("  - ID: " & Courant.Id'Image & ", Titre: " & Courant.Titre);
         Courant := Courant.Suivant;
      end loop;
   end Afficher_Documents;

   -- Vérifier si un patient a un document spécifique
   function Possede_Document (
      Patient : T_Patients;
      Id_Doc  : Integer
   ) return Boolean is
      Courant : T_Pteur_Doc;
   begin
      Courant := Patient.P_DocumentPatient;
      while Courant /= null loop
         if Courant.Id = Id_Doc then
            return True;
         end if;
         Courant := Courant.Suivant;
      end loop;
      return False;
   end Possede_Document;

end Gestion_Patient;