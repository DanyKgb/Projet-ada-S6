WITH Ada.Sequential_IO, Gestion_liste_Documents, Outils, gestion_dates, gestion_personnel, Gestion_Liste_Personnel, Gestion_Documents;
USE Gestion_Documents, Gestion_Liste_Documents, Outils, gestion_dates, gestion_personnel, Gestion_Liste_Personnel, Gestion_Documents;

Package Gestion_Archivage_Documents is
   Package Fichier_Archivage_Document is New Ada.Sequential_IO (T_docArchive);
   Use Fichier_Archivage_Document;
End Gestion_Archivage_Documents;

