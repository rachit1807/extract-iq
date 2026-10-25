FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY --chown=node:node server.js network.js extraction.js ./
COPY --chown=node:node public ./public
USER node
ENV NODE_ENV=production
EXPOSE 3010
CMD ["node", "server.js"]
