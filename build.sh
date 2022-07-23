#!/bin/bash

set -e

lang=$1
image=$(echo "hello-$lang" | tr '[:upper:]' '[:lower:]')

case $lang in

    C)                  docker build "$lang" -t "$image" && docker run "$image";;
    Cpp)                docker build "$lang" -t "$image" && docker run "$image";;
    Cs)                 docker build "$lang" -t "$image" && docker run "$image";;
    Cs-Aspnet)          docker build "$lang" -t "$image" && docker run "$image";;
    Clojure)            docker build "$lang" -t "$image" && docker run "$image";;
    Go)                 docker build "$lang" -t "$image" && docker run "$image";;
    Java)               docker build "$lang" -t "$image" && docker run "$image";;
    JavaScript-Nodejs)  docker build "$lang" -t "$image" && docker run "$image";;
    Powershell)         docker build "$lang" -t "$image" && docker run "$image";;
    Python)             docker build "$lang" -t "$image" && docker run "$image";;
    Rust)               docker build "$lang" -t "$image" && docker run "$image";;
    TypeScript-Nodejs)  docker build "$lang" -t "$image" && docker run "$image";;
    All)                for d in */ ; do
                          lang=${d%/}
                          image=$(echo "hello-$lang" | tr '[:upper:]' '[:lower:]')
                          docker build "$d" -t "$image" && docker run "$image"
                        done;;
                        
    "")    echo "help: invoke ./run.sh <lang-folder>";;
    *)     echo "unsupported lang $lang";;

esac
