# Build Image
FROM node:18 AS build-env
WORKDIR /app
COPY package.json .
COPY package-lock.json .
#RUN npm install your-dependencies
COPY src .
RUN npm ci --omit=dev

# Run app using distroless
FROM gcr.io/distroless/nodejs:18
WORKDIR /app
COPY --from=build-env /app /app
USER nonroot:nonroot
CMD [ "hello_world.js" ]
