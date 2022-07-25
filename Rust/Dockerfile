# Build env
FROM rust:1.62 as build-env
WORKDIR /app
COPY Cargo.toml .
COPY src ./src
RUN cargo build --release

# Run app using distroless
FROM gcr.io/distroless/cc-debian11:nonroot
WORKDIR /app
COPY --from=build-env /app/target/release/hello-world /app
USER nonroot:nonroot
CMD [ "./hello-world" ]
