#!/bin/bash

set -e

lang=$1
image=$(echo "hello-$lang" | tr '[:upper:]' '[:lower:]')

case $lang in

    C)          docker build $lang -t $image;;
    Cpp)        docker build $lang -t $image;;
    Cs)         docker build $lang -t $image;;
    Clojure)    docker build $lang -t $image;;
#    Crystal)    docker build $lang -t $image;;
#    Dart)       docker build $lang -t $image;;
#    Elixir)     docker build $lang -t $image;;
#    Erlang)     docker build $lang -t $image;;
    Go)         docker build $lang -t $image;;
#    Groovy)     docker build $lang -t $image;;
#    Haskel)     docker build $lang -t $image;;
#    Haxe)       docker build $lang -t $image;;
    Java)       docker build $lang -t $image;;
    JavaScript-Nodejs) docker build $lang -t $image;;
#    Julia)      docker build $lang -t $image;;
#    Perl)       docker build $lang -t $image;;
#    PHP)        docker build $lang -t $image;;
    Powershell)     docker build $lang -t $image;;
    Python)     docker build $lang -t $image;;
#    Raku)       docker build $lang -t $image;;
#    Ruby)       docker build $lang -t $image;;
    Rust)       docker build $lang -t $image;;
#    Swift)      docker build $lang -t $image;;
    TypeScript-Nodejs) docker build $lang -t $image;;
    All)  for d in */ ; do
            lang=${d%/}
            image=$(echo "hello-$lang" | tr '[:upper:]' '[:lower:]')
            docker build $d -t $image
          done;;


    "")    echo "help: invoke ./run.sh <lang-folder>";;
    *)     echo "unsupported lang $lang";;

esac
