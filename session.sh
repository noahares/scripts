#!/bin/sh

type=$(echo -e "writing\nicpc\nkorrektur" | dmenu)

case "$type" in
    "writing" )
        sh wacom_setup.sh
        xournalpp & disown
        ;;
    "icpc" )
        setsid -f $TERMINAL -e bash -ic "cd $HOME/documents/uni_repos/icpc/praxis; bash"
        $BROWSER --new-tab https://domjudge.iti.kit.edu/main/login
        $BROWSER --new-tab https://ilias.studium.kit.edu/goto.php?target=fold_1079803&client_id=produktiv
        ;;
    "korrektur" )
        setsid -f $TERMINAL -e bash -ic "cd $HOME/documents/uni_repos/swt/feedback; bash"
        $BROWSER --new-tab https://ilias.studium.kit.edu/goto.php?target=fold_1096863&client_id=produktiv
        virt-manager & disown
        ;;
esac
