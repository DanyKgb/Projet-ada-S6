#!/bin/bash

# Accéder au répertoire du projet
cd "/Users/user/Documents/GPHY/Cours L3/2024-2025/S6/Algo/Projet centre medical" || exit

# Vérifier la branche actuelle
echo "Branche actuelle :"
git branch

# Récupérer les mises à jour
echo "Récupération des mises à jour depuis GitHub..."
git pull

# Vérifier l'état après la mise à jour
echo "État du dépôt après mise à jour :"
git status
