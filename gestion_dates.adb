WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling;

PACKAGE BODY gestion_dates IS


-- verif date

--annee bisextille

   function annee_bis (Annee : integer ) return boolean is

      bis : boolean;

   begin

      if (Annee mod 4 = 0 and  ((Annee mod 100 /= 0) or (Annee mod 400 = 0))) then
         bis := true;
      else
         bis := false;
      end if;

      return bis;

   end annee_bis;

--verif du nombre de jours max

   function NB_jour_max (M : T_mois ; Annee : integer) return integer is

      J_max : integer;

   begin

      case M is

         when janvier | mars | mai | juillet | aout | octobre | decembre => J_max := 31;

         when avril | juin | septembre | novembre => J_max := 30;

         when others =>
                        if annee_bis(Annee) then
                           J_max := 29;
                        else J_max := 28;
                        end if;

      end case;

      return(J_max);

   end NB_jour_max;


--saisie date
   procedure saisie_date (D : out T_date) is

        k : integer;
        s : string (1..11);

    Begin

       Put_Line ("Saisissez la date");

       loop

         begin

            Put("en quelle annee sommes nous? "); get (D.annee); skip_line;
            exit;

         exception

            when Data_Error => Skip_Line; Put_Line ("mauvaise saisie de date");
            when Constraint_Error =>Skip_Line; Put_Line ("mauvaise saisie de date");

         end;

      end loop;



      loop

         begin

            S := (others => ' ');

            put("Quel est le mois? => "); get_line(s,k);
            D.Mois := T_Mois'Value(S(1..K));
            EXIT;


         exception

            when Constraint_Error =>Skip_Line; Put_Line ("mauvaise saisie de date");

         END;


      END LOOP;

      loop

         begin

            Put("nous sommes le combien du mois? "); get(D.jour);skip_line;
            exit when D.jour <= NB_jour_max(D.mois, D.annee);

         exception

            when Data_Error => Skip_Line; Put_Line ("mauvaise saisie de date");
            when Constraint_Error =>Skip_Line; Put_Line ("mauvaise saisie de date");

         end;

      end loop;

   end saisie_date;


--visu date

   procedure visu_date (D : T_date) is

   begin

      Put(D.Jour); Put(" ");
      Put(T_Mois'Image(D.Mois)); Put(" ");
      Put(D.Annee); New_Line;


   end visu_date;


--jour suivant

   PROCEDURE Jour_Suivant(D : IN OUT T_Date) IS

   BEGIN
      IF D.Mois = Decembre AND D.Jour = 31 THEN
         D.Annee := D.Annee + 1;
         D.Mois := Janvier;
         D.Jour := 1;
      ELSE
         CASE D.Mois IS
            WHEN fevrier =>
               IF Annee_Bis(D.Annee) THEN
                  IF D.Jour < 29 THEN
                     D.Jour := D.Jour + 1;
                  ELSE
                     D.Mois := Mars;
                     D.Jour := 1;
                  END IF;
               ELSE
                  IF D.Jour < 28 THEN
                     D.Jour := D.Jour + 1;
                  ELSE
                     D.Mois := Mars;
                     D.Jour := 1;
                  END IF;
               END IF;
            WHEN janvier|mars|mai|juillet|aout|octobre|decembre =>
               IF D.Jour < 31 THEN
                  D.Jour := D.Jour + 1;
               ELSE
                  D.Jour := 1;
                  D.Mois := T_Mois'succ(D.Mois);
               END IF;
            WHEN OTHERS =>
               IF D.Jour < 30 THEN
                  D.Jour := D.Jour + 1;
               ELSE
                  D.Jour := 1;
                  D.Mois := T_Mois'succ(D.Mois);
               END IF;
         END CASE;
      END IF;
      Put_Line("La date a ete mise a jour ");
      visu_date(D);
   end jour_suivant;

end gestion_dates;
