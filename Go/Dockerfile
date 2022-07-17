# Build Image
FROM golang:1.18 as build-env
WORKDIR /go/src/app
COPY src .
RUN go mod download && \
  go vet -v && \
  go test -v && \
  CGO_ENABLED=0 go build -o /go/bin/app

# Run app using distroless
FROM gcr.io/distroless/static-debian11:nonroot
WORKDIR /app
COPY --from=build-env /go/bin/app /app
USER nonroot:nonroot
CMD [ "/app/app" ]
