WITH Ada.Text_Io, Ada.Integer_Text_Io;
USE Ada.Text_Io, Ada.Integer_Text_Io;

Package Gestion_Liste_Documents is
   Type T_cell_doc;
   Type T_pteur_doc is Access T_cell_doc;

   Type T_cell_doc is record
      doc : T_Document;
      Suiv : T_pteur_doc;
   End record;
End Gestion_Liste_Documents;