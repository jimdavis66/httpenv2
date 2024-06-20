FROM node:20-bookworm-slim
# Create and set the working directory
WORKDIR /usr/src/app
# Copy package.json and package-lock.json to the working directory
COPY package*.json ./
# Install dependencies
RUN npm install
# Copy the rest of the application code to the working directory
COPY app.js .
EXPOSE 3000
CMD ["node", "app.js"]
