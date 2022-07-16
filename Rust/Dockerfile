# Build env
FROM rust:1.41.0 as build-env
WORKDIR /app
COPY Cargo.toml .
COPY src ./src
RUN cargo build --release

# Run app using distroless
FROM gcr.io/distroless/cc
WORKDIR /app
COPY --from=build-env /app/target/release/hello-world /app
CMD [ "./hello-world" ]
