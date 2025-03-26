WITH Ada.Text_Io, Ada.Integer_Text_Io, Ada.Characters.Handling;
USE Ada.Text_Io, Ada.Integer_Text_Io, Ada.Characters.Handling;

Package gestion_dates is
   Type T_mois is (janvier, fevrier, mars, avril, mai, juin, juillet, aout, septembre, octobre, novembre, decembre);
   Subtype int_31 is Integer range 1 .. 31;

   Type T_date is record
      jour : int_31;
      mois : T_mois;
      annee : Integer;
   End record;

   FUNCTION annee_bis (Annee : Integer) RETURN Boolean;
   FUNCTION NB_jour_max (M : T_Mois; Annee : Integer) RETURN Integer;

   PROCEDURE saisie_date (D : OUT T_Date);
   PROCEDURE visu_date (D : T_Date);
   PROCEDURE jour_suivant (D : IN OUT T_Date);
End gestion_dates;