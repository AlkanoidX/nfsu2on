#!/bin/bash
# Envoie les fichiers du jeu sur GitHub (AlkanoidX/nfsu2on, branche main), en plusieurs commits/push de moins de 2 Go
# (limite d'un push GitHub).  A lancer dans ce dossier (Git Bash) :  bash push_github.sh
# Il faut un compte qui a le droit d'ecrire dans AlkanoidX/nfsu2on (celui de Git par defaut, narkos69, ne l'a pas).
set -e
cd "$(dirname "$0")"
[ -d .git ] || git init -q -b main
# les morceaux sont binaires : jamais de conversion CRLF (4-hebergement-livraison.md)
git config core.autocrlf false
git remote get-url origin >/dev/null 2>&1 || git remote add origin https://github.com/AlkanoidX/nfsu2on.git
git add README.md manifest.json push_github.sh
git diff --cached --quiet || git commit -q -m "manifest and README" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"
git push -u origin main
# un lot par dossier du jeu (MOVIES et SOUND, les plus gros, a part)
for d in data/*; do
  git add "$d"
  if ! git diff --cached --quiet; then
    git commit -q -m "game data: ${d#data/}" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"
    git push origin main
  fi
done
git status --short | head
echo "fini : https://github.com/AlkanoidX/nfsu2on"
