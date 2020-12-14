#!/bin/sh

type=$1
name=$2
dir=$(xdg-user-dir TEMPLATES)

case "$type" in
    "cpp" )
        cp $dir/template.cpp $name.cpp
        $EDITOR $name.cpp
        ;;
    "beamer" )
        cp $dir/beamer.tex $name.tex
        $EDITOR $name.tex
        ;;
    "article" )
        cp $dir/article.tex $name.tex
        $EDITOR $name.tex
        ;;
    "mdp" )
        cp $dir/mdp.md $name.md
        $EDITOR $name.md
        ;;
    * )
        echo "$type not supported. Use cpp, article, beamer or mdp."
esac
