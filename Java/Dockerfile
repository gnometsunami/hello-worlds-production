# Build Image
FROM openjdk:11-jdk-slim-bullseye AS build-env
WORKDIR /app
COPY ./HelloWorld ./HelloWorld
RUN javac HelloWorld/*.java && \
  jar cfe HelloWorld.jar HelloWorld.HelloWorld HelloWorld/*.class

# Run app using distroless
FROM gcr.io/distroless/java11-debian11:nonroot
WORKDIR /app
COPY --from=build-env /app/HelloWorld.jar .
USER nonroot:nonroot
CMD [ "HelloWorld.jar" ]
