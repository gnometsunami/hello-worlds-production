build-c:
		lang=C ; image=$$(echo "hello-$$lang" | tr '[:upper:]' '[:lower:]') ; \
		docker build $$lang -t $$image

build-clojure:
		lang=Clojure ; image=$$(echo "hello-$$lang" | tr '[:upper:]' '[:lower:]') ; \
		docker build $$lang -t $$image

