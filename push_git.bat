@echo off
cd /d %~dp0
echo =====================================
echo 🔄 Ajout des fichiers au commit...
echo =====================================
git add .

echo =====================================
echo ✅ Création du commit...
echo =====================================
git commit -m "Mise à jour automatique"

echo =====================================
echo 🔄 Récupération des dernières modifications...
echo =====================================
git pull --rebase origin main

echo =====================================
echo 🚀 Envoi sur GitHub...
echo =====================================
git push origin main

echo =====================================
echo 🎉 Push terminé ! Appuie sur une touche pour fermer.
echo =====================================
pause