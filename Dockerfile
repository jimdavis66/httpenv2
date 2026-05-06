FROM dhi.io/node:25-dev AS build

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --omit=dev && mkdir -p node_modules

FROM dhi.io/node:25 AS runtime

WORKDIR /usr/src/app
ENV NODE_ENV=production
COPY --from=build /usr/src/app/node_modules ./node_modules
COPY package*.json ./
COPY app.js .
EXPOSE 3000
CMD ["node", "app.js"]
