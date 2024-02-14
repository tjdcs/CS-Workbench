#!zsh

BEHIND_COUNT=$(git rev-list --count HEAD..@{u})
AHEAD_COUNT=$(git rev-list --count @{u}..HEAD)

git fetch 
git status -sb -uno

if [[ $BEHIND_COUNT -eq 0 && $AHEAD_COUNT -eq 0 ]]; then
    #Repo is in step with origin
    echo "${PWD##*/} $(git rev-parse --abbrev-ref HEAD) is up-to-date"
fi

if [[ $BEHIND_COUNT -eq 0 && $AHEAD_COUNT -gt 0 ]]; then
    #Repo is in ahead of origin
    echo "${PWD##*/} $(git rev-parse --abbrev-ref HEAD) is ahead of origin."
fi

if [[ $BEHIND_COUNT -gt 0 && $AHEAD_COUNT -eq 0 ]]; then
    #Repo is in behind of origin
    echo "${PWD##*/} $(git rev-parse --abbrev-ref HEAD) is behind update. Try git pull"
fi

if [[ $BEHIND_COUNT -gt 0 && $AHEAD_COUNT -gt 0 ]]; then
    #Repo is in diverged of origin
    echo "${PWD##*/} $(git rev-parse --abbrev-ref HEAD) is diverged. Try git pull --rebase"
fi