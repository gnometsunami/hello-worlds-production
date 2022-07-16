# Build Image
FROM node:18 AS build-env
WORKDIR /app
COPY package.json .
COPY tsconfig.json .
RUN npm install typescript ts-node
RUN npm ci --omit=dev
COPY ./src ./src
RUN npm run build

# Clean Environment
FROM node:18  as clean-env
WORKDIR /app
COPY --from=build-env /app/package*.json ./
COPY --from=build-env /app/out ./
RUN npm install --omit=dev

# Run app using distroless
FROM gcr.io/distroless/nodejs:18
WORKDIR /app
COPY --from=clean-env /app /app
USER nonroot:nonroot
CMD [ "hello_world.js" ]
