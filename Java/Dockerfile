# Build Image
FROM openjdk:11-jdk-slim-bullseye AS build-env
WORKDIR /app
COPY ./helloworld ./helloworld
RUN javac helloworld/*.java && \
  jar cfe hello_world.jar helloworld.HelloWorld helloworld/*.class

# Run app using distroless
FROM gcr.io/distroless/java11-debian11:nonroot
WORKDIR /app
COPY --from=build-env /app/hello_world.jar .
USER nonroot:nonroot
CMD [ "hello_world.jar" ]
