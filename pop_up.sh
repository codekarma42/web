#!/bin/bash

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

SECONDS=0

while true; do
    if [ $SECONDS -le 3600 ]; then
        DELAY=$(shuf -i 1-600 -n 1)  # Between 1 and 600 seconds during the first hour
    elif [ $SECONDS -le 7200 ]; then
        DELAY=$(shuf -i 1-10 -n 1)   # Between 1 and 10 seconds during the second hour
    elif [ $SECONDS -le 10800 ]; then
        DELAY=$(shuf -i 1-10 -n 1)   # Between 1 and 10 seconds during the third hour
    else
        DELAY=1                     # Every second after the third hour
    fi
    sleep $DELAY
    show_random_message
done
