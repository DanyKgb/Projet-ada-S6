WITH Ada.Sequential_IO, Gestion_Documents;
USE Gestion_Documents;

Package Gestion_Archivage_Documents is
   Package Fichier_Archivage_Document is New Ada.Sequential_IO (T_docArchive);
   Use Fichier_Archivage_Document;
End Gestion_Archivage_Documents;