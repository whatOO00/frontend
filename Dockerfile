FROM node:20-bookworm
RUN corepack enable
WORKDIR /app
RUN mkdir -p .yarn/releases && touch .yarn/releases/yarn-4.14.1.cjs
COPY package.json yarn.lock .yarnrc.yml ./
RUN yarn set version 4.14.1
COPY . .
RUN yarn install --immutable
RUN npx update-browserslist-db@latest --yes
RUN yarn build