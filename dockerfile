# Stage 1: Build
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build


# Stage 2: Runtime
FROM node:20-alpine AS runtime

WORKDIR /app

COPY package*.json ./

# Install ALL dependencies first
RUN npm ci

# THEN set production mode
ENV NODE_ENV=production

# Copy built files
COPY --from=build /app/dist ./dist
COPY --from=build /app/src ./src
COPY --from=build /app/scripts ./scripts
COPY --from=build /app/tsconfig.json ./tsconfig.json

EXPOSE 3000

CMD ["sh", "-c", "npm run seed:all && node dist/index.js"]