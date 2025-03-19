# filepath: /Users/user/Documents/GPHY/Cours L3/2024-2025/S6/Algo/Projet centre medical/auto_update.sh
#!/bin/bash

# Naviguer vers le répertoire du projet
cd "/Users/user/Documents/GPHY/Cours L3/2024-2025/S6/Algo/Projet centre medical"

# Ajouter tous les fichiers modifiés
git add .

# Commit avec un message automatique
git commit -m "Mise à jour automatique : $(date)"

# Pousser les modifications vers GitHub
git push origin main