# syntax=docker/dockerfile:1

ARG NODE_VERSION=23.7.0

FROM node:${NODE_VERSION}-alpine3.20@sha256:3ac002b133fd3737c44b66f0d023f5d75c7a1ddec71954fa06486aed6aead888

WORKDIR /app


# RUN --mount=type=bind,source=package.json,target=package.json \
#    --mount=type=bind,source=package-lock.json,target=package-lock.json \
#    --mount=type=cache,target=/root/.npm \
#    npm ci --omit=dev

COPY /app/package.json .

RUN npm install

COPY /app .

EXPOSE 3000

CMD ["node", "app.mjs"]
