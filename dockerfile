FROM node:22-alpine

WORKDIR /app

COPY package*.json ./

# Ignore audit's exit code so remaining unfixable items don't break the build
RUN npm ci --omit=dev \
 && (npm audit fix --omit=dev || true)

COPY . .

EXPOSE 3000

CMD ["node", "app.js"]
