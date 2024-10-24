#!/bin/bash

# Vérifie si un message a été passé en argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 'message_de_commit'"
    exit 1
fi

# Stocke le message de commit
commit_message="$1"

# Ajoute tous les fichiers modifiés au staging
git add .
if [ $? -ne 0 ]; then
    echo "\nErreur lors de l'exécution de git add"
    exit 1
fi

# Fait un commit avec le message fourni
git commit -m "$commit_message"
if [ $? -ne 0 ]; then
    echo "Erreur lors de l'exécution de git commit"
    exit 1
fi

# Pousse les changements
git push
if [ $? -ne 0 ]; then
    echo "Erreur lors de l'exécution de git push"
    exit 1
fi

