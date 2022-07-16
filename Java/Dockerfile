# Build Image
FROM openjdk:11-jdk-slim-bullseye AS build-env
WORKDIR /app
COPY ./hello_world ./hello_world
RUN javac hello_world/*.java
RUN jar cfe hello_world.jar hello_world.HelloWorld hello_world/*.class

# Run app using distroless
FROM gcr.io/distroless/java11-debian11
WORKDIR /app
COPY --from=build-env /app/hello_world.jar .
USER nonroot:nonroot
CMD [ "hello_world.jar" ]
