# Build Image
FROM gcc:12-bullseye AS build-env
WORKDIR /app
COPY src .
RUN make build

# Run app using distroless
FROM gcr.io/distroless/cc
WORKDIR /app
COPY --from=build-env /app/hello_world .
USER nonroot:nonroot
CMD [ "./hello_world" ]
