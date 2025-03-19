WITH Ada.Text_Io, Ada.Integer_Text_Io;
USE Ada.Text_Io, Ada.Integer_Text_Io;

Package gestion_dates is
   Type T_mois is (janvier, fevrier, mars, avril, mai, juin, juillet, aout, septembre, octobre, novembre, decembre);
   Subtype int_31 is Integer range 1 .. 31;

   Type T_date is record
      jour : int_31;
      mois : T_mois;
      annee : Integer;
   End record;
End gestion_dates;