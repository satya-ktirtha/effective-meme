# syntax=docker/dockerfile:1

ARG NODE_VERSION=22.11.0

FROM node:latest-alpine@sha256:0bcc32c2d59aa8bf416a43be9672a59fa1b9f0f0fbdb6fe069d67e7be2f98e9e

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
