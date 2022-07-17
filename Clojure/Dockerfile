# Build Image
FROM clojure:openjdk-11-lein-slim-bullseye AS build-env
WORKDIR /app
COPY project.clj .
COPY src src
RUN lein deps
RUN lein uberjar

# Run app using distroless
FROM gcr.io/distroless/java11-debian11:nonroot
WORKDIR /app
COPY --from=build-env /app/target/uberjar/hello_world.jar .
USER nonroot:nonroot
CMD [ "hello_world.jar" ]
